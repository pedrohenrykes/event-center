<?php

require_once "database/Connection.php";

class ProgramacaoControl
{
    public static function getData()
    {
        try {

            $conn = Connection::open( "database" );

            $objects = $conn->query('
            SELECT pr.id AS id,
            	     pr.nome AS programa_nome,
                   pr.data_evento AS data_evento,
                   pr.hora_evento AS hora_evento,
                   pr.descricao AS descricao,
                   lo.id AS local_id,
                   lo.nome AS local_nome,
            	     se.id AS setor_id,
                   se.nome AS setor_nome
            FROM programacoes pr
            JOIN setores se ON se.id = setor_id
            JOIN locais lo ON lo.id = se.local_id
            ORDER BY data_evento
            ');

            return $objects;

        } catch ( Exception $e ) {

            echo "ERROR" . $e->getMessage();

            return NULL;

        }
    }
}
