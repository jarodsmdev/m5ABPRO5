
package mysql;
import conexion.ConexionSingleton;
import dao.CapacitacionDAO;
import dao.ClienteDAO;
import dao.DAOManager;
import dao.UsuarioDAO;
import java.sql.*;


public class MySQLDaoManager implements DAOManager{
    private Connection conn;
    
    private CapacitacionDAO capacitacion = null;
    private ClienteDAO cliente = null;
    private UsuarioDAO usuario = null;
    
    public MySQLDaoManager(){
        conn = ConexionSingleton.getConexion();
    };

    @Override
    public CapacitacionDAO getCapacitacionDAO() {
        if(capacitacion ==  null){
            capacitacion = new MySQLCapacitacionDAO(conn);
        }
        return capacitacion;
    }

    @Override
    public ClienteDAO getClienteDAO() {
        if(cliente == null){
            cliente = new MySQLClienteDAO(conn);
        }
        return cliente;
    }
    
    /*public static void main(String[] args) throws SQLException, DAOException{
        MySQLDaoManager man = new MySQLDaoManager();
        List<Capacitacion> capacitaciones = man.getCapacitacionDAO().obtenerTodos();
        System.out.println(capacitaciones);
    }
    */

    @Override
    public UsuarioDAO getUsuarioDAO() {
        if(usuario == null){
            usuario = new MySQLUsuarioDAO(conn);
        }
        return usuario;
    }
}
