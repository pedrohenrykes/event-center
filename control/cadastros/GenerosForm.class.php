<?php

class GenerosForm extends TWindow
{

    private $form;

    public function __construct()
    {

        parent::__construct();
		parent::setTitle( "Cadastro de Gêneros" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('form_generos');
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">Formul&aacute;rio de Gêneros</b>');
        $this->form->class = 'tform';

        $id = new THidden('id');
        $nome = new TEntry('nome');

        $nome->setMaxLength(100);

        $nome->addValidation('Nome do Gênero' , new TRequiredValidator);

        $titulo = new TLabel('* Campos obrigat&oacute;rios');
        $titulo->setFontFace('Arial');
        $titulo->setFontColor('red');
        $titulo->setFontStyle('b');
        $titulo->setFontSize(10);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel('Nome do Gênero <b style="color: red;">*</b>')], [$nome]);

        $this->form->addFields([$titulo]);

        $this->form->addAction( "Salvar", new TAction( [ $this, "onSave" ] ), "fa:floppy-o" );
        $this->form->addAction( "Voltar", new TAction( [ "GenerosList", "onReload" ] ), "fa:table blue" );

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

            $cadastro = $this->form->getData('GenerosRecord');

            $cadastro->store();

            TTransaction::close();

            new TMessage("info", "Registro salvo com sucesso!");
            TApplication::gotoPage('GenerosList', 'onReload');

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

                $object = new GenerosRecord($key);

                $this->form->setData($object);

                TTransaction::close();

            }

        } catch (Exception $e) {


            new TMessage('error', '<b>Error</b> ' . $e->getMessage() . "<br/>");

            TTransaction::rollback();

        }

    }

}
