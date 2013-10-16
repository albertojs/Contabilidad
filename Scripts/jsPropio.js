
jQuery(document).ready(function () {


    if (document.title == "Contabilidad - Inicio") {
        jQuery("li#a1").css({ "background-color": "#4f7ed1", "color": "White", "border-top": "2px solid #4f7ed1", "border-left": "2px solid #4f7ed1", "border-right": "2px solid #4f7ed1" });
    }
    else if (document.title == "Contabilidad - Entrada y Salida") {
        jQuery("li#a2").css({ "background-color": "#4f7ed1", "color": "White", "border-top": "2px solid #4f7ed1", "border-left": "2px solid #4f7ed1", "border-right": "2px solid #4f7ed1" });
    }
    else if (document.title == "Contabilidad - Conceptos") {
        jQuery("li#a3").css({ "background-color": "#4f7ed1", "color": "White", "border-top": "2px solid #4f7ed1", "border-left": "2px solid #4f7ed1", "border-right": "2px solid #4f7ed1" });
    }
    else if (document.title == "Contabilidad - Listados") {
        jQuery("li#a4").css({ "background-color": "#4f7ed1", "color": "White", "border-top": "2px solid #4f7ed1", "border-left": "2px solid #4f7ed1", "border-right": "2px solid #4f7ed1" });
    }
    else if (document.title == "Contabilidad - Gráficos") {
        jQuery("li#a5").css({ "background-color": "#4f7ed1", "color": "White", "border-top": "2px solid #4f7ed1", "border-left": "2px solid #4f7ed1", "border-right": "2px solid #4f7ed1" });
    }
    

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        jQuery("#ctl00_body_divError").delay(3000).fadeOut("slow");
    });


    

});


function pageLoad() {
    jQuery("li#graf1").click(function () {
        jQuery("div#grafico1").slideToggle("small");
        jQuery("div#grafico2").slideUp("small");
        jQuery("div#grafico3").slideUp("small");
        jQuery("div#grafico4").slideUp("small");
        jQuery("div#grafico5").slideUp("small");

    });
    jQuery("li#graf2").click(function () {
        jQuery("div#grafico2").slideToggle("small");
        jQuery("div#grafico1").slideUp("small");
        jQuery("div#grafico3").slideUp("small");
        jQuery("div#grafico4").slideUp("small");
        jQuery("div#grafico5").slideUp("small");

    });
    jQuery("li#graf3").click(function () {
        jQuery("div#grafico3").slideToggle("small");
        jQuery("div#grafico2").slideUp("small");
        jQuery("div#grafico1").slideUp("small");
        jQuery("div#grafico4").slideUp("small");
        jQuery("div#grafico5").slideUp("small");

    });
    jQuery("li#graf4").click(function () {
        jQuery("div#grafico4").slideToggle("small");
        jQuery("div#grafico2").slideUp("small");
        jQuery("div#grafico3").slideUp("small");
        jQuery("div#grafico1").slideUp("small");
        jQuery("div#grafico5").slideUp("small");

    });
    jQuery("li#graf5").click(function () {
        jQuery("div#grafico5").slideToggle("small");
        jQuery("div#grafico2").slideUp("small");
        jQuery("div#grafico3").slideUp("small");
        jQuery("div#grafico4").slideUp("small");
        jQuery("div#grafico1").slideUp("small");

    });
}

