<?php

class ProgramacoesImagensRecord extends TRecord
{
    const TABLENAME  = "programacoes_imagens";
    const PRIMARYKEY = "id";
    const IDPOLICY   = "serial";
	
	private $programacao_nome;
	
	function get_programacao_nome() {
		if(!empty($this->programacao_id)) {
			$this->programacao_nome = new ProgramacoesRecord($this->programacao_id);
			return $this->programacao_nome->nome;
		}
		return '';
	}
	
	function get_ico_imagem() {
		if(!empty($this->arquivo)) {
			return '<img src="../../../../posts/' . $this->arquivo . '" width="50px" height="50px">';
		}
		return '';
	}
}
