/**
 *
 * @author Starlord
 */
package ModeloDAO;
import Config.Conexion;
import Interfaces.IReserva;
import Modelo.Reserva;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO implements IReserva {

        private final Connection connection;

    public ReservaDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Reserva> listar() {
        List<Reserva> lista = new ArrayList<>();
        String sql = "SELECT * FROM reservas";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Reserva reserva = new Reserva();
                reserva.setReservaId(rs.getInt("reserva_id"));
                reserva.setCitaId(rs.getInt("cita_id"));
                reserva.setFechaReserva(rs.getTimestamp("fecha_reserva"));
                reserva.setMonto(rs.getDouble("monto"));
                reserva.setEstado(rs.getString("estado"));
                reserva.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                reserva.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                reserva.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                reserva.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                lista.add(reserva);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Reserva listarPorId(int reservaId) {
        Reserva reserva = null;
        String sql = "SELECT * FROM reservas WHERE reserva_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reservaId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    reserva = new Reserva();
                    reserva.setReservaId(rs.getInt("reserva_id"));
                    reserva.setCitaId(rs.getInt("cita_id"));
                    reserva.setFechaReserva(rs.getTimestamp("fecha_reserva"));
                    reserva.setMonto(rs.getDouble("monto"));
                    reserva.setEstado(rs.getString("estado"));
                    reserva.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    reserva.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                    reserva.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                    reserva.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reserva;
    }

    @Override
    public boolean agregar(Reserva reserva) {
        String sql = "INSERT INTO reservas (cita_id, fecha_reserva, monto, estado, fecha_creacion, usuario_creacion) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reserva.getCitaId());
            ps.setTimestamp(2, reserva.getFechaReserva());
            ps.setDouble(3, reserva.getMonto());
            ps.setString(4, reserva.getEstado());
            ps.setTimestamp(5, reserva.getFechaCreacion());
            ps.setInt(6, reserva.getUsuarioCreacion());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean editar(Reserva reserva) {
        String sql = "UPDATE reservas SET cita_id = ?, fecha_reserva = ?, monto = ?, estado = ?, fecha_modificacion = ?, usuario_modificacion = ? WHERE reserva_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reserva.getCitaId());
            ps.setTimestamp(2, reserva.getFechaReserva());
            ps.setDouble(3, reserva.getMonto());
            ps.setString(4, reserva.getEstado());
            ps.setTimestamp(5, reserva.getFechaModificacion());
            ps.setInt(6, reserva.getUsuarioModificacion());
            ps.setInt(7, reserva.getReservaId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminar(int reservaId) {
        String sql = "DELETE FROM reservas WHERE reserva_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reservaId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
