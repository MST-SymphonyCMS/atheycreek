<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../assets/xsl/search.xsl" />


<xsl:template match="/">
	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>

	<xsl:call-template name="head"/>

	<body>
		<xsl:attribute name="class">
			<xsl:text>pageid-</xsl:text>
			<xsl:value-of select="$ds-tags-filtered.system-id"/>
			<xsl:text> </xsl:text>
			<xsl:text>layout-</xsl:text>
			<xsl:value-of select="/data/layouts-ds-tags-entries-by-tag/entry/name/@handle" />
			<xsl:if test="/data/events-entry-by-id-preview/entry or /data/events-entry-by-id/entry or /data/events-recurring-entry-by-id/entry or /data/events-recurring-entry-by-id-preview/entry">
				<xsl:text> profile</xsl:text>
			</xsl:if>
		</xsl:attribute>

		<xsl:call-template name="alerts-home"/>
	  <xsl:call-template name="navbar"/>
	  <xsl:call-template name="mast"/>

		<div class="container main-container">
			<xsl:call-template name="component-search">
				<xsl:with-param name="position" select="column-full-width" />
				<xsl:with-param name="entries" select="data/search/entry" />
			</xsl:call-template>

			<xsl:call-template name="footer"/>
		</div> <!-- .main-container -->

	<xsl:call-template name="livereload"/>
	</body>

</html>

</xsl:template>


</xsl:stylesheet>