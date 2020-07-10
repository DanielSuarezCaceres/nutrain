/*
jQuery(window).on('load', function () {
  $('.appointment-box').fadeOut();
});
*/

// apparently working only after refreshing page. If going to another and then coming back, is not working
document.addEventListener("turbolinks:load", function () {
  $("#button-cal").click(function(){
    console.log("changing calendar");
    $("#calendar").toggle();
  });
});
