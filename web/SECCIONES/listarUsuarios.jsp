<%-- 
    Document   : listarUsuarios
    Created on : Apr 1, 2023, 5:57:47 PM
    Author     : Leonel Briones Palacios
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BOOTSTRAP CSS 5.2.3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- FONTAWESOME CDN 6.4.0 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
        <title>Usuarios</title>
    </head>
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>

        <main>
            <h2 class="text-center py-3 my-5">Listar Usuarios</h2>

            <table class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>RUT</th>
                        <th>Nombre</th>
                        <th>Fecha Nacimiento</th>
                        <th>
                            Opciones
                        </th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="usuario" items="${listaUsuarios}">
                        <tr>
                            <th>${usuario.id}</th>
                            <td>${usuario.run}</td>
                            <td>${usuario.nombreUsuario}</td>
                            <td>${usuario.fechaNacimiento}</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-sm"><i class="fa-solid fa-pencil"></i></a>
                                <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-eraser"></i></a>   
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>

    <footer>
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>
