$(document).on('turbolinks:load', function() {

  $(".rating-star").click(function(){
    var rating = parseInt($(this).attr("id").substr($(this).attr("id").length - 1));
    console.log(rating);
  })
})
