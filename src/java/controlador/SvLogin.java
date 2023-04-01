/**
 * @author: Leonel Briones Palacios
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yo
 */
@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {
   

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
            out.println("<title>Servlet SvLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet responses
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        if(session.getAttribute("nombre") != null){
            //SI EXISTE, ELIMINAR EL ATRIBUTO
            session.removeAttribute("nombre");
            response.sendRedirect("SvContacto");
        }
        else{
            response.sendRedirect("SECCIONES/login.jsp");
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
       // processRequest(request, response);
               
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");

        if (user == null || pass == null || !validar(user, pass)) {
            request.setAttribute("mensajeError", "Credenciales inválidas.");
            //response.sendRedirect("SECCIONES/login.jsp");
            request.getRequestDispatcher("SECCIONES/login.jsp").forward(request, response);
        }
        else {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", user);
            response.sendRedirect("SECCIONES/contacto.jsp");
            
        }
    }

    public boolean validar(String nombre, String password) {
        HashMap<String, String> usuarios = new HashMap<String, String>();
        usuarios.put("leonel", "123");
        usuarios.put("fernanda", "123");
        usuarios.put("jorge", "123");
        usuarios.put("mauricio", "123");
        usuarios.put("admin", "1234");
        return usuarios.containsKey(nombre) && usuarios.get(nombre).equals(password);
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
