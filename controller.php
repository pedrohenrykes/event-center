<?php

class PageController
{
    public static function setContent( $content, $main )
    {
        $content = "views/" . $content . ".php";

        if ( file_exists( $content ) ) {
            return str_replace( "{CONTENT}", file_get_contents( $content ), $main );
        } else {
            return str_replace( "{CONTENT}", file_get_contents( "views/ProgramacaoView.php" ), $main );
        }
    }
}
