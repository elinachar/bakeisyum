$(document).on('turbolinks:load', function() {

  // Responsive Navigation Bar
  $(".navigation-bar-bars").click(function() {
    $(".navigation-bar-bars, .navigation-bar-hr-collapse, .navigation-bar-main-body").toggleClass("collapsed");
  });

  // Dropdown menu for login
  function slideLoginDropdown() {
    var x =  $(".login-dropdown")
    if ($(window).width() > 991) {
      if (x.css("display") == "none") {
        x.slideDown();
      } else {
        x.slideUp();
      };
    };
  };

  $(".login i").click(slideLoginDropdown).mouseover(slideLoginDropdown);
  $(".login-dropdown").mouseleave(slideLoginDropdown);

  $(".login").hover(function() {
    $(".login span, .login i").toggleClass("hover-color");
  });

});
