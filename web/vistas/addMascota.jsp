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
                <h1>Agregar Mascota</h1>
            </div>
        </div>
        <form action="ControladorMascota">
            <input type="hidden" name="accion" value="Agregar">
            <div class="row">
                <div class="col-md-6">
                    NOMBRE:
                    <input class="form-control" type="text"  name="txtNombre" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+" title="El nombre solo puede contener letras y espacios."  required>
                </div>
                <div class="col-md-6">
                    ESPECIE:
                    <input class="form-control" type="text"  name="txtEspecie" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="La especie solo puede contener letras y números." required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    RAZA:
                    <input class="form-control" type="text"  name="txtRaza" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="La raza solo puede contener letras y números." required>
                </div>
                <div class="col-md-6">
                    PESO:
                    <input class="form-control" type="text"  name="txtPeso" pattern="^[0-9]+(\.[0-9]{1,2})?$" title="Peso válido, solo números y máximo dos decimales" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    FECHA|NACIMIENTO:
                    <input class="form-control" type="date"  name="txtFechaNac" required>
                </div>
                <div class="col-md-6">
                    SEXO:
                    <select class="form-control" type="text"  name="txtSexo" required>
                        <option>Macho</option>
                        <option>Hembra</option>
                    </select></br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    HISTORIAL|MEDICO:
                    <input class="form-control" type="text"  name="txtHistMedico" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="El historial médico solo puede contener letras y números." required>
                </div>
                <div class="col-md-6">
                    ESTADO:
                    <input class="form-control" type="text" value="Activo" name="txtEstado" pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+" title="El estado solo puede contener letras y números." required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <input class="btn btn-primary" type="submit" value="Agregar">
                    <a class="btn btn-danger" href="ControladorMascota?accion=listar">Regresar</a>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/includes/Footer.jsp" />
<script src="/js/AgregarCita.js"></script>