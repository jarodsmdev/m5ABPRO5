//FUNCIÓN ANÓNIMA AUTOEJECUTABLE DE BOOTSTRAP V5.2.3
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})();

//ESPERO A QUE EL DOCUMENTO SE ENCUENTRE TOTALMENTE CARGADO
document.addEventListener("DOMContentLoaded", function(){

    //ESTOY A LA ESCUCHA DE LOS INPUTS PARA LA VALIDACION DE SOLO NUMEROS
    document.addEventListener("keyup", function(){
        //INPUT DURACION
        let inputDuracion = document.getElementById("duracion");
        validarDuracion(inputDuracion);
        
        //INPUT ASISTENTES
        let inputAsistentes = document.getElementById("cantAsistentes");
        validarDuracion(inputAsistentes);
  })
  
});

//FUNCIÓN PARA VALIDAR SOLO NUMEROS EN LOS INPUTS RECIBE COMO PARÁMETRO UN ELEMENTO HTML
function validarDuracion(elementoHTML){
  const regEx = new RegExp(/^\d+$/);
  
  let duracion = elementoHTML.value;
  
  if(regEx.test(duracion)){
      
  }else{
      elementoHTML.value = "";
  }
  
}

