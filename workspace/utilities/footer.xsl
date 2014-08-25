<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="footer">

  <div class="footer">
    <div class="footer-nav container">
      <div class="row">
        <div class="span2">
          <ul class="nav nav-list">
            <li class="nav-header first"><a href="/meetings/">Meetings</a></li><br />
            <li class="nav-header"><a href="/teachings/">Teachings</a></li><br />
            <li class="nav-header"><a href="/events/">Events</a></li><br />
            <li class="nav-header"><a href="/ministries/">Ministries</a></li><br />
            <li class="nav-header"><a href="/home-groups/">Home Groups</a></li><br />
            <li class="nav-header"><a href="/missions/">Missions</a></li><br />
            <li class="nav-header"><a href="/about/">About</a></li>
          </ul>
        </div>
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='footer']/content)" disable-output-escaping="yes" />
      </div>
    </div>
    <div class="baseline">
      <div class="container">
        <div class="row">
          <div class="span12 center">
            <div class="facebook">
              <a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289">Visit us on Facebook</a>
            </div>
            <div class="copyright">
              <xsl:text>© </xsl:text>
              <a href="{$root}"><xsl:value-of select="$website-name" /></a>
              <xsl:text>.&#160;All&#160;rights&#160;reserved.&#160;|&#160;&#160;</xsl:text>
              <span class="dev">
               <a href="https://github.com/atheycreek/atheycreek/issues/" target="_blank">Website Support</a>
               <span class="divider">| Some photos courtesy of <a href="http://fiftyfootshadows.net" target="_blank">John Carey</a></span>
               <br />
              </span>
            </div>
            <div class="branding">
              <a href="{root}">&#x2014;<span class="year left">1996</span><span class="icon">0</span><span class="year right"><xsl:value-of select="$this-year" /></span>&#x2014;</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript" src="{$workspace}/assets/js/application.min.js"></script>

  <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-32000708-1']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script>

</xsl:template>


</xsl:stylesheet>