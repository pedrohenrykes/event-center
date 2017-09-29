<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" type="image/x-icon" href="resources/app/img/favicon.ico" sizes="16x16">
    <?= file_get_contents( "resources/app/html/styles.html" ); ?>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <body>
  <?= file_get_contents( "resources/app/html/header.html" ); ?>

    <main class="container section no-pad-bot">
      <?php

      if ( isset( $_GET["page"] ) &&  file_exists( "views/{$_GET["page"]}View.php" ) ) {
          require_once "views/{$_GET["page"]}View.php";
      } else {
          require_once "views/ProgramacaoView.php";
      }

      ?>
    </main>

  <?= file_get_contents( "resources/app/html/footer.html" ); ?>
  <?= file_get_contents( "resources/app/html/scripts.html" ); ?>
  </body>
</html>
