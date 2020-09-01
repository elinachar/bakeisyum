$(document).on('turbolinks:load', function() {

  // Function for smooth scrolling only to jumb to recipe
  var $root = $('html, body');
  $(".jump-to-recipe a").click(function () {
    var hash = $.attr(this, 'href');
    $root.animate({
      scrollTop: $(hash).offset().top
    });
  });

  // Go-top btn
  // Display the #go-top btn as soon as the user scrolls down the page and limit
  // it above the footer: ONLY FOR RECIPES SHOW PAGE
  $(window).scroll(function(){
    if (window.location.href.indexOf("recipes/") > -1 ){
      // Show the #go-top when scrolling from top is more than 120px
      if ($(window).scrollTop() > 120 ) {
        if ($("#go-top").outerHeight() < 21) {
          $("#go-top").css("height", "48px");
        }
      } else {
        $("#go-top").css("height", "0");
      }

      // Limit the #go-top button till is is up to the "footer"
      checkOffset();
    }
  });

  var ta, ha, mba, tb, offset, diff

  function checkOffset() {

    ta = $("#go-top").offset().top;
    ha = $("#go-top").outerHeight();
    mba = parseInt($("#go-top").css("margin-bottom"));
    tb = $("footer").offset().top;
    offset = 5

    diff = ta + ha + mba - tb + offset
    if (diff >= 0) {

      $("#go-top").css("margin-bottom", (diff).toString() + "px");

    } else {
      $("#go-top").css("margin-bottom", "0");
    }

  }

  //Scroll on top of page when #go-top btn is clicked
  $("#go-top").on("click", function() {
   $("html, body").animate({ scrollTop: 0 }, "slow");
  });
})
