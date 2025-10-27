
<%@page import="Modelo.Cliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%-- 
   Document   : index
   Created on : 31 feb 6666, 66:66:66
   Author     : Starlord
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<%@page import="Config.Utils"%>
<%@ page import="java.util.List" %>

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
        <div class="row">
            <div class="col-md-12 text-center">
                <%
                    ClienteDAO oED = new ClienteDAO();
                    int codigo = Integer.parseInt((String) request.getAttribute("codcliente"));
                    Cliente oE = (Cliente) oED.list(codigo);
                %>
                <h1>Modificar Cliente</h1>
            </div>
        </div>
        <form action="Controlador" method="post">
            <div class="row">
                <div class="col-md-6">
                    NOMBRE:
                    <input class="form-control" type="text" name="txtNombre" value="<%= oE.getNombre()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" title="El nombre solo puede contener letras y espacios." required>
                </div>
                <div class="col-md-6">
                    APELLIDO:
                    <input class="form-control" type="text" name="txtApellido" value="<%= oE.getApellido()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" title="El apellido solo puede contener letras y espacios." required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    CORREO:
                    <input class="form-control" type="text" name="txtEmail" value="<%= oE.getEmail()%>" required>
                </div>
                <div class="col-md-6">
                    TELEFONO:
                    <input class="form-control" type="text" name="txtTelefono" value="<%= oE.getTelefono()%>" pattern="[0-9]+" title="El teléfono solo puede contener números." min="0" minlength="9" maxlength="9" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    DIRECCION:
                    <input class="form-control" type="text" name="txtDireccion" value="<%= oE.getDireccion()%>" required>
                </div>
                <div class="col-md-6">
                    FECHA|REGISTRO:
                    <input class="form-control" type="date" name="txtFechaRegistro" value="<%= Utils.formatoDate(oE.getFechaRegistro()) %>" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    TIPO|DOCUMENTO:
                    <select class="form-select" name="txtTipoDocumento" required>
                        <option value="DNI" <%= (oE.getTipoDocumento().equalsIgnoreCase("DNI") ? "selected" : "") %>>DNI</option>
                        <option value="Carné de extranjería" <%= (oE.getTipoDocumento().equalsIgnoreCase("Carné de extranjería") ? "selected" : "") %>>Carné de extranjería</option>
                    </select>
                </div>
                <div class="col-md-6">
                    DOCUMENTO:
                    <input class="form-control" type="text" name="txtDocumento" value="<%= oE.getDocumento()%>" pattern="[0-9]+" title="La identificación solo puede contener números." min="0" minlength="8" maxlength="20" required>
                </div>
            </div>
            <input type="hidden" name="txtClienteId" value="<%= oE.getClienteId()%>">
            <div class="row">
                <div class="col-md-12">
                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                    <a class="btn btn-danger" href="Controlador?accion=listar">Regresar</a>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>
