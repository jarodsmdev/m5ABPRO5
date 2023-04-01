
package modelo;


public class Cliente {
    //ATRIBUTOS DE CLASE
    private Integer id;
    private int rut;
    private String nombre;
    private String apellido;
    
    /**
     * CONSTRUCTOR PREDETERMINADO
     */
    public Cliente(){}
    
    /**
     * CONSTRUCTOR PARAMETRIZADO
     * @param id
     * @param rut
     * @param nombre
     * @param apellido 
     */
    public Cliente(int id, int rut, String nombre, String apellido){
        this.id = id;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    /**
     * Método Getter
     * @return 
     */
    public int getId() {
        return id;
    }
    /**
     * Método Setter
     * @param id 
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Método Getter
     * @return 
     */
    public int getRut() {
        return rut;
    }

    /**
     * Método Setter
     * @param rut 
     */
    public void setRut(int rut) {
        this.rut = rut;
    }

    /**
     * Método Getter
     * @return 
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método Setter
     * @param nombre 
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método Getter
     * @return 
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Método Setter
     * @param apellido 
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public String obtenerNombreApellido(){
        return nombre + " " + apellido;
    }
}
