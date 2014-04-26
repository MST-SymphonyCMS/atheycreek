var refTagger = {
  settings: {
    bibleVersion: "NKJV",
    convertHyperlinks: true,
    dropShadow: false,
    roundCorners: true,
    tooltipStyle: "dark",
    tagChapters: true,
    customStyle : {
      heading: {
        backgroundColor : "#434343",
        color : "#ffffff"
      }
    }
  }
};
(function(d, t) {
  var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
  g.src = "//api.reftagger.com/v2/RefTagger.js";
  s.parentNode.insertBefore(g, s);
}(document, "script"));
