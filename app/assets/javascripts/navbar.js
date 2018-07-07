$(document).on('turbolinks:load', function() {

  $(".navigation-bar-bars").click(function() {
    var x = document.getElementById("navbar");
    if (x.className === "container-fluid navigation-bar") {
        x.className += " responsive";
        $(".navigation-bar-bars").css("background-color", "#f6fdfa")
    } else {
        x.className = "container-fluid navigation-bar";
          $(".navigation-bar-bars").css("background-color", "var(--off-white)")
    };
  });

});
