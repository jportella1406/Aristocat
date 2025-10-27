<%-- 
   Document   : index
   Created on : 31 feb 6666, 66:66:66
   Author     : Starlord
--%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Producto" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Catalogo de Productos");
    request.setAttribute("descripcionPagina", "Listar de todos los productos para las ventas");
    HttpSession usuario = request.getSession(false);
    System.out.println("usuario: " + usuario);
    if (usuario == null || usuario.getAttribute("username") == null) {
        response.sendRedirect("/principal/Principal.jsp");
    }
%>
<jsp:include page="/includes/Head.jsp" />
<jsp:include page="/includes/menu.jsp" />

<div class="container">
    <form class="form-control" action="/CarritoServlet" method="POST">
        <div class="row">
            <div class="col-md-12 text-center">
                <p class="h1">Catálogo de Productos</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <!--<label for="servicioId" class="form-label">Tipo</label>-->

                <select class="form-select" id="seleccion" name="seleccion" required onchange="enviarSelect()">
                    <option class="label" value="" readonly>Filtrar por tipo</option>
                    <% 
                        String seleccionMostrar = (String)request.getAttribute("seleccionMostrar");
                        
                        List<Producto> productosFitlro = (List<Producto>) request.getAttribute("productosCompleto");
                        Set<String> tiposUnicos = new HashSet<>();
                        for (Producto productoFitlro : productosFitlro) {
                            tiposUnicos.add(productoFitlro.getTipo());
                        }
                        for (String tipo : tiposUnicos) {
                            if(seleccionMostrar != null){
                                if(seleccionMostrar.equals(tipo)){
                                    %>
                                    <option class="label" value="<%= tipo %>" selected><%= tipo %></option>
                                    <%
                                }else{
                                    %>
                                    <option class="label" value="<%= tipo %>"><%= tipo %></option>
                                    <%
                                }
                            }else{
                                %>
                                <option class="label" value="<%= tipo %>"><%= tipo %></option>
                                <%
                            }
                            %>

                        <% } %>
                </select>

            </div>
        </div>
        <div class="row">
            <% 
            List<Producto> productos = (List<Producto>) request.getAttribute("productos");
            for (Producto producto : productos) {
            %>
            <div class="col-md-3">
                <div class="card" >
                    <img src="<%= producto.getImagen() %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title nombre-producto-lista"><%= producto.getNombre() %></h5>
                        <p class="card-text descripcion"><%= producto.getDescripcion() %></p>
                        <div class="precio"><p class="card-text">Precio: S/<%= producto.getPrecio() %></p></div>
                        <a type="button" class="btn btn-primary logoCarrito2" data-bs-toggle="modal" data-bs-target="#modalAgregar" 
                           data-producto-id="<%= producto.getProductoId() %>"
                           data-producto-nombre="<%= producto.getNombre() %>"
                           data-producto-precio="<%= producto.getPrecio() %>">
                            Agregar
                        </a>
                    </div>
                </div>
            </div>
            <% } %>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <% 
                    int paginaActual = (Integer) request.getAttribute("paginaActual");
                    int totalPaginas = (Integer) request.getAttribute("totalPaginas");

                    if (paginaActual > 1) {
                    %>
                    <li class="page-item">
                        <a class="page-link" href="/CarritoServlet?action=listar&pagina=<%= paginaActual - 1 %>">Previous</a>
                    </li>
                    <% } else { %>
                    <li class="page-item disabled">
                        <a class="page-link">Previous</a>
                    </li>
                    <% } 

                    for (int i = 1; i <= totalPaginas; i++) {
                    if (i == paginaActual) {
                    %>
                    <li class="page-item active">
                        <a class="page-link" href="/CarritoServlet?action=listar&pagina=<%= i %>"><%= i %></a>
                    </li>
                    <% } else { %>
                    <li class="page-item">
                        <a class="page-link" href="/CarritoServlet?action=listar&pagina=<%= i %>"><%= i %></a>
                    </li>
                    <% } 
                    }
                    if (paginaActual < totalPaginas) {
                    %>
                    <li class="page-item">
                        <a class="page-link" href="/CarritoServlet?action=listar&pagina=<%= paginaActual + 1 %>">Next</a>
                    </li>
                    <% } else { %>
                    <li class="page-item disabled">
                        <a class="page-link">Next</a>
                    </li>
                    <% } %>
                </ul>
            </nav>
        </div>
    </form>
</div>
<div class="modal fade" id="modalAgregar" tabindex="-1" aria-labelledby="modalAgregarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalAgregarLabel">Agregar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formAgregarProducto" action="/ManejoCarritoServlet" method="POST">
                    <input type="hidden" id="productoId" name="productoId">
                    <div class="mb-3">
                        <label for="productoNombre" class="form-label">Nombre del Producto</label>
                        <input type="text" class="form-control" id="productoNombre" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="productoPrecio" class="form-label">Precio Unitario</label>
                        <input type="text" class="form-control" id="productoPrecio" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="cantidad" class="form-label">Cantidad</label>
                        <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1">
                    </div>
                    <div class="mb-3">
                        <label for="precioTotal" class="form-label">Precio Total</label>
                        <input type="text" class="form-control" id="precioTotal" disabled>
                    </div>
                    <button type="submit" class="btn btn-primary logoCarrito2 logoCarrito" name="action" value="agregar">Agregar al Carrito</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function enviarSelect() {
        var seleccion = document.getElementById("seleccion").value;
        if (seleccion) {
            // Construir la URL para la solicitud GET
            var url = "/CarritoServlet?action=listarSelect&seleccion=" + encodeURIComponent(seleccion);
            // Redirigir a la URL
            window.location.href = url;
        }
    }
</script>
<jsp:include page="/includes/Footer.jsp" />


