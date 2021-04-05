$(document).on('turbolinks:load', function() {
    $(window).on('scroll', function() {
      var more_posts_url = $('#infinite-scrolling .pagination .next_page').attr('href');
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        console.log("scrolled");
        $('#infinite-scrolling .pagination').html('<img src="/assets/loading.gif" alt="Loading..." title="Loading..." />');
        $.getScript(more_posts_url);
      }
    })
})
