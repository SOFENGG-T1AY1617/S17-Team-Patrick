for(var i=1960; i<=2016; i++) {
    $('#year_admitted').append($('<option>', {value:i, text:i}));
}

$("#masters").click(function() {
  $("#cbGraduate").prop("checked", true);
})

$("#doctorate").click(function() {
  $(".#cbGraduate").prop("checked", true);
})
