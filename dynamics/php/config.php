<?php
    define("DBHOST", "localhost");
    define("DBUSER", "root");
    define("PASSWORD", "");
    define("DB", "pruebaula_cw");

    function connect()
    {
        $conexion = mysqli_connect(DBHOST, DBUSER, PASSWORD, DB);
        //var_dump($conexion);
        if(!$conexion)
        {
            mysqli_error();
            echo "No se pudo conectar a la base";
        }
        return $conexion;
    }


?>