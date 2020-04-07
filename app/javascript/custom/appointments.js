function showSomething () {
  console.log("APPNTMNTS");
}

// called as window.showing();
window.showing = () => {
  console.log("testing custom JS")
};

// called as myFunction();
myFunction = () => {
  console.log("MY FUNCTION");
}

/*
jQuery(window).on('load', function () {
  $('.appointment-box').fadeOut();
});
*/


$(document).ready(function(){
  $("#button-cal").click(function(){
    console.log("CLICKING");
    $("#calendar").toggle();
  });
});
