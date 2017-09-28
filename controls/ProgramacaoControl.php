<?php

class ProgramacaoControl
{
    public function getData()
    {
          $conn = Connection::open();

          foreach ( $objects as $object ) {

              $sql = "SELECT $object->quantifier FROM $object->dataview";

              $result = $conn->query( $sql, PDO::FETCH_OBJ );

              foreach ( $result as $row ) {
                  $object->quantifier = $row->amount;
              }

              $this->mountDashboard( $object );
          }
    }
}
