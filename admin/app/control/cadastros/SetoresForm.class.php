<?php

class SetoresForm extends TWindow
{

    private $form;

    public function __construct()
    {

        parent::__construct();
		parent::setTitle( "Cadastro de Setores" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('form_setores');
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">* Campos obrigat&oacute;rios</b>');
        $this->form->class = 'tform';
		
		$redstar = '<font color="red"><b>*</b></font>';

        $id = new THidden('id');
        $local_id = new TDBCombo('local_id', 'database', 'LocaisRecord', 'id', 'nome');
        $nome = new TEntry('nome');

        $nome->setMaxLength(50);
		
		$local_id->setDefaultOption( "..::SELECIONE::.." );

        $local_id->addValidation('Local' , new TRequiredValidator);
        $nome->addValidation('Nome do Setor' , new TRequiredValidator);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel("Local {$redstar}")], [$local_id]);
        $this->form->addFields([new TLabel("Nome do Setor {$redstar}")], [$nome]);

        $this->form->addAction('Salvar', new TAction(array($this, 'onSave')), 'ico_save.png')->class = 'btn btn-info';
        $this->form->addAction('Voltar', new TAction(array('LocaisList', 'onReload')), 'ico_datagrid.gif');

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

            $cadastro = $this->form->getData('SetoresRecord');

            $cadastro->store();

            TTransaction::close();

            new TMessage("info", "Registro salvo com sucesso!");
            TApplication::gotoPage('SetoresList', 'onReload');

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

                $object = new SetoresRecord($key);

                $this->form->setData($object);

                TTransaction::close();

            }

        } catch (Exception $e) {


            new TMessage('error', '<b>Error</b> ' . $e->getMessage() . "<br/>");

            TTransaction::rollback();

        }

    }

}
