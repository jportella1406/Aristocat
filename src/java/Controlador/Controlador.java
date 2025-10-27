package Controlador;

import Config.Conexion;
import Config.Utils;
import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    String listar = "vistas/listar.jsp";
    String add = "vistas/add.jsp";
    String edit = "vistas/edit.jsp";
    String detalle = "vistas/detalleCliente.jsp";
    Cliente oE = new Cliente();
    ClienteDAO oDE = new ClienteDAO();
    int cod;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        HttpSession usuario = request.getSession(false);
        System.out.println("usuario: " + usuario);
        if (usuario == null || usuario.getAttribute("username") == null) {
            response.sendRedirect("/principal/Principal.jsp");
        }
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {

            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String email = request.getParameter("txtEmail");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");

            String fechalocal = request.getParameter("txtFechaRegistro");
            Timestamp fechaRegistro = Utils.ConverisonFecha(fechalocal); // Asegúrate de que el formato sea correcto (yyyy-mm-dd hh:mm:ss)

            String estado = request.getParameter("txtEstado");
            String tipoDocumento = request.getParameter("txtTipoDocumento");
            String documento = request.getParameter("txtDocumento");

            oE.setNombre(nombre);
            oE.setApellido(apellido);
            oE.setEmail(email);
            oE.setTelefono(telefono);
            oE.setDireccion(direccion);
            oE.setFechaRegistro(fechaRegistro);
            oE.setEstado(estado);
            oE.setTipoDocumento(tipoDocumento);
            oE.setDocumento(documento);
            oDE.add(oE);
            acceso = listar;

        } else if (action.equalsIgnoreCase("detalle")) {
            request.setAttribute("codcliente", request.getParameter("codigo"));
            acceso = detalle;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("codcliente", request.getParameter("codigo"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            actualizar(request, response);

        } else if (action.equalsIgnoreCase("eliminar")) {
            cod = Integer.parseInt(request.getParameter("codigo"));
            oDE.eliminar(cod);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String acceso = "";

        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String email = request.getParameter("txtEmail");
        String telefono = request.getParameter("txtTelefono");
        String direccion = request.getParameter("txtDireccion");

        String fechalocal = request.getParameter("txtFechaRegistro");
        Timestamp fechaRegistro = Utils.ConverisonFecha(fechalocal); // Asegúrate de que el formato sea correcto (yyyy-mm-dd hh:mm:ss)

        String estado = request.getParameter("txtEstado");
        String tipoDocumento = request.getParameter("txtTipoDocumento");
        String documento = request.getParameter("txtDocumento");
        String clienteid = request.getParameter("txtClienteId");

        oE.setClienteId(Integer.parseInt(clienteid));
        oE.setNombre(nombre);
        oE.setApellido(apellido);
        oE.setEmail(email);
        oE.setTelefono(telefono);
        oE.setDireccion(direccion);
        oE.setFechaRegistro(fechaRegistro);
        oE.setEstado(estado);
        oE.setTipoDocumento(tipoDocumento);
        oE.setDocumento(documento);

        oDE.edit(oE);
        acceso = listar;

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Actualizar")) {

            actualizar(request, response);
        }
        processRequest(request, response);
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (username != null && password != null) {
            try {
                Connection conn = Conexion.getConnection();
                String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = SHA2(?, 256)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    out.println("<script type='text/javascript'>");
                    out.println("window.location.href='/vistas/listar.jsp';");
                    out.println("</script>");
                } else {
                    out.println("swal('Error!', 'Usuario o contraseña incorrectos.', 'error');");
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                out.println("<h3>Error al conectarse a la base de datos: " + e.getMessage() + "</h3>");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
