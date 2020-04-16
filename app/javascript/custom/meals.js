// With turbolinks:load, you don't need to refresh the page to make jQuery/JavaScript work
// (without that, it only works first time)
document.addEventListener("turbolinks:load", function () {
  $("#add-ingredient").click(function () {
    $('html,body').animate({
      scrollTop: $(".foods-form").offset().top
    },
      'slow');
  })
})

/*document.addEventListener("turbolinks:load", function () {
  $("#delete-ingredient").click(function () {
    $('html, body').animate({
      scrollTop: $(".foods-form").offset().top
    },
      'slow');
  })
})*/

/*
document.addEventListener("turbolinks:load", function () {
  $("#delete-ingredient").click(function () {
    $('.food-fields').fadeOut(300, function(){ $(this).remove();});
  });
});*/

/*
$(document).ready(function(){
  $("#add-ingredients").click(function(){
      $(".food-form").append(" <b>Newly added appended text</b>.");
  });
});*/