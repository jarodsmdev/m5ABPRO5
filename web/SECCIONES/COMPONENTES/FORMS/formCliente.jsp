<%-- Document : formCliente Created on : Apr 4, 2023, 9:37:06 AM Author : jarod --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    
    <form action="SvUsuario" method="POST" class="needs-validation" novalidate>
        <div class="formCliente">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" placeholder="RUT" id="run" name="rut" required />
                <label for="rut" class="ps-4">Rut:</label>
                <div class="invalid-feedback">Por favor ingrese RUT Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="nombreCliente" id="nombreCliente" class="form-control" required placeholder="Nombre de Cliente" min="5" max="30" />
                <label for="nombreCliente" class="ps-4">Nombre de Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese Nombre Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="apellidoCliente" id="apellidoCliente" class="form-control" required="required" min="5" max="30" placeholder="Apellido Cliente" />
                <label for="apellidoCliente" class="ps-4">Apellido Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese Apellido Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="telefonoCliente" id="telefonoCliente" class="form-control" required placeholder="Apellido Cliente" />
                <label for="telefonoCliente" class="ps-4">Teléfono Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese teléfono Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="afpCliente" id="afpCliente" class="form-control" required placeholder="AFP Cliente" min="4" max="30" />
                <label for="afpCliente" class="ps-4">AFP Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese AFP Cliente.</div>
            </div>

            <div class="form-check form-check-inline mb-3">
                <input type="radio" class="form-check-input" name="sistemaSalud" id="sSaludFonasa" checked="false" required >
                <label for="sSaludFonasa" class="form-check-label">
                    FONASA
                </label>
            </div>

            <div class="form-check form-check-inline mb-3">
                <input type="radio" class="form-check-input" name="sistemaSalud" id="sSaludIsapre" checked="false" required >
                <label for="sSaludIsapre" class="form-check-label">
                    ISAPRE
                </label>
                <div class="invalid-feedback">Seleccione Sistema de Salud</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="direccionCliente" id="direccionCliente" class="form-control" placeholder="Dirección Cliente" max="30" />
                <label for="direccionCliente" class="ps-4">Dirección Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese Dirección Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="comunaCliente" id="comunaCliente" class="form-control" placeholder="Comuna Cliente" max="50" />
                <label for="comunaCliente" class="ps-4">Comuna Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese Comuna Cliente.</div>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="edadCliente" id="edadCliente" class="form-control" required placeholder="Comuna Cliente" max="3" />
                <label for="edadCliente" class="ps-4">Edad Cliente:</label>
                <div class="invalid-feedback">Por favor ingrese edad Cliente.</div>
            </div>

        </div>
    </form>