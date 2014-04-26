<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="masthead">

  <div class="masthead">
    <xsl:call-template name="navbar"/>
    <xsl:if test="/data/tags-entries-by-tag/entry/content">
      <div class="tagline">
        <xsl:value-of select="/data/tags-entries-by-tag/entry/content" disable-output-escaping="yes" />
      </div>
    </xsl:if>
  </div>

</xsl:template>


<xsl:template name="google-analytics">
  <script>
    <xsl:text>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');</xsl:text>
    <xsl:text>ga('create', '</xsl:text>
    <xsl:value-of select="$ua-id"/>
    <xsl:text>', '</xsl:text>
    <xsl:value-of select="$ua-site"/>
    <xsl:text>');</xsl:text>
    <xsl:text>ga('send', 'pageview');</xsl:text>
  </script>
</xsl:template>


<xsl:template name="typekit">
  <script>
    <xsl:attribute name="src">
      <xsl:text>//use.typekit.net/</xsl:text>
      <xsl:value-of select="$typekit-id"/>
      <xsl:text>.js</xsl:text>
    </xsl:attribute>
  </script>
  <script>try{Typekit.load();}catch(e){}</script>
</xsl:template>


</xsl:stylesheet>