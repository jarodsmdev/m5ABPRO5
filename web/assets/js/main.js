document.addEventListener("DOMContentLoaded", function(){
  
function removeFadeOut( el, speed ) {
    var seconds = speed/1000;
    el.style.transition = "opacity "+seconds+"s ease";

    el.style.opacity = 0;
    setTimeout(function() {
        el.parentNode.removeChild(el);
    }, speed);
}

removeFadeOut(document.querySelector('.alert'), 5000);
});

