 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Pago" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Detalle del Pago");
    request.setAttribute("descripcionPagina", "Detalle de los Pagos");
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
                <p class="h1">Detalle del Pago</p>
            </div>
        </div>
        <% 
    Pago pago = (Pago) request.getAttribute("pago");
        %>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Id de la venta</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= pago.getVentaId() %>" disabled>
            </div>            
            <div class="col-md-6">
                <label for="fecha" class="form-label">Monto pagado</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="S/. <%= pago.getMontoPagado() %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Método de pago</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= pago.getMetodoPago() %>" disabled>
            </div>
            <div class="col-md-6">
                <label for="fecha" class="form-label">Fecha de pago</label>
                <input id="fecha" name="fecha" class="form-control" type="datetime-local" value="<%= pago.getFechaPago() %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Estado</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= pago.getEstado() %>" disabled>
            </div>
            <div class="col-md-6">
                <label for="fecha" class="form-label">Fecha de Creación</label>
                <input id="fecha" name="fecha" class="form-control" type="datetime-local" value="<%= pago.getFechaCreacion() %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-danger logoCarrito" href="/VentaServlet?action=listar">Cancelar</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>