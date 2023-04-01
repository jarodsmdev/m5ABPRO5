
package modelo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Clase que define un Cliente, extiende de la clase Usuario
 * @author Leonel Briones
 */
public class Cliente extends Usuario{
    
    //ATRIBUTOS DE CLASE
    private int rut;
    private String nombre;
    private String apellido;
    private String telefono;
    private String afp;
    private String sistemaSalud;
    private String direccion;
    private String comuna;
    private int edad;
    private List<Accidente> listaAccidentes = new ArrayList<Accidente>();
    private List<VisitaEnTerreno> listaVisitaEnTerreno = new ArrayList<VisitaEnTerreno>(); 

    /**
     * Constructor Predefinido: No recibe parámetros como argumentos.
     */
    public Cliente() {
    }

    /**
     * Constructor Parametrizado: Recibe int rut, String nombre, String apellido, String telefono, String afp, String sistemaSalud, String direccion, String comuna, int edad, int id, long run, String nombreUsuario, Date fechaNacimiento
     * @param rut
     * @param nombre
     * @param apellido
     * @param telefono
     * @param afp
     * @param sistemaSalud
     * @param direccion
     * @param comuna
     * @param edad
     * @param id
     * @param run
     * @param nombreUsuario
     * @param fechaNacimiento 
     */
    public Cliente(int rut, String nombre, String apellido, String telefono, String afp, String sistemaSalud, String direccion, String comuna, int edad, int id, long run, String nombreUsuario, Date fechaNacimiento) {
        super(id, run, nombreUsuario, fechaNacimiento);
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.afp = afp;
        this.sistemaSalud = sistemaSalud;
        this.direccion = direccion;
        this.comuna = comuna;
        this.edad = edad;
    }

    /**
     * Método Getter:
     * @return int
     */
    public int getRut() {
        return rut;
    }

    /**
     * Método Setter:
     * @param rut 
     */
    public void setRut(int rut) {
        this.rut = rut;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método Setter:
     * @param nombre 
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Método Setter:
     * @param apellido 
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Método Setter:
     * @param telefono 
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getAfp() {
        return afp;
    }

    /**
     * Método Setter:
     * @param afp 
     */
    public void setAfp(String afp) {
        this.afp = afp;
    }
    
    /**
     * Método Getter:
     * @return String
     */
    public String getSistemaSalud() {
        return sistemaSalud;
    }

    /**
     * Método Setter:
     * @param sistemaSalud 
     */
    public void setSistemaSalud(String sistemaSalud) {
        this.sistemaSalud = sistemaSalud;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * Método Setter:
     * @param direccion 
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * Método Getter:
     * @return String
     */
    public String getComuna() {
        return comuna;
    }

    /**
     * Método Setter:
     * @param comuna 
     */
    public void setComuna(String comuna) {
        this.comuna = comuna;
    }

    /**
     * Método Getter:
     * @return int
     */
    public int getEdad() {
        return edad;
    }

    /**
     * Método Setter:
     * @param edad 
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * Método Getter:
     * @return List de tipo Accidente
     */
    public List<Accidente> getListaAccidentes() {
        return listaAccidentes;
    }

    /**
     * Método Setter:
     * @param listaAccidentes 
     */
    public void setListaAccidentes(List<Accidente> listaAccidentes) {
        this.listaAccidentes = listaAccidentes;
    }

    /**
     * Método Getter:
     * @return List de tipo VisitaEnTerreno
     */
    public List<VisitaEnTerreno> getListaVisitaEnTerreno() {
        return listaVisitaEnTerreno;
    }

    /**
     * Método Setter:
     * @param listaVisitaEnTerreno 
     */
    public void setListaVisitaEnTerreno(List<VisitaEnTerreno> listaVisitaEnTerreno) {
        this.listaVisitaEnTerreno = listaVisitaEnTerreno;
    }


    /**
     * Método obtenerNombre: Retorna un String concatenando nombre y apellido:
     * @return String
     */
    public String obtenerNombre(){
        return nombre + " " + apellido;
    }
    
    /**
     * Método obtenerSistemaSalud: Recibe como argumento un String 1 o 2 haciendo referencia FONASA o ISAPRE respectivamente.
     * @param sistemaSalud
     * @return String "FONASA" o "ISAPRE"
     */
    public String obtenerSistemaSalud(String sistemaSalud) {

            if(sistemaSalud.equals(1)) {
                return "FONASA";
            }
            else {
                return "ISAPRE";
            }
    }

    /**
     * Método agregarAccidente: Recibe un objeto tipo Accidente y lo agrega a la lista 'listaAccidentes'
     * @param nuevoAccidente 
     */
    public void agregarAccidente(Accidente accidente) {
            listaAccidentes.add(accidente);
    }
    
    /**
     * Método agregarVisitaTerreno: Recibe un objeto tipo VisitaEnTerreno y lo agrega a la lista 'listaVisitaEnTerreno'
     * @param nuevaVisita 
     */
    public void agregarVisitaTerreno(VisitaEnTerreno visita) {
        listaVisitaEnTerreno.add(visita);
    }   
    
    /**
     * Método analizarUsuario: Retorna datos de la clase usuario, dirección y comuna de la clase Cliente.
     * @return String concatenando los atributos anteriormente mencionados.
     */
    @Override
    public String analizarUsuario() {
            return "Cliente: " + super.getNombreUsuario() + ", RUN: " + super.getRun() + ", Dirección: " + getDireccion() + ", Comuna: " + getComuna();
    }
    
    /**
     * Método toString retorna todos los datos de la Clase
     * @return String concatenando todos los atributos de la clase Cliente agregando los de la clase Usuario (Superclase).
     */
    @Override
    public String toString() {
        return "Cliente{" + super.toString() + ", RUN=" + getRun() + "RUT=" + rut + ", nombre=" + nombre + ", apellido=" + apellido + ", telefono=" + telefono + ", afp=" + afp + ", sistemaSalud=" + sistemaSalud + ", direccion=" + direccion + ", comuna=" + comuna + ", edad=" + edad + ", listaAccidentes=" + listaAccidentes + ", listaVisitaEnTerreno=" + listaVisitaEnTerreno + '}';
    }
}
