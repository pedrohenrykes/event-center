<?php

class ProgramacoesForm extends TWindow
{

    private $form;

    public function __construct()
    {

        parent::__construct();
		parent::setTitle( "Cadastro de Programações" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('form_programacoes');
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">* Campos obrigat&oacute;rios</b>');
        $this->form->class = 'tform';
		
		$redstar = '<font color="red"><b>*</b></font>';

        $id = new THidden('id');
        $evento_id = new TDBCombo('evento_id', 'database', 'EventosRecord', 'id', 'nome');
		$setor_id = new TDBCombo('setor_id', 'database', 'SetoresRecord', 'id', 'nome');
        $genero_id = new TDBCombo('genero_id', 'database', 'GenerosRecord', 'id', 'nome');
        $nome = new TEntry('nome');
        $descricao = new TText('descricao');
        $data_evento = new TDate('data_evento');
        $hora_inicio = new TEntry('hora_inicio');
		$hora_fim = new TEntry('hora_fim');
        $situacao = new TCombo('situacao');

        $nome->setMaxLength(100);
        $descricao->setMaxLength(1500);
		
		$evento_id->setSize(300);
        $setor_id->setSize(300);
		$genero_id->setSize(300);
        $nome->setSize(300);
		$descricao->setSize(300);
		$data_evento->setSize(300);
		$hora_inicio->setSize(300);
		$hora_fim->setSize(300);
		$situacao->setSize(300);
		
		$data_evento->setMask('dd/mm/yyyy');
		$data_evento->setDatabaseMask('yyyy-mm-dd');
		
		$hora_inicio->setProperty('type', 'time');
		$hora_fim->setProperty('type', 'time');
		
		$evento_id->setDefaultOption( "..::SELECIONE::.." );
		$setor_id->setDefaultOption( "..::SELECIONE::.." );
		$genero_id->setDefaultOption( "..::SELECIONE::.." );
		$situacao->setDefaultOption( "..::SELECIONE::.." );
		
		$situacao->addItems(['ABERTO' => 'ABERTO', 'CANCELADO' => 'CANCELADO', 'FINALIZADO' => 'FINALIZADO']);

        $evento_id->addValidation('Local' , new TRequiredValidator);
		$setor_id->addValidation('Setor' , new TRequiredValidator);
        $genero_id->addValidation('Gênero' , new TRequiredValidator);
        $nome->addValidation('Nome' , new TRequiredValidator);
        $descricao->addValidation('Descrição' , new TRequiredValidator);
        $data_evento->addValidation('Data do Evento' , new TRequiredValidator);
        $hora_inicio->addValidation('Hora de Início' , new TRequiredValidator);
		$hora_fim->addValidation('Hora de Fim' , new TRequiredValidator);
        $situacao->addValidation('Situação' , new TRequiredValidator);

        $this->form->addFields([$id]);
		$this->form->addFields([new TLabel("Nome  {$redstar}")], [$nome]);
        $this->form->addFields([new TLabel("Descrição  {$redstar}")], [$descricao]);
        $this->form->addFields([new TLabel("Evento  {$redstar}")], [$evento_id]);
		$this->form->addFields([new TLabel("Setor  {$redstar}")], [$setor_id]);
        $this->form->addFields([new TLabel("Gênero  {$redstar}")], [$genero_id]);
        $this->form->addFields([new TLabel("Data do Evento  {$redstar}")], [$data_evento]);
        $this->form->addFields([new TLabel("Hora de Início  {$redstar}")], [$hora_inicio]);
		$this->form->addFields([new TLabel("Hora de Fim  {$redstar}")], [$hora_fim]);
        $this->form->addFields([new TLabel("Situação  {$redstar}")], [$situacao]);

        $this->form->addAction('Salvar', new TAction(array($this, 'onSave')), 'ico_save.png')->class = 'btn btn-info';
        $this->form->addAction('Voltar', new TAction(array('ProgramacoesList', 'onReload')), 'ico_datagrid.gif');

        $container = new TVBox();
        $container->style = "width: 100%";
        $container->add( $this->form );

        parent::add( $container );

    }

    function onSave()
    {

        try {

            $this->form->validate();

            TTransaction::open('database');

            $cadastro = $this->form->getData('ProgramacoesRecord');

            $cadastro->store();

            TTransaction::close();

            new TMessage("info", "Registro salvo com sucesso!");
            TApplication::gotoPage('ProgramacoesList', 'onReload');

        } catch (Exception $e) {

            new TMessage('error', $e->getMessage());

            TTransaction::rollback();

        }

    }

    function onEdit($param)
    {
        try {

            if (isset($param['key'])) {

                $key = $param['key'];

                TTransaction::open('database');

                $object = new ProgramacoesRecord($key);
                $this->form->setData($object);

                TTransaction::close();

            }

        } catch (Exception $e) {
            new TMessage('error', '<b>Error</b> ' . $e->getMessage() . "<br/>");
            TTransaction::rollback();
        }

    }

}
