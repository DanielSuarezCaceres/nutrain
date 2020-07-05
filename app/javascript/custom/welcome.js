document.addEventListener("turbolinks:load", function () {
  $("#nutrition-overview-week").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('container-nutrition-overview-weekly').style.display = 'inline';
    document.getElementById('container-nutrition-overview-month').style.display = 'none';
    document.getElementById('container-nutrition-overview-trimester').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#nutrition-overview-month").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('container-nutrition-overview-weekly').style.display = 'none';
    document.getElementById('container-nutrition-overview-month').style.display = 'inline';
    document.getElementById('container-nutrition-overview-trimester').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#nutrition-overview-trimester").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('container-nutrition-overview-weekly').style.display = 'none';
    document.getElementById('container-nutrition-overview-month').style.display = 'none';
    document.getElementById('container-nutrition-overview-trimester').style.display = 'inline';
  })
})