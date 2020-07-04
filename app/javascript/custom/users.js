window.myFunction = () => {
    //console.log("testing custom JS")
};

document.addEventListener("turbolinks:load", function () {
  $("#button-client-meals").click(function () {
    document.getElementById('client-meals').style.display = 'inline';
    document.getElementById('client-workouts').style.display = 'none';
    document.getElementById('client-psychology').style.display = 'none';
    document.getElementById('client-physiotherapy').style.display = 'none';
    document.getElementById('client-body-measurements').style.display = 'none';
    $('html,body').animate({
      scrollTop: $("#client-meals").offset().top
    },
      'slow');
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-client-workouts").click(function () {
    document.getElementById('client-meals').style.display = 'none';
    document.getElementById('client-workouts').style.display = 'inline';
    document.getElementById('client-psychology').style.display = 'none';
    document.getElementById('client-physiotherapy').style.display = 'none';
    document.getElementById('client-body-measurements').style.display = 'none';
    $('html,body').animate({
      scrollTop: $("#client-workouts").offset().top
    },
      'slow');
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-client-psychology").click(function () {
    document.getElementById('client-meals').style.display = 'none';
    document.getElementById('client-workouts').style.display = 'none';
    document.getElementById('client-psychology').style.display = 'inline';
    document.getElementById('client-physiotherapy').style.display = 'none';
    document.getElementById('client-body-measurements').style.display = 'none';
    $('html,body').animate({
      scrollTop: $("#client-psychology").offset().top
    },
      'slow');
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-client-physiotherapy").click(function () {
    document.getElementById('client-meals').style.display = 'none';
    document.getElementById('client-workouts').style.display = 'none';
    document.getElementById('client-psychology').style.display = 'none';
    document.getElementById('client-physiotherapy').style.display = 'inline';
    document.getElementById('client-body-measurements').style.display = 'none';
    $('html,body').animate({
      scrollTop: $("#client-physiotherapy").offset().top
    },
      'slow');
  })
})

document.addEventListener("turbolinks:load", function () {
  $("#button-client-body-measurements").click(function () {
    document.getElementById('client-meals').style.display = 'none';
    document.getElementById('client-workouts').style.display = 'none';
    document.getElementById('client-psychology').style.display = 'none';
    document.getElementById('client-physiotherapy').style.display = 'none';
    document.getElementById('client-body-measurements').style.display = 'inline';
    $('html,body').animate({
      scrollTop: $("#client-body-measurements").offset().top
    },
      'slow');
  })
})