 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Carrito"%>
<%@page import="Modelo.ItemCarrito"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/AgregarCita.css">
<link rel="stylesheet" href="/css/EstilosTarjeta.css">
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setAttribute("tituloPagina", "Carrito de compras");
    request.setAttribute("descripcionPagina", "Listado de los productos agregados al carrito");
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
                <p class="h1">Carrito de Compras</p>
            </div>
        </div>
        <% 
        Carrito carrito = (Carrito) request.getAttribute("carrito");
        %>

        <div class="row alert alert-secondary ">

            <div class="col-md-3">
                <form action="#" >
                    <a href="/CarritoServlet?action=listar" class="btn btn-Info logoCarrito" title="Regresar a comprar mas productos"><i class="bi bi-arrow-left-square"></i> Comprar más productos</a>
                </form>
            </div>

            <div class="col-md-2"> 
                <form action="/ManejoCarritoServlet" method="POST">
                    <input type="hidden" name="action" value="vaciar">
                    <button type="submit" class="btn btn-warning logoCarrito" title="Limpiar todo lo que está en el carrito"><i class="bi bi-cart-x-fill"></i> Vaciar Carrito</button>
                </form>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <%
                if(carrito.getTotal()>0 && carrito!=null){
                %>
                <form action="#" >
                    <a type="button" class="btn btn-success logoCarrito" data-bs-toggle="modal" data-bs-target="#modalAgregar" title="Pagar el monto total con tu tarjeta">
                        <i class="bi bi-cart-check"></i> Ir a pagar
                    </a>
                </form>
                <%
                    }else{
                %>
                <form action="#" disabled>
                    <button  type="button" disabled class="btn btn-success logoCarrito" data-bs-toggle="modal" data-bs-target="" title="Pagar el monto total con tu tarjeta" >
                        <i class="bi bi-cart-check"></i> Ir a pagar
                    </button >
                </form>
                <%
                }
                %>

            </div>
            <div class="col-md-3">
                <div class="text-end">
                    <h4 ><i class="bi bi-credit-card-2-front-fill text-end "></i>  Total: S/. <span id="total"><%= carrito != null ? carrito.getTotal() : 0 %></span></h4>
                </div>
            </div>


        </div>
        <table class="table table-bordered" id="table_id">
            <thead class="table-light">
                <tr>
                    <th>N°</th>
                    <th>Producto</th>
                    <th>Precio Unitario</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="carrito-body">
                <% 
                Integer contador = 0;
                if (carrito != null && carrito.getItems().size() > 0) {
                    for (ItemCarrito item : carrito.getItems()) {
                    contador++;
                %>
                <tr id="producto-<%= item.getProducto().getProductoId() %>">
                    <td class="text-center"><%= contador %></td>
                    <td><%= item.getProducto().getNombre() %></td>
                    <td>S/. <%= item.getProducto().getPrecio() %></td>
                    <td>
                        <input type="number" 
                               class="form-control form-control-sm d-inline w-50 cantidad-input" 
                               min="1" 
                               value="<%= item.getCantidad() %>" 
                               data-producto-id="<%= item.getProducto().getProductoId() %>">
                    </td>
                    <td class="subtotal" id="subtotal-<%= item.getProducto().getProductoId() %>">
                        S/. <%= item.getSubtotal() %>
                    </td>
                    <td class="text-center">
                        <form action="/ManejoCarritoServlet" method="POST" class="d-inline text-center">
                            <input type="hidden" name="action" value="eliminar">
                            <input type="hidden" name="productoId" value="<%= item.getProducto().getProductoId() %>">
                            <button type="submit" class="btn btn-danger btn-sm logoCarrito tamnioAcciones" title="Eliminar el producto"><i class="bi bi-trash3-fill"></i></button>
                        </form>
                    </td>
                </tr>
                <% 
                    }
                } else { 
                %>
                <tr>
                    <td colspan="5" class="text-center">El carrito está vacío.</td>
                </tr>
                <% } %>
            </tbody>
        </table>



    </div>
</div>
<div class="modal fade" id="modalAgregar" tabindex="-1" aria-labelledby="modalAgregarLabel" aria-hidden="true">
    <div class="modal-dialog custom-modal-width-principal">
        <div class="modal-content custom-modal-width">
            <div class="modal-body custom-modal-width" >
                <div class="contenedor">
                    <section class="tarjeta" id="tarjeta">
                        <div class="delantera">
                            <div class="logo-marca" id="logo-marca">
                                <img src="/files/tarjeta/logos/visa.png" alt="">
                            </div>
                            <img src="/files/tarjeta/chip-tarjeta.png" class="chip" alt="">
                            <div class="datos">
                                <div class="grupo" id="numero">
                                    <p class="label">Número Tarjeta</p>
                                    <p class="numero">#### #### #### ####</p>
                                </div>
                                <div class="flexbox">
                                    <div class="grupo" id="nombre">
                                        <p class="label">Nombre Tarjeta</p>
                                        <p class="nombre">Wendy Reynoso</p>
                                    </div>

                                    <div class="grupo" id="expiracion">
                                        <p class="label">Expiracion</p>
                                        <p class="expiracion"><span class="mes">MM</span> / <span class="year">AA</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="trasera">
                            <div class="barra-magnetica"></div>
                            <div class="datos">
                                <div class="grupo" id="firma">
                                    <p class="label">Firma</p>
                                    <div class="firma"><p></p></div>
                                </div>
                                <div class="grupo" id="ccv">
                                    <p class="label">CCV</p>
                                    <p class="ccv"></p>
                                </div>
                            </div>
                            <p class="leyenda">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus exercitationem, voluptates illo.</p>
                            <a href="#" class="link-banco">www.tubanco.com</a>
                        </div>
                    </section>

                    <!-- Contenedor Boton Abrir Formulario -->
                    <div class="contenedor-btn">
                        <button class="btn-abrir-formulario" id="btn-abrir-formulario">
                            <i class="bi bi-plus-lg"></i>
                        </button>
                    </div>

                    <!-- Formulario -->
                    <form action="/VentaServlet?action=agregar" method="POST" id="formulario-tarjeta" class="formulario-tarjeta">
                        <div class="grupo">
                            <label for="inputNumero">Número Tarjeta</label>
                            <input type="text" id="inputNumero" maxlength="19" autocomplete="off" required>
                        </div>
                        <div class="grupo">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" id="inputNombre" maxlength="19" autocomplete="off" required>
                        </div>
                        <div class="flexbox">
                            <div class="grupo expira">
                                <label for="selectMes">Expiracion</label>
                                <div class="flexbox">
                                    <div class="grupo-select">
                                        <select name="mes" id="selectMes" required>
                                            <option disabled selected>Mes</option>
                                        </select>
                                        <i class="fas fa-angle-down"></i>
                                    </div>
                                    <div class="grupo-select">
                                        <select name="year" id="selectYear" required>
                                            <option disabled selected>Año</option>
                                        </select>
                                        <i class="fas fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="grupo ccv">
                                <label for="inputCCV">CCV</label>
                                <input type="text" id="inputCCV" maxlength="3" required>
                            </div>
                        </div>
                        <input type="hidden" name="action" value="agregar">
                        <button type="submit" class="btn-enviar">Pagar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('.cantidad-input').forEach(input => {
        input.addEventListener('change', function () {
            const productoId = this.dataset.productoId;
            const cantidad = this.value;
            if (cantidad && !isNaN(cantidad) && cantidad > 0) {
                fetch('/ManejoCarritoServlet?action=actualizar', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productoId: productoId,
                        cantidad: cantidad
                    })
                })
                        .then(response => response.json())
                        .then(data => {
                            const subtotalElement = document.getElementById(`subtotal-${productoId}`);
                            const totalElement = document.getElementById('total');
                            if (subtotalElement) {
                                subtotalElement.textContent = `S/${data.subtotal}`;
                            }

                            if (totalElement) {
                                totalElement.textContent = `S/${data.total}`;
                            }
                            location.reload();
                        })
                        .catch(error => console.error('Error al actualizar la cantidad:', error));
            } else {
                alert('Por favor, ingresa una cantidad válida.');
                this.value = 1;
            }
        });
    });

</script>
<%
    String action = request.getParameter("action");
    String stock = request.getParameter("stock");
    String message = "";
    String messageType = "";

    if ("exito".equals(action) && "ok".equals(stock)) {
        message = "Tu transacción se ha realizado con éxito.";
        messageType = "success";
    } else if ("error".equals(action) && "ok".equals(stock)){
        message = "Hubo un error con la acción proporcionada.";
        messageType = "error";
    } else if ("error".equals(action) && "error".equals(stock)){
        message = "No contamos con la cantidad solicitada. Lamentamos el inconveniente!!!.";
        messageType = "error";
    }
%>
<% if (message != null && messageType != null && (action.equals("exito") || action.equals("error"))) { %>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        Swal.fire({
            title: "<%= messageType.equals("success") ? "Éxito" : "Error" %>",
            text: "<%= message %>",
            icon: "<%= messageType %>",
            confirmButtonText: "Aceptar",
            allowOutsideClick: false,
            allowEscapeKey: false
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '/ManejoCarritoServlet?action=detalle';
            }
        });
    });
</script>
<% } %>

<script src="/js/MainTarjeta.js"></script>
<jsp:include page="/includes/Footer.jsp" />
