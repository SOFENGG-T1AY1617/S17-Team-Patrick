function resizeWindow() {
  myWindow.resizeTo(800, 600);
  myWindow.focus();
}

$("#pickup").click(function() {
  $(".delivery-info").css("display", "none");
})

$("#delivery").click(function() {
  $(".delivery-info").css("display", "");
})
