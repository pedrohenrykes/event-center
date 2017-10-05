<?php

class LocaisForm extends TWindow
{

    private $form;

    public function __construct()
    {

        parent::__construct();
		parent::setTitle( "Cadastro de Locais" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('form_locais');
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">Formul&aacute;rio de Locais</b>');
        $this->form->class = 'tform';
		
        $id = new THidden('id');
        $nome = new TEntry('nome');
        $municipio = new TEntry('municipio');
        $bairro = new TEntry('bairro');
        $endereco = new TEntry('endereco');
        $latitude = new TEntry('latitude');
        $longitude = new TEntry('longitude');

        $nome->setMaxLength(100);
        $bairro->setMaxLength(100);
        $endereco->setMaxLength(100);

        $nome->addValidation('Nome' , new TRequiredValidator);
        $municipio->addValidation('Município' , new TRequiredValidator);
        $bairro->addValidation('Bairro' , new TRequiredValidator);
        $endereco->addValidation('Endereço' , new TRequiredValidator);
        $latitude->addValidation('Latitude' , new TRequiredValidator);
        $longitude->addValidation('Longitude' , new TRequiredValidator);

        $titulo = new TLabel('* Campos obrigat&oacute;rios');
        $titulo->setFontFace('Arial');
        $titulo->setFontColor('red');
        $titulo->setFontStyle('b');
        $titulo->setFontSize(10);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel('Nome <b style="color: red;">*</b>')], [$nome]);
        $this->form->addFields([new TLabel('Município <b style="color: red;">*</b>')], [$municipio]);
        $this->form->addFields([new TLabel('Bairro <b style="color: red;">*</b>')], [$bairro]);
        $this->form->addFields([new TLabel('Endereço <b style="color: red;">*</b>')], [$endereco]);
        $this->form->addFields([new TLabel('Latitude <b style="color: red;">*</b>')], [$latitude]);
        $this->form->addFields([new TLabel('Longitude <b style="color: red;">*</b>')], [$longitude]);

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

            $cadastro = $this->form->getData('LocaisRecord');

            $cadastro->store();

            TTransaction::close();

            new TMessage("info", "Registro salvo com sucesso!");
            TApplication::gotoPage('LocaisList', 'onReload');

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

                $object = new LocaisRecord($key);

                $this->form->setData($object);

                TTransaction::close();

            }

        } catch (Exception $e) {
            new TMessage('error', '<b>Error</b> ' . $e->getMessage() . "<br/>");
            TTransaction::rollback();
        }

    }

}
