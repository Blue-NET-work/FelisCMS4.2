<?php                     
  class View extends CI_Model{
 
    const MSG_NL_FORMAT_NONE = 0;
    const MSG_NL_FORMAT_BR = 1;
    const MSG_NL_FORMAT_NL = 2;

    /**
     * @var string format odpowiedzi
     */
    private $_outputFormat = '';
    /**
     * @var string format kodowania znaków 
     */
    private $_charset = 'UTF-8';
    /**
     * @var string odpowiedź
     */
    private $_output = array(
        'status' => 1,
        'message' => '',
        'timestamp' => '',
        'errorCode' => 0,
        'executionTime' => 0,
        'data' => array()
    );
    
    private static $_data = array();
    private static $_css = array();
    private static $_jq = array();
    
    /**
     * @var string format odpowiedzi 
     */
    private $_messageNewLineFormat = self::MSG_NL_FORMAT_NL;
    /**
     * @var string odpowiedź zakodowana jako string
     */
    private $_outputString = '';

    function __construct($outputFormat = 'XML', $charset = 'UTF-8') {
        $this->setOutputFormat($outputFormat);
        $this->setCharset($charset);
        $this->_output['timestamp'] = $_SERVER['REQUEST_TIME'];
    }

    
    /**
     * przygotowanie tablicy stylu CSS
     */
    public function setCSS($data, $type = false, $media = false) {
        self::$this->_css[] = array("href"=>$data, "type"=>$type, "media"=> $media);
    }
    
    /**
     * przygotowanie tablicy stylu jQuery
     */
    public function setJQ($src, $type = false) {
        $this->_jq[] = array("src"=>$src, "type"=>$type);
    }
    
    /**
     * przygotowanie tablicy stylu jQuery
     */
    public function gets() {
        $jq = $this->_jq;
        $css = $this->_css;
        
        if($css) $this->smarty->assign("_CSS", $css);
        if($jq)  $this->smarty->assign("_JQ", $jq);
    }
    
    /**
     * zwraca opowiedź jako tekst
     * @param mixed $options opcje wysyłania - zależne od formatu
     */
    public function fetch($options = false) {
        $this->createOutputString($options);
        return $this->_outputString;
    }

    /**
     * zwraca string z odpowiedzią
     * @return void
     */
    public function asString() {
        $this->createOutputString();
        return $this->_outputString;
    }

    /**
     * @param string $format format odpowiedzi
     */
    public function setOutputFormat($format) {
        $this->_outputFormat = $format;
    }

    /**
     * @param string $charset kodowanie strony
     */
    public function setCharset($charset) {
        $this->_charset = $charset;
    }

    /**
     * ustawia status żądania
     * @param bool $status status
     */
    public function setStatus($status) {
        $this->_output['status'] = $status ? 1 : 0;
    }

    /**
     * ustawia wiadomość żądania
     * @param string
     * @return void
     */
    public function setMessage($text) {
        $this->_output['message'] = $text;
    }

    /**
     * ustawienie kodu bledu
     *
     * @param int $code kod błędu
     * @return void
     */
    public function setErrorCode($code) {
        $this->_output['errorCode'] = (int) $code;
    }

    /**
     * Metoda dokleja wiadomość do istniejącej wiadomości żądania
     * @param string $text wiadomość
     */
    public function appendMessage($text) {
        $this->_output['message'] .= PHP_EOL . $text;
    }

    /**
     * Metoda zwraca wiadomość żadania
     * @return string wiadomość żądania
     */
    public function getMessage() {
        return $this->_output['message'];
    }

    /**
     * Metoda dodaje dane do wyjścia
     * @param mixed $data wartość wysyłana na wyjście
     * @param string $key klucz pod którym umieścić dene
     * @param bool $append flaga czy dodajemy do istniejącej już struktury
     */
    public function setData($data, $key = false, $append = false) {
        if ($key) {
            if ($append) {
                $this->_output['data'][$key][] = $data;
            } else {
                $this->_output['data'][$key] = $data;
            }
        } else {
            if ($append) {
                $this->_output['data'][] = $data;
            } else {
                $this->_output['data'] = $data;
            }
        }
    }

    /**
     * Metoda przygotowuje dane na wyjście
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function createOutputString($options = false) {
        $this->_output['executionTime'] = time() - $_SERVER['REQUEST_TIME'];
        switch ($this->_messageNewLineFormat) {
            case self::MSG_NL_FORMAT_BR : $this->_output['message'] = nl2br($this->_output['message']);
                break;
            case self::MSG_NL_FORMAT_NL : $this->_output['message'] = MString::br2nl($this->_output['message']);
                break;
        }

        $fn = 'createOutputString' . $this->_outputFormat;
        $this->$fn($options);
    }

    /**
     * Metoda zamienia tablice z danymi na string - JSON
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function createOutputStringJSON($options = false) {
        if (is_array($options) && isset($options['addBrackets']) && $options['addBrackets'] == true) {
            $this->_outputString = "(" . json_encode($this->_output) . ")";
        } else {
            $this->_outputString = json_encode($this->_output);
        }
    }

    /**
     * Metoda zamienia tablice z danymi na string - XML
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function createOutputStringXML($options = false) {
        $this->_outputString = MArray::arrayToXML($this->_output, 'response');
    }

    /**
     * Metoda zamienia tablice z danymi na string - Debug
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function createOutputStringDebug($options = false) {
        $this->_outputString = "<pre>" . print_r($this->_output, true);
    }

    /**
     * Metoda zamienia tablice z danymi na string - HTML
     * @param string $template nazwa/ścieżka template'a do wyświetlenia
     */
    protected function createOutputStringHTML($template) {
        if (!$template) {
            throw new cViewException("Brak zdefiniowanego szablonu!");
        }

        if(!FC_Smarty::$this->template_exists($template)){
            throw new cViewException("Brak szablonu {$template}");
        }
        
        foreach ($this->_output['data'] as $k => $v) {
            FC_Smarty::$this->assign($k, $v);
        }
        $this->_outputString = FC_Smarty::$this->fetch($template);
        
    }

    /**
     * Metoda zamienia tablice z danymi na string - Raw
     * @param mixed $options opcje ustawiania wyjścia
     */
    protected function createOutputStringRaw($options = false) {
        $this->_outputString = $this->_output['data'];
    }

    /**
     * Metoda wysyła nagłówki
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function sendHeaders($options = false) {
        if (isset($options['sendHeaders']) && $options['sendHeaders'] == false) {
            return;
        }
        $fn = 'sendHeaders' . $this->_outputFormat;
        $this->$fn($options);
    }

    /**
     * Metoda wysyła nagłówki JSON
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function sendHeadersJSON($options = false) {
        header('Cache-Control: no-cache, must-revalidate');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Content-type: application/json; charset=' . $this->_charset);
    }

    /**
     * Metoda wysyła nagłówki XML
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function sendHeadersXML($options = false) {
        header('Cache-Control: no-cache, must-revalidate');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Content-type: application/xml; charset=' . $this->_charset);
    }

    /**
     * Metoda wysyła nagłówki Debug
     * @param mixed $options opcje ustawiania wyjścia
     */
    private function sendHeadersDebug($options = false) {
        header('Cache-Control: no-cache, must-revalidate');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Content-type: text/html; charset=' . $this->_charset);
    }

    /**
     * Metoda wysyła nagłówki HTML
     * @param mixed $options opcje ustawiania wyjścia
     */
    protected function sendHeadersHTML($options = false) {
        header('Cache-Control: no-cache, must-revalidate');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Content-type: text/html; charset=' . $this->_charset);
    }

    /**
     * Metoda wysyła nagłówki Raw
     * @param mixed $options opcje ustawiania wyjścia
     */
    protected function sendHeadersRaw($options = false) {
        header('Cache-Control: no-cache, must-revalidate');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Content-type: text/html; charset=' . $this->_charset);
    }
    
    public function clearData(){
        $this->_output['data'] = array();
    }
    
    public function set($key, $value){
        $this->_data[$key] = $value;
    }
    
    public function get($key, $default = false){
        return isset($this->_data[$key]) ? $this->_data[$key] : $default;
    }

  }
?>
