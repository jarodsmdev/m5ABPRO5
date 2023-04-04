/**
 * @author: Leonel Briones Palacios
 */
package controlador;


import dao.DAOException;
import modelo.Capacitacion;
import java.io.IOException;
import java.io.PrintWriter;
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
import mysql.MySQLDaoManager;

/**
 *
 * @author Yo
 */
@WebServlet(name = "SvListarCapacitacion", urlPatterns = {"/SvListarCapacitacion"})
public class SvListarCapacitacion extends HttpServlet {

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
            out.println("<title>Servlet SvListarCapacitacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvListarCapacitacion at " + request.getContextPath() + "</h1>");
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
        //List<Capacitacion>listaCapacitacion = new ArrayList<>();
       
        HttpSession session = request.getSession();
        
        if(session.getAttribute("nombre") == null){
            response.sendRedirect(request.getContextPath() + "/SvLogin");
        }
        else {
            try {
                //INSTANCIAR EL DAOMANAGER
                MySQLDaoManager manager = new MySQLDaoManager();
                //OBTENER LA LISTA QUE TRAE EL MÉTODO OBTENER TODOS
                List<Capacitacion> listaCapacitacion = manager.getCapacitacionDAO().obtenerTodos();
                
                // ENVIAR EL ARRAYLIST CAPACITACION A LA VISTA COMO PARÁMETRO
                request.setAttribute("listaCapacitacion", listaCapacitacion);
                
                // REDIRECCIONAR
                RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/listarCapacitacion.jsp");
                dispatcher.forward(request, response);
            } catch (DAOException ex) {
                Logger.getLogger(SvListarCapacitacion.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
