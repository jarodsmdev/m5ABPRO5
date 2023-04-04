<%-- 
    Document   : navbar
    Created on : Mar 22, 2023, 5:49:36 PM
    Author     : jarod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/SvInicio">Prevención de Riesgo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.endsWith('/SvInicio') ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/SvInicio">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.endsWith('/SvContacto') ? 'active' : ''}" href="${pageContext.request.contextPath}/SvContacto">Contacto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.endsWith('/SvCapacitacion') ? 'active' : ''}" href="${pageContext.request.contextPath}/SvCapacitacion">Capacitación</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.endsWith('/SvListarCapacitacion') ? 'active' : ''}" href="${pageContext.request.contextPath}/SvListarCapacitacion">Lista de Capacitaciones</a>
                </li>

                <% if (request.getSession().getAttribute("nombre") != null) { %>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Menú Gestión
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/SvUsuario">Crear Usuario</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/SvListarUsuarios">Listar Usuarios</a></li>
                    </ul>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Usuario <%= request.getSession().getAttribute("nombre") %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Configuración</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/SvLogin">Cerrar Sesión</a></li>
                    </ul>
                </li>

                <% } else { %>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/SvLogin">Login</a>
                </li>

                <% }%> 
            </ul>
        </div>
    </div>
</nav>
