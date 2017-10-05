<?php

class ProgramacoesRecord extends TRecord {
    const TABLENAME = 'programacoes';
    const PRIMARYKEY = 'id';
    const IDPOLICY = 'serial';
	
	private $evento_nome;
	private $setor_nome;
	private $genero_nome;
	
	function get_evento_nome() {
		if(!empty($this->evento_id)) {
			$this->evento_nome = new EventosRecord($this->evento_id);
			return $this->evento_nome->nome;
		}
		return '';
	}
	
	function get_setor_nome() {
		if(!empty($this->setor_id)) {
			$this->setor_nome = new SetoresRecord($this->setor_id);
			return $this->setor_nome->nome;
		}
		return '';
	}
	
	function get_genero_nome() {
		if(!empty($this->genero_id)) {
			$this->genero_nome = new LocaisRecord($this->genero_id);
			return $this->genero_nome->nome;
		}
		return '';
	}
}
