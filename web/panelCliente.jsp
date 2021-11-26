<%-- 
    Document   : panelCliente
    Created on : 05-09-2021, 21:52:25
    Author     : Felipe Fuentes
--%>
<%@page import="Modelo.HorarioReservaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.ReservaDAO"%>
<%@page import="Modelo.Reserva"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="es">
    <head>
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
            th{
                padding: 5px;
            }
            td{
                padding: 5px;
            }
            .login-box-body{
                width: fit-content;
                margin-top: 5%;
            }
            .login-logo{
                margin-top: 5%;
            }
        </style>
        <script type="text/javascript">
            if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
                location.reload();
            }
        </script>
       <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbarReservas.jsp" %>
        <div class="principal">
            <div align="center">
                <div class="login-logo">
                    <a href="#"><b>Restaurant</b>  Siglo XXI</a>
                </div>
                <div class="login-box-body ">
                    <p class="login-box-msg">RESERVAS</p>
                        <div>
                        <table>
                            <thead>
                                <tr>
                                    <th class="col-xs-2">N°</th>
                                    <th class="col-xs-2">FECHA RESERVA</th>
                                    <th class="col-xs-2">HORARIO RESERVA</th>
                                    <th class="col-xs-2">NÚMERO MESA</th>
                                    <th class="col-xs-2">OPCIONES</th>
                                </tr>
                            </thead>
                            <tbody id="prodReportTable">
                            <!--- Enumerar lista de reservas --->
                            <% 
                                int i = 1;
                            %>
                            <c:forEach var="dato" items="${datos}">
                                <tr>
                                    <td class="col-xs-2"><%= i %> <% i++; %></td>
                                    <td class="col-xs-2"><fmt:formatDate pattern="dd-MM-yyyy" value="${dato.getFecha_reserva()}"/></td>
                                    <td class="col-xs-2">${dato.getHorario_reserva()}</td>
                                    <td class="col-xs-2">${dato.getMesas_id_mesa()}</td>
                                    <td>
                                        <form role="form" action="Resv" method="POST">
                                            <input class="btn btn-primary btn-block btn-flat" type="hidden" name="id" value="${dato.getId_reserva()}">
                                            <input class="btn btn-primary btn-block btn-flat" type="submit" name="accion" onclick="confirmarCambios();" value="Cancelar">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <div>
                            <div class="col-xs-8">
                            </div>
                            <div class="col-xs-4">
                                <form class="form-botons" role="form" name="form" id="form" action="Resv" method="POST">
                                <div id="outer">
                                    <div class="inner">
                                        <input class="btn btn-primary btn-block btn-flat" type="submit" name="accion" value="Reservar">
                                    </div>
                                    <div class="inner">
                                        <button class="btn btn-primary btn-block btn-flat" type="submit" name="accion" value="ModificarVentana">Modificar perfil</button>
                                    </div>
                                    <div class="inner">
                                        <button class="btn btn-primary btn-block btn-flat" type="submit" onclick="loadForm();" name="accion" value="Salir">Salir</button>
                                    </div>
                                </div>
                                <input type="hidden" id="refresh" value="no">
                                </form>
                            </div>
                        </div>
                        <!--- Si no supera la validación, se indicará a través de un mensaje --->
                        <%     
                            if (request.getAttribute("ErrorCancelar") != (null) && (Boolean)request.getAttribute("ErrorCancelar") == true ){
                                out.print("<div style='text-align: center;'>"
                                        + "</br>"
                                        + "<p style='color: red'> La reserva no puede cancelarse. La fecha actual es muy cercana a la reserva agendada. Para más información enviar un correo a consultas@sigloxxi.cl. </p>"
                                        + "</div>"
                                );
                            }
                        %>
                </div>
            </div>
        </div>      
        <!-- jQuery 3 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Bootstrap 3.4.1 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>
        <!--- Funciones del archivo JSP --->
        <script>
            function confirmarCambios() {
                var respuesta=confirm("¿Estás seguro que deseas cancelar la reserva?");
                if (respuesta==true)
                  {
                    if (form.checkValidity()) {
                    }
                    else{
                        alert("La reserva no ha sido cancelada. Por favor volver a intentarlo.");
                    }
                    return true;
                  }
                else
                {
                    alert("La reserva no ha sido cancelada. Por favor volver a intentarlo.");
                    return false;
                }
            }
            function loadForm() {
                var respuesta=confirm("¿Estás seguro que deseas salir?");
                if (respuesta==true)
                  {
                    if (form.checkValidity()) {
                        window.close();
                    }
                    else{
                        alert("No se ha logrado cerrar la sesión.");
                    }
                    return true;
                  }
                else
                {
                    alert("No ha cerrado la sesión. Por favor volver a intentarlo.");
                    return false;
                }
            }
        </script>
        </div>
                <%@include file="/includes/footer.jsp"%>
    </body>
</html>
