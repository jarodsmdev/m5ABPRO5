<%-- 
    Document   : formProfesional
    Created on : Apr 4, 2023, 11:18:39 AM
    Author     : Leonel Briones Palacios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="SvUsuario" method="POST" class="needs-validation" novalidate>
    <div id="formProfesional">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" placeholder="Título Profesional" id="tituloProf" name="tituloProf" required min="10" max="50" />
            <label for="tituloProf" class="ps-4">Título Profesional:</label>
            <div class="invalid-feedback">Por favor ingrese Título Profesional.</div>
        </div>

        <div class="form-floating mb-3">
            <input type="date" class="form-control" required="true" id="fechaIngreso" name="fechaIngreso">
            <label for="fechaIngreso" class="ps-4">Fecha de Ingreso:</label>
            <div class="invalid-feedback">
                Por favor seleccione Fecha ingreso.
            </div>
        </div>
    </div>
</form>

