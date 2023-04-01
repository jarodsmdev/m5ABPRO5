<%-- 
    Document   : contacto
    Created on : Mar 22, 2023, 6:05:42 PM
    Author     : jarod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Contacto</title>
    </head>
    
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>
        
        <main>
            
            <h2 class="text-center py-3 my-5">Contacto</h2>
        
            <form action="" method="POST">

                <div class="form-floating mb-3">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                    <label for="email">Email:</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" name="name" id="nombre" class="form-control" placeholder="Nombre de Contacto">
                    <label for="nombre">Nombre:</label>
                </div>

                <div class="form-floating mb-3">
                    <textarea name="comentarios" id="comentarios" cols="30" rows="10" class="form-control" placeholder="Escriba sus comentarios aquí" style="height: 100px; resize:none "></textarea>
                    <label for="comentarios">Comentarios:</label>
                </div>

                <div>
                    <input type="submit" value="Enviar" class="btn btn-primary px-3">
                </div>

            </form>
        
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
    
    <footer class="py-3">
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>
