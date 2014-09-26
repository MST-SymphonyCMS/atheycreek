<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:math="http://exslt.org/math"
  extension-element-prefixes="exsl math">


<xsl:template name="merge-data-sources">

    <xsl:variable name="entries">
      <xsl:for-each select="/data/featured-all/entry">
        <entry>
          <title>
						<xsl:value-of select="name"/>
          </title>
          <uri>
						<xsl:value-of select="url"/>
          </uri>
					<image>
						<xsl:value-of select="image/item/image/file/filename"/>
					</image>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/featured-events/entry">
        <entry>
          <title>
						<xsl:value-of select="name"/>
          </title>
          <uri>
						<xsl:value-of select="$root"/>
						<xsl:text>/events/</xsl:text>
						<xsl:value-of select="@id"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="name/@handle"/>
          </uri>
					<image>
						<xsl:value-of select="images/item/image/file/filename"/>
					</image>
        </entry>
      </xsl:for-each>


      <xsl:for-each select="data/featured-events-recurring/entry">
        <entry>
          <title>
						<xsl:value-of select="name"/>
          </title>
          <uri>
						<xsl:value-of select="$root"/>
						<xsl:text>/events/</xsl:text>
						<xsl:value-of select="@id"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="name/@handle"/>
          </uri>
					<image>
						<xsl:value-of select="images/item/image/file/filename"/>
					</image>
        </entry>
      </xsl:for-each>

    </xsl:variable>

  <xsl:for-each select="exsl:node-set($entries)/entry">
		<xsl:sort select="math:random()" data-type="number" order="ascending" />
    <xsl:copy-of select="." />
  </xsl:for-each>

</xsl:template>


<xsl:template name="component-featured">

  <xsl:variable name="entries">
    <xsl:call-template name="merge-data-sources" />
  </xsl:variable>

	<div id="frontCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#frontCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#frontCarousel" data-slide-to="1"></li>
      <xsl:for-each select="exsl:node-set($entries)/entry">
        <li data-target="#frontCarousel" data-slide-to="{position() + 1}"></li>
      </xsl:for-each>
    </ol>
    <div class="carousel-inner">
      <div class="item active">
				<xsl:for-each select="/data/featured-teachings-home/entry">
					<xsl:call-template name="teaching-entry" />
				</xsl:for-each>
      </div>
			<xsl:if test="count(data/featured-teachings-series/entry) &gt; 0">
	      <div class="item">
					<xsl:for-each select="/data/featured-teachings-series/entry">
						<xsl:call-template name="teaching-series-entry" />
					</xsl:for-each>
	      </div>
			</xsl:if>
		  <xsl:for-each select="exsl:node-set($entries)/entry">
		    <div class="item">
		      <div class="row">
		        <div class="col-md-12">
		          <a>
		            <xsl:attribute name="href">
		              <xsl:value-of select="uri" />
		            </xsl:attribute>

		            <img style="width:1140px; height: 642px;" class="inline" data-responsimage-anchor="5" src="/workspace/assets/img/spacer.gif">
		              <xsl:attribute name="data-responsimage">
		                <xsl:value-of select="image" />
		              </xsl:attribute>
		            </img>
		          </a>
		        </div>
		      </div>
		    </div>
		  </xsl:for-each>
    </div>
    <a class="left carousel-control" href="#frontCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#frontCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  </div>

</xsl:template>


<xsl:template name="featured-home">

  <div class="feature">
    <div class="container">
      <div class="row home">
        <div id="main-content" class="col-md-12">
          <h3>Featured Content</h3>
          <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='banner']/content)" disable-output-escaping="yes" />
          <xsl:call-template name="component-featured" />
        </div>
      </div><!-- .row -->
    </div><!-- .container -->
  </div><!-- .feature -->

</xsl:template>


</xsl:stylesheet>