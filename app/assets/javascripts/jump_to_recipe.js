$(document).on('turbolinks:load', function() {

  // Function for smooth scrolling only to jumb to recipe
  var $root = $('html, body');
  $(".jump-to-recipe a").click(function () {
    var hash = $.attr(this, 'href');
    $root.animate({
      scrollTop: $(hash).offset().top
    });
  });
})
