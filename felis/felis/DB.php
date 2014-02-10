<?php
/*
    FelisCMS 
    Klasa z gotowymi zapytaniami do bazy danych
*/

class FC_DB {                 

    var $table;
    var $where;
    var $data;
    var $order;
    var $limit;
    var $join;       
    
/*
    Pobieranie danych 
    ####################################################################################################
*/                             
    
// Pobieranie danych z bazy
    public function table($table, $select = "*"){      
        $this->db->select($select);
        $query = $this->db->get($table);
        return $query->result_array();
    }            
    
// Pobieranie wyników z tabeli oraz dołączenie drugiej    
    public function tableJoin($table, $table1, $join, $select = "*") {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $join);   
        $query = $this->db->get();
        return $query->result_array();
    } 
    
// Pobieranie danych z bazy według sortowania z limitem       
    public function tableOrderLimit($table, $order, $limit = false, $select = "*"){
        $this->db->select($select);
        $this->db->order_by($order);    
        if($limit) $this->db->limit($limit);
        $query = $this->db->get($table);       
        return  $query->result_array();
    }

//////////////////////////////////////////////////////////////////////////////////////////////
           
// Pobieranie wyniku gdzie       
    public function getData($table, $where, $select = "*", $order = false){ 
        $this->db->select($select);
        if($order) $this->db->order_by($order);
        $query = $this->db->get_where($table, $where);
        return  $query->row_array();
    }                 
    
// Pobieranie określonego wyniku         
    public function getDataSelect($select, $table, $where, $kolumna = 'value'){
        $this->db->select($select);
        $query = $this->db->get_where($table, $where);
        return  $query->row($kolumna);
    } 
              
// Pobieranie wyników gdzie   
    public function getWhere($table, $where, $select = "*", $order = false){     
        $this->db->select($select);
        if($order) $this->db->order_by($order);
        $query = $this->db->get_where($table, $where);
        return  $query->result_array();
    }       

// Liczenie wyników gdzie
    public function getWhereCount($table, $where){
        $query = $this->db->get_where($table, $where);
        return $query->num_rows();
    }
    
// Pobieranie wyniku dla tabel z warunkami oraz sortowanie       
    public function getWhereJoinOrder($table, $table1, $join, $where, $order, $select = '*'){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $join);  
        $this->db->where($where);    
        $this->db->order_by($order);     
        $query = $this->db->get();
        return  $query->row_array();
    }             
 
 
/*
    Operacje dodawania, usuwania, aktualizacji
    ####################################################################################################
*/ 
                 
// Aktualizacja         
    public function update($table, $data, $where){
        $sql = $this->db->update_string($table, $data, $where);
        return $this->db->query($sql);
    }   
      
// Dodawanie wyniku        
    public function insert($table, $data){
        $sql = $this->db->insert_string($table, $data);
        return $this->db->query($sql);
    }   
      
// Usuwanie wyniku
    public function delete($table, $where){
        $sql = $this->db->delete($table, $where); 
        return $this->db->query($sql);
    }
    
//    
//    
//    
//    
//    
//    
//    
// STARE    
//    
//    
//    
//    
//    
//    
//    
             
    
########################################################################################################################################
/*
                                                          
              
// Pobieranie wyniku z warunkami oraz sortowanie       
    public function getDataOrder($table, $where, $order){
        $this->db->order_by($order); 
        $query = $this->db->get_where($table, $where);
        return  $query->row_array();
    }      
// Pobieranie wyniku z warunkami oraz sortowanie       
    public function getDataOrderLimit($table, $order, $limit){
        $this->db->limit($limit); 
        $this->db->order_by($order); 
        $query = $this->db->get($table);
        return  $query->row_array();
    }             
    
// Pobieranie wyników z warunkami oraz sortowanie     
    public function getWhereOrder($table, $where, $order){
        $this->db->order_by($order); 
        $query = $this->db->get_where($table, $where);
        return  $query->result_array();
    }
// Pobieranie wyników z warunkami oraz limitem     
    public function getWhereLimit($table, $where, $limit){
        $this->db->limit($limit); 
        $query = $this->db->get_where($table, $where);
        return  $query->result_array();
    }

// Pobieranie wyników z tabeli oraz dołączenie drugiej    
    public function queryWhereLimitOrderJoin($select, $table, $table1, $join, $where, $limit, $order) {
        $this->db->select($select);
        $this->db->from($table); 
        $this->db->where($where);    
        $this->db->join($table1, $join); 
        $this->db->order_by($order); 
        $this->db->limit($limit);   
        $query = $this->db->get();
        return $query->result_array();
    }         
// Pobieranie wyniku z warunkami oraz sortowanie       
    public function getWhereLimitOrder($table, $where, $limit, $order){
        $this->db->order_by($order); 
        $query = $this->db->get_where($table, $where, $limit);
        return  $query->result_array();
    }     
// Pobieranie ilości wyników z tabeli     
    public function rowsTable($table) {
        $table = $this->db->dbprefix($table);
        $query = $this->db->query("SELECT COUNT(*) as 'ilosc' FROM `$table`");
        return $query->result_array();
    }
// Pobieranie ilości wyników z tabeli     
    public function rowsTableWhere($table, $where) {
        $table = $this->db->dbprefix($table);
        $query = $this->db->query("SELECT COUNT(*) as 'ilosc' FROM `$table` WHERE {$where}");
        return $query->result_array();
    } 
*/

}