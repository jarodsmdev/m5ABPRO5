package modelo;

import java.util.Date;

/**
 * Clase Capacitación
 *
 * @author Leonel Briones
 */
public class Capacitacion {

    private int idCapacitacion;
    private Date fechaCapacitacion;
    private String horaCapacitacion;
    private String lugarCapacitacion;
    private int duracionCapacitacion;
    private int rutCliente;

    /**
     * Constructor Predeterminado
     */
    public Capacitacion() {
    }

    public Capacitacion(int idCapacitacion, Date fechaCapacitacion, String horaCapacitacion, String lugarCapacitacion, int duracionCapacitacion, int rutCliente) {
        this.idCapacitacion = idCapacitacion;
        this.fechaCapacitacion = fechaCapacitacion;
        this.horaCapacitacion = horaCapacitacion;
        this.lugarCapacitacion = lugarCapacitacion;
        this.duracionCapacitacion = duracionCapacitacion;
        this.rutCliente = rutCliente;
    }

    public int getIdCapacitacion() {
        return idCapacitacion;
    }

    public void setIdCapacitacion(int idCapacitacion) {
        this.idCapacitacion = idCapacitacion;
    }

    public Date getFechaCapacitacion() {
        return fechaCapacitacion;
    }

    public void setFechaCapacitacion(Date fechaCapacitacion) {
        this.fechaCapacitacion = fechaCapacitacion;
    }

    public String getHoraCapacitacion() {
        return horaCapacitacion;
    }

    public void setHoraCapacitacion(String horaCapacitacion) {
        this.horaCapacitacion = horaCapacitacion;
    }

    public String getLugarCapacitacion() {
        return lugarCapacitacion;
    }

    public void setLugarCapacitacion(String lugarCapacitacion) {
        this.lugarCapacitacion = lugarCapacitacion;
    }

    public int getDuracionCapacitacion() {
        return duracionCapacitacion;
    }

    public void setDuracionCapacitacion(int duracionCapacitacion) {
        this.duracionCapacitacion = duracionCapacitacion;
    }

    public int getRutCliente() {
        return rutCliente;
    }

    public void setRutCliente(int rutCliente) {
        this.rutCliente = rutCliente;
    }

    @Override
    public String toString() {
        return "Capacitacion{" + "idCapacitacion=" + idCapacitacion + ", fechaCapacitacion=" + fechaCapacitacion + ", horaCapacitacion=" + horaCapacitacion + ", lugarCapacitacion=" + lugarCapacitacion + ", duracionCapacitacion=" + duracionCapacitacion + ", rutCliente=" + rutCliente + '}';
    }

}
