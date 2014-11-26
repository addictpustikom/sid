$(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(function() {
    var getValue;
    $(".editable_input_text").on("focus", function() {
        $(this).css({
            "background": "#f39c12",
            "color": "#FFF"
        });
        getValue = $(this).val();
    });
    $(".editable_input_text").on("blur", function() {
        $(this).css({
            "background": "transparent",
            "color": "#555",
            "border": "none"
        });
    });
    $(".editable_input_text").on("keypress", function(e) {
        if (e.which == 13) { // Jika user menekan tombol Enter
            if ($(this).val() != getValue) { // Jika ada perubahan pada value, barulah update ke database
                getValue = $(this).val();
                $(".loader").fadeIn("slow");
                editNamaDosen($(this).attr("name"), $(this).val());
            }
        }
    });
    $(".editable_input_text").on("change", function() {
        if ($(this).val() != getValue) { // Jika ada perubahan pada value, barulah update ke database
            getValue = $(this).val();
            $(".loader").fadeIn("slow");
            editNamaDosen($(this).attr("name"), $(this).val());
        }
    });
});