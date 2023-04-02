<%-- 
    Document   : usuario
    Created on : Apr 2, 2023, 3:11:12 PM
    Author     : Leonel Briones Palacios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BOOTSTRAP CSS V5.2.3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Usuario</title>
    </head>
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>

        <main>
            <h2 class="text-center py-3 my-5">Crear Usuario</h2>

            <form action="SvUsuario" method="POST" class="needs-validation" novalidate>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" placeholder="RUN" id="run" name="run" required="true">
                    <label for="run" class="ps-4">Run:</label>
                    <div class="invalid-feedback">
                        Por favor ingrese RUN.
                    </div>
                </div>
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" placeholder="Nombre" id="usuario" name="usuario" required="true">
                    <label for="usuario" class="ps-4">Nombre de Usuario:</label>
                    <div class="invalid-feedback">
                        Por favor ingrese Nombre.
                    </div>
                </div>
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" placeholder="Apellidos" id="apellido" name="apellido" required="true">
                    <label for="apellido" class="ps-4">Apellido:</label>
                    <div class="invalid-feedback">
                        Por favor ingrese Apellido.
                    </div>
                </div>
                
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" required="true" id="fechaNacimiento" name="fechaNacimiento">
                    <label for="fechaNacimiento" class="ps-4">Fecha de Nacimiento:</label>
                    <div class="invalid-feedback">
                        Por favor selecione fecha de Nacimiento.
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-block d-md-flex justify-content-md-around mt-3 mb-5">
                    <input type="submit" value="Guardar" class="btn btn-primary col-md-5">
                    <input type="reset" value="Limpiar" class="btn btn-danger col-md-5">
                </div>
            </form>
        </main>

        <!-- CUSTOM JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- VALIDATION CSS JS -->
        <script src="assets/js/validationBootstrapCSSJS.js"></script>
    </body>

    <footer class="py-3">
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>
