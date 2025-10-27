/**
 *
 * @author Starlord
 */
package Modelo;

import java.sql.Timestamp;

public class Venta {

    private Integer ventaId;
    private Integer clienteId;
    private Timestamp fechaVenta;
    private Double total;
    private String metodoPago;
    private String estado;
    private Timestamp fechaCreacion;
    private Timestamp fechaModificacion;
    private Integer usuarioCreacion;
    private Integer usuarioModificacion;

    public Venta() {
    }

    public Venta(Integer ventaId, Integer clienteId, Timestamp fechaVenta, Double total, String metodoPago, String estado, Timestamp fechaCreacion, Timestamp fechaModificacion, Integer usuarioCreacion, Integer usuarioModificacion) {
        this.ventaId = ventaId;
        this.clienteId = clienteId;
        this.fechaVenta = fechaVenta;
        this.total = total;
        this.metodoPago = metodoPago;
        this.estado = estado;
        this.fechaCreacion = fechaCreacion;
        this.fechaModificacion = fechaModificacion;
        this.usuarioCreacion = usuarioCreacion;
        this.usuarioModificacion = usuarioModificacion;
    }

    public int getVentaId() {
        return ventaId;
    }

    public void setVentaId(int ventaId) {
        this.ventaId = ventaId;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public Timestamp getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Timestamp fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Timestamp getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Timestamp fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public int getUsuarioCreacion() {
        return usuarioCreacion;
    }

    public void setUsuarioCreacion(int usuarioCreacion) {
        this.usuarioCreacion = usuarioCreacion;
    }

    public int getUsuarioModificacion() {
        return usuarioModificacion;
    }

    public void setUsuarioModificacion(int usuarioModificacion) {
        this.usuarioModificacion = usuarioModificacion;
    }
    
    
}
