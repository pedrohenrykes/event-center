<?php

class EventosForm extends TWindow
{

    private $form;

    public function __construct()
    {

        parent::__construct();
		parent::setTitle( "Cadastro de Eventos" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('form_eventos');
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">* Campos obrigat&oacute;rios</b>');
        $this->form->class = 'tform';

		$redstar = '<font color="red"><b>*</b></font>';
		
        $id = new THidden('id');
        $local_id = new TDBCombo('local_id', 'festadoboi', 'LocaisRecord', 'id', 'nome');
        $genero_id = new TDBCombo('genero_id', 'festadoboi', 'GenerosRecord', 'id', 'nome');
        $edicao = new TEntry('edicao');
        $nome = new TEntry('nome');
        $descricao = new TText('descricao');
        $data_evento = new TDate('data_evento');
        $hora_evento = new TEntry('hora_evento');
        $duracao = new TEntry('duracao');
        $situacao = new TCombo('situacao');

        $nome->setMaxLength(100);
        //$descricao->setMaxLength(1500);
		
		$hora_evento->setProperty('type', 'time');
		
		$duracao->setMask('99');
		
		$local_id->setDefaultOption( "..::SELECIONE::.." );
		$genero_id->setDefaultOption( "..::SELECIONE::.." );
		$situacao->setDefaultOption( "..::SELECIONE::.." );
		
		$situacao->addItems(['ABERTO' => 'ABERTO', 'CANCELADO' => 'CANCELADO', 'FINALIZADO' => 'FINALIZADO']);
		
		$edicao->setProperty( "title", "Ex: 26ª" );
		$duracao->setProperty( "title", "Em horas" );

        $local_id->addValidation('Local' , new TRequiredValidator);
        $genero_id->addValidation('Gênero' , new TRequiredValidator);
        $edicao->addValidation('Edição' , new TRequiredValidator);
        $nome->addValidation('Nome' , new TRequiredValidator);
        $descricao->addValidation('Descrição' , new TRequiredValidator);
        $data_evento->addValidation('Data do Evento' , new TRequiredValidator);
        $hora_evento->addValidation('Hora do Evento' , new TRequiredValidator);
        $duracao->addValidation('Duração(horas)' , new TRequiredValidator);
        $situacao->addValidation('Situação' , new TRequiredValidator);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel("Local {$redstar}")], [$local_id]);
        $this->form->addFields([new TLabel("Gênero {$redstar}")], [$genero_id]);
        $this->form->addFields([new TLabel("Edição {$redstar}")], [$edicao]);
        $this->form->addFields([new TLabel("Nome {$redstar}")], [$nome]);
        $this->form->addFields([new TLabel("Descrição {$redstar}")], [$descricao]);
        $this->form->addFields([new TLabel("Data do Evento {$redstar}")], [$data_evento]);
        $this->form->addFields([new TLabel("Hora do Evento {$redstar}")], [$hora_evento]);
        $this->form->addFields([new TLabel("Duração(horas) {$redstar}")], [$duracao]);
        $this->form->addFields([new TLabel("Situação {$redstar}")], [$situacao]);

        $this->form->addAction('Salvar', new TAction(array($this, 'onSave')), 'ico_save.png')->class = 'btn btn-info';
        $this->form->addAction('Voltar', new TAction(array('EventosList', 'onReload')), 'ico_datagrid.gif');

        $container = new TVBox();
        $container->style = "width: 100%";
        $container->add( $this->form );

        parent::add( $container );

    }

    function onSave()
    {

        try {

            $this->form->validate();

            TTransaction::open('festadoboi');

            $cadastro = $this->form->getData('EventosRecord');

            $cadastro->store();

            TTransaction::close();

            new TMessage("info", "Registro salvo com sucesso!");
            TApplication::gotoPage('EventosList', 'onReload');

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

                TTransaction::open('festadoboi');

                $object = new EventosRecord($key);
                $this->form->setData($object);

                TTransaction::close();

            }

        } catch (Exception $e) {
            new TMessage('error', '<b>Error</b> ' . $e->getMessage() . "<br/>");
            TTransaction::rollback();
        }

    }

}
