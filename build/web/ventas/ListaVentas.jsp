<%@ page import="java.util.List" %>
<%@ page import="Modelo.Venta" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Lista de Ventas");
    request.setAttribute("descripcionPagina", "Lista de todas las ventas");
    HttpSession usuario = request.getSession(false);
    HttpSession session1 = request.getSession();
    String usuarioLista = (String) session1.getAttribute("username");
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
                <p class="h1">Lista de Ventas</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover " cellspacing="0" width="100%" id="table_id">
                    <thead class="table-dark text-center">
                        <tr >
                            <th scope="col">N°</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Fecha de la venta</th>
                            <th scope="col">Total</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                             int contador = 0;
                             List<Venta> ventas = (List<Venta>) request.getAttribute("ventas");
                             for (Venta venta : ventas) {
                                 contador++;
                        %>
                        <tr>
                            <th scope="row"><%= contador %></th>
                            <td> <%= usuarioLista %></td>
                            <td> <%= venta.getFechaVenta() %></td>
                            <td>S/. <%= venta.getTotal() %></td>
                            <td><%= venta.getEstado() %></td>
                            <td class="text-center">
                                <a class="btn btn-info logoCarrito" href="/DetalleVentaServlet?action=listarPorId&ventaId=<%= venta.getVentaId()%>" title="Mostrar el detalle de la venta"><i class="bi bi-file-text-fill"></i> Venta</a>                             
                                <a class="btn btn-warning logoCarrito" href="/PagoServlet?action=listarPorId&pagoId=<%= venta.getVentaId()%>" title="Mostrar el detalle del pago"><i class="bi bi-book"></i> Pago</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />


