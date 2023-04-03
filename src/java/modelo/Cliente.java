package modelo;

import java.util.Date;

public class Cliente extends Usuario {

    private int telefonoCliente;
    private String afpCliente;
    private int sistemaSaludCliente;
    private String direccionCliente;
    private String comunaCliente;
    private int edadCliente;

    public Cliente() {
    }

    public Cliente(int telefonoCliente, String afpCliente, int sistemaSaludCliente, String direccionCliente, String comunaCliente, int edadCliente, int idUsuario, String nombreUsuario, String apellidoUsuario, int rutUsuario, Date fechaNacimientoUsuario) {
        super(idUsuario, nombreUsuario, apellidoUsuario, rutUsuario, fechaNacimientoUsuario);
        this.telefonoCliente = telefonoCliente;
        this.afpCliente = afpCliente;
        this.sistemaSaludCliente = sistemaSaludCliente;
        this.direccionCliente = direccionCliente;
        this.comunaCliente = comunaCliente;
        this.edadCliente = edadCliente;
    }

    public int getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(int telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getAfpCliente() {
        return afpCliente;
    }

    public void setAfpCliente(String afpCliente) {
        this.afpCliente = afpCliente;
    }

    public int getSistemaSaludCliente() {
        return sistemaSaludCliente;
    }

    public void setSistemaSaludCliente(int sistemaSaludCliente) {
        this.sistemaSaludCliente = sistemaSaludCliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getComunaCliente() {
        return comunaCliente;
    }

    public void setComunaCliente(String comunaCliente) {
        this.comunaCliente = comunaCliente;
    }

    public int getEdadCliente() {
        return edadCliente;
    }

    public void setEdadCliente(int edadCliente) {
        this.edadCliente = edadCliente;
    }

    @Override
    public String toString() {
        return "Cliente{" + "telefonoCliente=" + telefonoCliente + ", afpCliente=" + afpCliente + ", sistemaSaludCliente=" + sistemaSaludCliente + ", direccionCliente=" + direccionCliente + ", comunaCliente=" + comunaCliente + ", edadCliente=" + edadCliente + '}';
    }

}
