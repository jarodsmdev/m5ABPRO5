<%-- 
    Document   : capacitacion
    Created on : Mar 22, 2023, 6:47:22 PM
    Author     : Leonel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Capacitación</title>
    </head>
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>
        
        <main>
            
            <h2 class="text-center py-3 my-5">Crear Capacitación</h2>
            
            <% String mensaje = request.getAttribute("mensaje") != null ? request.getAttribute("mensaje").toString() : ""; %>

            <% if (mensaje != null && !mensaje.isEmpty()) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="mensajeError">
                    <strong>¡Éxito!</strong> <%= mensaje %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
                
                <form action="SvCapacitacion" method="POST" class="needs-validation" novalidate>

                    <div class="form-floating mb-3">
                        <select name="rutCliente" id="rutCliente" class="form-select" required id="rutCliente">
                            <option selected disabled value=""">Seleccione un Cliente</option>
                            <c:forEach var="cliente" items="${listaClientes}">
                                <option value="${cliente.rut}">${cliente.obtenerNombreApellido()}</option>
                            </c:forEach>
                        </select>
                        <label for="rutCliente">Cliente:</label>
                            <div class="invalid-feedback">
                                Por favor seleccione un Cliente.
                            </div>

                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" placeholder="Fecha" id="hora" name="fecha" required="">
                        <label for="fecha">Fecha:</label>
                        <div class="invalid-feedback">
                            Por favor ingrese una fecha.
                        </div>
                    </div>    
    
                    <div class="form-floating mb-3">
                        <input type="time" class="form-control" placeholder="Hora" id="hora" name="hora" value="22:00">
                        <label for="hora">Hora:</label>
                    </div>
    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="Lugar" id="lugar" name="lugar" required>
                        <label for="lugar">Lugar:</label>
                        <div class="invalid-feedback">
                            Por favor ingrese el lugar de la Capacitación.
                        </div>
                    </div>
    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" maxlength="70" placeholder="Duración" id="duracion" name="duracion" required>
                        <label for="duracion">Duración:</label>
                        <div class="invalid-feedback">
                            Por favor ingrese duración en minutos.
                        </div>
                    </div>
    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" required placeholder="Cantidad de Asistentes" id="cantAsistentes" name="cantAsistentes">
                        <label for="cantAsistentes">Cantidad de Asistentes:</label>
                        <div class="invalid-feedback">
                            Por favor ingrese cantidad de asistentes.
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
