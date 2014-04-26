<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="classes.xsl" />
<xsl:include href="components.xsl" />
<xsl:include href="date-time-advanced.xsl" />
<xsl:include href="date-utilities.xsl" />
<xsl:include href="timespan-format.xsl" />
<xsl:include href="toolkit.xsl" />
<xsl:include href="url-encode.xsl" />
<xsl:include href="globals.xsl"/>
<xsl:include href="navigation.xsl"/>
<xsl:include href="head.xsl"/>
<xsl:include href="footer.xsl"/>
<xsl:include href="pages.xsl"/>
<xsl:include href="pagination.xsl" />

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
	<html class="no-js" lang="en">

	<xsl:call-template name="head"/>

		<body>
			<xsl:attribute name="class">
				<xsl:text>page-</xsl:text>
				<xsl:value-of select="$ds-tags-filtered.tag"/>
				<xsl:text> </xsl:text>
				<xsl:text>layout-</xsl:text>
				<xsl:value-of select="/data/layouts-ds-tags-entries-by-tag/entry/name/@handle" />
				<xsl:if test="/data/events-entry-by-id-preview/entry or /data/events-entry-by-id/entry or /data/events-recurring-entry-by-id/entry or /data/events-recurring-entry-by-id-preview/entry">
					<xsl:text> profile</xsl:text>
				</xsl:if>
			</xsl:attribute>



			<div class="main-body">
				<a class="close-top-menu" href="#">&#160;</a>
				<xsl:call-template name="top-menu"/>
				<xsl:call-template name="masthead"/>

		    	<article>

			    	<xsl:if test="not($pt1) or $pt1 = 'home'">

		    			<xsl:call-template name="events-home">
		    				<xsl:with-param name="component" select="'events'" />
		    				<xsl:with-param name="entries" select="/data/events-3-latest/entry" />
		    			</xsl:call-template>

			    		<xsl:call-template name="teachings-home"/>
							<xsl:call-template name="teachings-series-home"/>
							<xsl:call-template name="teachings-series-special-home"/>
							<xsl:call-template name="featured-home"/>

			    	</xsl:if>

	    			<xsl:choose>
	    				<xsl:when test="$pt1 = 'toolkit' and $cookie-username">
	    					<xsl:call-template name="toolkit" />
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
	    				</xsl:otherwise>
	    			</xsl:choose>

				</article>

			</div>

			<xsl:call-template name="footer"/>

			<script src="{$workspace}/assets/build/main.min.js"></script>
			<xsl:call-template name="google-analytics"/>
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
