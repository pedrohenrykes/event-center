<!DOCTYPE html>
<html>
<head>
  <link rel="icon" type="image/x-icon" href="resources/application/img/favicon.ico" sizes="16x16">
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="resources/materialize/css/materialize.min.css"  media="screen,projection"/>
  <!--Applicatio CSS-->
  <link type="text/css" rel="stylesheet" href="resources/application/css/app.css"  media="screen,projection"/>

  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<body>

  <header>

    <nav class="light-green darken-3">
      <div class="container nav-wrapper">
        <a href="index.php" class="brand-logo change-logo">Festa do Boi 2017</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
          <li><a href="#!" class="breadcrumb"><i style="margin-left:20px;" class="material-icons">home</i></a></li>
          <li><a href="index.php">Programação</a></li>
          <li><a href="index.php">Sobre a festa</a></li>
        </ul>
        <ul class="side-nav" id="mobile-demo">
          <li><a href="#!" class="breadcrumb"><i class="material-icons">home</i></a></li>
          <li><a href="index.php">Programação</a></li>
          <li><a href="index.php">Sobre a festa</a></li>
        </ul>
      </div>
    </nav>

  </header>

  <main class="container section no-pad-bot">

    <nav class="light-green darken-3">
      <div class="nav-wrapper">
        <div class="col s12">
          <a href="#!" class="breadcrumb"><i style="margin-left:20px;" class="material-icons">home</i></a>
          <a href="#!" class="breadcrumb">Programação</a>
        </div>
      </div>
    </nav>

    <section>

      <ul class="collapsible" data-collapsible="accordion">
        <li>
          <div class="collapsible-header itemtitlesize">
            <i class="material-icons">today</i>
            <h5>Exposição de caprinos</h5>
          </div>
          <div class="collapsible-body">
            <div class="row">
              <div class="col s12  l6">
                <div class="intro-message left-align green-text text-darken-4 ">
                  <h5>Local</h5>
                  <hr class="intro-divider"><a></a>
                </div>
                <span><b>LOCAL: </b>Setor 7</span><br>
                <span><b>HORÁRIO: </b>8h00 às 9h00</span><br>
                <span><b>ORGANIZADOR: </b>SENAR</span><br>
                <div class="intro-message left-align green-text text-darken-4 ">
                  <h5> Contatos </h5>
                  <hr class="intro-divider"><a></a>
                </div>
                <span><b>EMAIL:</b></span><br>
                <span><b>TELEFONE:</b>(84)3232-2526</span><br><br>
              </div>
              <div class="col s12 l6">
                <iframe width="100%" height="300" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDP-2IdhwwOkR8O0JkKdQQkr_plYsEcZ_Y&#10;&amp;q=-5.776491,-35.205452" allowfullscreen=""></iframe>
              </div>
            </div>
          </div>
        </li>

        <!--<li>
          <div class="collapsible-header itemtitlesize">
            <i class="material-icons">today</i>
            <h5>Exposição de bovinos</h5>
          </div>
          <div class="collapsible-body">
            Teste
          </div>
        </li>-->
      </ul>

    </section>

  </main>

  <footer class="page-footer light-green darken-3">

    <div class="row">
      <div class="container">
        <div class="col l6 s12">
          <h5 class="white-text">55ª Edição da Festa do Boi</h5>
          <p class="grey-text text-lighten-4">O maior evento do setor agropecuário do nordeste e, uma das principais festas populares e feiras de negócios do Rio Grande do Norte.</p>
        </div>
        <div class="col l4 offset-l2 s12">
          <h5 class="white-text">Redes Sociais</h5>
          <ul>
            <li>
              <!--<a target="_blank" href="http://cerescidadao.rn.gov.br"></a>-->
              <a target="_blank" href="https://pt-br.facebook.com/festadoboishowspage/"><img height="50px" src="resources/application/img/facebook.png" alt=""></a>
              <a target="_blank" href="#"><img height="50px" src="resources/application/img/instagram.png" alt=""></a>
              <a target="_blank" href="#"><img height="50px" src="resources/application/img/twitter.png" alt=""></a>
              <a target="_blank" href="#"><img height="50px" src="resources/application/img/youtube.png" alt=""></a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="footer-copyright">
      <div class="container">
        <b>Copyright</b> © 2017 <b>e-Code</b>. Todos os Direitos Reservados.
        <!--<a class="grey-text text-lighten-4 right" href="#!">More Links</a>-->
      </div>
    </div>

  </footer>

  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="resources/materialize/js/materialize.min.js"></script>
  <!--Application JS-->
  <script type="text/javascript" src="resources/application/js/app.js"></script>

</body>
</html>
