
package modelo;

import java.util.Date;

/**
 * Clase que define un Administrativo, extiende de la clase Usuario
 * @author Leonel Briones Palacios
 */
public class Administrativo extends Usuario{
    
    //ATRIBUTOS DE CLASE
    private String area;
    private String experienciaPrevia;

    /**
     * Constructor Predeterminado
     */
    public Administrativo() {
    }

    /**
     * Constructor Parametrizado: Recibe como argumento String area, String experienciaPrevia, int id, long run, String nombreUsuario, Date fechaNacimiento, int id, int run, String nombreUsuario, Date fechaNacimiento);
     * @param area
     * @param experienciaPrevia
     * @param id
     * @param run
     * @param nombreUsuario
     * @param fechaNacimiento 
     */
    public Administrativo(String area, String experienciaPrevia, int id, long run, String nombreUsuario, Date fechaNacimiento) {
        super(id, run, nombreUsuario, fechaNacimiento);
        this.area = area;
        this.experienciaPrevia = experienciaPrevia;
    }

    /**
     * Método Getter: Retorna un String como area
     * @return String
     */
    public String getArea() {
        return area;
    }

    /**
     * Método Setter: Recibe un String como argumento
     * @param area 
     */
    public void setArea(String area) {
        this.area = area;
    }

    /**
     * Método Getter: Retorna un String
     * @return String
     */
    public String getExperienciaPrevia() {
        return experienciaPrevia;
    }

    /**
     * Método Setter: Recibe String como argumento
     * @param experienciaPrevia 
     */
    public void setExperienciaPrevia(String experienciaPrevia) {
        this.experienciaPrevia = experienciaPrevia;
    }
    
    @Override
    public String toString() {
            return "Administrativo: " + super.toString() +", Área " + area + ", Experiencia Previa: " + experienciaPrevia;
    }

    /**
     * Método analizarUsuario: Retorna datos de la clase usuario, titulo y experiencia Previa de la clase Administrativo.
     * @return String concatenando los atributos anteriormente mencionados.
     */
    @Override
    public String analizarUsuario() {
            return "Administrativo : " + getNombreUsuario() + ", RUT: " + getRun() + ", Área: " + area + ", Experiencia Previa: " + experienciaPrevia;
    }
}
