$(document).on('turbolinks:load', function() {

  $(".navigation-bar-bars").click(function() {
    $(".navigation-bar-bars, .navigation-bar-hr-collapse, .navigation-bar-main-body").toggleClass("collapsed");
    console.log("collapsed")
  });


  $(".search-button").click(function() {
    $(".search-input .form-control").css("visibility", "visible");
  });

});
