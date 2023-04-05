
package mysql;

import conexion.ConexionSingleton;
import dao.DAOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import dao.UsuarioDAO;
import modelo.Usuario;


public class MySQLUsuarioDAO implements UsuarioDAO{
    
    final String INSERT = "INSERT INTO Usuarios(id, run, nombre, apellidos, fechaNac, idUsuario) VALUES(?, ?, ?, ? ,?, ?);";
    final String UPDATE = "UPDATE Usuarios SET id = ?, run = ?, nombre = ?, apellidos = ?, fechNac = ? , idUsuario = ? WHERE idUsuario = ?;";
    final String DELETE = "DELETE FROM Usuarios WHERE idUsuario = ?;";
    final String GETALL = "SELECT * FROM Usuarios;";
    final String GETONE = "SELECT * FROM Usuarios WHERE idUsuario = ?;";
    
    private Connection conn;
    
    public MySQLUsuarioDAO(Connection conn){
        this.conn = ConexionSingleton.getConexion();
    }

    @Override
    public void insertar(Usuario u) throws DAOException {
        PreparedStatement st1 = null;
        PreparedStatement st2 = null;
        PreparedStatement st3 = null;
        try{
            st1 = conn.prepareStatement("SET FOREIGN_KEY_CHECKS=0;");
            st2 = conn.prepareStatement(INSERT);
            st3 = conn.prepareStatement("SET FOREIGN_KEY_CHECKS=1;");
            st2.setInt(1, u.getIdUsuario());
            st2.setInt(2, u.getRutUsuario());
            st2.setString(3, u.getNombreUsuario());
            st2.setString(4, u.getApellidoUsuario());
            st2.setDate(5, new Date(u.getFechaNacimientoUsuario().getTime()));
            st2.setInt(6, u.getIdUsuario());
            
            st1.executeUpdate();
            st2.executeUpdate();
            st3.executeUpdate();
            
        }catch(SQLException ex){
            throw new DAOException("Error en SQL", ex);
        } finally{
            if(st2 != null){
                try{
                    st1.close();
                    st2.close();
                    st3.close();
                }catch(SQLException ex){
                    throw new DAOException("Error en SQL", ex);
                }
            }
        }
    }

    @Override
    public void modificar(Usuario u) {

    }

    @Override
    public void eliminar(Usuario u) {

    }

    private Usuario convertirObjeto(ResultSet rs) throws SQLException{
        
        Usuario usuario = new Usuario();

        usuario.setIdUsuario(rs.getInt("idUsuario"));
        usuario.setNombreUsuario(rs.getString("nombre"));
        usuario.setApellidoUsuario(rs.getString("apellidos"));
        usuario.setRutUsuario(rs.getInt("run"));
        usuario.setFechaNacimientoUsuario(rs.getDate("fechaNac"));
        
        return usuario;
    }
    
    @Override
    public List<Usuario> obtenerTodos() throws DAOException{
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Usuario> listaUsuarios = new ArrayList<>();
        
        try{
            st = conn.prepareStatement(GETALL);
            rs = st.executeQuery();
            while(rs.next()){
                listaUsuarios.add(convertirObjeto(rs));
            }
        }catch(SQLException ex){
            throw new DAOException("Error en SQL", ex);
        }finally{
            if(rs != null){
                try{
                    rs.close();
                }catch(SQLException ex){
                    new DAOException("Error en SQL", ex);
                }
            }
            if(st != null){
                try {
                    st.close();
                } catch (SQLException ex) {
                   new DAOException("Error en SQL", ex);
                }
            }
        }
        return listaUsuarios;
    }

    @Override
    public Usuario obtener(Integer id) throws DAOException {
        PreparedStatement st = null;
        ResultSet rs = null;
        Usuario u = null;
        try{
            st = conn.prepareStatement(GETONE);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                u = convertirObjeto(rs);
            }else{
                throw new DAOException("No se ha encontrado ese registro.");
            }
        }catch(SQLException ex){
            throw new DAOException("Error en SQL", ex);
        }finally{
            if(rs != null){
                try{
                    rs.close();
                }catch(SQLException ex){
                    new DAOException("Error en SQL", ex);
                }
            }
            if(st != null){
                try {
                    st.close();
                } catch (SQLException ex) {
                   new DAOException("Error en SQL", ex);
                }
            }
        }
        return u;
    }
    
}
