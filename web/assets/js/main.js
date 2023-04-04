//ESPERO QUE TODO EL DOCUMENTO SE ENCUENTRE TOTALMENTE CARGADO
document.addEventListener("DOMContentLoaded", function () {

    //FUNCIÓN REMUEVE UN ELEMENTO QUE RECIBE POR PARAMETRO ADEMAS DEL TIEMPO EN MILISEGUNDOS
    function removeFadeOut(el, speed) {
        var seconds = speed / 1000;
        el.style.transition = "opacity " + seconds + "s ease";

        el.style.opacity = 0;
        setTimeout(function () {
            el.parentNode.removeChild(el);
        }, speed);
    }

    removeFadeOut(document.querySelector('.alert'), 5000);
});

//FUNCIÓN PARA VALIDAR SOLO NUMEROS EN LOS INPUTS RECIBE COMO PARÁMETRO UN ELEMENTO HTML
function validarDuracion(elementoHTML) {
    const regEx = new RegExp(/^\d+$/);

    let duracion = elementoHTML.value;

    if (regEx.test(duracion)) {
        elementoHTML.classList.remove("is-invalid");
    } else {
        elementoHTML.value = "";
        elementoHTML.classList.add("is-invalid");
    }

}

