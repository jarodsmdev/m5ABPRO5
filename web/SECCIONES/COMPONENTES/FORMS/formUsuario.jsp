<%-- 
    Document   : formUsuario
    Created on : Apr 4, 2023, 9:33:08 AM
    Author     : Leonel Briones Palacios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="SvUsuario" method="POST" class="needs-validation" novalidate>
    <div id="formUsuario">
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
            <input type="date" class="form-control" required="true" id="fechaNacimiento" name="fechaNacimiento">
            <label for="fechaNacimiento" class="ps-4">Fecha de Nacimiento:</label>
            <div class="invalid-feedback">
                Por favor seleccione fecha de Nacimiento.
            </div>
        </div>

        <div class="form-floating mb-3">
            <select name="tipoCliente" id="tipoCliente" class="form-select" required>
                <option value="" selected disabled>Seleccione tipo de Cliente</option>
                <option value="cliente">Cliente</option>
                <option value="administrativo">Administrativo</option>
                <option value="profesional">Profesional</option>
            </select>
            <label for="tipoCliente" class="ps-4">Tipo Cliente:</label>
            <div class="invalid-feedback">
                Por favor seleccione tipo Cliente.
            </div>
        </div>

        <div class="d-grid gap-2 d-md-block d-md-flex justify-content-md-around mt-3 mb-5">
            <input type="submit" value="Guardar" class="btn btn-primary col-md-5">
            <input type="reset" value="Limpiar" class="btn btn-danger col-md-5">
        </div>
    </div>
</form>

