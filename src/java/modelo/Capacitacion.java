
package modelo;

import java.util.Date;

/**
 * Clase Capacitación
 * @author Leonel Briones
 */
public class Capacitacion {
    private int id;
    private Date fecha;
    private String hora;
    private String lugar;
    private int duracion;
    private int rutCliente;
    
    /**
     * Constructor Predeterminado
     */
    public Capacitacion(){}
    
    /**
     * Constructor Parametrizado con todos los atributos de clase
     * @param fecha
     * @param hora
     * @param lugar
     * @param duracion
     * @param rutCliente 
     */
    public Capacitacion(int id, Date fecha, String hora, String lugar, int duracion, int rutCliente){
        this.id = id;
        this.fecha = fecha;
        this.hora = hora;
        this.lugar = lugar;
        this.duracion = duracion;
        this.rutCliente = rutCliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * Método Getter
     * @return 
     */
    public Date getFecha() {
        return fecha;
    }
    
    /**
     * Método Setter
     * @param fecha 
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * Método Getter
     * @return 
     */
    public String getHora() {
        return hora;
    }

    /**
     * Método Setter
     * @param hora 
     */
    public void setHora(String hora) {
        this.hora = hora;
    }

    /**
     * Método Getter
     * @return 
     */
    public String getLugar() {
        return lugar;
    }

    /**
     * Método Setter
     * @param lugar 
     */
    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    /**
     * Método Getter
     * @return 
     */
    public int getDuracion() {
        return duracion;
    }

    /**
     * Método Setter
     * @param duracion 
     */
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    /**
     * Método Getter
     * @return 
     */
    public int getRutCliente() {
        return rutCliente;
    }

    /**
     * Método Setter
     * @param rutCliente 
     */
    public void setRutCliente(int rutCliente) {
        this.rutCliente = rutCliente;
    }

    @Override
    public String toString() {
        return "Capacitacion{" + "id=" + id + ", fecha=" + fecha + ", hora=" + hora + ", lugar=" + lugar + ", duracion=" + duracion + ", rutCliente=" + rutCliente + '}';
    }
    
    
}
