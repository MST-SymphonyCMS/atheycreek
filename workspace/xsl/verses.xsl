<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-verses">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div class="verses verses-full-width">
			<xsl:for-each select="$entries">
				<blockquote class="verse">
					<xsl:choose>
						<xsl:when test="string-length(content)">
							<p>
								<xsl:value-of select="content"/>
							</p>
							<cite>
								<xsl:value-of select="passage" />
								<xsl:text> (</xsl:text>
								<xsl:value-of select="version"/>
								<xsl:text>)</xsl:text>
							</cite>
						</xsl:when>
						<xsl:otherwise>
							<p>
								<xsl:value-of select="//xml-api-biblia-com/text" />
							</p>
							<cite>
								<xsl:value-of select="passage" />
							</cite>
						</xsl:otherwise>
					</xsl:choose>
				</blockquote>
				<hr/>
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>