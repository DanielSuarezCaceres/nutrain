// With turbolinks:load, you don't need to refresh the page to make jQuery/JavaScript work
// (without that, it only works first time)
document.addEventListener("turbolinks:load", function () {
  $("#add-workout").click(function () {
    $('html,body').animate({
      scrollTop: $(".exercises-form").offset().top
    },
      'slow');
  })
})