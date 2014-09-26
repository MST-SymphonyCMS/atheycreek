<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-verses">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<div>
				<xsl:call-template name="class-rows" />
				<xsl:for-each select="$entries">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<xsl:choose>
								<xsl:when test="string-length(content)">
									<blockquote>
										<span>
											<xsl:text>&#8220;</xsl:text>
											<xsl:value-of select="content"/>
											<xsl:text>&#8221;</xsl:text>
										</span>
									</blockquote>
									<cite>
										<xsl:value-of select="passage" />
										<xsl:text> (</xsl:text>
										<xsl:value-of select="version"/>
										<xsl:text>)</xsl:text>
									</cite>
								</xsl:when>
								<xsl:otherwise>
									<blockquote>
										<span>
											<xsl:text>&#8220;</xsl:text>
											<xsl:value-of select="//xml-api-biblia-com/text" />
											<xsl:text>&#8221;</xsl:text>
										</span>
										<xsl:text>&#160;</xsl:text>
										<strong><xsl:value-of select="passage" /></strong>
									</blockquote>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>