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
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">Formul&aacute;rio de Setores</b>');
        $this->form->class = 'tform';

        $id = new THidden('id');
        $local_id = new TDBCombo('local_id', 'festadoboi', 'LocaisRecord', 'id', 'nome');
        $nome = new TEntry('nome');

        $nome->setMaxLength(50);

        $local_id->addValidation('Local' , new TRequiredValidator);
        $nome->addValidation('Nome do Setor' , new TRequiredValidator);

        $titulo = new TLabel('* Campos obrigat&oacute;rios');
        $titulo->setFontFace('Arial');
        $titulo->setFontColor('red');
        $titulo->setFontStyle('b');
        $titulo->setFontSize(10);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel('Local <b style="color: red;">*</b>')], [$local_id]);
        $this->form->addFields([new TLabel('Nome do Setor <b style="color: red;">*</b>')], [$nome]);

        $this->form->addFields([$titulo]);

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

            TTransaction::open('festadoboi');

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

                TTransaction::open('festadoboi');

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
