
jQuery(document).ready(function () {


    if (document.title == "Contabilidad - Inicio") {
        jQuery("li#a1").css({ "background-color": "#4dbbe5", "color": "White", "border-top": "2px solid #4dbbe5", "border-left": "2px solid #4dbbe5", "border-right": "2px solid #4dbbe5" });
    }
    else if (document.title == "Contabilidad - Entrada y Salida") {
        jQuery("li#a2").css({ "background-color": "#4dbbe5", "color": "White", "border-top": "2px solid #4dbbe5", "border-left": "2px solid #4dbbe5", "border-right": "2px solid #4dbbe5" });
    }
    else if (document.title == "Contabilidad - Conceptos") {
        jQuery("li#a3").css({ "background-color": "#4dbbe5", "color": "White", "border-top": "2px solid #4dbbe5", "border-left": "2px solid #4dbbe5", "border-right": "2px solid #4dbbe5" });
    }
    else if (document.title == "Contabilidad - Gráficos") {
        jQuery("#a5").css({ "background-color": "#4dbbe5", "color": "White", "border-top": "2px solid #4dbbe5", "border-left": "2px solid #4dbbe5", "border-right": "2px solid #4dbbe5" });
    }


    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        jQuery("#ctl00_body_divError").delay(3000).fadeOut("slow");
    });


    

});


function pageLoad() {
    jQuery("li#graf1").click(function () {
        jQuery("div#grafico1").slideToggle("small");
    });
    jQuery("li#graf2").click(function () {
        jQuery("div#grafico2").slideToggle("small");

    });
    jQuery("li#graf3").click(function () {
        jQuery("div#grafico3").slideToggle("small");

    });
    jQuery("li#graf4").click(function () {
        jQuery("div#grafico4").slideToggle("small");

    });
    jQuery("li#graf5").click(function () {
        jQuery("div#grafico5").slideToggle("small");

    });
}

