
package mysql;

import java.sql.*;

import java.util.List;
import modelo.Cliente;
import conexion.ConexionSingleton;
import dao.ClienteDAO;

public class MySQLClienteDAO implements ClienteDAO{
    
    final String INSERT = "INSERT INTO";
    final String UPDATE = "UPDATE";
    final String DELETE = "DELETE FROM ";
    final String GETALL = "SELECT * FROM Cliente;";
    final String GETONE = "SELECT * FROM Cliente WHERE";
    
    private Connection conn;
    
    public MySQLClienteDAO(Connection conn){
        this.conn = ConexionSingleton.getConexion();
    }

    @Override
    public void insertar(Cliente c) {
        
    }

    @Override
    public void modificar(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void eliminar(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cliente> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cliente obtener(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
