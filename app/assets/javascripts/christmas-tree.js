// $(document).on('turbolinks:load', function() {
//   // setTimeout(appearChristmasTree, 500);
//   // setTimeout(shakeOrnaments, 3600);
//   // setTimeout(appearCandies, 800);
//
//
//   if (!sessionStorage.viewed){
//     console.log("no session vied")
//     $(".christmas img, .christmas-tree").addClass("hidden-on-load");
//     setTimeout(appearChristmasTree, 500);
//     setTimeout(shakeOrnaments, 3600);
//     setTimeout(appearCandies, 800);
//     sessionStorage.viewed=1;
//   } else {
//     $(".christmas img").addClass("hidden-on-load");
//     setTimeout(appearCandies, 300);
//     setTimeout(shakeOrnaments, 800);
//   };
//
//   $(window).bind('beforeunload',function(){
//     sessionStorage.removeItem('viewed');
//   });
//
//   function appearChristmasTree() {
//     $(".christmas-tree.hidden-on-load").addClass("appear");
//   }
//
//   function appearCandies() {
//     $(".christmas img.hidden-on-load").addClass("appear");
//   }
//
//   function shakeOrnaments() {
//     $(".ornaments").addClass("shake-top")
//   }
// })
