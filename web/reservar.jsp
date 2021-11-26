<%-- 
    Document   : reservar
    Created on : 05-09-2021, 21:52:25
    Author     : Felipe Fuentes
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelo.MesaDAO"%>
<%@page import="Modelo.Mesa"%>
<%@page import="Modelo.Reserva"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ReservaDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link href="https://unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.10/css/AdminLTE.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/flat/blue.css  ">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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
            .logo{
                cursor: pointer;
                width: 100px;
                height: 100px;
            }
            #outer{                   
                width:100%;
                text-align: center;
            }
            .inner{
            display: inline-block;
            }
            #prodReportTable
            {
            }
            .table{
                align-content: center;
            }
            .btn{
                background-color: gold;
                color: black;
                border:black
            }
            
        </style>
         <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbarReservar2.jsp" %>
        <div class="principal">
            <div class="login-box">
                <div class="login-logo">
                    <a href="#"><b>Restaurant</b>  Siglo XXI</a>
                </div>
                <div class="login-box-body">
                    <p class="login-box-msg">Crear reserva</p>

                    <form role="form" action="Resv"  method="POST">
                        <div class="form-group">
                            <input class="form-control" type="date" name="fechaReserva" id="fechaReserva" placeholder="Fecha reserva" required>
                        </div>
                        <div class="form-group has-feedback">
                            <select class="form-control" id="horarioReserva" name="horarioReserva" required>
                            </select>
                        </div>
                        <div class="form-group has-feedback">
                            <select class="form-control" id="idMesa" name="idMesa" placeholder="Mesa" required>
                            </select>
                        </div>
                        <div class="col-xs-4">
                                <form class="form-botons" role="form" name="form" id="form" action="Resv" method="POST">
                                <div id="outer">
                                    <div class="inner">
                                        <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" value="Registrar">Registrar</button>
                                    </div>
                                    <div class="inner">
                                            <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" onclick="atras();">Volver</button>
                                    </div>
                                </div>
                                <input type="hidden" id="refresh" value="no">
                                </form>
                            </div>
                        </div>
                    </div>
                    </form>
                    
                <!--- Si no supera la validación, se indicará a través de un mensaje --->
                <%     
                    if (request.getAttribute("ErrorReservar") != (null) && (Boolean)request.getAttribute("ErrorReservar") == true ){
                        out.print("<div style='text-align: center;'>"
                                + "</br>"
                                + "<p style='color: red'> La reserva ya existe. Ingrese un horario y mesa que estén disponibles. </p>"
                                + "</div>"
                        );
                    }
                    if (request.getAttribute("errorData") != (null) && (Boolean)request.getAttribute("errorData") == true ){
                        out.print("<div style='text-align: center;'>"
                                + "</br>"
                                + "<p style='color: red'> Por favor escoger un horario y una mesa. </p>"
                                + "</div>"
                        );
                    }
                %>
                </div>
            </div>
        </div>
        <!-- jQuery 3 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <!-- AJAX que permite actualizar los combobox según fecha y horario para mostrar solo las mesas disponibles -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#horarioReserva').append('<option value="0">Selecciona un horario</option>');
                $('#idMesa').append('<option value="0">Selecciona una mesa</option>');
                
                $('#fechaReserva').change(function () {
                    $('#horarioReserva').find('option').remove();
                    $('#horarioReserva').append('<option value="0">Selecciona un horario</option>');
                    $('#idMesa').find('option').remove();
                    $('#idMesa').append('<option value="0">Selecciona una mesa</option>');
                    
                    $.ajax({
                    url: "MesasDisponibles",
                    method: "GET",
                    data: {operation: 'horarioReserva'},
                    success: function (data, textStatus, jqXHR) {
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#horarioReserva').append('<option value="' + value.id_horario_reserva + '">' + value.horario_reserva + '</option>')
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#horarioReserva').find('option').remove();
                        $('#horarioReserva').append('<option value="0">Horarios no disponibles</option>');
                    },
                    cache: false
                    });
                });                 
                
                $('#horarioReserva').change(function () {
                    $('#idMesa').find('option').remove();
                    $('#idMesa').append('<option value="0">Selecciona una mesa</option>'); 

                    let hid = $('#horarioReserva').val();
                    let fid = $('#fechaReserva').val();
                    let data = {
                        operation: "idMesa",
                        id_horario_reserva: hid,
                        fecha_reserva: fid
                    };
                    $.ajax({
                        url: "MesasDisponibles",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            let obj = $.parseJSON(data);
                            console.log(obj);
                            if(obj.length === 0){
                                $('#idMesa').find('option').remove();
                                $('#idMesa').append('<option value="0">Mesas no disponibles</option>');
                            }else{
                                $('#idMesa').find('option').remove();
                                $.each(obj, function (key, value) {
                                $('#idMesa').append('<option value="' + value.id_mesa + '">Mesa N° ' + value.id_mesa + '</option>')
                            });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#idMesa').find('option').remove();
                            $('#idMesa').append('<option value="0">Mesas no disponibles</option>');
                        },
                        cache: false
                    });
                });
            });
        </script>
        <!-- Bootstrap 3.3.7 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>
        <!--- Funciones del archivo JSP --->
        <script language="javascript">
            function atras(){history.back();}
            
            var now = new Date(),
            // minimum date the user can choose, in this case now and in the future
            minDate = now.toISOString().substring(0,10);
            $('#fechaReserva').prop('min', minDate);
            
            Date.prototype.addDays = function(days) {
                var date = new Date(this.valueOf());
                date.setDate(date.getDate() + days);
                return date;
            }
            
            var future = new Date(),
            // minimum date the user can choose, in this case now and in the future
            maxDate = future.addDays(90).toISOString().substring(0,10);

            $('#fechaReserva').prop('max', maxDate);
        </script> 
        <!--- Función para validar el Rut --->
        <script>
            function checkRut(rut) {
                // Despejar Puntos
                var valor = rut.value.replace('.', '');
                // Despejar Guión
                valor = valor.replace('-', '');

                // Aislar Cuerpo y Dígito Verificador
                cuerpo = valor.slice(0, -1);
                dv = valor.slice(-1).toUpperCase();

                // Formatear RUN
                rut.value = cuerpo + '-' + dv

                // Si no cumple con el mínimo ej. (n.nnn.nnn)
                if (cuerpo.length < 7) {
                    rut.setCustomValidity("RUT incompleto");
                    return false;
                }
                
                // Si no posee caracteres
                if (cuerpo.length = 0) {
                    rut.setCustomValidity("Ingresar RUT");
                    return false;
                }

                // Calcular Dígito Verificador
                suma = 0;
                multiplo = 2;

                // Para cada dígito del Cuerpo
                for (i = 1; i <= cuerpo.length; i++) {

                    // Obtener su Producto con el Múltiplo Correspondiente
                    index = multiplo * valor.charAt(cuerpo.length - i);

                    // Sumar al Contador General
                    suma = suma + index;

                    // Consolidar Múltiplo dentro del rango [2,7]
                    if (multiplo < 7) {
                        multiplo = multiplo + 1;
                    } else {
                        multiplo = 2;
                    }

                }

                // Calcular Dígito Verificador en base al Módulo 11
                dvEsperado = 11 - (suma % 11);

                // Casos Especiales (0 y K)
                dv = (dv == 'K') ? 10 : dv;
                dv = (dv == 0) ? 11 : dv;

                // Validar que el Cuerpo coincide con su Dígito Verificador
                if (dvEsperado != dv) {
                    rut.setCustomValidity("RUT Inválido");
                    return false;
                }

                // Si todo sale bien, eliminar errores (decretar que es válido)
                rut.setCustomValidity('');
            }
        </script>
    </body>
</html>
