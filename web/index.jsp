<%-- 
    Document   : index
    Created on : Mar 22, 2023, 5:36:25 PM
    Author     : jarod
<%@ include file="SECCIONES/COMPONENTES/footer.jsp" %>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <title>M5 ABPRO 4</title>
</head>

<nav>
    <%@ include file="SECCIONES/COMPONENTES/navbar.jsp" %>
</nav>

<body class="container">
    <main>
        <h2 class="text-center py-3 my-5">Nuestra Empresa</h2>

        <p class="text-justify">
            Bienvenido al sitio web de nuestra empresa de Prevención de Riesgos. Somos una compañía especializada en ofrecer soluciones en materia de seguridad laboral y prevención de accidentes. En esta página encontrarás información detallada sobre nuestros servicios y cómo podemos ayudarte a garantizar un ambiente de trabajo seguro y saludable para tus empleados.
        </p>
    
        <p class="text-justify">
            Nuestro equipo de profesionales altamente capacitados está comprometido con la seguridad y el bienestar de tu empresa, por lo que trabajamos de manera rigurosa y eficiente para garantizar que todas las normativas de prevención de riesgos sean cumplidas. Además, ofrecemos una amplia gama de servicios personalizados que se adaptan a las necesidades específicas de tu negocio.
        </p>
    
        <p class="text-justify">
            Te invitamos a explorar nuestra página y conocer más acerca de nuestros servicios. Si tienes alguna consulta o necesitas más información, no dudes en contactarnos. Estamos a tu disposición para ayudarte en todo lo que necesites
        </p>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

<footer>
    <%@include file="SECCIONES/COMPONENTES/footer.jsp" %>
</footer>
</html>
