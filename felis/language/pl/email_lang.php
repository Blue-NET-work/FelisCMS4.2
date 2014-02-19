<?php
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.2.4 or newer
 *
 * NOTICE OF LICENSE
 *
 * Licensed under the Open Software License version 3.0
 *
 * This source file is subject to the Open Software License (OSL 3.0) that is
 * bundled with this package in the files license.txt / license.rst.  It is
 * also available through the world wide web at this URL:
 * http://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to obtain it
 * through the world wide web, please send an email to
 * licensing@ellislab.com so we can send you a copy immediately.
 *
 * @package		CodeIgniter
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (http://ellislab.com/)
 * @license		http://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');
                                                                     
$lang['email_must_be_array'] = 'Metoda walidująca adresy email musi być wywołana z parametrem typu array.';
$lang['email_invalid_address'] = 'Niepoprawny adres email: %s';
$lang['email_attachment_missing'] = 'Nie można odnaleźć załącznika wiadomości email: %s';
$lang['email_attachment_unreadable'] = 'Nie można otworzyć załącznika: %s';
$lang['email_no_recipients'] = 'Musisz podać odbiorców: To, Cc, or Bcc';
$lang['email_send_failure_phpmail'] = 'Nie można wysłać wiadomości email używając funkcji PHP mail().  Serwer może nie być skonfigurowany do wysyłania maili przy użyciu tej metody.';
$lang['email_send_failure_sendmail'] = 'Nie można wysłać wiadomości email używając PHP Sendmail.  Serwer może nie być skonfigurowany do wysyłania maili przy użyciu tej metody.';
$lang['email_send_failure_smtp'] = 'Nie można wysłać wiadomości email używając PHP SMTP.  Serwer może nie być skonfigurowany do wysyłania maili przy użyciu tej metody.';
$lang['email_sent'] = 'Twoja wiadomość została pomyślnie wysłana używając protokołu: %s';
$lang['email_no_socket'] = 'Nie można otworzyć gniazda do Sendmail. Sprawdź ustawienia.';
$lang['email_no_hostname'] = 'Nie podano nazwy hosta SMTP.';
$lang['email_smtp_error'] = 'Wystąpił błąd SMTP: %s';
$lang['email_no_smtp_unpw'] = 'Błąd: Musisz podać login i hasło SMTP.';
$lang['email_failed_smtp_login'] = 'Błąd podczas wysyłania polecenia AUTH LOGIN. Błąd: %s';
$lang['email_smtp_auth_un'] = 'Błąd uwierzytelniania loginu. Błąd: %s';
$lang['email_smtp_auth_pw'] = 'Błąd uwierzytelniania hasła. Błąd: %s';
$lang['email_smtp_data_failure'] = 'Nie można wysłać danych: %s';
$lang['email_exit_status'] = 'Kod statusu zakończenia: %s';
/* End of file email_lang.php */
/* Location: ./system/language/english/email_lang.php */