$(".can_pend").on('click', function() {
  $(".pending").css("display", "block");
})

$(".details").on('click', function() {
  $(".details-popup").css("display", "block");
  $(".content-scrolling").css("overflow-y", "hidden");
})

$("#cancel_popup").on('click', function() {
  $(".popup").css("display", "none");
})

$("#save_popup").on('click', function() {
  $(".popup").css("display", "none");
})

$("#back_popup").on('click', function() {
  $(".details-popup").css("display", "none");
  $(".content-scrolling").css("overflow-y", "scroll");
})

$("#markasdone_popup").on('click', function() {
  $(".details-popup").css("display", "none");
  $(".content-scrolling").css("overflow-y", "scroll");
})

$(".can_process").on('click', function() {
  $(".process").css("display", "block");
  $(".content-scrolling").css("overflow-y", "hidden");
})

$("#mark_processing_popup, #cancelprocess_popup").on('click', function() {
  $(".process").css("display", "none");
});

for(var i=1; i<32; i++) {
  $('#day').append($('<option>', {value:i, text:i}));
}

for(var i=2003; i>=1960; i--) {
  $('#year').append($('<option>', {value:i, text:i}));
}
