package modelo;

import java.util.Date;

/**
 *
 * @author Yo
 */
public class Administrativo extends Usuario{
    private String emailAdministrativo;
    private String areaAdministrativo;

    public Administrativo() {
    }

    public Administrativo(String emailAdministrativo, String areaAdministrativo, int idUsuario, String nombreUsuario, String apellidoUsuario, int rutUsuario, Date fechaNacimientoUsuario) {
        super(idUsuario, nombreUsuario, apellidoUsuario, rutUsuario, fechaNacimientoUsuario);
        this.emailAdministrativo = emailAdministrativo;
        this.areaAdministrativo = areaAdministrativo;
    }

    public String getEmailAdministrativo() {
        return emailAdministrativo;
    }

    public void setEmailAdministrativo(String emailAdministrativo) {
        this.emailAdministrativo = emailAdministrativo;
    }

    public String getAreaAdministrativo() {
        return areaAdministrativo;
    }

    public void setAreaAdministrativo(String areaAdministrativo) {
        this.areaAdministrativo = areaAdministrativo;
    }

    @Override
    public String toString() {
        return "Administrativo{" + "emailAdministrativo=" + emailAdministrativo + ", areaAdministrativo=" + areaAdministrativo + '}';
    }

}
