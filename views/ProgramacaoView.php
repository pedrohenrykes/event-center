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
                  substr( strftime( '%A - ', strtotime( $key ) ), 0, 3 ) . ' - ' .
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
                      <span><b> <?= date( "H:i", strtotime( $object["hora_inicio"] ) ) . " às " . date( "H:i", strtotime( $object["hora_fim"] ) ); ?> </b></span><br>
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
                      <img class="materialboxed" width="100%" src="resources/app/img/no-photo.png" >
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
