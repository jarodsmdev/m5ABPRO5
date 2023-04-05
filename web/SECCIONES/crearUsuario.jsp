<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Crear Usuario</title>
    </head>
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>
        
        <main>
            
            <h2 class="text-center py-3 my-5">Crear Usuarios</h2>
            
            <% String mensaje = request.getAttribute("mensaje") != null ? request.getAttribute("mensaje").toString() : ""; %>

            <% if (mensaje != null && !mensaje.isEmpty()) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="mensajeError">
                    <strong>¡Éxito!</strong> <%= mensaje %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
                
                <form action="SvUsuarios" method="POST" class="needs-validation" novalidate>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="RUT" id="rutUsuario" name="rutUsuario" required="">
                        <label for="rut">Rut:</label>
                        <div class="invalid-feedback">
                            Ingrese RUT del Usuario
                        </div>
                    </div>    
    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="Nombre" id="nombreUsuario" name="nombreUsuario">
                        <label for="nombre">Nombre:</label>
                    </div>
    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="Apellido" id="apellidoUsuario" name="apellidoUsuario">
                        <label for="apellido">Apellido:</label>
                    </div>
    
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" placeholder="Fecha" id="fechaNacimientoUsuario" name="fechaNacimientoUsuario" required="">
                        <label for="fecha">Fecha de Nacimiento:</label>
                        <div class="invalid-feedback">
                            Por favor ingrese una fecha de nacimiento.
                        </div>
                    </div>

                    <input type="submit" value="Guardar" class="btn btn-primary w-25">
                      
                </form>
        </main>

                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/validations.js"></script>
    </body>

    <footer class="py-3">
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>