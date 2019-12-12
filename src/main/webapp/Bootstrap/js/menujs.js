
(function ($) {
    $(document).ready(function () {
        $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).parent().siblings().removeClass('open');
            $(this).parent().toggleClass('open');
        });
    });
})(jQuery);

$(window).resize(function () {
    hideMenu();
});
function hideMenu()
{
    var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    if (w <= 400)
    {
        $(".navbar").hide();
        $(".low").show();
        $(".top_bar").hide();
    } else
    {
        $(".navbar").show();
        $(".low").hide();
        $(".top_bar").show();
    }
}
function showMenu() {
    $(".navbar").show();
    $(".low").hide();
}
hideMenu();

$(document).ready(function () {
    $('.dropdown-submenu a.test ').on("click", function (e) {
        $(this).next('ul').toggle();
        e.stopPropagation();
        e.preventDefault();
    });
});


