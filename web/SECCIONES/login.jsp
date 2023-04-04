<%-- 
    Document   : login
    Created on : 24-03-2023, 08:16:53
    Author     : Mauricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Login</title>

    </head>
    <body class="container">
        <nav>

        </nav>
    </body>

    <h1 class="text-center py-3 my-5">Login</h1>

    <% String mensajeError = request.getAttribute("mensajeError") != null ? request.getAttribute("mensajeError").toString() : ""; %>

    <% if (mensajeError != null && !mensajeError.isEmpty()) {%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="mensajeError">
        <strong>¡Error!</strong> <%= mensajeError%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% }%>



    <form action="${pageContext.request.contextPath}/SvLogin" method="POST">

        <div class="row justify-content-center">
            <div class="col-6">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" placeholder="Introduce nombre" name="user">
                    <label for="nombre">Usuario:</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" placeholder="Introduce contraseña" name="pass" id="pwd" autocomplete="off">
                    <label for="pwd">Contraseña:</label>
                </div>

                <div>
                    <button type="submit" class="btn btn-primary mb-3 w-50">Entrar</button>
                </div>
            </div>
        </div>

    </form>


    <p class="text-center my-5">¿No tiene una cuenta?, Contacta con el administrador de Sistemas.</p>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>
