<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-images">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">

		<xsl:choose>
			<xsl:when test="count($entries) = 1">
				<xsl:call-template name="images-single">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="position" select="$position" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="images-multiple">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="position" select="$position" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:if>

</xsl:template>


<xsl:template name="images-single">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<xsl:for-each select="$entries">
			<xsl:call-template name="image-master">
        <xsl:with-param name="photo" select="image/filename" />
        <xsl:with-param name="width" select="1800" />
        <xsl:with-param name="class" select="'image-banner'" />
      </xsl:call-template>
		</xsl:for-each>
	</div>

</xsl:template>


<xsl:template name="images-multiple">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />


	<div id="home-carousel" class="carousel slide">
    <div class="carousel-inner">
		  <xsl:for-each select="$entries">
		    <div>
		    	<xsl:attribute name="class">
		    		<xsl:choose>
		    			<xsl:when test="position() = 1">
		    				<xsl:text>item active</xsl:text>
		    			</xsl:when>
		    			<xsl:otherwise>
		    				<xsl:text>item</xsl:text>
		    			</xsl:otherwise>
		    		</xsl:choose>
		    	</xsl:attribute>
    			<xsl:call-template name="image-master">
            <xsl:with-param name="photo" select="image/filename" />
            <xsl:with-param name="width" select="1800" />
            <xsl:with-param name="height" select="900" />
          </xsl:call-template>
		    </div><!-- /item -->
		  </xsl:for-each>
    </div>
    <a class="left carousel-control" href="#home-carousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#home-carousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  </div>

</xsl:template>


</xsl:stylesheet>
