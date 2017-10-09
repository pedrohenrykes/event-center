<?php

class ProgramacoesImagensDetalhe extends TWindow
{

    protected $form;
    protected $datagrid; 
    protected $pageNavigation;
    protected $formgrid;
    protected $deleteButton;
    protected $transformCallback;

    public function __construct()
    {

        parent::__construct();
        parent::setTitle( "Detalhe de Fotos das Programações" );
        parent::setSize( 0.600, 0.800 );

        $this->form = new BootstrapFormBuilder('detalhe_programacoes_imagens');
        $this->form->class = 'detalhe_programacoes_imagens';
        $this->form->setFormTitle('<b style="color: red; font-size: 15px; font-family: Arial;">* Campos obrigat&oacute;rios</b>');
		
		$redstar = '<font color="red"><b>*</b></font>';

		$id = new THidden('id');
		$programacao_id = new THidden('programacao_id');
        $programacao_id->setValue(filter_input(INPUT_GET, 'fk'));
		$arquivo = new TFile('arquivo');
		$descricao = new TText('descricao');
		
		$nome_programacao = new TEntry('programacao_nome');
		
		try {
			TTransaction::open('database');
			
			$programacao = new ProgramacoesRecord(filter_input(INPUT_GET, 'fk'));
			$nome_programacao->setValue($programacao->nome);
			TTransaction::close();
		} catch(Exception $e) {
			new TMessage( "error", "Não foi possível carregar os dados da programação.<br><br>" . $e->getMessage() );
		}
		
		$nome_programacao->setSize(300);
		$programacao_id->setSize(300);
		$arquivo->setSize(300);
		$descricao->setSize(300);
		
		$nome_programacao->setEditable(False);
		
		$programacao_id->addValidation('Programacao ID', new TRequiredValidator);
		$arquivo->addValidation('Imagem', new TRequiredValidator);
		$descricao->addValidation('Descrição', new TRequiredValidator);

        $titulo = new TLabel('* Campos obrigat&oacute;rios');
        $titulo->setFontFace('Arial');
        $titulo->setFontColor('red');
        $titulo->setFontStyle('b');
        $titulo->setFontSize(10);

        $action1 = new TAction(array($this, 'onSave'));
        $action1->setParameter('fk', '' . filter_input(INPUT_GET, 'fk') . '');
        $action1->setParameter('key', '' . filter_input(INPUT_GET, 'key') . '');

		$this->form->addFields( [ new TLabel( "Programação: {$redstar}" ) ], [ $nome_programacao ] );
		$this->form->addFields( [ new TLabel( "Imagem: {$redstar}" ) ], [ $arquivo ] );
		$this->form->addFields( [ new TLabel( "Descrição: {$redstar}" ) ], [ $descricao ] );
        $this->form->addFields( [ $id, $programacao_id ] );

		$this->form->addAction('Salvar', new TAction(array($this, 'onSave')), 'ico_save.png')->class = 'btn btn-info';
        $this->form->addAction('Voltar', new TAction(array('ProgramacoesList', 'onReload')), 'ico_datagrid.gif');

        $this->datagrid = new BootstrapDatagridWrapper( new CustomDataGrid() );
        $this->datagrid->datatable = "true";
        $this->datagrid->style = "width: 100%";
        $this->datagrid->setHeight( 320 );

        $this->datagrid->addColumn(new TDataGridColumn('programacao_nome', 'Programação', 'left', 100));
		$this->datagrid->addColumn(new TDataGridColumn('descricao', 'Descrição', 'left', 100));
		$this->datagrid->addColumn(new TDataGridColumn('ico_imagem', 'Imagem', 'left', 100));

        $actionDelete = new CustomDataGridAction(array($this, 'onDelete'));
        $actionDelete->setLabel('Deletar');
        $actionDelete->setImage('ico_delete.png');
        $actionDelete->setField('id');
        $actionDelete->setFk('programacao_id');

        $this->datagrid->addAction($actionDelete);

		$this->datagrid->createModel();

        $this->pageNavigation = new TPageNavigation();
        $this->pageNavigation->setAction( new TAction( [ $this, "onReload" ] ) );
        $this->pageNavigation->setWidth( $this->datagrid->getWidth() );
		
        $container = new TVBox();
        $container->style = "width: 100%";
        $container->add( $this->form );
        $container->add( TPanelGroup::pack( NULL, $this->datagrid ) );
        $container->add( $this->pageNavigation );
		
        parent::add( $container );
    }

    function onReload()
    {
        TTransaction::open('database');

        $repository = new TRepository('ProgramacoesImagensRecord');

        $criteria = new TCriteria;

        $criteria->add(new TFilter('programacao_id', '=', filter_input(INPUT_GET, 'fk')));
        $cadastros = $repository->load($criteria);

        $this->datagrid->clear();

        if ($cadastros) {
            foreach ($cadastros as $cadastro) {
                $this->datagrid->addItem($cadastro);
            }
        }

        TTransaction::close();

        $this->loaded = true;
    }

    function onDelete($param)
    {
        $action = new TAction(array($this, 'Delete'));

        $action->setParameter('key', $param['key']);
        $action->setParameter('fk', $param['fk']);

        new TQuestion('Deseja realmente excluir o registro?', $action);
    }

    function Delete($param)
    {
        $key = $param['key'];

        TTransaction::open('database');

        $obj = new ProgramacoesImagensRecord($key);

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


    function onSave()
    {
        try {
            TTransaction::open('database');

            $cadastro = $this->form->getData('ProgramacoesImagensRecord');

            try {
				$this->form->validate();
				$source_file = 'tmp/' . $cadastro->arquivo;
                $extensao = pathinfo(strtolower($cadastro->arquivo), PATHINFO_EXTENSION);
				
				$extensoes = ['jpg', 'png', 'gif', 'jpeg'];
				if (in_array($extensao, $extensoes)) {
					if (file_exists($source_file)) {
						TTransaction::open('database');
						$cadastro->store();
						
						$nomearquivo = 'imagem_festadoboi_' . $cadastro->id . '.' . $extensao;
						$caminho = __DIR__ . '/../../../../posts/' . $nomearquivo;
						unset($cadastro->programacao_nome);
						
						rename($source_file, $caminho);
						$cadastro->arquivo = $nomearquivo;
						
						$cadastro->store();
						
						TTransaction::close();
						
						$param = array();
						$param ['fk'] = $cadastro->programacao_id;

						new TMessage("info", "Registro salvo com sucesso!");

						TApplication::gotoPage('ProgramacoesImagensDetalhe', 'onReload', $param);
					}
                } else {
                    $msg = 'Apenas arquivos PDF.';
                    $icone = 'error';
					new TMessage("error", "Apenas arquivos jpg!");
                }
			} catch(Exception $e) {
				new TMessage('error', $e->getMessage());
				TTransaction::rollback();
				$this->form->setData($cadastro);
			}

        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();

            $this->form->setData($cadastro);
        }

    }

    function onEdit($param)
    {
        try {
            if (isset($param['key'])) {

                $key = $param['key'];

                TTransaction::open('database');

                $obj = new ProgramacoesImagensRecord($key);

                $this->form->setData($obj);

                TTransaction::close();
            }

        } catch (Exception $e) {
            new TMessage('error', '<b>Error</b> ' . $e->getMessage());

            TTransaction::rollback();
        }
    }

    function show()
    {
        $this->onReload();
        parent::show();
    }

}