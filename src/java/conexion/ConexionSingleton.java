package conexion;


import java.sql.*;

public class ConexionSingleton {
    
    //ATRIBUTOS
    private static Connection conn = null;

    //CONSTRUCTOR
    private ConexionSingleton(){
        String url = "jdbc:mysql://localhost:3306/SPRINT_PREV_RIESGOS";
        String driver = "com.mysql.cj.jdbc.Driver";
        String user = "root";
        String password = "12345";
        
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url,user,password);
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    };
    
    //MÉTODOS GETCONNECTION
    public static Connection getConexion(){
        if(conn == null){
            new ConexionSingleton();
        }
        
        return conn;
    }
    
    //MÉTODO CLOSE
    public static void close() {
        if(conn != null) {
            try {
                conn.close();
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}
