/**
 *
 * @author Leonel Briones Palacios
 */
package controlador;

import dao.DAOException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import mysql.MySQLDaoManager;

/**
 *
 * @author Leonel Briones Palacios
 */
@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

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
            out.println("<title>Servlet SvUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvUsuario at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

        //OBTENGO LA SESION ACTUAL
        HttpSession session = request.getSession();

        if (session.getAttribute("nombre") == null) {
            //NO EXISTE LA INICIADA LA SESION
            response.sendRedirect(request.getContextPath() + "/SvLogin");

        } else {
            //REDIRECCIONO A LA PÁGINA DE USUARIOS
            RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/usuario.jsp");
            dispatcher.forward(request, response);
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
        //processRequest(request, response);

        try {
            // Capturar los datos que vienen del request
            int run = Integer.parseInt(request.getParameter("run"));
            String nombreUsuario = request.getParameter("usuario");
            String fechaNacimiento = request.getParameter("fechaNacimiento");

            // Crear objeto Usuario y settear los datos
            Usuario usuario = new Usuario();
            usuario.setRun(run);
            usuario.setNombreUsuario(nombreUsuario);
            usuario.setFechaNacimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimiento));

            // Instanciar el DAOManager y llamar al método para la inserción del registro
            MySQLDaoManager manager = new MySQLDaoManager();
            manager.getUsuarioDAO().insertar(usuario);

            // Enviar mensaje de éxito a la vista
            request.setAttribute("mensaje", "Registro guardado exitosamente.");

        } catch (ParseException ex) {
            // Manejar la excepción si no se pudo parsear la fecha
            request.setAttribute("mensajeError", "Error: no se pudo procesar la fecha de nacimiento.");
        } catch (DAOException ex) {
            // Manejar la excepción si ocurre un error en la inserción del registro
            if (ex.getCause() instanceof SQLIntegrityConstraintViolationException) {
                // Manejar el error de clave primaria o índice único duplicado
                request.setAttribute("mensajeError", "URUN ingresado ya se encuentra registrado.");
            } else {
                // Manejar otros errores de DAOException
                request.setAttribute("mensajeError", "Error al insertar el registro: " + ex.getMessage());
            }
        }

        // Redirigir al usuario a la página correspondiente
        doGet(request, response);

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
