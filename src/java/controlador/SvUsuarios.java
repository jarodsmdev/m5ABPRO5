package controlador;

import conexion.ConexionSingleton;
import dao.DAOException;
import java.sql.*;
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
import modelo.Usuario;
import mysql.MySQLDaoManager;

/**
 *
 * @author jarod
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    int maxId;

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
            out.println("<title>Servlet SvUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvUsuarios at " + request.getContextPath() + "</h1>");
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

        if (session.getAttribute("nombre") == null) {
            response.sendRedirect(request.getContextPath() + "/SvLogin");
        } else {

            List<Usuario> listaUsuarios = new ArrayList<>();

            try {

                Connection conn = ConexionSingleton.getConexion();
                Statement st = conn.createStatement();
                String querySQL = "SELECT * FROM Usuarios;";
                ResultSet rs = st.executeQuery(querySQL);

                while (rs.next()) {
                    Usuario usuario = new Usuario();

                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombreUsuario(rs.getString("nombre"));
                    usuario.setApellidoUsuario(rs.getString("apellidos"));
                    usuario.setRutUsuario(rs.getInt("run"));
                    usuario.setFechaNacimientoUsuario(rs.getDate("fechaNac"));

                    listaUsuarios.add(usuario);

                    if (listaUsuarios.size() > 1) {
                        for (int i = 0; i < listaUsuarios.size() - 1; i++) {
                            if (listaUsuarios.get(i).getIdUsuario() < listaUsuarios.get(i + 1).getIdUsuario()) {
                                maxId = listaUsuarios.get(i + 1).getIdUsuario();
                            }
                        }
                    }
                    else {
                        maxId = 1;
                    }
                }

                request.setAttribute("listaUsuarios", listaUsuarios);

                RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/crearUsuario.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, ex);
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
            String rutUsuario = request.getParameter("rutUsuario");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String apellidoUsuario = request.getParameter("apellidoUsuario");
            String fechaNacimientoUsuario = request.getParameter("fechaNacimientoUsuario");

            //2. CREAR OBJETO CAPACITACION
            Usuario usuario = new Usuario();

            usuario.setIdUsuario(maxId + 1);
            usuario.setRutUsuario(Integer.parseInt(rutUsuario));
            usuario.setNombreUsuario(nombreUsuario);
            usuario.setApellidoUsuario(apellidoUsuario);
            usuario.setFechaNacimientoUsuario(new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimientoUsuario));

            //INSTANCIAR EL DAOMANAGER
            MySQLDaoManager manager = new MySQLDaoManager();
            try {
                //INVOCAR AL MÉTODO PARA LA INSERCIÓN DEL REGISTRO
                manager.getUsuarioDAO().insertar(usuario);
                request.setAttribute("mensaje", "Registro Guardado exitosamente");
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("SECCIONES/crearUsuario.jsp");
                dispatcher.forward(request, response);

            } catch (DAOException ex) {
                Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ParseException ex) {
            Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, ex);
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
