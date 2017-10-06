<?php

date_default_timezone_set( "America/Recife" );

$MenuOptions = [
    "Programação" => "Programacao",
    "Sobre a festa" => "Sobre"
];

function setMain( $page )
{
    if ( !empty( $page ) &&  file_exists( "views/{$page}View.php" ) ) {
        require_once "views/{$page}View.php";
    } else {
        require_once "views/HomeView.php";
    }
}

function setHeader()
{
    global $MenuOptions;

    $header = file_get_contents( "resources/app/html/header.html" );

    $options = "";
    foreach ( $MenuOptions as $page => $option ) {
       $options .= '<li><a href="index.php?page='.$option.'">'.$page.'</a></li>';
    }

    $header = str_replace( "{OPTIONS}", $options, $header );

    echo $header;
}

function setFooter()
{
    echo file_get_contents( "resources/app/html/footer.html" );
}

function setStyles()
{
    echo file_get_contents( "resources/app/html/styles.html" );
}

function setScripts()
{
    echo file_get_contents( "resources/app/html/scripts.html" );
}
