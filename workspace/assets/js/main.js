(function($, document, window) {
  "use strict";

  return $(function() {

    $.fn.exists = function() {
      return $(this).length > 0;
    };

    return $(document).ready(function() {

      // Alerts
      // --------------------------------------------------

      $(".alert").alert();

      // Carousel
      // --------------------------------------------------

      $(".carousel").carousel({
        interval: 6000
      });

      // Teaching Tabs
      // --------------------------------------------------

      $('#teachingTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
      });

      $('#teachingTab a[href="#video"]').tab('show');

      // Media Element
      // --------------------------------------------------

      $('audio').mediaelementplayer({
        videoWidth: '100%',
        videoHeight: '100%',
        audioWidth: '100%',
        features: ['playpause', 'progress', 'tracks', 'volume'],
        videoVolume: 'horizontal'
      });

      // Joey Special
      // --------------------------------------------------

      $('#joey-meador .content').append('<audio id="joey-special" src="/workspace/assets/img/my-beloved.mp3"></audio>');

      $('#joey-meador img').click(function(){
        $('#joey-special').trigger("play");
      });

    });

  });
})(jQuery, document, window);
