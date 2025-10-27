<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Mascota"%>
<%@page import="Modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.MascotaDAO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
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
        <div class="row">
            <div class="col-md-12 text-center">
                <h1>CRUD MASCOTAS</h1>
            </div>
        </div>

        <table class="table table-hover " cellspacing="0" width="100%" id="table_id">
            <thead class="table-danger">
                <tr>
                    <th class="text-center">N°</th>
                    <th class="text-center">CLIENTE</th>
                    <th class="text-center">NOMBRE|MASCOTA</th>
                    <th class="text-center">ESPECIE</th>
                    <th class="text-center">RAZA</th>
                    <th class="text-center">SEXO</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String tipo = "administrador";
                    MascotaDAO oDE = new MascotaDAO();
                    ClienteDAO clienteDAO = new ClienteDAO();
                    List<Mascota> relacionMascota = oDE.mascota();
                    
                    Iterator<Mascota> iter = relacionMascota.iterator();
                    Mascota oE = null;
                    Integer contador = 0;
                    while (iter.hasNext()) {
                        oE = iter.next();
                        contador++;
                        /*String fechaNueva = oE.getFechaNac().toString();
                        fechaNueva = fechaNueva.split(" ")[0];*/
                        Cliente clienteLista = clienteDAO.list(oE.getClienteId());
                        if (tipo.equals("administrador")) {
                %>
                <tr>
                    <td class="text-center"><%= contador%></td>
                    <td class="text-center"><%= clienteLista.getNombre()%></td>
                    <td class="text-center"><%= oE.getNombre()%></td>
                    <td class="text-center"><%= oE.getEspecie()%></td>
                    <td class="text-center"><%= oE.getRaza()%></td>                        
                    <td class="text-center"><%= oE.getSexo()%></td>

                    <td class="text-center">
                        <a class="btn btn-primary tamnioAcciones logoCarrito" href="/ControladorMascota?accion=detalle&codigo=<%= oE.getMascotasId()%>" title="Mostrar la mascota"><ion-icon  name="reader-outline"></ion-icon></a>
                        <a class="btn btn-warning tamnioAcciones logoCarrito" href="/ControladorMascota?accion=editar&codigo=<%= oE.getMascotasId()%>" title="Editar la mascota"><ion-icon  name="pencil"></ion-icon></ion-icon></a>
                        <a class="btn btn-danger tamnioAcciones logoCarrito" href="/ControladorMascota?accion=eliminar&codigo=<%= oE.getMascotasId()%>" title="Eliminar la mascota"><ion-icon  name="trash-outline"></ion-icon></a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>
