var $ = require("jquery");
global.jQuery = $;

import modernizr from 'modernizr';
import Swiper from 'swiper';
import swiper from 'swiper/bundle';

$(window).on("load", function() {
  setTimeout(function() {
    $(".overlay").addClass("loaded");
  }, 0)
});

$(window).on("load", function() {
  setTimeout(function() {
    $(".checkAnim-on-load").each(function() {
      $(this).addClass("anim")
    });
  }, 500)
});

function checkAnim () {
  var e;
  e = $("#get_scroll").offset().top + 1.5 * $("#get_scroll").height(),
  $(".checkAnim").each(function() {
      $(this).offset().top < e ? $(this).addClass("anim") : $(this).removeClass("anim")
  })
}

$(window).on('scroll resize', function () {
  checkAnim();
});

$(document).ready(function() {

  // Menu toggler
  $(".js-nav-toggler").add(".site-nav__menu-toggler__close").add(".site-nav__menu-toggler__open").click(function(e) {
    e.preventDefault();
    $(".site-nav__menu").toggleClass('is-open');
    $(".site-nav__logo__mobile--light").toggle();
    $(".site-nav__menu-toggler__close").toggleClass('is-open');
    $('.site-nav__menu-toggler__open').toggleClass('is-open');
    $(".js-nav-toggler").toggleClass('is-open');
    $('.site-nav__submenu').removeClass('is-open');
  });

  // Dropdown menu
  $(".js-nav-open-submenu").click(function(b) {
    b.preventDefault();
  });   

  if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
      img.src = img.dataset.src;
      img.srcset = img.dataset.srcset;
      img.sizes = img.dataset.sizes;
    });
  } else {
    // Dynamically import the LazySizes library
    const script = document.createElement('script');
    script.src =
      'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.1.2/lazysizes.min.js';
    document.body.appendChild(script);
  }  

  // CANVAS ASIDE LEFT
  $(".js-nav-toggler--left").click(function(e) {
    e.preventDefault;
    $(".canvas").addClass("is-shifted shift-left");
  });
  // CANVAS ASIDE RIGHT
  $(".js-nav-toggler--right").click(function(e) {
    e.preventDefault;
    $(".canvas").addClass("is-shifted shift-right");
  });
  $(".js-nav-close").click(function(e) {
    e.preventDefault;
    $(".canvas").removeClass("is-shifted shift-left shift-right");
  });

  if ($(".carousel").length){
    var mySwiper = new Swiper('.carousel', {
      slidesPerView: 1,
      lazy: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
    })
  } 
});
