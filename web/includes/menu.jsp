<%-- 
   Document   : index
   Created on : 31 feb 6666, 66:66:66
   Author     : Starlord
--%>
<%@page import="Config.Constantes" %>
<link rel="stylesheet" href="/css/style_menu.css">
<%HttpSession usuario = request.getSession(false);
String rolBD= (String)usuario.getAttribute("rol");
String usuarioBD= (String)usuario.getAttribute("username");
System.out.println("usuario: "+usuario+" rol: "+rolBD);
if(usuario == null || usuario.getAttribute("username")== null){
response.sendRedirect("/principal/Principal.jsp");
    }%>

<div class="menu">
    <ion-icon name="menu-outline"></ion-icon>
    <ion-icon name="close-outline"></ion-icon>
</div>
<div class="barra-lateral">

    <div class="text-center">
        <div >
            <img class="imagenMenu" src="/files/logos/usuario.webp" alt="Imagen de Usuario">
        </div>
    </div> 
    <div class="text-center">
        <span class="nombre"><%=usuarioBD%></span><br>
        <span class="rol"><%=rolBD%></span> 
    </div> 
    <div class="linea"></div>
    <nav class="navegacion">
        <ul>
            <% 
    if(Constantes.ADMIN.equals(rolBD)){                   
            %>


            <li id="listaProcutos">
                <a href="/ProductoServlet?action=listar">
                    <ion-icon name="bookmark-sharp"></ion-icon>
                    <span>Lista de Productos</span>
                </a>
            </li>
            <li id="agregarProducto">
                <a href="/ProductoServlet?action=agregar">
                    <ion-icon name="bag-add"></ion-icon>
                    <span>Agregar Producto</span>
                </a>
            </li>

            <li id="listaProveedores">
                <a href="/ProveedorServlet?action=listar">
                    <ion-icon name="baseball-outline"></ion-icon>
                    <span>Lista de Proveedores</span>
                </a>
            </li>
            <li id="nuevoProveedor">
                <a href="/ProveedorServlet?action=agregar">
                    <ion-icon name="baseball-outline"></ion-icon>
                    <span>Nuevo Proveedor</span>
                </a>
            </li>
            <li id="listaEspecialidad">
                <a href="/EspecialidadServlet?action=listar">
                    <ion-icon name="bookmark-sharp"></ion-icon>
                    <span>Lista de Especialidades</span>
                </a>
            </li>

            <li id="nuevaEspecialidad">
                <a href="/EspecialidadServlet?action=agregar">
                    <ion-icon name="bag-add"></ion-icon>
                    <span>Nueva Especialidad</span>
                </a>
            </li>
            <li id="listaTrabajadores">
                <a href="/ControladorTrabajador?accion=listar">
                    <ion-icon name="accessibility-outline"></ion-icon>
                    <span>Lista de Trabajadores</span>
                </a>
            </li>
            <li id="agregarTrabajador">
                <a href="/ControladorTrabajador?accion=add">
                    <ion-icon name="accessibility-outline"></ion-icon>
                    <span>Agregar Trabajador</span>
                </a>
            </li>
            <li id="listaClientes">
                <a  href="/vistas/listar.jsp">
                    <ion-icon name="accessibility-outline"></ion-icon>
                    <span>Lista de Clientes</span>
                </a>
            </li>
            <li id="agregarCliente">
                <a  href="/Controlador?accion=add">
                    <ion-icon name="accessibility-outline"></ion-icon>
                    <span>Agregar Cliente</span>
                </a>
            </li>
            <li id="listaMascota">
                <a href="/vistas/mascotas.jsp">
                    <ion-icon name="paw-outline"></ion-icon>
                    <span>Lista de Mascotas</span>
                </a>
            </li>
            <li id="agregarMascota">
                <a href="/ControladorMascota?accion=add">
                    <ion-icon name="paw-outline"></ion-icon>
                    <span>Agregar Mascota</span>
                </a>
            </li>
            <% }
    if(Constantes.CLIENTE.equals(rolBD)||Constantes.ADMIN.equals(rolBD)){               
            %>
            <li id="catalogoProductos">
                <a href="/CarritoServlet?action=listar">
                    <ion-icon name="bag-add-outline"></ion-icon>
                    <span>Catálogo de Productos</span>
                </a>
            </li>
            <li id="listaCitas">
                <a href="/CitaServlet?action=listar">
                    <ion-icon name="paw-outline"></ion-icon>
                    <span>Lista de  Citas</span>
                </a>
            </li>
            <li id="reservarCitas">
                <a href="/CitaServlet?action=agregar">
                    <ion-icon name="bag-add-outline"></ion-icon>
                    <span>Reservar Cita</span>
                </a>
            </li>
            <li id="listaVentas">
                <a href="/VentaServlet?action=listar">
                    <ion-icon name="bag-handle-outline"></ion-icon>
                    <span>Lista de Ventas</span>
                </a>
            </li>
            <%}%>
        </ul>
    </nav>
    <div>
        <div class="linea"></div>

        <div class="modo-oscuro">
            <div class="info">
                <ion-icon name="moon-outline"></ion-icon>
                <span>Modo Obscuro</span>
            </div>
            <div class="switch">
                <div class="base">
                    <div class="circulo">

                    </div>
                </div>
            </div>
        </div>

        <div class="usuario">
            <img src="/Jhampier.jpg" alt="">
            <div class="info-usuario">
                <div class="nombre-email">

                    <span class="nombre"><%=usuarioBD%></span>
                    <span class="email"><%=rolBD%>@gmail.com</span>
                </div>
                <ion-icon name="ellipsis-vertical-outline"></ion-icon>
            </div>
        </div>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        var menuItems = document.querySelectorAll('.navegacion li');
        var activeMenuItemId = localStorage.getItem('activeMenuItemId');
        if (activeMenuItemId) {
            var activeItem = document.getElementById(activeMenuItemId);
            if (activeItem) {
                activeItem.classList.add('active');
                activeItem.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
            }
        }

        menuItems.forEach(function (item) {
            item.addEventListener('click', function () {
                menuItems.forEach(function (i) {
                    i.classList.remove('active');
                });
                item.classList.add('active');
                localStorage.setItem('activeMenuItemId', item.id);
                item.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
            });
        });
    });
</script>