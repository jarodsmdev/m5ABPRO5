/**
 * author: Leonel Briones Palacios
 */
package mysql;

import conexion.ConexionSingleton;
import dao.DAOException;
import java.sql.*;
import dao.UsuarioDAO;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

/**
 *
 * @author Leonel Briones Palacios
 */
public class MySQLUsuarioDAO implements UsuarioDAO {

    final String INSERT = "INSERT INTO usuarios(run, nombre, fechaNac) VALUES(? ,?, ?);";
    final String UPDATE = "";
    final String DELETE = "";
    final String GETALL = "SELECT * FROM usuarios;";
    final String GETONE = "";

    private Connection conn;

    public MySQLUsuarioDAO(Connection conn) {
        this.conn = ConexionSingleton.getConexion();
    }

    @Override
    public void insertar(Usuario t) throws DAOException {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement(INSERT);
            st.setInt(1, (int) t.getRun());
            st.setString(2, t.getNombreUsuario());
            st.setDate(3, new Date(t.getFechaNacimiento().getTime()));

            if (st.executeUpdate() == 0) {
                throw new DAOException("No se ha guardado el Registro.");
            }
        } catch (SQLException ex) {
            throw new DAOException("Error en SQL", ex);
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException ex) {
                    throw new DAOException("Error en SQL", ex);
                }
            }
        }
    }

    @Override
    public void modificar(Usuario t) throws DAOException {

    }

    @Override
    public void eliminar(Usuario t) throws DAOException {

    }

    private Usuario convertirObjeto(ResultSet rs) throws SQLException {

        Usuario usuario = new Usuario();

        usuario.setId(rs.getInt("id"));
        usuario.setRun(rs.getLong("run"));
        usuario.setNombreUsuario(rs.getString("nombre"));
        usuario.setFechaNacimiento(rs.getDate("fechaNac"));

        return usuario;
    }

    @Override
    public List<Usuario> obtenerTodos() throws DAOException {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Usuario> listaUsuario = new ArrayList<>();
        try {
            st = conn.prepareStatement(GETALL);
            rs = st.executeQuery();
            while (rs.next()) {
                listaUsuario.add(convertirObjeto(rs));
            }

        } catch (SQLException ex) {
            throw new DAOException("Error en SQL", ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    new DAOException("Error en SQL", ex);
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException ex) {
                    new DAOException("Error en SQL", ex);
                }
            }
        }
        return listaUsuario;
    }

    @Override
    public Usuario obtener(Integer id) throws DAOException {
        return null;
    }

}
