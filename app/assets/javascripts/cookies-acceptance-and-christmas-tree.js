$(document).on('turbolinks:load', function() {
  // Set expired accepted cookie manually
  // document.cookie = "accepted=no; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/";

  // if user has already checked the confirmation button
  // the alert panel should be hidden.
  // else is should appear
  if (getCookie('accepted') === 'yes') {
    // $("#cookies-acceptance").hide();
  } else {
    // Show div for accept cookies
    if (!sessionStorage.viewedAcceptCookies){
      $(".cookies-acceptance").addClass("slide-in-bottom ");
      sessionStorage.viewedAcceptCookies=1;
    } else {
      $(".cookies-acceptance").show();
    };

  }

  // Accept cookies when #accept-cookies button is clicked
  // Hide accept cookies div
  $("#accept-cookies").click(function() {
    $(".cookies-acceptance").addClass("slide-out-bottom");
    setCookie('accepted', 'yes', 100);
  });

  // code from :http://stackoverflow.com/a/4825695/191220
  // set cookie method
  function setCookie(c_name, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
      document.cookie = c_name + "=" + c_value;
  }

  // get cookie method
  function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
          return unescape(y);
        }
    }
  }

  // Function for checking if user first visits the website
  $(window).bind('beforeunload',function(){
    sessionStorage.removeItem('viewedAcceptCookies');
  });
})
