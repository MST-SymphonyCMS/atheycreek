<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="navbar">

<!--   <div class="navbar main navbar-inverse visible-desktop">
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
            <xsl:if test="data/xml-ustream/status = 'live'">
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
  </div> -->

</xsl:template>


<xsl:template name="masthead">

  <div class="masthead">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <ul class="navigation">
            <xsl:for-each select="/data/tags-all-entries/entry[not(parent/item) and not(hide-nav = 'Yes')]">
              <xsl:if test="position() &lt; 4">
                <xsl:call-template name="subnav-entry" />
              </xsl:if>
            </xsl:for-each>
            <li class="logo">
              <a href="{$root}" id="branding" class="logo standard">
                <span class="icon icon-logo"></span>
              </a>
            </li>
            <xsl:for-each select="/data/tags-all-entries/entry[not(parent/item) and not(hide-nav = 'Yes')]">
              <xsl:if test="position() &gt; 3">
                <xsl:call-template name="subnav-entry" />
              </xsl:if>
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template name="subnav-entry">

  <xsl:variable name="active-parent" select="/data/tags-all-entries/entry[ @id = /data/tags-entries-by-tag/entry/@id ]/parent/item/@id" />

  <xsl:variable name="realID" select="@id" />
  <xsl:variable name="node" select="." />

  <li>
    <xsl:choose>
      <xsl:when test="/data/tags-entries-by-tag/entry/@id = @id or $active-parent = @id or /data/tags-all-entries/entry[ @id = $active-parent ]/parent/item/@id = @id">
        <xsl:attribute name="class">
          <xsl:if test="/data/tags-all-entries/entry[@id]/parent/item/@id = @id">
            <xsl:text>dropdown </xsl:text>
          </xsl:if>
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="/data/tags-all-entries/entry[@id]/parent/item/@id = @id">
        <xsl:attribute name="class">dropdown</xsl:attribute>
      </xsl:when>
    </xsl:choose>
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


</xsl:stylesheet>