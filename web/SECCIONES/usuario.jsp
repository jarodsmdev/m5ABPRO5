<%-- 
    Document   : usuario
    Created on : Apr 2, 2023, 3:11:12 PM
    Author     : Leonel Briones Palacios
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <c:if test="${not empty mensaje}">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="mensajeExito">
                    <strong>¡Exito!</strong> ${mensaje}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty mensajeError}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="mensajeError">
                    <strong>Error:</strong> ${mensajeError}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <!-- INCRUSTAR FORMULARIO USUARIO -->
            <%@include file="COMPONENTES/FORMS/formUsuario.jsp" %>

            <c:choose>
                <c:when test="${tipoUsuario == 'cliente'}">
                    <!-- INCRUSTAR FORMULARIO CLIENTE -->
                    <%@include file="COMPONENTES/FORMS/formCliente.jsp" %>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${tipoUsuario == 'administrativo'}">
                    <!-- INCRUSTAR FORMULARIO ADMINISTRATIVO -->
                    <%@include file="COMPONENTES/FORMS/formAdministrativo.jsp" %>     
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${tipoUsuario == 'profesional'}">
                    <!-- INCRUSTAR FORMULARIO PROFESIONAL -->
                    <%@include file="COMPONENTES/FORMS/formProfesional.jsp" %>
                </c:when>
            </c:choose>



        </main>

        <!-- CUSTOM JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- VALIDATION CSS JS -->
        <script src="assets/js/validationBootstrapCSSJS.js"></script>
        <!-- MAIN JS -->
        <script src="assets/js/main.js"></script>
        <!-- VALIDATION INPUTS -->
        <script>
            //ESPERO A QUE EL DOCUMENTO SE ENCUENTRE TOTALMENTE CARGADO
            document.addEventListener("DOMContentLoaded", function () {

                //SELECCIONO EL ELEMENTO HTML DURACIÓN
                let inputRun = document.getElementById("run");

                //ESTOY A LA ESCUCHA DE LOS INPUTS PARA LA VALIDACION DE SOLO NUMEROS
                inputRun.addEventListener("keyup", function () {
                    validarDuracion(inputRun);
                });

            });
        </script>
    </body>

    <footer class="py-3">
        <%@include file="COMPONENTES/footer.jsp" %>
    </footer>
</html>
