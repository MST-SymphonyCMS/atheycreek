<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"
    media-type="text/css"
    encoding="UTF-8" />

<xsl:include href="../utilities/toolkit.xsl" />


<xsl:template match="data">
<!--   <xsl:apply-templates select="tags-all-entries/entry" mode="css"/> -->
  <xsl:apply-templates select="featured-all/entry" mode="css" />
</xsl:template>


<xsl:template match="tags-all-entries/entry" mode="css">

  <xsl:choose>
    <xsl:when test="contains($current-query-string, tag/@handle)">
      <xsl:text>.masthead {</xsl:text>
      <xsl:text>background-image:url('</xsl:text>
      <xsl:value-of select="$root"/>
      <xsl:text>/image/2/1800/800/5/0/uploads/images/</xsl:text>
      <xsl:value-of select="image/item/image/filename"/>
      <xsl:text>');</xsl:text>
      <xsl:text>} } </xsl:text>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template match="featured-all/entry" mode="css">

  <xsl:text>.feature.</xsl:text>
  <xsl:value-of select="name/@handle" />
  <xsl:text> {</xsl:text>
    <xsl:call-template name="image-background-css">
      <xsl:with-param name="image" select="image/item/image/filename" />
    </xsl:call-template>
  <xsl:text>} </xsl:text>

</xsl:template>


</xsl:stylesheet>
