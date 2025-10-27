 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.DetalleVenta" %>
<%@ page import="Modelo.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Detalle de la Venta");
    request.setAttribute("descripcionPagina", "Detalle de la venta seleccionada");
    HttpSession usuario = request.getSession(false);
    System.out.println("usuario: " + usuario);
    if (usuario == null || usuario.getAttribute("username") == null) {
        response.sendRedirect("/principal/Principal.jsp");
    }
%>
<jsp:include page="/includes/Head.jsp" />
<jsp:include page="/includes/menu.jsp" />
<div class="container">
    <form class="form-control" action="/CitaServlet" method="POST">
        <div class="row">
            <div class="col-md-12 text-center">
                <p class="h1">Detalle de ventas</p>
            </div>
        </div>
        <% 
    DetalleVenta detalleVenta = (DetalleVenta) request.getAttribute("detalleVenta");
    Producto producto = (Producto) request.getAttribute("producto");
    String nombreProducto = "Sin producto";
    if(detalleVenta.getProductoId() == producto.getProductoId()){
    nombreProducto= producto.getNombre();
            }
        %>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Id de la venta</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= detalleVenta.getVentaId() %>" disabled>
            </div>            
            <div class="col-md-6">
                <label for="fecha" class="form-label">Producto</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= nombreProducto %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Precio</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="S/. <%= detalleVenta.getPrecio() %>" disabled>
            </div>
            <div class="col-md-6">
                <label for="fecha" class="form-label">Cantidad</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="<%= detalleVenta.getCantidad() %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Subtotal</label>
                <input id="fecha" name="fecha" class="form-control" type="text" value="S/. <%= detalleVenta.getSubtotal() %>" disabled>
            </div>
            <div class="col-md-6">
                <label for="fecha" class="form-label">Fecha de Creación</label>
                <input id="fecha" name="fecha" class="form-control" type="datetime-local" value="<%= detalleVenta.getFechaCreacion() %>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-danger logoCarrito" href="/VentaServlet?action=listar">Cancelar</a>
            </div>
        </div>
    </form>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>