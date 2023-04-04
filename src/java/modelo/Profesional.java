
package modelo;

import java.util.Date;

/**
 * Clase que define un Profesional, extiende de la Clase Usuario
 * @author Leonel Briones Palacios
 */
public class Profesional extends Usuario{
    
    //ATRIBUTOS DE CLASE
    private String titulo;
    private Date fechaIngreso;

    /**
     * Constructor predeterminado
     */
    public Profesional() {
    }

    /**
     * Constructor Parametrizado: Recibe como argumento String titulo, Date fechaIngreso, int id, long run, String nombreUsuario, Date fechaNacimiento int id, int run, String nombreUsuario, Date fechaNacimiento
     * @param titulo
     * @param fechaIngreso
     * @param id
     * @param run
     * @param nombreUsuario
     * @param fechaNacimiento 
     */
    public Profesional(String titulo, Date fechaIngreso, int id, long run, String nombreUsuario, Date fechaNacimiento) {
        super(id, run, nombreUsuario, fechaNacimiento);
        this.titulo = titulo;
        this.fechaIngreso = fechaIngreso;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * Método Setter: Recibe String como titulo
     * @param titulo 
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * Método Getter: Retorna un Date como fecha de Ingreso
     * @return 
     */
    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    /**
     * Método Setter: Recibe un Date como fecha de Ingreso
     * @param fechaIngreso 
     */
    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }
    
    /**
     * Método analizarUsuario: Retorna datos de la clase usuario(SuperClase), además de titulo y fecha ingreso de la clase Profesional.
     * @return String concatenando los atributos anteriormente mencionados.
     */
    @Override
    public String analizarUsuario() {
            return "Profesional: " + super.getNombreUsuario() + ", RUT: " + super.getRun() + ", Título: " + titulo + ", Fecha Ingreso: " + fechaIngreso;
    }
    
    /**
     * Método toString: Retorna un String concatenando la información del Usuario, agregando los atributos de la clase Profesional
     * @return String concatenando la información de la clase Usuario(SuperClase) y agregando los de la clase Profesional
     */
    @Override
    public String toString() {
            return "Profesional" + super.toString() + "Título: " + titulo + ", Fecha Ingreso: " + fechaIngreso;
    }   
    
    
    
}
