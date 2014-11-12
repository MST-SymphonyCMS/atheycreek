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
            <xsl:value-of select="image/item/image/filename"/>
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
            <xsl:value-of select="images/item/image/filename"/>
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
            <xsl:value-of select="images/item/image/filename"/>
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

  <div class="teachings-current container">

    <div class="row">
      <div class="col-md-12">
        <h4>Featured Teaching <span class="pull-right">Featured Series</span></h4>
      </div>
      <xsl:for-each select="/data/featured-teachings-home/entry">
        <div class="col-md-6">
          <a>
            <xsl:call-template name="url-teachings" />
            <xsl:call-template name="image-master">
              <xsl:with-param name="photo" select="poster/item/image/filename" />
              <xsl:with-param name="width" select="1920" />
              <xsl:with-param name="height" select="1080" />
            </xsl:call-template>
          </a>
        </div>
      </xsl:for-each>
      <xsl:for-each select="/data/featured-teachings-series/entry">
        <div class="col-md-6">
          <a>
            <xsl:call-template name="url-teachings-series" />
            <xsl:call-template name="image-master">
              <xsl:with-param name="photo" select="poster/item/image/filename" />
              <xsl:with-param name="width" select="1920" />
              <xsl:with-param name="height" select="1080" />
            </xsl:call-template>
          </a>
        </div>
      </xsl:for-each>
    </div>

    <div class="row">
      <div class="col-md-12">
        <h4>Featured Items</h4>
      </div>
      <div class="col-md-12">
        <div id="home-carousel" class="carousel slide">
          <div class="carousel-inner">
            <xsl:for-each select="exsl:node-set($entries)/entry">
              <div>
                <xsl:attribute name="class">
                  <xsl:choose>
                    <xsl:when test="position() = 1">item active</xsl:when>
                    <xsl:otherwise>item</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="uri" />
                  </xsl:attribute>
                  <xsl:call-template name="image-master">
                    <xsl:with-param name="photo" select="image" />
                    <xsl:with-param name="width" select="1800" />
                    <xsl:with-param name="height" select="900" />
                  </xsl:call-template>
                </a>
              </div>
            </xsl:for-each>
          </div><!-- .carousel-inner -->
          <a class="left carousel-control" href="#home-carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#home-carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div><!-- #home-carousel -->
      </div><!-- .col-md-12 -->
    </div><!-- .row -->

  </div><!-- .teachings-current -->

</xsl:template>


<xsl:template name="featured-home">

  <div class="feature">
    <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='banner']/content)" disable-output-escaping="yes" />
    <xsl:call-template name="component-featured" />
  </div><!-- .feature -->

</xsl:template>


</xsl:stylesheet>