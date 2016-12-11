for(var i=1; i<32; i++) {
  $('#day').append($('<option>', {value:i, text:i}));
}

for(var i=1960; i<2003; i++) {
  $('#year').append($('<option>', {value:i, text:i}));
}

