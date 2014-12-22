<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page-live">

  <xsl:if test="$pt1 = 'live'">
    <div class="teachings-live">
      <xsl:choose>
        <xsl:when test="/data/live-status/entry/status = 'live' or /data/ustream/status = 'live'">
          <div class="teaching-viewer" style="background-image: url('http://atheycreek.s3.amazonaws.com/meetings-black-white-549874bb7c346.jpg');">
            <div class="inner">
              <div class="teaching-nav">
                <ul class="nav nav-pills">
                  <li class="active">
                    <a href="#live" role="tab" data-toggle="tab">Live Broadcast</a>
                  </li>
                </ul>
              </div>
              <div class="teaching-media">
                <div class="container">
                  <div class="row">
                    <div class="tab-content col-md-8 col-md-offset-2">
                      <div class="tab-pane fade in active" id="live">
                        <div class="embed-responsive embed-responsive-16by9">
                          <iframe src="http://www.ustream.tv/embed/4325662/" width="788" height="443" scrolling="no" frameborder="0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen"></iframe>
                        </div><!-- /embed-responsive -->
                      </div><!-- /tab-pane -->
                    </div><!-- /tab-content -->
                  </div><!-- /row -->
                </div><!-- /container -->
              </div><!-- /teaching-media -->
            </div><!-- /inner -->
          </div><!-- /teaching-viewer -->
        </xsl:when>
        <xsl:otherwise>
          <h5>Broadcast is Currently Offline</h5>
          <h4>Here's our Latest Teaching</h4>
          <xsl:call-template name="teaching-viewer">
            <xsl:with-param name="entry" select="/data/featured-teachings/entry" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </div>
    <xsl:call-template name="teachings-podcast"/>
  </xsl:if>

</xsl:template>


</xsl:stylesheet>