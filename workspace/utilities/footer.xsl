<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="footer">

  <footer class="footer">
    <div class="search">
      <form action="get">
        <xsl:call-template name="form-search-action" />
        <a>
          <xsl:call-template name="url-search-home" />
          <span class="glyphicon glyphicon-search"></span>
        </a>
        <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
      </form>
    </div><!-- .search -->
    <div class="container">
      <div class="row">
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='footer-new']/content)" disable-output-escaping="yes" />
      </div><!-- .row -->
    </div><!-- .container -->
  </footer>

</xsl:template>

<xsl:template name="copyright">

  <div class="baseline">
    <div class="container">
      <p class="copyright">
        <xsl:text>© 2006–</xsl:text>
        <xsl:value-of select="$this-year" />
        <xsl:text>&#160;&#160;•&#160;&#160;</xsl:text>
        <a href="{$root}"><xsl:value-of select="$website-name" /></a>
        <xsl:text>&#160;&#160;•&#160;&#160;All rights reserved.&#160;&#160;•&#160;&#160;Some photos courtesy of </xsl:text>
        <a href="http://fiftyfootshadows.net" target="_blank">John Carey</a>
        <xsl:text>.</xsl:text>
      </p>
    </div>
  </div>

</xsl:template>


<xsl:template name="scripts">
  <xsl:choose>
    <xsl:when test="contains($root, '.dev')">
      <script src="{$workspace}/assets/build/scripts/main.js"></script>
      <xsl:call-template name="livereload" />
    </xsl:when>
    <xsl:otherwise>
      <script src="{$workspace}/assets/build/scripts/main.min.js"></script>
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
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>
