$(".edit_button").on('click', function() {
  $(".edit").css("display", "block");
})

$("#yes_edit, #no_edit").on('click', function() {
  $(".edit").css("display", "none");
});

$("#add_button").on('click', function() {
  $(".add").css("display", "block");
});

$("#yes_add, #no_add").on('click', function() {
  $(".add").css("display", "none");
});

$("#delete_button").on('click', function() {
  $(".delete").css("display", "block");
});

$("#yes_delete, #no_delete").on('click', function() {
  $(".delete").css("display", "none");
});
