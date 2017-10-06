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
		$this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">* Campos obrigat&oacute;rios</b>');
        $this->form->class = 'tform';
		
		$redstar = '<font color="red"><b>*</b></font>';
		
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
		
		$nome->setSize(300);
		$municipio->setSize(300);
		$bairro->setSize(300);
		$endereco->setSize(300);
		$latitude->setSize(300);
		$longitude->setSize(300);

        $nome->addValidation('Nome' , new TRequiredValidator);
        $municipio->addValidation('Município' , new TRequiredValidator);
        $bairro->addValidation('Bairro' , new TRequiredValidator);
        $endereco->addValidation('Endereço' , new TRequiredValidator);
        $latitude->addValidation('Latitude' , new TRequiredValidator);
        $longitude->addValidation('Longitude' , new TRequiredValidator);

        $this->form->addFields([$id]);
        $this->form->addFields([new TLabel("Nome {$redstar}")], [$nome]);
        $this->form->addFields([new TLabel("Município {$redstar}")], [$municipio]);
        $this->form->addFields([new TLabel("Bairro {$redstar}")], [$bairro]);
        $this->form->addFields([new TLabel("Endereço {$redstar}")], [$endereco]);
        $this->form->addFields([new TLabel("Latitude {$redstar}")], [$latitude]);
        $this->form->addFields([new TLabel("Longitude {$redstar}")], [$longitude]);

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

                TTransaction::open('database');

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
