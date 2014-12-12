<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="teachings-series-landing">

  <div class="teachings teachings-series-landing">
    <div class="container">
      <div class="row">
        <h4>Teaching Series</h4>
      </div><!-- .row -->
    </div><!-- .container -->
    <div class="container">
      <div class="row">
        <xsl:for-each select="/data/teachings-series-entries-all/entry[not(special) or special = 'No']">
          <div class="col-md-6 series">
            <a>
              <xsl:call-template name="url-teachings-series" />
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="poster/item/image/filename" />
                <xsl:with-param name="width" select="600" />
                <xsl:with-param name="height" select="338" />
              </xsl:call-template>
            </a>
            <div class="meta">
              <h5 class="center">
                <a>
                  <xsl:call-template name="url-teachings-series" />
                  <xsl:value-of select="title" disable-output-escaping="yes" />
                </a>
              </h5>
            </div>
          </div>
        </xsl:for-each>
      </div><!-- .row -->
      <div class="row">
        <br/>
        <h4>Special Series</h4>
        <xsl:for-each select="/data/teachings-series-entries-all/entry[special = 'Yes']">
          <div class="col-md-6 series">
            <a>
              <xsl:call-template name="url-teachings-series" />
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="poster/item/image/filename" />
                <xsl:with-param name="width" select="600" />
                <xsl:with-param name="height" select="338" />
              </xsl:call-template>
            </a>
            <div class="info">
              <h5>
                <a>
                  <xsl:call-template name="url-teachings-series" />
                  <xsl:value-of select="title" disable-output-escaping="yes" />
                  <xsl:if test="featured = 'Yes'">
                    <xsl:text>&#160;</xsl:text>
                    <span class="label accent">Featured</span>
                    <xsl:text>&#160;</xsl:text>
                  </xsl:if>
                </a>
              </h5>
            </div>
          </div>
        </xsl:for-each>
      </div><!-- .row -->
    </div><!-- .container -->
  </div><!-- .teachings-series-landing -->

</xsl:template>


<!-- The template for Teachings on the homepage -->
<xsl:template name="teachings-home">

  <div class="teachings teachings-full-width teachings-home">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h4>Recent Teachings</h4>
          <div class="row">
            <xsl:for-each select="/data/teachings-latest/entry[position() &lt; 5]">
              <div>
                <xsl:attribute name="class">
                  <xsl:text>teaching col-md-6 recent number</xsl:text>
                  <xsl:value-of select="position()" />
                </xsl:attribute>
                <a>
                  <xsl:call-template name="url-teachings" />
                  <h5>
                    <xsl:choose>
                      <xsl:when test="position() = 1 and featured = 'Yes'">
                        <xsl:call-template name="truncate">
                          <xsl:with-param name="node" select="title" />
                          <xsl:with-param name="length" select="25" />
                        </xsl:call-template>
                        <span class="label accent">FEATURED</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="truncate">
                          <xsl:with-param name="node" select="title" />
                          <xsl:with-param name="length" select="30" />
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </h5>
                  <p class="date">
                    <xsl:call-template name="date-teaching">
                       <xsl:with-param name="date" select="date/date/start/@iso" />
                    </xsl:call-template>
                  </p>
                  <p class="description">
                    <xsl:call-template name="truncate">
                      <xsl:with-param name="node" select="description" />
                      <xsl:with-param name="length" select="180" />
                    </xsl:call-template>
                  </p>
                  <p class="more">
                    <span class="more-link">More</span>
                  </p>
                </a>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </div>

      <div class="teachings-series teachings-series-full-width teachings-series-home">
        <h4>Teaching Series</h4>
        <div class="row">
          <xsl:for-each select="/data/teachings-series-entries-filtered/entry[position() &lt; 3]">
            <div class="col-md-6 series">
              <a>
                <xsl:call-template name="url-teachings-series" />
                <xsl:call-template name="image-master">
                  <xsl:with-param name="photo" select="poster/item/image/filename" />
                  <xsl:with-param name="width" select="600" />
                  <xsl:with-param name="height" select="338" />
                </xsl:call-template>
              </a>
            </div>
          </xsl:for-each>
        </div>
        <h4>Special Series</h4>
        <div class="row">
          <xsl:for-each select="/data/teachings-series-special-filtered/entry[position() &lt; 3]">
            <div class="col-md-6 series">
              <a>
                <xsl:call-template name="url-teachings-series" />
                <xsl:call-template name="image-master">
                  <xsl:with-param name="photo" select="poster/item/image/filename" />
                  <xsl:with-param name="width" select="600" />
                  <xsl:with-param name="height" select="338" />
                </xsl:call-template>
              </a>
            </div>
          </xsl:for-each>
        </div>
      </div><!-- .row -->

    </div><!-- .container -->

  </div>

</xsl:template>


<xsl:template name="teaching-entry">

  <xsl:param name="entry" select="." />

  <xsl:for-each select="$entry">
    <xsl:if test="number($pt2)">

      <div class="title-wrapper">
        <div class="container">
          <div class="row">
            <div class="col-md-12 center">
              <h2>
                <xsl:value-of select="title" disable-output-escaping="yes" />
                <span class="verse">
                  <xsl:text>&#160;&#160;(</xsl:text>
                  <xsl:if test="book/item != ''">
                    <xsl:value-of select="book/item" />
                    <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="chapter" />
                  <xsl:text>)</xsl:text>
                </span>
              </h2>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-8 teaching-main">
          <ul class="nav nav-tabs" id="teachingTab">
            <xsl:choose>
              <xsl:when test="string-length(video-id) or video-podcast = 'Yes'">
                <li class="active"><a href="#video" data-toggle="tab">Video</a></li>
                <li><a href="#audio" data-toggle="tab">Audio</a></li>
              </xsl:when>
              <xsl:otherwise>
                <li class="active"><a href="#audio" data-toggle="tab">Audio</a></li>
              </xsl:otherwise>
            </xsl:choose>
          </ul>
          <xsl:if test="$cookie-username">
            <div class="edit-wrapper">
              <xsl:call-template name="edit-entry">
                <xsl:with-param name="component" select="'teachings'"/>
              </xsl:call-template>
            </div>
          </xsl:if>
          <div class="tab-content">
            <xsl:choose>
              <xsl:when test="string-length(video-id)">
                <div class="tab-pane fade active in" id="video">
                  <iframe src="http://player.vimeo.com/video/{video-id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" width="500" height="281" frameborder="0" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen"></iframe>
                </div>
                <div class="tab-pane fade in" id="audio">
                  <div class="audio-poster">
                    <xsl:call-template name="image-master">
                      <xsl:with-param name="photo" select="poster/item/image/filename" />
                      <xsl:with-param name="width" select="1920" />
                      <xsl:with-param name="height" select="1080" />
                    </xsl:call-template>
                  </div>
                  <xsl:call-template name="teaching-actions" />
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="tab-pane fade active in" id="audio">
                  <div class="audio-poster">
                    <xsl:call-template name="image-master">
                      <xsl:with-param name="photo" select="poster/item/image/filename" />
                      <xsl:with-param name="width" select="1920" />
                      <xsl:with-param name="height" select="1080" />
                    </xsl:call-template>
                  </div>
                  <xsl:call-template name="teaching-actions" />
                </div>
              </xsl:otherwise>
            </xsl:choose>

          </div>
        </div>
        <div class="col-md-4">
          <div class="teacher">
            <em>by </em>
            <strong>
              <xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
              <xsl:text disable-output-escaping="yes"> </xsl:text>
              <xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
            </strong>
          </div>
          <div class="avatar">
            <xsl:call-template name="image-master">
              <xsl:with-param name="photo" select="speaker/item/photo/filename" />
              <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
              <xsl:with-param name="height" select="140" />
              <xsl:with-param name="width" select="140" />
              <xsl:with-param name="responsive" select="0" />
              <xsl:with-param name="circle" select="1" />
            </xsl:call-template>
          </div>
          <div class="about">
            <xsl:value-of select="speaker/item/about" disable-output-escaping="yes" />
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-8">
          <div class="meta">
            <p>
              <xsl:if test="string-length(filename) &gt; 0">
                <span class="badge">
                  <xsl:value-of select="filename" />
                </span>
                <span class="divider">|</span>
              </xsl:if>
              <span class="date">
                <xsl:call-template name="date-teaching">
                  <xsl:with-param name="date" select="date/date/start/@iso" />
                </xsl:call-template>
              </span>
            </p>
          </div>
          <div class="description">
            <xsl:value-of select="description"  disable-output-escaping="yes" />
          </div>

        </div>
        <div class="col-md-4">
          <xsl:if test="tags/item">
            <xsl:call-template name="teaching-tag-list">
              <xsl:with-param name="tags" select="tags/item" />
            </xsl:call-template>
          </xsl:if>
        </div>
        <div class="col-md-12">
          <br/><br/>
          <hr/>
          <br/><br/>
          <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
        </div>
      </div>

    </xsl:if>

    <xsl:if test="not(number($pt2))">
      <xsl:choose>
        <xsl:when test="not($pt1)">
        </xsl:when>
        <xsl:otherwise>
          <h4>
            <a>
              <xsl:call-template name="url-teachings" />
              <xsl:value-of select="title" disable-output-escaping="yes" />
              <span class="verse">
                <xsl:value-of select="book/item" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="chapter" />
              </span>
            </a>
          </h4>
          <div class="meta">
            <p>
              <xsl:if test="string-length(filename)">
                <span class="badge">
                  <xsl:value-of select="filename" />
                </span>
              </xsl:if>
              <span class="teacher">
                <em>by </em>
                <xsl:choose>
                  <xsl:when test="$pt2 = 'tag' or $pt2 = 'year'">
                    <xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
                    <xsl:text disable-output-escaping="yes"> </xsl:text>
                    <xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="speaker/item" disable-output-escaping="yes" />
                  </xsl:otherwise>
                </xsl:choose>
              </span>
              <span class="verse">
                <span class="icon">u</span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="book/item" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="chapter" />
              </span>
              <span class="divider">|</span>
              <span class="date">
                <xsl:call-template name="format-date">
                  <xsl:with-param name="date" select="date/date/start/@iso" />
                  <xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
                </xsl:call-template>
              </span>
            </p>
          </div>
          <div class="description">
            <xsl:value-of select="description" disable-output-escaping="yes" />
          </div>
          <xsl:call-template name="teaching-tag-list">
            <xsl:with-param name="tags" select="tags/item" />
          </xsl:call-template>

          <xsl:if test="string-length(filename)">
            <span class="pull-right" style="position:relative;top:-38px;right:5px;">
              <xsl:variable name="audio-url">
                <xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
                <xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
                <xsl:text>.mp3</xsl:text>
              </xsl:variable>
              <a href="{$audio-url}" class="btn btn-default" target="_blank">
                <span class="icon">d</span>
                <span class="text">Download</span>
              </a>
            </span>
          </xsl:if>

        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:for-each>

</xsl:template>


<!-- The template for a Teachings Landing page -->
<xsl:template name="teachings-landing">
  <xsl:param name="position" />
  <xsl:param name="entries" />

  <div class="teachings teachings-landing">
    <div class="container">
      <h4>Latest Teaching</h4>
    </div>
    <xsl:call-template name="teaching-viewer">
      <xsl:with-param name="entry" select="/data/featured-teachings/entry" />
    </xsl:call-template>
    <div class="teachings-search">
      <h4>Teachings Search</h4>
      <form class="search-form" method="get">
        <xsl:call-template name="form-search-action"/>
        <a>
          <xsl:call-template name="url-search-home" />
          <span class="glyphicon glyphicon-search"></span>
        </a>
        <input type="hidden" name="sections" value="teachings,teachings-tags,teachings-series" />
        <input class="keywords" name="keywords" onclick="this.select()" placeholder="Search for Teachings, Tags, or Series" autocomplete="off" />
      </form>
    </div>
    <xsl:call-template name="teachings-home"/>
    <div class="teachings-podcast" id="podcasts">
      <div class="container">
        <div class="row">
          <h4>Official Podcasts</h4>
          <div class="podcast col-md-6">
            <div class="podcast-image">
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="'podcast-audio-54876aecc97f9.jpg'" />
                <xsl:with-param name="width" select="300" />
                <xsl:with-param name="height" select="300" />
              </xsl:call-template>
            </div>
            <div class="podcast-description">
              <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-audio-description']/content)" disable-output-escaping="yes" />
            </div>
            <div class="podcast-links more">
              <a class="more-link">
                <xsl:attribute name="href">
                  <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-audio']/content)" disable-output-escaping="yes" />
                </xsl:attribute>
                <xsl:text>iTUNES</xsl:text>
              </a>
              <a class="more-link">
                <xsl:attribute name="href">
                  <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-audio-subscribe']/content)" disable-output-escaping="yes" />
                </xsl:attribute>
                <xsl:text>Instant Subscribe</xsl:text>
              </a>
            </div>
          </div>
          <div class="podcast col-md-6">
            <div class="podcast-image">
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="'podcast-video-54876b6186866.jpg'" />
                <xsl:with-param name="width" select="300" />
                <xsl:with-param name="height" select="300" />
              </xsl:call-template>
            </div>
            <div class="podcast-description">
              <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-video-description']/content)" disable-output-escaping="yes" />
            </div>
            <div class="podcast-links more">
              <a class="more-link">
                <xsl:attribute name="href">
                  <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-video']/content)" disable-output-escaping="yes" />
                </xsl:attribute>
                <xsl:text>iTUNES</xsl:text>
              </a>
              <a class="more-link">
                <xsl:attribute name="href">
                  <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='podcast-video-subscribe']/content)" disable-output-escaping="yes" />
                </xsl:attribute>
                <xsl:text>Instant Subscribe</xsl:text>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><!-- .teachings-landing -->
</xsl:template>


<!-- The template for a Teachings List page -->
<xsl:template name="teachings-list">
  <xsl:param name="position" />
  <xsl:param name="entries" />

  <div class="teachings teachings-list">
    <xsl:if test="$pt2 = 'series'">
      <div class="teachings-list-poster">
        <xsl:call-template name="image-master">
          <xsl:with-param name="photo" select="/data/teachings-series-entries-all/entry[@id = $pt3]/poster/item/image/filename" />
          <xsl:with-param name="width" select="1920" />
          <xsl:with-param name="height" select="1080" />
        </xsl:call-template>
      </div>
    </xsl:if>
    <div class="container">
      <h4 class="teachings-list-title">
        <xsl:choose>
          <!-- Testing for Teachings by Series -->
          <xsl:when test="number($pt3) and $pt4">
            <xsl:text>Series: </xsl:text>
            <span class="subtitle">
              <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$pt4" />
                <xsl:with-param name="replace" select="'-'" />
                <xsl:with-param name="by" select="' '" />
              </xsl:call-template>
            </span>
          </xsl:when>
          <!-- Testing for Teachings by Tags -->
          <xsl:when test="$pt2 = 'tag'">
            <xsl:text>Tag: </xsl:text>
            <span class="subtitle">
              <xsl:value-of select="/data/teachings-entry-by-tag-filtered/entry/tags/item[@id=$pt3]/tag/@handle" disable-output-escaping="yes" />
            </span>
          </xsl:when>
          <!-- Testing for Teachings by Year -->
          <xsl:when test="$pt2 = 'year'">
            <xsl:text>Year: </xsl:text>
            <span class="subtitle">
              <xsl:value-of select="$pt3" disable-output-escaping="yes" />
            </span>
          </xsl:when>
        </xsl:choose>
      </h4>

      <xsl:if test="/data/teachings-series-entries-all/entry[@id = $pt3]/description != ''">
        <p class="teachings-list-description">
          <xsl:value-of select="/data/teachings-series-entries-all/entry[@id = $pt3]/description" disable-output-escaping="yes" />
        </p>
      </xsl:if>

      <hr/>

      <div class="teachings-table row">
        <xsl:for-each select="$entries">
          <div class="teaching col-md-6">
            <a>
              <xsl:call-template name="url-teachings"/>
              <h5>
                <xsl:value-of select="title" disable-output-escaping="yes" />
                <xsl:if test="string-length(filename) &gt; 0">
                  <xsl:text>&#160;&#160;</xsl:text>
                  <span class="label label-default">
                    <xsl:value-of select="filename" />
                  </span>
                </xsl:if>
              </h5>
              <div class="meta">
                <span class="date">
                  <xsl:call-template name="format-date">
                    <xsl:with-param name="date" select="date/date/start/@iso" />
                    <xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
                  </xsl:call-template>
                </span>
                <xsl:text> • </xsl:text>
                <span class="book">
                  <xsl:value-of select="book/item" />
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="chapter" />
                </span>
              </div>
            </a>
          </div><!-- .teaching -->
        </xsl:for-each>
      </div><!-- .teachings-table -->
    </div><!-- .container -->
  </div><!-- .teachings-list -->

</xsl:template>


<!-- The template for a Teachings Detail page -->
<xsl:template name="teachings-detail">
  <xsl:param name="position" />
  <xsl:param name="entries" />

  <div class="teachings teachings-full-width teachings-detail">
    <xsl:for-each select="$entries">
      <div class="teaching">
        <xsl:call-template name="teaching-viewer">
          <xsl:with-param name="entry" select="$entries" />
        </xsl:call-template>

        <div class="main">
          <h4>
            <xsl:value-of select="title" disable-output-escaping="yes" />
            <xsl:if test="string-length(filename)">
              <xsl:text> </xsl:text>
              <span class="label label-default">
                <xsl:value-of select="filename" />
              </span>
            </xsl:if>
          </h4>
          <div class="meta">
            <span class="date">
              <xsl:call-template name="format-date">
                <xsl:with-param name="date" select="date/date/start/@iso" />
                <xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
              </xsl:call-template>
            </span>
            <xsl:text> • </xsl:text>
            <span class="book">
              <xsl:value-of select="book/item" />
              <xsl:text> </xsl:text>
              <xsl:value-of select="chapter" />
            </span>
          </div>
          <div class="divider">⨉⨉⨉</div>
          <div class="description">
            <xsl:value-of select="description" disable-output-escaping="yes"/>
            <hr/>
            <div class="tags">
              <xsl:call-template name="teaching-tag-list">
                <xsl:with-param name="tags" select="tags/item" />
              </xsl:call-template>
            </div>
          </div>

        </div><!-- .main -->
        <div class="speaker">
          <div class="members-roles members-roles-column-right">
            <div class="member">
              <h4>
                <xsl:value-of select="speaker/item/first-name"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="speaker/item/last-name"/>
              </h4>
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="speaker/item/photo/filename" />
                <xsl:with-param name="default" select="anonymous-4fef5a675fd64-5459168309152.jpg" />
                <xsl:with-param name="width" select="400" />
                <xsl:with-param name="height" select="400" />
                <xsl:with-param name="responsive" select="0" />
                <xsl:with-param name="circle" select="1" />
              </xsl:call-template>
              <div class="info">
                <div class="description">
                  <xsl:value-of select="speaker/item/about" disable-output-escaping="yes" />
                </div>
              </div>
            </div>
          </div>
        </div><!-- .speaker -->
      </div><!-- .teaching -->
    </xsl:for-each>
  </div>
</xsl:template>


<xsl:template name="teaching-viewer">
  <xsl:param name="entry" select="." />

  <xsl:for-each select="$entry">
    <div class="teaching-viewer">
      <xsl:attribute name="style">
        <xsl:text>background-image: url('</xsl:text>
        <xsl:value-of select="poster/item/image/@url"/>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
      <div class="inner">
        <div class="teaching-nav">
          <ul class="nav nav-pills">
            <xsl:choose>
              <xsl:when test="string-length(video-id) or video-podcast = 'Yes'">
                <li class="active">
                  <a href="#video" role="tab" data-toggle="tab">Video</a>
                </li>
                <li><a href="#audio" role="tab" data-toggle="tab">Audio</a></li>
              </xsl:when>
              <xsl:otherwise>
                <li class="active"><a href="#audio" role="tab" data-toggle="tab">Audio</a></li>
              </xsl:otherwise>
            </xsl:choose>
          </ul>
        </div>
        <div class="teaching-media">
          <div class="container">
            <div class="row">
              <div class="tab-content col-md-8 col-md-offset-2">
                <xsl:choose>
                  <xsl:when test="string-length(video-id)">
                    <div class="tab-pane fade in active" id="video">
                      <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="http://player.vimeo.com/video/{video-id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" width="788" height="443" frameborder="0" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen"></iframe>
                      </div>
                    </div>
                    <div class="tab-pane fade in" id="audio">
                      <div class="audio-poster">
                        <xsl:call-template name="image-master">
                          <xsl:with-param name="photo" select="poster/item/image/filename" />
                          <xsl:with-param name="width" select="1920" />
                          <xsl:with-param name="height" select="1080" />
                        </xsl:call-template>
                      </div>
                      <xsl:call-template name="teaching-actions" />
                    </div>
                  </xsl:when>
                  <xsl:when test="string-length(video-id) &lt; 1 and video-podcast = 'Yes'">
                    <div class="tab-pane fade in active" id="video">
                      <div class="embed-responsive embed-responsive-16by9">
                        <video id="{@id}" width="788" height="433" preload="auto" controls="true">
                          <xsl:attribute name="src">
                            <xsl:text>http://66.147.244.244/~atheycre/teachings/video/</xsl:text>
                            <xsl:value-of select="filename"/>
                            <xsl:text>_540.mp4</xsl:text>
                          </xsl:attribute>
                          <xsl:attribute name="poster">
                            <xsl:value-of select="$root"/>
                            <xsl:text>/image/2/1920/1080/5/1/atheycreek.s3.amazonaws.com/</xsl:text>
                            <xsl:value-of select="poster/item/image/filename"/>
                          </xsl:attribute>
                        </video>
                      </div>
                    </div>
                    <div class="tab-pane fade in" id="audio">
                      <div class="audio-poster">
                        <xsl:call-template name="image-master">
                          <xsl:with-param name="photo" select="poster/item/image/filename" />
                          <xsl:with-param name="width" select="1920" />
                          <xsl:with-param name="height" select="1080" />
                        </xsl:call-template>
                      </div>
                      <xsl:call-template name="teaching-actions" />
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="tab-pane fade active in" id="audio">
                      <div class="audio-poster">
                        <xsl:call-template name="image-master">
                          <xsl:with-param name="photo" select="poster/item/image/filename" />
                          <xsl:with-param name="width" select="1920" />
                          <xsl:with-param name="height" select="1080" />
                        </xsl:call-template>
                      </div>
                      <xsl:call-template name="teaching-actions" />
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </div><!-- .tab-content -->
            </div>
          </div>
          <div class="title more">
            <a class="more-link">
              <xsl:call-template name="url-teachings"/>
              <xsl:text>More →</xsl:text>
            </a>
          </div>
        </div><!-- .teaching-select -->
      </div><!-- .inner -->
    </div><!-- .teaching-viewer -->
  </xsl:for-each>
</xsl:template>


<xsl:template name="teaching-actions">
  <xsl:param name="entry" select="." />

  <xsl:variable name="audio-url">
    <xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
    <xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
    <xsl:text>.mp3</xsl:text>
  </xsl:variable>

  <div class="teaching-audio">
    <audio src="{$audio-url}" preload="auto" controls="true"></audio>
  </div>
</xsl:template>


<xsl:template name="teaching-tag-list">
  <xsl:param name="tags" />

  <ul class="tag-list">
    <li class="tag-list-heading">Tags</li>
    <xsl:for-each select="tags/item">
      <li class="tag-list-item">
        <a>
          <xsl:call-template name="url-teachings-tags" />
          <xsl:value-of select="." disable-output-escaping="yes" />
        </a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>


<xsl:template name="date-teaching">

  <xsl:param name="date" />

  <xsl:call-template name="format-date">
    <xsl:with-param name="date" select="$date" />
    <xsl:with-param name="format" select="'%d+;, %m+; %d;%ds;, %y+;'" />
  </xsl:call-template>

</xsl:template>


<xsl:template name="bible-book">

  <xsl:param name="book" />

  <xsl:choose>
    <xsl:when test="$book = 'Psalms'">
      <a href="{$root}/{/data/tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/psalm/">
        <xsl:text>Psalms</xsl:text>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <a href="{$root}/{/data/tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/{$book/@handle}/">
        <xsl:value-of select="$book" />
      </a>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template name="years-counter">

  <xsl:param name="howMany">1997</xsl:param>

  <xsl:if test="$howMany &lt; $this-year + 1">
    <a href="{$root}/teachings/year/{$howMany}/"><xsl:value-of select="$howMany" /></a>
    <xsl:if test="$howMany &lt; $this-year">, </xsl:if>
    <xsl:call-template name="years-counter">
    <xsl:with-param name="howMany" select="$howMany + 1" />
    </xsl:call-template>
  </xsl:if>

</xsl:template>


<xsl:template name="years-counter-nav">

  <xsl:param name="howMany">1997</xsl:param>

  <xsl:if test="$howMany &lt; $this-year + 1">
    <li>
      <a href="{$root}/teachings/year/{$howMany}/"><xsl:value-of select="$howMany" /></a>
    </li>
    <xsl:call-template name="years-counter-nav">
    <xsl:with-param name="howMany" select="$howMany + 1" />
    </xsl:call-template>
  </xsl:if>

</xsl:template>


<xsl:template name="teachings-pagination">

  <xsl:param name="entries" />

  <xsl:call-template name="cd-pagination">
    <xsl:with-param name="pagination" select="$entries/../pagination" />
    <xsl:with-param name="pagination-url">
      <xsl:value-of select="$root" /><xsl:text>/</xsl:text>
      <xsl:if test="$pt1">
        <xsl:value-of select="$pt1" /><xsl:text>/</xsl:text>
      </xsl:if>
      <xsl:if test="$pt2">
        <xsl:value-of select="$pt2" /><xsl:text>/</xsl:text>
      </xsl:if>
      <xsl:if test="$pt3">
        <xsl:value-of select="$pt3" /><xsl:text>/</xsl:text>
      </xsl:if>
      <xsl:if test="$pt4">
        <xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>

</xsl:template>


</xsl:stylesheet>