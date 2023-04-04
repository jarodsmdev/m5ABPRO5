<%-- 
    Document   : listarcapacitacion
    Created on : 24-03-2023, 08:04:38
    Author     : Mauricio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BOOTSTRAP CSS 5.2.3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- FONTAWESOME CDN 6.4.0 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
        <title>Capacitaciones</title>
    </head>
    <body class="container">
        <nav>
            <%@include file="COMPONENTES/navbar.jsp" %>
        </nav>

        <main>
            <h2 class="text-center py-3 my-5">Listar Capacitaciones</h2>
                   
            
            <table class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>RUT Cliente</th>
                        <th><i class="fa-regular fa-calendar-days px-1"></i>Día</th>
                        <th><i class="fa-regular fa-clock text-info px-1"></i>Hora</th>
                        <th><i class="fa-solid fa-location-dot text-danger px-1"></i>Lugar</th>
                        <th><i class="fa-solid fa-stopwatch text-primary px-1"></i>Duración</th>
                        <th><i class="fa-solid fa-users px-1"></i>Asistentes</th>
                        <th>Opciones</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="capacitacion" items="${listaCapacitacion}">
                        
                        <tr>
                            <th>${capacitacion.id}</th>
                            <td>${capacitacion.rutCliente}</td>
                            <td><fmt:formatDate value="${capacitacion.fecha}" pattern="dd.MMM.yyyy" /></td>
                            <td>${capacitacion.hora}</td>
                            <td>${capacitacion.lugar}</td>
                            <td class="text-center"><i class="fa-solid fa-stopwatch px-1 text-primary"></i><span>${capacitacion.duracion} min.</span></td>
                            <td></td>
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

    <footer class="py-3">
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>
