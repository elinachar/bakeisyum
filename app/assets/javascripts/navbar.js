$(document).on('turbolinks:load', function() {

  // Responsive Navigation Bar
  $(".navigation-bar-bars").click(function() {
    $(".navigation-bar-bars, .navigation-bar-hr-collapse, .navigation-bar-main-body").toggleClass("collapsed");
  });

  // Dropdown menu for login md, lg
  function slideLoginDropdownMdLg() {
    var x =  $(".login-dropdown")
    if ($(window).width() > 991) {
      if (x.css("display") == "none") {
        x.slideDown();
      } else {
        x.slideUp();
      };
    };
  };

  $(".login i").click(slideLoginDropdownMdLg).mouseover(slideLoginDropdownMdLg);
  $(".login-dropdown").mouseleave(slideLoginDropdownMdLg);

  $(".login").hover(function() {
    $(".login span, .login i").toggleClass("hover-color");
  });

  //Dropdown menu for login xs, sm
  function slideLoginDropdownXsSm() {
    $(".login-collapsed p i").toggleClass("fa-angle-up fa-angle-down");
    $(".login-collapsed ul").slideToggle();
  };

  $(".login-collapsed p i").click(slideLoginDropdownXsSm);

});
