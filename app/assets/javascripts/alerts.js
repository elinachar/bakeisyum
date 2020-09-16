$(document).on('turbolinks:load', function() {

  // Slide up flash messages when show up
  if ($("#notice").text().indexOf("unsubscribed") == -1) {
    $(".alert").delay(4000).slideUp(3000);
  } else {
    $("#notice").css({"background-color":"#e0f4f1", "color":"#67cabc", "border-color":"#67cabc"})
  }

});
