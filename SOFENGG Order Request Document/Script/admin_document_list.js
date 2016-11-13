$("#add_button").on('click', function () {
    $('.popup-background').height($(document).height(), function() {
        $(".popup-background").css("display", "block");
    });
    event.preventDefault();
    return false;
});

$("#btnAdd, #btnAddCancel").on('click', function () {
    $(".popup-background").css("display", "none");
    return false;
});
