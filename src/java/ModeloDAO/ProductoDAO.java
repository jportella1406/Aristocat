/**
 *
 * @author Starlord
 */
package ModeloDAO;
import Interfaces.IProducto;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO  implements IProducto {

    private final Connection connection;

    public ProductoDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Producto> listar() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM productos";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setProductoId(rs.getInt("producto_id"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setEstado(rs.getString("estado"));
                producto.setMarca(rs.getString("marca"));
                producto.setImagen(rs.getString("imagen"));
                producto.setTipo(rs.getString("tipo"));
                producto.setRazonSocial(rs.getString("razon_social"));
                producto.setProveedorId(rs.getInt("proveedor_id"));
                producto.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
                producto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                producto.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                producto.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                producto.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                lista.add(producto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Producto listarPorId(int productoId) {
        Producto producto = null;
        String sql = "SELECT * FROM productos WHERE producto_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productoId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    producto = new Producto();
                    producto.setProductoId(rs.getInt("producto_id"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getDouble("precio"));
                    producto.setStock(rs.getInt("stock"));
                    producto.setEstado(rs.getString("estado"));
                    producto.setMarca(rs.getString("marca"));
                    producto.setImagen(rs.getString("imagen"));
                    producto.setTipo(rs.getString("tipo"));
                    producto.setRazonSocial(rs.getString("razon_social"));
                    producto.setProveedorId(rs.getInt("proveedor_id"));
                    producto.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
                    producto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    producto.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                    producto.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                    producto.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return producto;
        
    }
    
    @Override
    public List<Producto> listarPorTipo(String tipo) {

        
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM productos WHERE tipo = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)){
                ps.setString(1, tipo);
             try (ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setProductoId(rs.getInt("producto_id"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setEstado(rs.getString("estado"));
                producto.setMarca(rs.getString("marca"));
                producto.setImagen(rs.getString("imagen"));
                producto.setTipo(rs.getString("tipo"));
                producto.setRazonSocial(rs.getString("razon_social"));
                producto.setProveedorId(rs.getInt("proveedor_id"));
                producto.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
                producto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                producto.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));
                producto.setUsuarioCreacion(rs.getInt("usuario_creacion"));
                producto.setUsuarioModificacion(rs.getInt("usuario_modificacion"));
                lista.add(producto);
            }
        }} catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public boolean agregar(Producto producto) {
        String sql = "INSERT INTO productos (nombre, descripcion, precio, stock, estado, marca, imagen, tipo, "
                + "razon_social, proveedor_id, fecha_vencimiento, fecha_creacion, usuario_creacion) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getEstado());
            ps.setString(6, producto.getMarca());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getTipo());
            ps.setString(9, producto.getRazonSocial());
            ps.setInt(10, producto.getProveedorId());
            ps.setDate(11, (Date) producto.getFechaVencimiento());
            ps.setTimestamp(12, producto.getFechaCreacion());
            ps.setInt(13, producto.getUsuarioCreacion());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean editar(Producto producto) {
        String sql = "UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, stock = ?, estado = ?, marca = ?, imagen = ?, tipo = ?, razon_social = ?, proveedor_id = ?, fecha_vencimiento = ?, fecha_modificacion = ?, usuario_modificacion = ? WHERE producto_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getEstado());
            ps.setString(6, producto.getMarca());
            ps.setString(7, producto.getImagen());
            ps.setString(8, producto.getTipo());
            ps.setString(9, producto.getRazonSocial());
            ps.setInt(10, producto.getProveedorId());
            ps.setDate(11, (Date) producto.getFechaVencimiento());
            ps.setTimestamp(12, producto.getFechaModificacion());
            ps.setInt(13, producto.getUsuarioModificacion());
            ps.setInt(14, producto.getProductoId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

        @Override
    public boolean editarStock(Producto producto) {
        String sql = "UPDATE productos SET stock = ?, fecha_modificacion = ?, usuario_modificacion = ? WHERE producto_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, producto.getStock());
            ps.setTimestamp(2, producto.getFechaModificacion());
            ps.setInt(3, producto.getUsuarioModificacion());
            ps.setInt(4, producto.getProductoId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean eliminar(int productoId) {
        String sql = "DELETE FROM productos WHERE producto_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productoId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
