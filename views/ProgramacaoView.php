<nav class="light-green darken-3">
  <div class="nav-wrapper">
    <div class="col s12">
      <a href="index.php" class="breadcrumb"><i style="margin-left:20px;" class="material-icons">home</i></a>
      <a href="index.php?page=Programacao" class="breadcrumb">Programação</a>
    </div>
  </div>
</nav>

<section>

  <?php
  require_once "controls/ProgramacaoControl.php";
  require_once "controls/ProgramacaoImagensControl.php";

  $objects = ProgramacaoControl::getData();

  $tabs = [];
  foreach ( $objects as $object ) {
    $data = date( "d/m", strtotime( $object["data_evento"] ) );
    $tabs[ $object["data_evento"] ] = $data;
  }
  ?>

  <div class="row">
    <div class="col s12">
      <div class="section scrollspy">
        <ul class="tabs tab-demo z-depth-1">

          <?php foreach ( $tabs as $key => $tab ): ?>
            <li class="tab col s3">
              <a href="#<?= str_replace( '/', '_', $tab ); ?>">
                <?=
                utf8_encode( substr( strftime( '%A - ', strtotime( $key ) ), 0, 3 ) ) . ' - ' .
                strftime( '%d/%m', strtotime( $key ) );
                ?>
              </a>
            </li>
          <?php endforeach; ?>

        </ul>
      </div>
    </div>

    <?php foreach ( $tabs as $tab ): ?>
      <?php $tab = str_replace( "/", "_", $tab ); ?>

      <div id="<?= $tab ?>" class="col s12">
        <ul class="collapsible" data-collapsible="accordion">

          <?php $objects = ProgramacaoControl::getData(); ?>
          <?php foreach( $objects as $object ): ?>
            <?php $format = date( "d/m", strtotime( $object["data_evento"] ) ); ?>
            <?php $data = str_replace( "/", "_", $format ); ?>
            <?php if ( $data == $tab ): ?>

              <li>
                <div class="collapsible-header itemtitlesize">
                  <i class="material-icons">today</i>
                  <h5> <?= $object["programa_nome"]; ?> </h5>
                </div>
                <div class="collapsible-body">
                  <div class="row">
                    <div class="col s12  l6">
                      <div class="intro-message left-align green-text text-darken-4 ">
                        <h5>Horário</h5>
                        <hr class="intro-divider"><a></a>
                      </div>
                      <span>
                        <b>
                          <?php

                          $inicio = date( "H:i", strtotime( $object["hora_inicio"] ) );
                          $fim    = date( "H:i", strtotime( $object["hora_fim"] ) );

                          if ( $fim != "00:00" ) {
                            echo $inicio . " às " . $fim;
                          } else {
                            echo $inicio;
                          }

                          ?>
                        </b>
                      </span><br>
                      <div class="intro-message left-align green-text text-darken-4 ">
                        <h5>Local</h5>
                        <hr class="intro-divider"><a></a>
                      </div>
                      <span><b> <?= $object["setor_nome"]; ?> </b></span><br> <?= $object["setor_descricao"]; ?> <br>
                      <div class="intro-message left-align green-text text-darken-4 ">
                        <h5>Sobre</h5>
                        <hr class="intro-divider"><a></a>
                      </div>
                      <span><b> <?= $object["descricao"]; ?> </b></span><br>
                    </div>
                    <div class="col s12 l6">
                      <div class="intro-message left-align green-text text-darken-4 ">
                        <h5>Fotos</h5>
                        <hr class="intro-divider"><a></a>
                      </div>
                      <?php $objects2 = ProgramacaoImagensControl::getData($object["id"]); ?>
                      <div class="slider">
                        <ul class="slides">
                          <?php if($objects2->rowCount() > 0): ?>
                            <?php foreach( $objects2 as $object2 ): ?>
                              <li>
                                <img<?php /*class="materialboxed" width="100%"*/ ?> data-caption="<?= $object2["descricao"]; ?>" src="posts/<?= $object2["arquivo"]; ?>">
                                <div class="caption right-align">
                                  <h5 class="light grey-text text-lighten-3"><?= $object2["descricao"]; ?></h5>
                                </div>
                              </li>
                            <?php endforeach; ?>
                          <?php else: ?>
                            <img class="materialboxed" data-caption="Sem fotos" width="100%" src="resources/app/img/no-photo.png" >
                          <?php endif; ?>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

            <?php endif; ?>
          <?php endforeach; ?>

        </ul>
      </div>

    <?php endforeach; ?>

  </div>

</section>
