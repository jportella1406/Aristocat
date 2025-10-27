 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-primary fixed-top" data-bs-theme="dark">
    <div class="container-fluid">
        <div class="nombre-pagina nombreNavbar">
            <a class="navbar-brand" href="/CarritoServlet?action=listar">
            <ion-icon name="paw-outline"></ion-icon>
            <span>Amor Peludo</span></a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active logoCarrito" aria-current="page" href="/CarritoServlet?action=listar">
                        <i class="bi bi-cart-plus"></i> Seguir Comprando</a>
                </li>

                <li class="nav-item logoCarrito">
                    <a type="button" class="btn btn-Primary nav-link d-flex align-items-center active logoCarrito2" href="/ManejoCarritoServlet?action=detalle" >
                        <i class="bi bi-cart4"></i> Carrito
                    </a>
                </li>
                <li class="nav-item dropdown margenNavbar">
                    <a class="nav-link dropdown-toggle logoCarrito" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Mas opciones
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="text-center logoCarrito">
                                <a class="btn btn-danger" href="/logout"><i class="bi bi-arrow-bar-left"></i> Cerrar Sesión</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>
