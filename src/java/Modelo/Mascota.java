/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


import java.sql.Timestamp;
/**
 *
 * @author GamingWorld
 */
public class Mascota {
    
    private Integer mascotasId;
    private Integer clienteId;
    private String nombre;
    private String especie;
    private String raza;
    private Double peso;
    private Timestamp fechaNac;
    private String sexo;
    private String histMedico;
    private String estado;
    
    private Timestamp fechaCreacion;
    private Timestamp fechaModificacion;
    private Integer usuarioCreacion;
    private Integer usuarioModificacion;

    public Mascota() {
    }

    public Mascota(Integer mascotasId, Integer clienteId, String nombre, String especie, String raza, Double peso, Timestamp fechaNac, String sexo, String histMedico, String estado, Timestamp fechaCreacion, Timestamp fechaModificacion, Integer usuarioCreacion, Integer usuarioModificacion) {
        this.mascotasId = mascotasId;
        this.clienteId = clienteId;
        this.nombre = nombre;
        this.especie = especie;
        this.raza = raza;
        this.peso = peso;
        this.fechaNac = fechaNac;
        this.sexo = sexo;
        this.histMedico = histMedico;
        this.estado = estado;
        this.fechaCreacion = fechaCreacion;
        this.fechaModificacion = fechaModificacion;
        this.usuarioCreacion = usuarioCreacion;
        this.usuarioModificacion = usuarioModificacion;
    }
    
    

    public Integer getMascotasId() {
        return mascotasId;
    }

    public void setMascotasId(Integer mascotasId) {
        this.mascotasId = mascotasId;
    }

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Timestamp getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Timestamp fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getHistMedico() {
        return histMedico;
    }

    public void setHistMedico(String histMedico) {
        this.histMedico = histMedico;
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

    public Integer getUsuarioCreacion() {
        return usuarioCreacion;
    }

    public void setUsuarioCreacion(Integer usuarioCreacion) {
        this.usuarioCreacion = usuarioCreacion;
    }

    public Integer getUsuarioModificacion() {
        return usuarioModificacion;
    }

    public void setUsuarioModificacion(Integer usuarioModificacion) {
        this.usuarioModificacion = usuarioModificacion;
    }

    @Override
    public String toString() {
        return "Mascota{" + "mascotasId=" + mascotasId + ", clienteId=" + clienteId + ", nombre=" + nombre + ", especie=" + especie + ", raza=" + raza + ", peso=" + peso + ", fechaNac=" + fechaNac + ", sexo=" + sexo + ", histMedico=" + histMedico + ", estado=" + estado + ", fechaCreacion=" + fechaCreacion + ", fechaModificacion=" + fechaModificacion + ", usuarioCreacion=" + usuarioCreacion + ", usuarioModificacion=" + usuarioModificacion + '}';
    }
    
}
