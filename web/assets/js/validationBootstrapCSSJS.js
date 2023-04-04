//FUNCIÓN ANÓNIMA AUTOEJECUTABLE DE BOOTSTRAP V5.2.3
//HACE QUE TODOS LOS ELEMENTOS OBTENGAN UNA CLASE EN CASO DE NO CUMPLIR CON LA VALIDACION QUE ENTREGA LA API DE HTML
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  "use strict"

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation');

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      form.classList.add('was-validated');
    }, false);
  });
})();

