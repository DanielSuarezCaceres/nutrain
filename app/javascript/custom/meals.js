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

document.addEventListener("turbolinks:load", function () {
  $('select#meal_food_ids').on("select2:selecting", function(e) { 
    // what you would like to happen
    console.log("testing mio");
  });
})

document.addEventListener("turbolinks:load", function () {
  $("#meal_foods").on('select2:selecting', function(e) {
    console.log("testing orca");
  })
})

document.addEventListener("turbolinks:load", function () {
  $(".select-meal-ingredients").unbind().on('select2:selecting', function(e){
    console.log("ahora si");
  })
})

document.addEventListener("turbolinks:load", function () {
  $(".select #meal_food_ids").unbind().on('select2:selecting', function(e){
    console.log("al fin");
  })
})

document.addEventListener("turbolinks:load", function () {
  $("select#select_ingredients_meal").on('select2:selecting', function(e) {
    console.log("hola");
  })
})

document.addEventListener("turbolinks:load", function () {
  $("select#meal_foods").select2();
})

document.addEventListener("turbolinks:load", function () {
  $("#tags").autocomplete({
    source: '/foods'
  });
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

document.addEventListener("turbolinks:load", function () {
  $("#toggle-edit-meal-graphics").click(function(){
    $("#edit-meal-graphics").slideToggle(
      "slow"
    );
  });
});

document.addEventListener("turbolinks:load", function () {
  $("#toggle-show-meal-graphics").click(function(){
    let button = this;
    console.log(button.text)
    $("#show-meal-graphics").slideToggle(
      "slow",
      // function(){
      //   console.log($(this)); // div show meal graphics
      //   // console.log($("span", button).text
      //   $("span", button).text("Hide");
      // }
    );
  });
});
