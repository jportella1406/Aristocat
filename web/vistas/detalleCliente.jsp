

<%@page import="Modelo.Cliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="Config.Utils"%>
<%@ page import="java.util.List" %>
<%-- 
   Document   : index
   Created on : 31 feb 6666, 66:66:66
   Author     : Starlord
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Editar Cita");
    request.setAttribute("descripcionPagina", "Editar la Cita seleccionad");
    HttpSession usuario = request.getSession(false);
    System.out.println("usuario: " + usuario);
    if (usuario == null || usuario.getAttribute("username") == null) {
        response.sendRedirect("/principal/Principal.jsp");
    }
%>
<jsp:include page="/includes/Head.jsp" />
<jsp:include page="/includes/menu.jsp" />
<div class="container">
    <div class="form-control">
        <%
            ClienteDAO oED = new ClienteDAO();
            int codigo = Integer.parseInt((String) request.getAttribute("codcliente"));
            Cliente oE = (Cliente) oED.list(codigo);
        %>
        <div class="row">
            <div class="col-md-12">
                <Center><h1>DETALLE DE CLIENTE</h1></Center>
            </div>
        </div>
        <form action="Controlador">
            <div class="row">
                <div class="col-md-6">
                    <span for="txtClienteId">ID|CLIENTE:</span>
                    <input disabled class="form-control" type="text" name="txtClienteId" value="<%= oE.getClienteId()%>">
                </div>
                <div class="col-md-6">
                    NOMBRE:
                    <input disabled class="form-control" type="text" name="txtNombre" value="<%= oE.getNombre()%>">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    APELLIDO:
                    <input disabled class="form-control" type="text" name="txtApellido" value="<%= oE.getApellido()%>">
                </div>
                <div class="col-md-6">
                    CORREO:
                    <input disabled class="form-control" type="text" name="txtEmail" value="<%= oE.getEmail()%>">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    TELEFONO:
                    <input disabled class="form-control" type="text" name="txtTelefono" value="<%= oE.getTelefono()%>">
                </div>
                <div class="col-md-6">
                    DIRECCION:
                    <input disabled class="form-control" type="text" name="txtDireccion" value="<%= oE.getDireccion()%>">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    FECHA|REGISTRO:
                    <input disabled class="form-control" type="text" name="txtFechaRegistro" value="<%= Utils.formatoDate(oE.getFechaRegistro())%>">
                </div>
                <div class="col-md-6">
                    ESTADO:
                    <input disabled class="form-control" type="text" name="txtEstado" value="<%= oE.getEstado()%>">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    TIPO|DOCUMENTO:
                    <input disabled class="form-control" type="text" name="txtTipoDocumento" value="<%= oE.getTipoDocumento()%>">
                </div>
                <div class="col-md-6">
                    DOCUMENTO:
                    <input disabled class="form-control" type="text" name="txtDocumento" value="<%= oE.getDocumento()%>">
                </div>
            </div>
            <input type="hidden" name="txtClienteId" value="<%= oE.getClienteId()%>">
            <div class="row">
                <div class="col-md-6">
                    <a class="btn btn-danger" href="Controlador?accion=listar">Regresar</a>
                </div>
            </div>
        </form>
    </div><br>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>
