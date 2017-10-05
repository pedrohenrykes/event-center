<?php

class SetoresRecord extends TRecord {
    const TABLENAME = 'setores';
    const PRIMARYKEY = 'id';
    const IDPOLICY = 'serial';
	
	private $local_nome;
	
	function get_local_nome() {
		if(!empty($this->local_id)) {
			$this->local_nome = new LocaisRecord($this->local_id);
			return $this->local_nome->nome;
		}
		return '';
	}
}
