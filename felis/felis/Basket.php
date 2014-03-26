<?php
  class FC_BASKET{
      
// dodawanie zawartości koszyka      
      public function insert($date){
           return $this->cart->insert($date);
      }
// aktualizacja zawartości koszyka      
      public function update($date){
           return $this->cart->update($date);
      }
// zwraca cene przedmiotów w koszyku      
      public function total(){
           return $this->cart->total();
      }
      
// zwraca ilość przedmoitów w koszyku      
      public function total_items(){
           return $this->cart->total_items();
      }
      
      public function contents(){
           return $this->cart->contents();
      }
      
      public function has_options($rowid){
           return $this->cart->has_options($rowid);
      }
      
      public function product_options($rowid){
           return $this->cart->product_options($rowid);
      }
      
      public function destroy(){
           return $this->cart->destroy();
      }
  }
?>
