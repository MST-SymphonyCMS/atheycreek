<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-downloads">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<xsl:choose>
			<xsl:when test="$position = 'column-full-width'"></xsl:when>
			<xsl:when test="$position = 'column-center'"></xsl:when>
			<xsl:when test="$position = 'column-right'">
				<xsl:call-template name="downloads-column-right">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:if>

</xsl:template>


<xsl:template name="downloads-column-right">

	<xsl:param name="component" />
	<xsl:param name="entries" />

	<div class="downloads downloads-column-right">
		<h4>Downloads</h4>
		<xsl:for-each select="$entries">
			<div class="download">
				<a target="_blank">
					<xsl:call-template name="url-downloads" />
					<div>
						<xsl:attribute name="class">
							<xsl:text>glyphicon </xsl:text>
							<xsl:choose>
								<xsl:when test="string-length(link)">glyphicon-link</xsl:when>
								<xsl:otherwise>glyphicon-file</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</div>
					<div class="title">
						<xsl:text>&#160;&#160;</xsl:text>
						<xsl:value-of select="name" />
					</div>
				</a>
			</div>
		</xsl:for-each>
	</div>

</xsl:template>


</xsl:stylesheet>