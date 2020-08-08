$(document).on('turbolinks:load', function() {

  // Full like heart on hover
  $(".like i").hover(function() {
    if ( $(this).hasClass("far")) { //if empty
      $(this).removeClass("far clicked").addClass("fas"); //full
    } else  { //if full
      $(this).removeClass("fas clicked").addClass("far"); // empty
    }
    $(".like-info-user").slideDown();
  }, function() {
    if ( ! ($(this).hasClass("not-logged-in-user")) ) {
      if ( !$(this).hasClass("clicked") ) {
        if ( $(this).hasClass("far")) { // if empty
          $(this).removeClass("far").addClass("fas"); //full
        } else  { // if full
          $(this).removeClass("fas").addClass("far"); //empty
        }
       $(".like-info-user").slideUp();
     }
   }
  });



  $(".like-info-user").mouseleave(function() {
    if ( $(".like i").hasClass("not-logged-in-user") ) {
      $(".like-info-user").slideUp();
      if ( $(".like i").hasClass("far")) { // if empty
        $(".like i").removeClass("far").addClass("fas"); //full
      } else  { // if full
        $(".like i").removeClass("fas").addClass("far"); //empty
      }
    }
  })

})
