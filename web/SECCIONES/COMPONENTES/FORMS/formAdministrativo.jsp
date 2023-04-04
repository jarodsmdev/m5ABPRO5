<%-- 
    Document   : formAdministrativo
    Created on : Apr 4, 2023, 11:20:10 AM
    Author     : Leonel Briones Palacios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="SvUsuario" method="POST" class="needs-validation" novalidate>
    
    <div id="formAdministrativo">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" required="true" id="areaAdministrativo" name="areaAdministrativo" required maxlength="20">
            <label for="areaAdministrativo" class="ps-4">Área:</label>
            <div class="invalid-feedback">
                Por favor ingrese Área.
            </div>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" required="true" id="expPrevia" name="expPrevia" maxlength="100">
            <label for="expPrevia" class="ps-4">Experiencia Previa:</label>
            <div class="invalid-feedback">
                Por favor defina su Expreriencia Previa.
            </div>
        </div>
    </div>
</form>