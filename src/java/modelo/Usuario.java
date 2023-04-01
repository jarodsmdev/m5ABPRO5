
package modelo;

import java.util.Date;

/**
 * Clase que define un Usuario, implementa de la interfaz Asesoria.
 * @author Leonel Briones Palacios
 */
public class Usuario implements IAsesoria{
    
    //ATRIBUTOS DE CLASE
    private int id;
    private long run;
    private String nombreUsuario;
    private Date fechaNacimiento;
    
    /**
     * Constructor Predefinido: No recibe parámetros como argumentos.
     */
    public Usuario() {
    }

    /**
     * Constructor Parametrizado: Recibe int id, Long rut, String nombre Usuario, String Fecha Nacimiento
     * @param run
     * @param nombreUsuario
     * @param fechaNacimiento 
     */
    public Usuario(int id, long run, String nombreUsuario, Date fechaNacimiento) {
        this.id = id;
        this.run = run;
        this.nombreUsuario = nombreUsuario;
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * Método Getter: Retorna int como un identificador.
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * Método Setter: Recibe un int como un identificador.
     * @param id 
     */
    public void setId(int id) {
        this.id = id;
    }
   
    /**
     * Método Getter: Retorna un long como run.
     * @return long
     */
    public long getRun() {
        return run;
    }

    /**
     * Método Setter Recibe un long como run
     * @param run 
     */
    public void setRun(long run) {
        this.run = run;
    }

    /**
     * Método Getter
     * @return Retorna un String como nombre de Usuario.
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Método Setter recibe un String como nombre de Usuario
     * @param nombreUsuario 
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * Método Getter: Retorna Date como Fecha de Nacimiento
     * @return Date
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * Método Setter recibe un String como argumento indicando Fecha de nacimiento
     * @param fechaNacimiento 
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
    /**
     * Método Analizar Usuario retorna String indicando nombre y rut del usuario
     * @return String indicando nombre y rut del usuario
     */
    @Override
    public String analizarUsuario() {
        return "Usuario: " + getNombreUsuario() + ", RUN:" + run;
    }

    /**
     * Método toString retorna todos los datos de la Clase
     * @return Un String concatenendo el nombre del campo y su valor
     */
    @Override
    public String toString() {
        return "Usuario{" + "Nombre Usuario=" + nombreUsuario + ", Fecha Nacimiento=" + fechaNacimiento + ", Run=" + run + '}';
    }
}
