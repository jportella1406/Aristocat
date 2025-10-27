/**
 *
 * @author Starlord
 */
package ModeloDAO;

import Interfaces.IVenta;
import Modelo.Venta;
import com.mysql.jdbc.Statement;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class VentaDAO implements IVenta {

    private final Connection connection;

    public VentaDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Venta> listar(HttpSession session) {
        List<Venta> lista = new ArrayList<>();
        String usuarioId = (String) session.getAttribute("idususario");
        int nuevoId = Integer.parseInt(usuarioId);
        String sql = "SELECT * FROM ventas";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                if (nuevoId == rs.getInt("cliente_id")) {

                    Venta venta = new Venta();
                    venta.setVentaId(rs.getInt("venta_id"));
                    venta.setClienteId(rs.getInt("cliente_id"));
                    venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                    venta.setTotal(rs.getDouble("total"));
                    venta.setMetodoPago(rs.getString("metodo_pago"));
                    venta.setEstado(rs.getString("estado"));
                    venta.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    venta.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                    venta.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                    venta.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                    lista.add(venta);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Venta listarPorId(int ventaId) {
        Venta venta = null;
        String sql = "SELECT * FROM ventas WHERE venta_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, ventaId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    venta = new Venta();
                    venta.setVentaId(rs.getInt("venta_id"));
                    venta.setClienteId(rs.getInt("cliente_id"));
                    venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                    venta.setTotal(rs.getDouble("total"));
                    venta.setMetodoPago(rs.getString("metodo_pago"));
                    venta.setEstado(rs.getString("estado"));
                    venta.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    venta.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                    venta.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                    venta.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return venta;
    }

    @Override
    public boolean agregar(Venta venta) {
        String sql = "INSERT INTO ventas (cliente_id, fecha_venta, total, metodo_pago, estado, fecha_creacion, usuarioCreacion) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, venta.getClienteId());
            ps.setTimestamp(2, venta.getFechaVenta());
            ps.setDouble(3, venta.getTotal());
            ps.setString(4, venta.getMetodoPago());
            ps.setString(5, venta.getEstado());
            ps.setTimestamp(6, venta.getFechaCreacion());
            ps.setInt(7, venta.getUsuarioCreacion());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int crearVenta(Venta venta) {
        String sql = "INSERT INTO ventas (cliente_id, total, metodo_pago, usuario_creacion) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, venta.getClienteId());
            ps.setDouble(2, venta.getTotal());
            ps.setString(3, venta.getMetodoPago());
            ps.setInt(4, venta.getUsuarioCreacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    @Override
    public boolean editar(Venta venta) {
        String sql = "UPDATE ventas SET cliente_id = ?, fecha_venta = ?, total = ?, metodo_pago = ?, estado = ?, fecha_modificacion = ?, usuario_modificacion = ? WHERE venta_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, venta.getClienteId());
            ps.setTimestamp(2, venta.getFechaVenta());
            ps.setDouble(3, venta.getTotal());
            ps.setString(4, venta.getMetodoPago());
            ps.setString(5, venta.getEstado());
            ps.setTimestamp(6, venta.getFechaModificacion());
            ps.setInt(7, venta.getUsuarioModificacion());
            ps.setInt(8, venta.getVentaId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminar(int ventaId) {
        String sql = "DELETE FROM ventas WHERE venta_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, ventaId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
