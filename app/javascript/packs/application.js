// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'cocoon';
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap")
require("chartkick")
require("chart.js")
//require("cocoon")
//require("scrollreveal")
require("custom/users")
require("custom/appointments")
require("custom/meals")
require("custom/routines")
require("custom/workouts")
//require("src/cocoon")
require("custom/scrollreveal")
require("select2")

import $ from 'jquery';
import select2 from 'select2';
import 'select2/dist/css/select2.css';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//import 'bootstrap'
//import './src/application.scss'

document.addEventListener("turbolinks:load", function () {
  $(document).ready(function(){
      $(".alert").fadeOut(4000);
  });
});

document.addEventListener("turbolinks:load", function () {
  $(document).ready(function() {
    //$('select').select2();
    $('.select2').select2();
  });
});

/*
$(document).ready(function(){
  ScrollReveal().reveal('.pie-graphics  ', {
      easing: 'ease-in',
      delay: 1000,
      duration: 1000,
  });
});
*/

/*
$(function(){
    $(document).foundation();
    window.scrollReveal = new ScrollReveal();
});*/

/*
document.addEventListener('page:change', function() {
    document.getElementsByClassName('pie-graphics').className += 'animated fadeIn';
});*/
