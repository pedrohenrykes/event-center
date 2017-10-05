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
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">Formul&aacute;rio de Programações</b>');
        $this->form->class = 'tform';

        $id = new THidden('id');
        $evento_id = new TDBCombo('evento_id', 'database', 'EventosRecord', 'id', 'nome');
		$setor_id = new TDBCombo('setor_id', 'database', 'SetoresRecord', 'id', 'nome');
        $genero_id = new TDBCombo('genero_id', 'database', 'GenerosRecord', 'id', 'nome');
        $nome = new TEntry('nome');
        $descricao = new TEntry('descricao');
        $data_evento = new TDate('data_evento');
        $hora_evento = new TEntry('hora_evento');
        $duracao = new TEntry('duracao');
        $situacao = new TCombo('situacao');

        $nome->setMaxLength(100);
        $descricao->setMaxLength(1500);
		
		$situacao->addItems(['ATIVO' => 'ATIVO', 'INATIVO' => 'INATIVO']);

        $evento_id->addValidation('Local' , new TRequiredValidator);
		$setor_id->addValidation('Setor' , new TRequiredValidator);
        $genero_id->addValidation('Gênero' , new TRequiredValidator);
        $nome->addValidation('Nome' , new TRequiredValidator);
        $descricao->addValidation('Descrição' , new TRequiredValidator);
        $data_evento->addValidation('Data do Evento' , new TRequiredValidator);
        $hora_evento->addValidation('Hora do Evento' , new TRequiredValidator);
        $duracao->addValidation('Duração' , new TRequiredValidator);
        $situacao->addValidation('Situação' , new TRequiredValidator);

        $titulo = new TLabel('* Campos obrigat&oacute;rios');
        $titulo->setFontFace('Arial');
        $titulo->setFontColor('red');
        $titulo->setFontStyle('b');
        $titulo->setFontSize(10);

        $this->form->addFields([new TLabel('')], [$id]);
        $this->form->addFields([new TLabel('Evento <b style="color: red;">*</b>')], [$evento_id]);
		$this->form->addFields([new TLabel('Setor <b style="color: red;">*</b>')], [$setor_id]);
        $this->form->addFields([new TLabel('Gênero <b style="color: red;">*</b>')], [$genero_id]);
        $this->form->addFields([new TLabel('Nome <b style="color: red;">*</b>')], [$nome]);
        $this->form->addFields([new TLabel('Descrição <b style="color: red;">*</b>')], [$descricao]);
        $this->form->addFields([new TLabel('Data do Evento <b style="color: red;">*</b>')], [$data_evento]);
        $this->form->addFields([new TLabel('Hora do Evento <b style="color: red;">*</b>')], [$hora_evento]);
        $this->form->addFields([new TLabel('Duração <b style="color: red;">*</b>')], [$duracao]);
        $this->form->addFields([new TLabel('Situação <b style="color: red;">*</b>')], [$situacao]);

        $this->form->addFields([$titulo]);

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
