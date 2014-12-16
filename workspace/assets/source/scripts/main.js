$(function() {

  // ------------------------------------------------
  // + FastClick
  // + - handles the slide menu
  // ------------------------------------------------

  FastClick.attach(document.body);


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


  // ------------------------------------------------
  // + Home Group Hash
  // + - detects hash
  // ------------------------------------------------

  if (window.location.hash.length > 0) {
    $('.locations-groups .list-group > li > a[href="' + window.location.hash + '"]').tab('show');
  } else {
    $('.locations-groups .list-group > li > a:first').tab('show');
  }


  // ------------------------------------------------
  // + Popovers
  // + - activates Bootstrap popovers on the site
  // ------------------------------------------------

  $('.members-roles-full-width .phone, .members-roles-full-width .email').popover();

});
