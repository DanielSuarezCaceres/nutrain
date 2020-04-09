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

countApps = (number) => {
  console.log("NUMBER OF APPOINTMENTS", number);
}

/*
jQuery(window).on('load', function () {
  $('.appointment-box').fadeOut();
});
*/

// apparently working only after refreshing page. If going to another and then coming back, is not working
$(document).ready(function(){
  $("#button-cal").click(function(){
    console.log("CLICKING");
    $("#calendar").toggle();
  });
});
