<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:import href="../utilities/classes.xsl" />
<xsl:import href="../utilities/components.xsl" />
<xsl:import href="../utilities/date-time-advanced.xsl" />
<xsl:import href="../utilities/date-utilities.xsl" />
<xsl:import href="../utilities/timespan-format.xsl" />
<xsl:import href="../utilities/toolkit.xsl" />
<xsl:import href="../utilities/url-encode.xsl" />
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/head.xsl"/>
<xsl:import href="../utilities/footer.xsl"/>
<xsl:import href="../utilities/error.xsl"/>
<xsl:import href="../utilities/pages.xsl"/>
<xsl:import href="../utilities/pagination.xsl" />


<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	method="xml"
	omit-xml-declaration="yes"
	indent="no"
	/>


<xsl:param name="cookie-username" />
<xsl:param name="url-language" />
<xsl:param name="url-sections" />
<xsl:param name="url-keywords" />

<xsl:variable name="events-entries-per-page" select="'5'" />
<xsl:variable name="member-is-logged-in" select="boolean(/data/events/member-login-info/@logged-in = 'yes')" />


<xsl:template match="/">
	<xsl:call-template name="master"/>
</xsl:template>


<xsl:template name="master">
	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>

	<xsl:call-template name="head"/>

		<body>
			<xsl:attribute name="class">
				<xsl:text>pageid-</xsl:text>
				<xsl:choose>
					<xsl:when test="not($pt1) or $pt1 = 'home'">
						<xsl:value-of select="$ds-tags-filtered.system-id"/>
					</xsl:when>
					<xsl:when test="not(/data/tags-entries-by-tag/entry)">
						<xsl:text>error</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$ds-tags-entries-by-tag"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:text>layout-</xsl:text>
				<xsl:choose>
					<xsl:when test="not($pt1) or $pt1 = 'home'">
						<xsl:value-of select="/data/tags-filtered/entry/layout/item/name/@handle" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/data/layouts-ds-tags-entries-by-tag/entry/name/@handle" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="/data/events-entry-by-id/entry or /data/events-recurring-entry-by-id/entry">
					<xsl:text> profile</xsl:text>
				</xsl:if>
			</xsl:attribute>

		  <xsl:call-template name="alerts-home"/>
			<xsl:call-template name="navbar"/>
			<xsl:call-template name="mast"/>

			<xsl:if test="not($pt1) or $pt1 = 'home'">

				<xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='tagline']/content)" disable-output-escaping="yes" />

				<xsl:call-template name="featured-home"/>

				<div class="container main-container">

					<xsl:call-template name="events-home">
						<xsl:with-param name="component" select="'events'" />
						<xsl:with-param name="entries" select="/data/events-latest/entry" />
					</xsl:call-template>

					<xsl:call-template name="teachings-home"/>

				</div> <!-- .main-container -->

			</xsl:if>


			<div class="container main-container">

				<xsl:call-template name="subnavs"/>

				<xsl:choose>
					<xsl:when test="$pt1 = 'toolkit' and $cookie-username">
						<xsl:call-template name="toolkit" />
					</xsl:when>
					<xsl:when test="$pt1 = 'search'">
						<xsl:call-template name="component-search">
						  <xsl:with-param name="position" select="column-full-width" />
						  <xsl:with-param name="entries" select="data/search/entry" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="not(/data/tags-entries-by-tag/entry)">
						<xsl:call-template name="error"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="count(/data/layouts-ds-tags-entries-by-tag/entry)">
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="/data/layouts-ds-tags-entries-by-tag/entry" />
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="/data/layouts-default/entry" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="/data/tags-all-entries/entry[path = $current-path]/overview = 'Yes'">
              <xsl:call-template name="navigation-tiles">
                <xsl:with-param name="entry" select="/data/tags-all-entries/entry[path = $current-path]" />
              </xsl:call-template>
            </xsl:if>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:call-template name="page-live"/>

				<xsl:call-template name="footer"/>
			</div> <!-- .main-container -->

		<xsl:call-template name="livereload"/>
		</body>
	</html>
</xsl:template>


<xsl:template name="call-components">

	<xsl:param name="xpath" />

	<div class="container">

		<div class="row">
			<div class="span12">
				<xsl:call-template name="component">
					<xsl:with-param name="xpath" select="$xpath/column-full-width" />
				</xsl:call-template>
			</div>
		</div> <!-- .row -->

		<div class="row">
			<xsl:call-template name="component">
				<xsl:with-param name="xpath" select="$xpath/column-center" />
			</xsl:call-template>
			<xsl:call-template name="component">
				<xsl:with-param name="xpath" select="$xpath/column-right" />
			</xsl:call-template>
		</div> <!-- .row -->

	</div> <!-- .container -->

</xsl:template>


</xsl:stylesheet>
