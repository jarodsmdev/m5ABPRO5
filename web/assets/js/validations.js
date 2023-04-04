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



