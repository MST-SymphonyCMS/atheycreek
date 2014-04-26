$(document).ready(function() {

  // Animating the top menu upon open

  $('.top-toggle').on('click touchstart', function(e){
    $('.top-menu').toggleClass('is-visible');
    $('.close-top-menu').toggleClass('is-visible');
    e.preventDefault();
  });

  $('.close-top-menu').on('click touchstart', function(e){
    $('.top-menu').toggleClass('is-visible');
    $('.close-top-menu').toggleClass('is-visible');
    e.preventDefault();
  });

  // $('.top-toggle').click(function(){
  //   $('.top-menu').fadeIn(function() {
  //     $('.top-menu li').addClass('open');
  //     $('.close-top-menu').addClass('open');
  //   });
  //   return false;
  // });

  // Animating the top menu upon close
  // $('.close-top-menu').click(function(){
  //   $('.top-menu li').removeClass('open');
  //   $('.top-menu').fadeOut();
  //   $('.close-top-menu').removeClass('open');
  //   return false;
  // });

  // Animating the top menu upon open
  // $('.top-toggle').click(function(){
  //   $('.top-menu').fadeIn({width:'show'});
  //   return false;
  // });


});
