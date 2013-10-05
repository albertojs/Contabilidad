
jQuery(document).ready(function () {

    jQuery("li#li1").click(function () {
        jQuery("div#grafico1").hide("medium");
    });
    jQuery("li#li2").click(function () {
        jQuery("div#grafico2").slideToggle("medium");
    });
    jQuery("li#li3").click(function () {
        jQuery("div#grafico3").slideToggle("medium");
    });
    jQuery("li#li4").click(function () {
        jQuery("div#grafico4").slideToggle("medium");
    });
    jQuery("li#li5").click(function () {
        jQuery("div#grafico5").slideToggle("medium");
    });
});