$(function() {

  // ------------------------------------------------
  // + SNAPJS
  // + - handles the slide menu
  // ------------------------------------------------

  var snapper = new Snap({
    element: document.getElementById('content'),
    disable: 'left',
    maxPosition: 288,
    minPosition: -288
  });

  $('.menu-activate').click(function() {
    if( snapper.state().state == "right" ){
      snapper.close();
    } else {
      snapper.open('right');
    }
  });

  // Dropdowns
  // --------------------------------------------------

  $('.masthead > ul > li.dropdown').hover().toggleClass('open');

  // Joey Special
  // --------------------------------------------------

  $('#joey-meador').prepend('<div class="center"><a href="#joey-meador" id="joey-click">&nbsp;</a></div>');
  $('#joey-meador .content').append('<audio id="joey-special" src="/workspace/assets/img/my-beloved.mp3"></audio>');

  $('#joey-click').click(function(){
    $('#joey-special').trigger("play");
  });

  // Home Group Hashing
  // --------------------------------------------------

  if (window.location.hash.length > 0) {
    $('.hg-box ul.nav-tabs > li > a[href="' + window.location.hash + '"]').tab('show');
  } else {
    $('.hg-box ul.nav-tabs > li > a:first').tab('show');
  }

});
