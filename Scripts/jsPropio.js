
jQuery(document).ready(function () {

    jQuery("li#a1").css({ "background-color": "#4dbbe5", "color": "White" });

    jQuery("li#a1").click(function () {
        jQuery("div#globalContent").fadeOut("fast");

    });
    jQuery("li#a2").click(function () {
        jQuery("div#globalContent").fadeOut("fast");

    });
    jQuery("li#a3").click(function () {
        jQuery("div#globalContent").fadeOut("fast");

    });
    jQuery("li#a4").click(function () {
        jQuery("div#globalContent").fadeOut("fast");

    });
    jQuery("li#a5").click(function () {
        jQuery("div#globalContent").fadeOut("fast");

    });

    jQuery(window).scroll(function () {

        jQuery("div#sombraCabeceraSuperior").css({ "position": "fixed", "top": "0px" });
        jQuery("div#cabecera").css({ "position": "fixed", "left": "342px","top":"4px" });
        jQuery("div#sombraCabecera").css({ "position": "fixed", "top": "74px" });
    });

});