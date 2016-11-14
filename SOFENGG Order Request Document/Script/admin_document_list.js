$("#add_button").on('click', function () {
    $(".popup-background").height($(document).height);
    $(".popup-background").css("display", "block");

    return false;
});

$("#btnAdd, #btnAddCancel").on('click', function () {
    $(".popup-background").css("display", "none");
    return false;
});
