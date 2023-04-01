//FUNCIÓN ANÓNIMA AUTOEJECUTABLE DE BOOTSTRAP V5.2.3
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

//ESPERO A QUE EL DOCUMENTO SE ENCUENTRE TOTALMENTE CARGADO
document.addEventListener("DOMContentLoaded", function(){

    //SELECCIONO EL ELEMENTO HTML DURACIÓN
    let inputDuracion = document.getElementById("duracion");
    
    //ESTOY A LA ESCUCHA DE LOS INPUTS PARA LA VALIDACION DE SOLO NUMEROS
    inputDuracion.addEventListener("keyup", function(){
        validarDuracion(inputDuracion);
    });
    
    //SELECCIONE EL ELEMENTO HTML ASISTENTES
    let inputAsistentes = document.getElementById("cantAsistentes");
    
    //ESTOY A LA ESCUCHA DEL INPUT PARA LA VALIDACION DE SOLO NUMEROS
    inputAsistentes.addEventListener("keyup", function(){
        validarDuracion(inputAsistentes);
    });


});

//FUNCIÓN PARA VALIDAR SOLO NUMEROS EN LOS INPUTS RECIBE COMO PARÁMETRO UN ELEMENTO HTML
function validarDuracion(elementoHTML){
  const regEx = new RegExp(/^\d+$/);
  
  let duracion = elementoHTML.value;
  
  if(regEx.test(duracion)){
      elementoHTML.classList.remove("is-invalid");
  }else{
      elementoHTML.value = "";
      elementoHTML.classList.add("is-invalid");
  }
  
}

