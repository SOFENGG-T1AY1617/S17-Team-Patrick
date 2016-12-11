$("#checkbox").on('click', function() {
  if($("#continue").hasClass("btn btn-primary disabled")) {
    // $("#continue").removeClass("disabled");
    $("#continue").attr("class", "btn btn-primary");
  } else {
  	$("#continue").attr("class", "btn btn-primary disabled");
    // $("#continue").addClass("disabled");
  }
})
