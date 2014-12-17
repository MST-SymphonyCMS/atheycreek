<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="navbar">

  <div class="navbar main navbar-inverse visible-desktop">
    <div class="navbar-inner">
      <div class="container">
        <div>
          <form class="navbar-search pull-left" action="get">
            <xsl:call-template name="form-search-action" />
            <a>
              <xsl:call-template name="url-search-home" />
              <span class="icon">s</span>
            </a>
            <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
          </form>
          <ul class="nav pull-right">
            <xsl:if test="/data/live-status/entry/status = 'live' or /data/ustream/status = 'live'">
              <li>
                <a href="{$root}/live/" class="live">
                  <span class="icon">V</span>
                  <xsl:text>Live</xsl:text>
                </a>
              </li>
            </xsl:if>
            <li><a href="{$root}/building/">Building</a></li>
            <li><a href="{$root}/meetings/">Meetings</a></li>
            <li><a href="{$root}/about/im-new-here/">New Here?</a></li>
            <li><a href="{$root}/give/">Give</a></li>
            <li>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="$cookie-username">
                    <xsl:text>worship</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>last worship</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <a href="{$root}/events/12962/tuesday-sunrise-worship/">
                <span class="icon">Z</span>
                <span class="worship">Worship: </span>
                <xsl:value-of select="$main-worship-sunrise" disable-output-escaping="yes" />
              </a>
            </li>
            <xsl:if test="$cookie-username">
              <li class="admin-menu">
                <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="/symphony/" target="_blank">Symphony</a>
                  </li>
                  <li>
                    <a href="?debug" target="_blank">Debug</a>
                  </li>
                  <xsl:if test="not($pt1 = 'toolkit')">
                    <li>
                      <a target="_blank">
                        <xsl:attribute name="href">
                          <xsl:choose>
                            <xsl:when test="$pt1">
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',/data/tags-all-entries/entry[title/@handle = 'home']/@id , '/')" />
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                        <xsl:text> Edit Page</xsl:text>
                      </a>
                    </li>
                  </xsl:if>
                  <li>
                    <a href="{$root}/symphony/logout/">Logout</a>
                  </li>
                </ul>
              </li>
            </xsl:if>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="navbar mobile navbar-inverse hidden-desktop">
    <div class="navbar-inner">
      <form class="navbar-search pull-left" action="get">
        <xsl:call-template name="form-search-action" />
        <a>
          <xsl:call-template name="url-search-home" />
          <span class="icon">s</span>
        </a>
        <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
      </form>
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <div class="nav-collapse">
        <ul class="nav">
          <xsl:if test="/data/live-status/entry/status = 'live' or /data/ustream/status = 'live'">
            <li>
              <a href="{$root}/live/">
                <span class="icon">V</span>
                <xsl:text>Live</xsl:text>
              </a>
            </li>
            <li class="divider-vertical"></li>
          </xsl:if>
          <li><a href="{$root}/building/">Building</a></li>
          <li><a href="{$root}/meetings/">Meetings</a></li>
          <li><a href="{$root}/about/im-new-here/">New Here?</a></li>
          <li><a href="{$root}/give/">Give</a></li>
          <li>
            <a href="{$root}/events/12962/tuesday-sunrise-worship/">
              <span class="icon">Z</span>
              <span class="worship">Sunrise Worship - </span>
              <xsl:value-of select="$main-worship-sunrise" disable-output-escaping="yes" />
            </a>
          </li>
          <li class="divider-vertical"></li>
        </ul>
        <ul class="nav">
          <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-nav = 'Yes') ]">
            <xsl:call-template name="subnav-entry" />
          </xsl:for-each>
        </ul>
      </div>

    </div>
  </div>

</xsl:template>


<xsl:template name="mast">

  <div class="header mast" id="overview">
    <div class="container">
      <div class="row">
        <div class="span12">
          <a href="{$root}" id="branding" class="logo standard">
            <span class="icon">2</span>
          </a>
          <ul class="main visible-desktop">
            <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-nav = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template name="subnavs">

  <xsl:variable name="parent" select="/data/tags-all-entries/entry[@id = /data/tags-entries-by-tag/entry/@id]/parent/item/@id" />

  <xsl:if test="$pt1 and not(/data/tags-entries-by-tag/entry/@id = /data/tags-all-entries/entry[title/@handle = 'home']/@id)">
    <div class="subnavs">
      <xsl:for-each select="/data/tags-all-entries/entry[@id = /data/tags-entries-by-tag/entry/@id]/parent/item/@id">
        <xsl:call-template name="nav-tier" />
      </xsl:for-each>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = /data/tags-entries-by-tag/entry/@id and not(hide-nav = 'Yes')]" />
      </xsl:call-template>
    </div>

    <div class="subnav-mobile hidden-desktop">
      <xsl:for-each select="/data/tags-all-entries/entry[@id = /data/tags-entries-by-tag/entry/@id]/parent/item/@id">
        <xsl:call-template name="nav-tier">
          <xsl:with-param name="mobile" select="'yes'" />
        </xsl:call-template>
      </xsl:for-each>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = /data/tags-entries-by-tag/entry/@id and not(hide-nav = 'Yes')]" />
        <xsl:with-param name="mobile" select="'yes'" />
      </xsl:call-template>
    </div>

  </xsl:if>

</xsl:template>


<xsl:template name="nav-tier">

  <xsl:param name="mobile" />

  <xsl:variable name="node" select="." />

  <xsl:for-each select="/data/tags-all-entries/entry[@id = $node]/parent/item/@id">
    <xsl:choose>
      <xsl:when test="$mobile = 'yes'">
        <xsl:call-template name="nav-tier">
          <xsl:with-param name="mobile" select="'yes'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="nav-tier" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>

  <xsl:choose>
    <xsl:when test="$mobile = 'yes'">
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $node and not(hide-nav = 'Yes')]" />
        <xsl:with-param name="mobile" select="'yes'" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $node and not(hide-nav = 'Yes')]" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template name="subnav-group">

  <xsl:param name="group" />
  <xsl:param name="mobile" />

  <xsl:if test="count($group)">
    <xsl:choose>
      <xsl:when test="$mobile = 'yes'">
        <ul class="nav nav-tabs nav-stacked">
          <xsl:for-each select="$group">
            <xsl:call-template name="subnav-entry" />
          </xsl:for-each>
        </ul>
      </xsl:when>
      <xsl:otherwise>
        <div class="jumbotron masthead" id="overview">
          <div class="subnav visible-desktop">
            <ul class="nav nav-pills">
              <xsl:for-each select="$group">
                <xsl:call-template name="subnav-entry" />
              </xsl:for-each>
            </ul>
          </div>
          <div class="spacer"> </div>
        </div>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:if>
</xsl:template>


<xsl:template name="subnav-entry">

<!--   <xsl:choose>
    <xsl:when test="not($pt1) or $pt1 = 'home'">
      <xsl:variable name="active-parent" select="/data/tags-all-entries/entry[ @id = $ds-tags-filtered.system-id ]/parent/item/@id" />
    </xsl:when>
    <xsl:otherwise>

    </xsl:otherwise>
  </xsl:choose> -->

  <xsl:variable name="active-parent" select="/data/tags-all-entries/entry[ @id = /data/tags-entries-by-tag/entry/@id ]/parent/item/@id" />

  <xsl:variable name="realID" select="@id" />
  <xsl:variable name="node" select="." />

  <li>
    <xsl:attribute name="class">
      <xsl:text>entry</xsl:text>
      <xsl:if test="/data/tags-entries-by-tag/entry/@id = @id or $active-parent = @id or /data/tags-all-entries/entry[ @id = $active-parent ]/parent/item/@id = @id">
        <xsl:text> active</xsl:text>
      </xsl:if>
      <xsl:if test="/data/tags-all-entries/entry[@id]/parent/item/@id = @id">
        <xsl:text> sub</xsl:text>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="position() mod 2 = 0">
          <xsl:text> even</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text> odd</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="position() = 1">
        <xsl:text> first</xsl:text>
      </xsl:if>
      <xsl:if test="position() &gt; 1 and position() &lt; last()">
        <xsl:text> middle</xsl:text>
      </xsl:if>
      <xsl:if test="position() = last()">
        <xsl:text> last</xsl:text>
      </xsl:if>
      <xsl:for-each select="tags/item">
        <xsl:text> category-</xsl:text>
        <xsl:value-of select="@id" />
      </xsl:for-each>
      <xsl:if test="file">
        <xsl:choose>
          <xsl:when test="file/@type = 'application/pdf'">
            <xsl:text> pdf</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text> unknown</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:attribute>
    <a>
      <xsl:call-template name="url-tags" />
      <xsl:value-of select="title" />
    </a>
    <xsl:if test="/data/tags-all-entries/entry[@id]/parent/item/@id = @id">
      <ul class="dropdown-menu">
        <xsl:for-each select="/data/tags-all-entries/entry[parent/item/@id = $realID]">
          <li>
            <a>
              <xsl:call-template name="url-tags" />
              <xsl:value-of select="title" />
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </li>
</xsl:template>


<xsl:template name="navigation-tiles">
  <xsl:param name="entry" />
  <xsl:for-each select="$entry">
    <xsl:variable name="realID">
      <xsl:value-of select="@id"/>
    </xsl:variable>
    <h4><xsl:value-of select="title"/></h4>
    <div class="nav-box">
      <div class="row">
        <xsl:for-each select="/data/tags-all-entries/entry[parent/item/@id = $realID]">
          <div class="span6 box">
            <a href="{$root}{path}">
              <span><xsl:value-of select="title"/></span>
            </a>
          </li>
        </xsl:for-each>
      </div>
    </div>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
