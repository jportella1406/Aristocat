/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.IMascota;
import Modelo.Mascota;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;


/**
 *
 * @author GamingWorld
 */
public class MascotaDAO implements IMascota {

    Conexion cn = new Conexion();
    private Connection con;

    public MascotaDAO() {
    }

    public MascotaDAO(Connection con) {
        this.con = con;
    }

    PreparedStatement ps;
    ResultSet rs;
    Mascota oE = new Mascota();

    @Override
    public List mascota() {
        ArrayList<Mascota> listaMascota = new ArrayList<>();
        String sql = "select * from mascotas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mascota oEst = new Mascota();
                oEst.setMascotasId(rs.getInt(1));
                oEst.setClienteId(rs.getInt(2));
                oEst.setNombre(rs.getString(3));
                oEst.setEspecie(rs.getString(4));
                oEst.setRaza(rs.getString(5));
                oEst.setPeso(rs.getDouble(6));
                oEst.setFechaNac(rs.getTimestamp(7));
                oEst.setSexo(rs.getString(8));
                oEst.setHistMedico(rs.getString(9));
                oEst.setEstado(rs.getString(10));

                listaMascota.add(oEst);
            }
        } catch (Exception e) {
        }
        return listaMascota;
    }

    @Override
    public Mascota list(int codigo) {
        String sql = "select * from mascotas where mascota_id=" + codigo;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                oE.setMascotasId(rs.getInt(1));
                oE.setClienteId(rs.getInt(2));
                oE.setNombre(rs.getString(3));
                oE.setEspecie(rs.getString(4));
                oE.setRaza(rs.getString(5));
                oE.setPeso(rs.getDouble(6));
                oE.setFechaNac(rs.getTimestamp(7));
                oE.setSexo(rs.getString(8));
                oE.setHistMedico(rs.getString(9));
                oE.setEstado(rs.getString(10));

            }
        } catch (Exception e) {
        }
        return oE;
    }

    @Override
    public boolean add(Mascota oEst) {

        String sql = "insert into mascotas(cliente_id,nombre,especie,raza,peso,fecha_nacimiento,sexo,historial_medico,estado)"
                + " values(?,?,?,?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oEst.getClienteId());
            ps.setString(2, oEst.getNombre());
            ps.setString(3, oEst.getEspecie());
            ps.setString(4, oEst.getRaza());
            ps.setDouble(5, oEst.getPeso());
            ps.setTimestamp(6, oEst.getFechaNac());
            ps.setString(7, oEst.getSexo());
            ps.setString(8, oEst.getHistMedico());
            ps.setString(9, oEst.getEstado());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    

    @Override
    public boolean edit(Mascota oEst) {

        String sql = "UPDATE mascotas SET cliente_id = ?,"
                + " nombre = ?,"
                + " especie = ?,"
                + " raza = ?,"
                + " peso = ?,"
                + " fecha_nacimiento = ?,"
                + " sexo = ?,"
                + " historial_medico = ?,"
                + " estado = ? WHERE mascota_id = ?";
        
        try {
            con = cn.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oEst.getClienteId());
            ps.setString(2, oEst.getNombre());
            ps.setString(3, oEst.getEspecie());
            ps.setString(4, oEst.getRaza());
            ps.setDouble(5, oEst.getPeso());
            ps.setTimestamp(6, oEst.getFechaNac());
            ps.setString(7, oEst.getSexo());
            ps.setString(8, oEst.getHistMedico());
            ps.setString(9, oEst.getEstado());
            ps.setInt(10, oEst.getMascotasId());
            
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
        
    }

    @Override
    public boolean eliminar(int codigo) {
        String sql = "delete from mascotas where mascota_id=" + codigo;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

}
