document.addEventListener("turbolinks:load", function () {
  $("#button-privacy").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('privacy-content').style.display = 'inline';
    document.getElementById('terms-of-service-content').style.display = 'none';
    document.getElementById('cookies').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-terms-of-service").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('privacy-content').style.display = 'none';
    document.getElementById('terms-of-service-content').style.display = 'inline';
    document.getElementById('cookies').style.display = 'none';
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-cookies").click(function () {
    // $("#measurements-graphics-month").show();
    // $("#measurements-graphics-year").hide();
    document.getElementById('privacy-content').style.display = 'none';
    document.getElementById('terms-of-service-content').style.display = 'none';
    document.getElementById('cookies').style.display = 'inline';
  })
})