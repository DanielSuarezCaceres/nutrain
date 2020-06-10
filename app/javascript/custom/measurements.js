/*document.addEventListener("turbolinks:load", function () {
  $("#toggle-edit-meal-graphics").click(function(){
    $("#edit-meal-graphics").slideToggle(
      "slow"
    );
  });
});*/

document.addEventListener("turbolinks:load", function () {
  $("#button-measurements-month").click(function () {
    console.log("SHOWING MONTH");
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    var chart = Chartkick.charts["weight-month-graphic"];
    var charObj = chart.getChartObject();
    console.log("CHART OBJECT", charObj);
    var xRotation = chart["chart"]["scales"]["x-axis-0"];
    var aspect = chart["chart"]["chart"]["aspectRatio"]
    document.getElementById('measurements-graphics-month').style.display = 'inline';
    document.getElementById('measurements-graphics-six-months').style.display = 'none';
    document.getElementById('measurements-graphics-three-months').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-measurements-three-months").click(function () {
    console.log("SHOWING QUARTER");
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('measurements-graphics-three-months').style.display = 'inline';
    document.getElementById('measurements-graphics-six-months').style.display = 'none';
    document.getElementById('measurements-graphics-month').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-measurements-six-months").click(function () {
    console.log("SHOWING YEARLY");
    // $("#measurements-graphics-year").hide();
    // $("#measurements-graphics-month").show();
    document.getElementById('measurements-graphics-six-months').style.display = 'inline';
    document.getElementById('measurements-graphics-month').style.display = 'none';
    document.getElementById('measurements-graphics-three-months').style.display = 'none';
  })
})