for(var i=1960; i<=2016; i++) {
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

$("select#body_ddlCampus").click(function () {
    console.log($("select#body_ddlCampus"));
})