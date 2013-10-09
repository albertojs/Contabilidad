

jQuery(document).ready(function () {


    if (document.title == "Contabilidad - Inicio") {
        jQuery("li#a1").css({ "background-color": "#4dbbe5", "color": "White" });
    }
    else if (document.title == "Contabilidad - Entrada y Salida") {
        jQuery("li#a2").css({ "background-color": "#4dbbe5", "color": "White" });
    }



    jQuery("#ctl00_body_divError").delay(3000).fadeOut("slow");

   


    /*jQuery(window).scroll(function () {

    jQuery("div#sombraCabeceraSuperior").css({ "position": "fixed", "top": "0px" });
    jQuery("div#cabecera").css({ "position": "fixed", "left": "342px", "top": "4px" });
    jQuery("div#sombraCabecera").css({ "position": "fixed", "top": "74px" });
    });*/

});

