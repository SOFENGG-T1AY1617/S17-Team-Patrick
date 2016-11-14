$("#add_button").on('click', function () {
    $(".popup-background").height($(document).height);
    $(".popup-background").toggle();

    return false;
});

$("#btnAdd, #btnAddCancel").on('click', function () {
    $(".popup-background").toggle();
    return false;
});
