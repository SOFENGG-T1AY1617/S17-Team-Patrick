for(var i=2016; i>=1960; i--) {
    $('#year_admitted').append($('<option>', {value:i, text:i}));
}

$("#bachelor").click(function() {
  $("#cbGraduate").prop("checked", false);
})

$("#masters").click(function() {
  $("#cbGraduate").prop("checked", true);
})

$("#doctorate").click(function() {
  $(".#cbGraduate").prop("checked", true);
})

$("#cbGraduate").click(function() {
  $("#doctorate").prop("checked", true);
})
