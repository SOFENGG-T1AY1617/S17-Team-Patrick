$("#checkbox").on('click', function() {
  if($("#continue").hasClass("disabled")) {
    $("#continue").removeClass("disabled");
  } else {
    $("#continue").addClass("disabled");
  }
})
