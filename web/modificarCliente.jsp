<%-- 
    Document   : modificarUsuario
    Created on : 05-09-2021, 21:52:25
    Author     : Felipe Fuentes
--%>

<%@page import="Modelo.ClienteDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!--- Recuperar datos de la sesión --->
    <%
        ClienteDAO clDAO = new ClienteDAO();
        String sessionNombre = "";
        String sessionPapellido = "";
        String sessionSapellido = "";
        int sessionTelefono = 9;
        String sessionDireccion = "";
        String sessionEmail = "";
        String sessionMensaje = "";

        HttpSession sessionHtml = request.getSession(true); // reusar
        sessionNombre = (String)sessionHtml.getAttribute("nombre");
        String sessionPass = (String)sessionHtml.getAttribute("password");
        sessionPapellido = (String)sessionHtml.getAttribute("papellido");
        sessionSapellido = (String)sessionHtml.getAttribute("sapellido");
        sessionTelefono = (Integer) sessionHtml.getAttribute("telefono");
        sessionDireccion = (String)sessionHtml.getAttribute("direccion");
        sessionEmail = (String)sessionHtml.getAttribute("email");
        sessionMensaje = (String)sessionHtml.getAttribute("mensaje");
    %>
<!DOCTYPE html>
<html lang="es">
    <head>
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
            #outer{                   
                width:100%;
                text-align: center;
            }
            .inner{
            display: inline-block;
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
                    <p class="login-box-msg">Modificar cuenta</p>
                    <form role="form" id="form" action="ClienteServlet" method="POST">
                        <div class="form-group has-feedback">
                            <input class="form-control" type="email" name="emailNuevo" id="emailNuevo" value="<%out.print(clDAO.traerCliente(sessionEmail).getEmail_cliente());%>" placeholder="Email">
                            <!--<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarEmail()">--->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="password" name="password" id="password" placeholder="Contraseña actual">
                            <!---<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarPass()">--->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" id="passwordNueva" type="password" name="passwordNueva" placeholder="Nueva contraseña">
                            <!---<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarPassNueva()">---->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="text" name="nombre" id="nombre" value="<%=sessionNombre%>" placeholder="Nombre">
                            <!--<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarNombre()">-->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="text" name="primerApellido" id="primerApellido" value="<%=sessionPapellido%>" placeholder="Apellido paterno">
                            <!--<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarPApellido()">--->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="text" name="segundoApellido" id="segundoApellido" value="<%=sessionSapellido%>" placeholder="Apellido materno">
                            <!--<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarSApellido()">--->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="text" name="telefono" id="telefono" value="<%=sessionTelefono%>" placeholder="Teléfono">
                            <!---<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarTelefono()">--->
                        </div>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="text" name="direccion" id="direccion" value="<%=sessionDireccion%>" placeholder="Dirección">
                            <!---<input class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=limpiarDireccion()">--->
                        </div>
                        <div class="row">
                            <form class="form-botons" role="form" name="form" id="form" action="Resv" method="POST">
                            <div id="outer">
                            <div class="inner">
                                <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" onclick="{return confirmarCambios();}" value="ModificarC">Modificar</button>
                            </div>
                            <div class="inner">
                                <button class="btn btn-primary btn-block btn-flat" type="reset" onClick="return a=resetForm()">Limpiar todo</button>
                            </div>
                            <div class="inner">
                                <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" onclick="atras();">Volver</button>
                            </div>
                            </form>
                            </div>
                        </div>
                <!--- Si no supera la validación, se indicará a través de un mensaje --->
                <%     
                    if (request.getAttribute("ErrorModificar") != (null) && (Boolean)request.getAttribute("ErrorModificar") == true ){
                        out.print("<div style='text-align: center;'>"
                                + "</br>"
                                + "<p style='color: red'> Contraseña incorrecta. Por favor ingrese su contraseña actual. </p>"
                                + "</div>"
                        );
                    }
                %>

            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Bootstrap 3.4.1 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.15/js/adminlte.min.js"></script>
        <!--- Validación de los campos ingresados --->
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
        <script>
            $('#form').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    emailNuevo: {
                        validators: {
                            stringLength: {
                                min: 3,
                                message: 'El correo puede tener un máximo de 100 caracteres.',
                                max: 100
                            },
                            notEmpty: {
                                message: 'Ingresar correo electrónico.'
                            },
                            emailAddress: {
                                message: 'Ingresar correo electrónico con el formato correcto. Recuerda que este debe llevar un símbolo "@".'
                            }
                        }
                    },
                    password: {
                        validators: {
                            stringLength: {
                                min: 8,
                                message: 'La cantidad de caracteres debe ser superior o igual a 8 y no sobrepasar los 30.',
                                max: 30
                            },
                            regexp: {
                                regexp: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/,
                                message: 'El formato debe llevar tanto mayúsculas como minúsculas, además de al menos un número.'
                            },
                            notEmpty: {
                                message: 'Por favor ingresar contraseña actual.'
                            }
                        }
                    },
                    passwordNueva: {
                        validators: {
                            stringLength: {
                                min: 8,
                                message: 'La cantidad de caracteres debe ser superior o igual a 8 y no sobrepasar los 30.',
                                max: 30
                            },
                            regexp: {
                                regexp: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/,
                                message: 'El formato debe llevar tanto mayúsculas como minúsculas, además de al menos un número.'
                            },
                            notEmpty: {
                                message: 'Por favor ingresar nueva contraseña.'
                            }
                        }
                    },
                    nombre: {
                        validators: {
                            stringLength: {
                                min: 1,
                                message: 'El nombre supera la cantidad de caracteres.',
                                max: 30
                            },
                            notEmpty: {
                                message: 'Por favor ingresar nombre.'
                            }
                        }
                    },
                    primerApellido: {
                        validators: {
                            stringLength: {
                                min: 1,
                                message: 'El apellido supera la cantidad de caracteres.',
                                max: 30
                            },
                            notEmpty: {
                                message: 'Por favor ingresar apellido.'
                            }
                        }
                    },
                    segundoApellido: {
                        validators: {
                            stringLength: {
                                min: 1,
                                message: 'El apellido supera la cantidad de caracteres.',
                                max: 30
                            },
                            notEmpty: {
                                message: 'Por favor ingresar apellido.'
                            }
                        }
                    },
                    telefono: {
                        validators: {
                            regexp: {
                                regexp: /^(9)(\s?)[987654321]\d{7}$/,
                                message: 'El número debe ser antepuesto por un 9. Ejemplo: 912345678'
                            },
                            notEmpty: {
                                message: 'Por favor ingresar número telefónico'
                            }
                        }
                    },
                    direccion: {
                        validators: {
                            stringLength: {
                                min: 1,
                                message: 'La dirección del domicilio supera el límite de caracteres.',
                                max: 100
                            },
                            notEmpty: {
                                message: 'Por favor ingresar dirección de su domicilio.'
                            }
                        }
                    }
                }
            });
        </script>
        <!--- Funciones del archivo JSP --->
        <script>
            function atras(){history.back();}

            function resetForm() {
                document.getElementById("emailNuevo").value="";
                document.getElementById("password").value="";
                document.getElementById("passwordNueva").value="";
                document.getElementById("nombre").value="";
                document.getElementById("primerApellido").value="";
                document.getElementById("segundoApellido").value="";
                document.getElementById("telefono").value="";
                document.getElementById("direccion").value="";
                return false;
            }
            
            function limpiarEmail(){
                document.getElementById("emailNuevo").value="";
                return false;
            }
            
            function limpiarPass(){
                document.getElementById("password").value="";
                return false;
            }
            
            function limpiarPassNueva(){
                document.getElementById("passwordNueva").value="";
                return false;
            }
            
            function limpiarNombre(){
                document.getElementById("nombre").value="";
                return false;
            }
            
            function limpiarPApellido(){
                document.getElementById("primerApellido").value="";
                return false;
            }
            
            function limpiarSApellido(){
                document.getElementById("segundoApellido").value="";
                return false;
            }
            
            function limpiarTelefono(){
                document.getElementById("telefono").value="";
                return false;
            }
            
            function limpiarDireccion(){
                document.getElementById("direccion").value="";
                return false;
            }
            
            function confirmarCambios() {
                var respuesta=confirm("¿Estás seguro que deseas modificar tus datos?");
                if (respuesta==true)
                  {
                    if (form.checkValidity()) {
                    }
                    else{
                        alert("Los cambios no han sido aplicados. Por favor volver a intentarlo.");
                    }
                    return true;
                  }
                else
                {
                    alert("Los cambios no han sido aplicados. Por favor volver a intentarlo.");
                    return false;
                }
            }
        </script>
    </body>
</html>
