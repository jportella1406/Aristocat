<%@page import="Modelo.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                <h1>CRUD DE CLIENTES</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover " cellspacing="0" width="100%" id="table_id">
                    <thead class="table-danger">
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">NOMBRES</th>
                            <th class="text-center">APELLIDOS</th>
                            <th class="text-center">TIPO|DOCUMENTO</th>
                            <th class="text-center">DOCUMENTO</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String tipo = "administrador";
                            ClienteDAO oDE = new ClienteDAO();
                            List<Cliente> relacionCliente = oDE.listar();
                            Iterator<Cliente> iter = relacionCliente.iterator();
                            Cliente oE = null;
                            Integer contador = 0;
                            while (iter.hasNext()) {
                                oE = iter.next();
                                contador++;
                                if (tipo.equals("administrador")) {
                        %>

                        <tr>
                            <td class="text-center"><%= contador%></td>
                            <td class="text-center"><%= oE.getNombre()%></td>
                            <td class="text-center"><%= oE.getApellido()%></td>
                            <td class="text-center"><%= oE.getTipoDocumento()%></td>
                            <td class="text-center"><%= oE.getDocumento()%></td>

                            <td class="text-center">
                                <a class="btn btn-primary tamnioAcciones logoCarrito" href="/Controlador?accion=detalle&codigo=<%= oE.getClienteId()%>"><ion-icon  name="reader-outline"></ion-icon></a>
                                <a class="btn btn-warning tamnioAcciones logoCarrito" href="/Controlador?accion=editar&codigo=<%= oE.getClienteId()%>"><ion-icon  name="pencil"></ion-icon></ion-icon></a>
                                <a class="btn btn-danger tamnioAcciones logoCarrito" href="/Controlador?accion=eliminar&codigo=<%= oE.getClienteId()%>"><ion-icon  name="trash-outline"></ion-icon></a>
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
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>
