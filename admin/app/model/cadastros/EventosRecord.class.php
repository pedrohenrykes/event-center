<?php

class EventosRecord extends TRecord {
    const TABLENAME = 'eventos';
    const PRIMARYKEY = 'id';
    const IDPOLICY = 'serial';
	
	private $local_nome;
	private $genero_nome;
	
	function get_local_nome() {
		if(!empty($this->local_id)) {
			$this->local_nome = new LocaisRecord($this->local_id);
			return $this->local_nome->nome;
		}
		return '';
	}
	
	function get_genero_nome() {
		if(!empty($this->genero_id)) {
			$this->genero_nome = new GenerosRecord($this->genero_id);
			return $this->genero_nome->nome;
		}
		return '';
	}
}
