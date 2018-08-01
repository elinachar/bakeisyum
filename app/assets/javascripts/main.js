$(document).on('turbolinks:load', function() {

  //Show form for leaving new comment
  $("#create-new-comment").click(function() {
    $(".new-comment").slideDown('slow');
    $("#create-new-comment").prop('disabled', true);
  });

  //Enable Tooltips
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })

});
