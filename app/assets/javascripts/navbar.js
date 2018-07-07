$(document).on('turbolinks:load', function() {

  $(".navigation-bar-bars").click(function() {
    var navbar = document.getElementById("navbar");
    var navbarHr = $(".navigation-bar-hr-collapse");
    if (navbar.className === "container-fluid navigation-bar") {
        navbar.className += " responsive";
        navbarHr.css("display","block");
        $(".navigation-bar-bars").css("background-color", "#f6fdfa");
    } else {
        navbar.className = "container-fluid navigation-bar";
        navbarHr.css("display","none");
        $(".navigation-bar-bars").css("background-color", "var(--off-white)");
    };
  });

});
