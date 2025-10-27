

<%@page import="Modelo.Mascota"%>
<%@page import="ModeloDAO.MascotaDAO"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Config.Utils"%>
<%@ page import="java.util.List" %>
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
        <%
            MascotaDAO oED = new MascotaDAO();
            int codigo = Integer.parseInt((String) request.getAttribute("codmascota"));

            Mascota oE = (Mascota) oED.list(codigo);
        %>
        <div class="row">
            <div class="col-md-12 text-center">
                <h1>Modificar|Datos|Mascota</h1>
            </div>
        </div>

        <form action="ControladorMascota" method="post">
            <div class="row">
                <div class="col-md-6">
                    NOMBRE:
                    <input class="form-control" type="text" name="txtNombre" value="<%= oE.getNombre()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" title="El nombre solo puede contener letras y espacios." required>
                </div>
                <div class="col-md-6">
                    ESPECIE:
                    <input class="form-control" type="text" name="txtEspecie" value="<%= oE.getEspecie()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="La especie solo puede contener letras y números." required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    RAZA:
                    <input class="form-control" type="text" name="txtRaza" value="<%= oE.getRaza()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="La raza solo puede contener letras y números." required>
                </div>
                <div class="col-md-6">
                    <label for="servicioId" class="form-label">Lista de clientes</label>
                    <select class="form-select" id="servicioId" name="servicioId" required>
                        <option value="">Selecciona un ciente</option>
                        <% 
                            List<Cliente> clientes = (List<Cliente>) request.getAttribute("clienteObj");
                            for (Cliente cliente : clientes) {
                            if(cliente.getClienteId()==oE.getClienteId()){
                        %>
                        <option value="<%= cliente.getClienteId() %>" selected><%= cliente.getNombre() %></option>
                        <% }else{
                        %>
                        <option value="<%= cliente.getClienteId() %>"><%= cliente.getNombre() %></option>
                        <%}
                    } %>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    FECHA|NACIMIENTO:
                    <input class="form-control" type="date" name="txtFechaNac" value="<%= Utils.formatoDate(oE.getFechaNac())%>" required>
                </div>
                <div class="col-md-6">
                    SEXO:
                    <select class="form-select" name="txtSexo" required>
                        <option value="Macho" <%= (oE.getSexo().equalsIgnoreCase("Macho") ? "selected" : "") %>>Macho</option>
                        <option value="Hembra" <%= (oE.getSexo().equalsIgnoreCase("Hembra") ? "selected" : "") %>>Hembra</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    HISTORIAL|MEDICO:
                    <input class="form-control" type="text" name="txtHistMedico" value="<%= oE.getHistMedico()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="El historial médico solo puede contener letras y números." required>
                </div>
                <div class="col-md-6">
                    ESTADO:
                    <input class="form-control" type="text" name="txtEstado" value="<%= oE.getEstado()%>" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="El estado solo puede contener letras y números." required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    PESO:
                    <input class="form-control" type="text" name="txtPeso" value="<%= oE.getPeso()%>" pattern="^[0-9]+(\.[0-9]{1,2})?$" title="Peso válido, solo números y máximo dos decimales" required>
                </div>
                <input type="hidden" name="idUsername" value="<%= oE.getClienteId()%>">
            </div>
            <input type="hidden" name="txtMascotaId" value="<%= oE.getMascotasId()%>">
            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-primary" type="submit" name="accion" value="Actualizar">Actualizar</button> 
                    <a class="btn btn-danger" href="ControladorMascota?accion=listar">Regresar</a>
                </div>
            </div>
        </form>

    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>
