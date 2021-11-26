<%-- 
    Document   : Inicio
    Created on : 05-11-2021, 0:04:40
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', function () {
                history.pushState(null, null, document.URL);
            });
        </script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Siglo XXI</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.10/css/AdminLTE.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/flat/blue.css  ">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <!--- Configuraciones específicas para este JSP --->
        <style>
            body{
                background-image: url('././images/fondo_restaurante.jpg');
                background-repeat: no-repeat,no-repeat;
                background-position: center center,center center;
                background-size: cover,cover;

            }
            .principal{
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.55);
                position: absolute;

            }
            .login-logo a{
                color: white!important;

            }
            .login-box{
                margin-top: 14%;
            }
        </style>
    </head>
    <body>
        <div class="principal">
            <div class="login-box " >
                <div class="login-logo">
                    <a href="#"><b>Restaurant</b>  Siglo XXI</a>
                </div>
                <div class="login-box-body">
                    <p class="login-box-msg">¿Desa comprar o visualizar las reservas?</p>
                    
                             <form class="form-botons" role="form" action="Resv" method="POST">
                                 <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" value="MenuComprar">Comprar</button>
                                    <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" value="PanelCliente">Reservas</button>
                                </form>
                        </div>
                </div>
            </div>
    </body>
</html>
