/**
 * @author: Leonel Briones Palacios
 */
package controlador;

import conexion.ConexionSingleton;
import dao.DAOException;
import java.sql.*;
import modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Capacitacion;
import mysql.MySQLDaoManager;

/**
 *
 * @author Leonel Briones Palacios
 */
@WebServlet(name = "SvCapacitacion", urlPatterns = {"/SvCapacitacion"})
public class SvCapacitacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvCapacitacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvCapacitacion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute("nombre") == null){
            response.sendRedirect(request.getContextPath() + "/SvLogin");
        }
        else {
            //MISSION: ENVIAR LOS CLIENTES EXISTENTES AL COMBOBOX
            
            //CREA LISTA DE OBJETOS CLIENTE
            List<Cliente>listaClientes = new ArrayList<>();

            try {
                
                //1. CREAR CONEXION BD
                Connection conn = ConexionSingleton.getConexion();
                //2. CREAR OBJETO STATEMENT
                Statement st = conn.createStatement();
                //3. CREAR LA SENTENCIA SQL
                String querySQL = "SELECT idCliente, rutCliente, CliNombres, CliApellidos FROM Cliente";
                //4. EJECUTAR LA QUERY
                ResultSet rs = st.executeQuery(querySQL);
                //5. RECORRER EL RESULTSET
                while(rs.next()){
                    //5.a LEER CADA CAMPO, PARA CREAR OBJETO CLIENTE EN CADA ITERACIÓN
                    Cliente cliente = new Cliente();

                    cliente.setId(rs.getInt("idCliente"));
                    cliente.setRut(rs.getInt("rutCliente"));
                    cliente.setNombre(rs.getString("CliNombres"));
                    cliente.setApellido(rs.getString("CliApellidos"));

                    //5.a AÑADIR CLIENTE A LA LISTA
                    listaClientes.add(cliente);
                    
                }

                //6. ENVIAR EL ARRAYLIST CLIENTES A LA VISTA COMO PARÁMETRO
                request.setAttribute("listaClientes", listaClientes);

                //7. REDIRECCIONAR
                RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/capacitacion.jsp");
                dispatcher.forward(request, response);
                
                
            } catch (SQLException ex) {
                Logger.getLogger(SvCapacitacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //processRequest(request, response);
            
            //1. RESCATAR LOS DATOS DEL REQUEST
            //TODO: VALIDAR EL TIPO DE DATOS Y VALIDAR
            int rut = Integer.parseInt(request.getParameter("rutCliente"));
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String lugar = request.getParameter("lugar");
            int duracion = Integer.parseInt(request.getParameter("duracion"));
            String qAsistentes = request.getParameter("cantAsistentes");
            
            //2. CREAR OBJETO CAPACITACION
            Capacitacion capacitacion = new Capacitacion();
            
            //3. SETEAR LOS DATOS DEL OBJETO
            capacitacion.setRutCliente(rut);
            capacitacion.setFecha(new SimpleDateFormat("yyyy-MM-dd").parse(fecha));
            capacitacion.setHora(hora);
            capacitacion.setLugar(lugar);
            capacitacion.setDuracion(duracion);
            
            //System.out.println(capacitacion.toString());
            
            //INSTANCIAR EL DAOMANAGER
            MySQLDaoManager manager = new MySQLDaoManager();
            try {
                //INVOCAR AL MÉTODO PARA LA INSERCIÓN DEL REGISTRO
                manager.getCapacitacionDAO().insertar(capacitacion);
                request.setAttribute("mensaje", "Registro Guardado exitosamente!.");
                //6. REDIRECCIONAR
                //RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/capacitacion.jsp");
                //dispatcher.forward(request, response);
                
                //RECARGO LA MISMA PÁGINA A TRAVÉS DEL MÉTODO DOGET PARA QUE VUELVA A TENER LOS DATOS EL COMBOBOX
                doGet(request,response);
                //System.out.println("REGISTRO GUARDADO CON ÉXITO");
            } catch (DAOException ex) {
                Logger.getLogger(SvCapacitacion.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(SvCapacitacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
