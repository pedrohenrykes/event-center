<?php

require_once "database/Connection.php";

class ProgramacaoImagensControl
{
    public static function getData($id)
    {
        try {

            $conn = Connection::open( "database" );

            $objects = $conn->query('
            SELECT arquivo, descricao
			FROM programacoes_imagens
			WHERE programacao_id = ' . $id .'
			ORDER BY id DESC
			LIMIT 30;
            ');
			return $objects;
			//$objects->bindParam(':progid', $id, PDO::PARAM_INT);

            //return $objects->fetchAll(PDO::FETCH_ASSOC);

        } catch ( Exception $e ) {

            echo "ERROR" . $e->getMessage();

            return NULL;

        }
    }
}
