/**
 *
 * @author Starlord
 */
package Config;

import java.sql.*;

public class Conexion {
    
    private static final String URL = "jdbc:mysql://localhost:3306/veterinaria";
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("No se pudo cargar el driver de MariaDB", e);
        }
    }
}

