<nav class="light-green darken-3">
  <div class="nav-wrapper">
    <div class="col s12">
      <a href="index.php" class="breadcrumb"><i style="margin-left:20px;" class="material-icons">home</i></a>
      <a href="index.php?page=Programacao" class="breadcrumb">Programação</a>
    </div>
  </div>
</nav>

<section>
  <ul class="collapsible" data-collapsible="accordion">

  <?php

  require_once "controls/ProgramacaoControl.php";

  $objects = ProgramacaoControl::getData();

  ?>

  <?php if ( !empty( $objects ) ) { ?>
    <?php  foreach( $objects as $object ) { ?>
      <li>
        <div class="collapsible-header itemtitlesize">
          <i class="material-icons">today</i>
          <h5> <?= $object["programa_nome"]; ?> </h5>
        </div>
        <div class="collapsible-body">
          <div class="row">
            <div class="col s12  l6">
              <div class="intro-message left-align green-text text-darken-4 ">
                <h5>Informações</h5>
                <hr class="intro-divider"><a></a>
              </div>
              <span><b>LOCAL: </b> <?= $object["setor_nome"]; ?> </span><br>
              <span><b>HORÁRIO: </b> <?= $object["horario"]; ?> </span><br>
              <div class="intro-message left-align green-text text-darken-4 ">
                <h5>Sobre</h5>
                <hr class="intro-divider"><a></a>
              </div>
              <span> <?= $object["descricao"]; ?> </span><br>
            </div>
            <div class="col s12 l6">
              <iframe width="100%" height="300" frameborder="0" style="border:0" src="http://www.hotel-r.net/im/hotel/es/el-parque-13.png" allowfullscreen=""></iframe>
            </div>
          </div>
        </div>
      </li>
    <?php } ?>
  <?php } ?>

  </ul>
</section>
