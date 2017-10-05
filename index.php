<?php require_once "controller.php"; ?>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	<title>Festa do Boi 2017</title>
    <link rel="icon" type="image/x-icon" href="resources/app/img/favicon.ico" sizes="16x16">
    <?php setStyles(); ?>
    <!-- Let browser know website is optimized for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <body>
  <?php setHeader(); ?>

    <main class="container section no-pad-bot">
      <?php setMain( isset( $_GET["page"] ) ? $_GET["page"] : NULL ); ?>
    </main>

  <?php setFooter(); ?>
  <?php setScripts(); ?>
  </body>
</html>
