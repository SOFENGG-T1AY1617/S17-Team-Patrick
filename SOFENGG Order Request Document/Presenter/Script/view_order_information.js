$("#btnMarkPending").on('click', function () {
    $('.popup-background').height($(document).height());
    $('.popup-background').css("display", "block");
});

$("#btnPendingCancel").on('click', function () {
    $(".popup-background").css("display", "none");
});