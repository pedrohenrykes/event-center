<?php

use Adianti\Database\TFilter1;
use Adianti\Widget\Datagrid\TDatagridTables;

class ProgramacoesList extends TPage
{

    private $form;
    private $datagrid;

    public function __construct()
    {

        parent::__construct();

        $this->form = new BootstrapFormBuilder('list_programacoes');
		$this->form->setFormTitle( "Listagem de Programações" );
		$this->form->class = "tform";

        $opcao = new TCombo( "opcao" );
        $dados = new TEntry( "dados" );

        $opcao->setDefaultOption( "..::SELECIONE::.." );
        $dados->setProperty( "title", "Informe os dados de acordo com a opção" );

        $opcao->setSize( "38%" );
        $dados->setSize( "38%" );

        $items = array();
        $items['nome'] = 'Nome';

        $opcao->addItems($items);

		$this->form->addFields( [ new TLabel( "Opção de busca:" ) ], [ $opcao ] );
        $this->form->addFields( [ new TLabel( "Dados à buscar:" )  ], [ $dados ] );
		
		$this->form->addAction( "Buscar", new TAction( [ $this, "onSearch" ] ), "fa:search" );
        $this->form->addAction( "Novo", new TAction( [ "ProgramacoesForm", "onEdit" ] ), "bs:plus-sign green" );

		$this->datagrid = new BootstrapDatagridWrapper( new TDataGrid() );
        $this->datagrid->datatable = "true";
        $this->datagrid->style = "width: 100%";
        $this->datagrid->setHeight( 320 );

        $dgevento_nome = new TDataGridColumn('evento_nome', 'Evento', 'left', 200);
		$dgsetor_nome = new TDataGridColumn('setor_nome', 'Setor', 'left', 200);
        $dggenero_nome = new TDataGridColumn('genero_nome', 'Gênero', 'left', 200);
        $dgnome = new TDataGridColumn('nome', 'Nome', 'left', 200);
        $dgdata_evento = new TDataGridColumn('data_evento', 'Data do Evento', 'left', 200);
        $dghora_evento = new TDataGridColumn('hora_evento', 'Hora do Evento', 'left', 200);
        $dgsituacao = new TDataGridColumn('situacao', 'Situação', 'left', 200);

        $this->datagrid->addColumn($dgevento_nome);
		$this->datagrid->addColumn($dgsetor_nome);
        $this->datagrid->addColumn($dggenero_nome);
        $this->datagrid->addColumn($dgnome);
        $this->datagrid->addColumn($dgdata_evento);
        $this->datagrid->addColumn($dghora_evento);
        $this->datagrid->addColumn($dgsituacao);

        $actionEdit = new TDataGridAction(array('ProgramacoesForm', 'onEdit'));
        $actionEdit->setLabel('Editar');
        $actionEdit->setImage('ico_edit.png');
        $actionEdit->setField('id');

        $actionDelete = new TDataGridAction(array($this, 'onDelete'));
        $actionDelete->setLabel('Deletar');
        $actionDelete->setImage('ico_delete.png');
        $actionDelete->setField('id');

        $this->datagrid->addAction($actionEdit);
        $this->datagrid->addAction($actionDelete);

        $this->datagrid->createModel();

        $this->pageNavigation = new TPageNavigation();
        $this->pageNavigation->setAction( new TAction( [ $this, "onReload" ] ) );
        $this->pageNavigation->setWidth( $this->datagrid->getWidth() );

        $container = new TVBox();
        $container->style = "width: 90%";
        $container->add( $this->form );
        $container->add( TPanelGroup::pack( NULL, $this->datagrid ) );
        $container->add( $this->pageNavigation );

        parent::add( $container );
    }

    function onReload()
    {
        TTransaction::open('database');

        $repository = new TRepository('ProgramacoesRecord');
        $criteria = new TCriteria;

        $cadastros = $repository->load($criteria);

        $this->datagrid->clear();

        if ($cadastros) {
            foreach ($cadastros as $cadastro) {
				$cadastro->data_evento = TDate::date2br($cadastro->data_evento);
                $this->datagrid->addItem($cadastro);
            }
        }

        TTransaction::close();

        $this->loaded = true;
    }

    function onSearch()
    {
        $data = $this->form->getData();

        $campo = $data->opcao;
        $dados = $data->nome;

        TTransaction::open('database');

        $repository = new TRepository('ProgramacoesRecord');
        $criteria = new TCriteria;

        if ($dados) {
            if (is_numeric($dados)) {
                $criteria->add(new TFilter($campo, 'like', '%' . $dados . '%'));
            } else {
                $criteria->add(new TFilter1('special_like(' . $campo . ",'" . $dados . "')"));
            }
        }

        $objects = $repository->load($criteria);

        $this->datagrid->clear();
        if ($objects) {
            foreach ($objects as $object) {
                $this->datagrid->addItem($object);
            }
        }

        TTransaction::close();

        $this->loaded = true;
    }

    function onDelete($param)
    {
        $key = $param['key'];
        $action = new TAction(array($this, 'Delete'));
        $action->setParameter('key', $key);
		
        new TQuestion('Deseja realmente excluir o registro?', $action);
    }


    function Delete($param)
    {
        $key = $param['key'];

        TTransaction::open('database');

        $obj = new ProgramacoesRecord($key);

        try {
            $obj->delete();

            new TMessage("info", "Registro deletado com sucesso!");

            TTransaction::close();

        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }

        $this->onReload();
    }

    function show()
    {
        $this->onReload();
        parent::show();

    }
}
