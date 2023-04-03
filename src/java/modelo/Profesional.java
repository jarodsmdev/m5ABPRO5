package modelo;

import java.util.Date;

/**
 *
 * @author Yo
 */
public class Profesional extends Usuario{
    private int telefonoProfesional;
    private String tituloProfesional;
    private String proyectoProfesional;

    public Profesional() {
    }

    public Profesional(int telefonoProfesional, String tituloProfesional, String proyectoProfesional, int idUsuario, String nombreUsuario, String apellidoUsuario, int rutUsuario, Date fechaNacimientoUsuario) {
        super(idUsuario, nombreUsuario, apellidoUsuario, rutUsuario, fechaNacimientoUsuario);
        this.telefonoProfesional = telefonoProfesional;
        this.tituloProfesional = tituloProfesional;
        this.proyectoProfesional = proyectoProfesional;
    }

    public int getTelefonoProfesional() {
        return telefonoProfesional;
    }

    public void setTelefonoProfesional(int telefonoProfesional) {
        this.telefonoProfesional = telefonoProfesional;
    }

    public String getTituloProfesional() {
        return tituloProfesional;
    }

    public void setTituloProfesional(String tituloProfesional) {
        this.tituloProfesional = tituloProfesional;
    }

    public String getProyectoProfesional() {
        return proyectoProfesional;
    }

    public void setProyectoProfesional(String proyectoProfesional) {
        this.proyectoProfesional = proyectoProfesional;
    }

    @Override
    public String toString() {
        return "Profesional{" + "telefonoProfesional=" + telefonoProfesional + ", tituloProfesional=" + tituloProfesional + ", proyectoProfesional=" + proyectoProfesional + '}';
    }
    
}
