<?php
    session_id("sesion-act");
    session_name("AULA_CW");


    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>        
    <meta charset="UTF-8">
    <meta name="author" content="Meta Hackers"><!--To be Decided-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Aula Virtual para alumnos de la Escuela Nacional Preparatoria Plantel 6: 'Antonio Caso'"><!---->    
    <meta name="keywords" content="Aula Virtual, ENP6, COYO-ROOM"><!---->
    <title>Lobby</title><!---->
    <!-- Añadir icono -->
    <script src="https://kit.fontawesome.com/a6b650041d.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">    
    <link rel="stylesheet" href="../../../statics/styles/styles_lobby.css">
    <!-- <link rel="stylesheet" href="./libs/css/bootstrap.css.map"> -->        

</head>
<body class="contenedorUniversal">

    <header class="barraSuperior">
        <nav id="nav_sup">
            <!-- <a href=""> -->
            <div class="nav_IconContent" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" >
                   multi
            </div>
            <!-- </a> -->
            <a href="">
                <div class="nav_TextContent">
                    En clase
                </div>
            </a>
            <a href="">
                <div class="nav_IconContent">
                    N
                </div>
            </a>
            <a href="">
                <div class="nav_TextContent">
                    Recordatorios
                </div>
            </a>
            <a href="">
                <div class="nav_IconContent">
                    P
                </div>
            </a>
        </nav>        
    </header>
    
    <main class="main">
        <section id="left_sect" class="barraLateral" class="aside"> 
            <div id="latprueba">  

                <!-- expansión del menú -->
                <div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
                    <div class="offcanvas-header">
                      <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Offcanvas with body scrolling</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    
                    <div id="menuDiv">
                      <ul class="aside_ul2" >
                        <a href="./lobby.php">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Menú principal</div>
                            </li>
                        </a>             
                        <a href="">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Mis aulas</div>
                            </li>
                        </a>     
                        <a href="">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Cámara de materiales</div>
                            </li>
                        </a>  
                        <a href="">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Foro</div>
                            </li>
                        </a>
                        <a href="../videojuego/Esa_es_la_Question.php">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Mis juegos</div>
                            </li>
                        </a>
                        <a href="./CALENDARIO/calendario.php">
                            <li class="aside_li">
                                <div class="aside_li_cuadros">Calendario</div>
                            </li>                    
                        </a>
                      </ul>
                      <ul class="aside_ul_EXTRA" >
                        <a href="">
                            <li class="aside_li_EXTRA">
                                <div class="aside_li_cuadros">Biblioteca</div> <!--BiblioTeca -->
                            </li>
                        </a>
                        <a href="">
                            <li class="aside_li_EXTRA">
                                <div class="aside_li_cuadros">Aulas</div>
                            </li>                                     
                        </a>
                      </ul>
                    </div> <!--cierra div menu-->
            
                </div> 
                
                <ul class="aside_ul" >
                    <a href="./lobby.php">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">m</div> <!--MULTI BLOCK -->
                        </li>
                    </a>             
                    <a href="">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">a</div><!--AULAS-->
                        </li>
                    </a>     
                    <a href="">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">c</div><!--CAMMAT-->
                        </li>
                    </a>  
                    <a href="">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">f</div><!--FORO-->
                        </li>
                    </a>
                    <a href="../videojuego/Esa_es_la_Question.php">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">J</div><!--JUEGOS-->
                        </li>
                    </a>
                    <a href="./CALENDARIO/calendario.php">
                        <li class="aside_li">
                            <div class="aside_li_cuadros">C</div><!--CALENDARIO-->
                        </li>                    
                    </a>
                </ul>
                <ul class="aside_ul_EXTRA" >
                    <a href="">
                        <li class="aside_li_EXTRA">
                            <div class="aside_li_cuadros">b</div> <!--BiblioTeca -->
                        </li>
                    </a>
                    <a href="">
                        <li class="aside_li_EXTRA">
                            <div class="aside_li_cuadros">a</div><!--AULAS-->
                        </li>                                     
                    </a>
                </ul>  
            </div>           
        </section> 

        <section id="right_sect">

<!-- Quitar al final -->
        <?php
            $ID = $_SESSION["ID_U"];
            $name = $_SESSION["nombre"];
            $apodo = $_SESSION["apodo"];
            $id_TU = $_SESSION["ID_TU"];
            $tipo_user = $_SESSION["tipo_U"];
            $id_grado = $_SESSION["grado"];            
            
            echo "
                    <div id=contDatosHidden style='display: fixed'>
                        <input id='userH_id' disabled value='$ID'>
                        <input id='userH_name' disabled value='$name'>
                        <input id='userH_apodo' disabled value='$apodo'>
                        <input id='userH_idTU' disabled value='$id_TU'>
                        <input id='userH_tipo' disabled value='$tipo_user'>
                        <input id='userH_grado' disabled value='$id_grado'>            
                    </div>
                ";        
        ?>


            <div id="multiBlock" class="sec_multiBlock" class="secciones_Lobby">
                <!-- <article></article>
                <article>HOLKJIASHDFAI IASDHFOA8ISD IAUHFA9BFA IFHASD AIRUHADUFB ASDINA9SUDHGFAIRW POAWI BNFWIEH9 ERB G39JQ'W OWAH9RGQ</article>             -->
                <div id="calendario" class="multiBlocks"><a href="./CALENDARIO/calendario.php"><span>CALENDARIO</span></a></div>
                
                
                <!-- No se si es el link correcto :0 -->
                <div id="aulas" class="multiBlocks"><a href="./AULAS/aulas.php"><span>Mis Aulas</span></a></div>
                <div id="perfil" class="multiBlocks"><a href=""><span>Mi Perfil</span></a></div>
                <div id="juegos" class="multiBlocks"><a href="../videojuego/Esa_es_la_Question.php"><span>Mis Juegos</span></a></div>
                <div id="foro" class="multiBlocks"><a href=""><span>Foro</span></a></div>
                <div id="descubre" class="multiBlocks"><a href=""><span>Descubre</span></a></div>
                
            </div>

            </div>
            <div id="sec_efemerides" class="secciones_Lobby">
                <h1>Efemerides</h1>
            </div>
            <h1 id="title_ANA">ANA</h1>
            <div id="sec_avisos" class="secciones_Lobby">
                <h1>AVISOS</h1>
            </div>
            <div id="sec_noticias" class="secciones_Lobby">
                <h1>NOTICIAS</h1>
            </div>
            <div id="sec_anuncios" class="secciones_Lobby">
                <h1>ANUNCIOS</h1>
            </div>
            <div id="sec_ayuda" class="secciones_Lobby">
                <h1>AYUDA</h1>
            </div>
            <div id="sec_clubes" class="secciones_Lobby">
                <h1>CLUBES</h1>
            </div>

        </section>        
    </main>
    
    <footer class="footer">
        FOOTER
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>