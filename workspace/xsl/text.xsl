<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-text">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:attribute name="class">
			  <xsl:choose>
			    <xsl:when test="$position = 'column-center'">
			      <xsl:text>text text-column-center</xsl:text>
			    </xsl:when>
			    <xsl:when test="$position = 'column-right'">
			      <xsl:text>text text-column-right</xsl:text>
			    </xsl:when>
			    <xsl:otherwise>
			      <xsl:text>text text-full-width container</xsl:text>
			    </xsl:otherwise>
			  </xsl:choose>
			</xsl:attribute>
      <xsl:for-each select="$entries">
        <div>
          <xsl:if test="$position = 'column-full-width'">
            <xsl:attribute name="class">row</xsl:attribute>
          </xsl:if>

          <div class="text-entry">
					  <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
			  	</div>
        </div>
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>
