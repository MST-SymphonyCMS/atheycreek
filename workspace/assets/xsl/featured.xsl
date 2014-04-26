<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:math="http://exslt.org/math"
  extension-element-prefixes="exsl math">


<xsl:template name="component-featured">

  <xsl:for-each select="/data/featured-all/entry">
    <a href="{url}">
      <div class="feature {name/@handle}">
        <div class="overlay">
          <xsl:value-of select="description" disable-output-escaping="yes"/>
        </div>
      </div>
    </a>
  </xsl:for-each>

</xsl:template>


<xsl:template name="featured-home">

  <div class="section section-featured home">
    <xsl:call-template name="component-featured"/>
  </div>

</xsl:template>


</xsl:stylesheet>
