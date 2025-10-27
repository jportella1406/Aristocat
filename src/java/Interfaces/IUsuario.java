/**
 *
 * @author Starlord
 */
package Interfaces;

import Modelo.Usuario;
import java.util.List;

public interface IUsuario {

    public List<Usuario> listar();

    public Usuario listarPorId(int usuarioId);

    public boolean agregar(Usuario usuario);

    public boolean editar(Usuario usuario);

    public boolean eliminar(int usuarioId);
}
