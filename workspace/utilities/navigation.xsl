<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="top-menu">
  <a class="close-top-menu mobile" href="#"><span>×</span></a>
  <ul class="top-menu">
    <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') and hide = 'No' ]">
      <xsl:call-template name="nav-full" />
    </xsl:for-each>

    <li class="has-dropdown">
      <a href="#">
        <i class="fi-wrench"></i>
        <xsl:text> Admin</xsl:text>
      </a>
      <ul class="dropdown">
        <xsl:for-each select="/data/tags-all-entries/entry[ admin = 'Yes' ]">
          <xsl:call-template name="nav-full" />
        </xsl:for-each>
        <xsl:if test="$cookie-username">
          <li><a href="/symphony/" target="_blank">Symphony</a></li>
          <li><a href="?debug" target="_blank">Debug</a></li>
          <xsl:if test="not($pt1 = 'toolkit')">
            <li>
              <a>
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="$pt1">
                      <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',/data/tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:text> Edit Page</xsl:text>
              </a>
            </li>
          </xsl:if>
          <li><a href="{$root}/symphony/logout/">Logout</a></li>
        </xsl:if>
      </ul>
    </li>
    <form class="navbar-form navbar-right" action="get">
      <xsl:call-template name="form-search-action" />
      <input name="keywords" type="text" placeholder="Search" autocomplete="off" onclick="this.select()" />
    </form>
  </ul>

</xsl:template>


<xsl:template name="navbar">

  <nav>
    <ul>
      <li class="brand">
        <a href="{$root}"><i class="icon-full-outline"></i></a>
      </li>
      <li class="top-menu-toggle"><a class="top-toggle" href="#">&#160;<span></span></a></li>
      <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') and hide = 'No' ]">
        <xsl:sort select="order" order="descending" />
        <xsl:call-template name="nav-parent" />
      </xsl:for-each>
    </ul>
  </nav>

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
            <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template name="subnavs">

  <xsl:variable name="parent" select="/data/tags-all-entries/entry[@id = $ds-tags-filtered.system-id]/parent/item/@id" />

  <xsl:if test="$pt1 and not($ds-tags-filtered.system-id = /data/tags-all-entries/entry[tag/@handle = 'home']/@id)">
    <div class="subnavs">
      <xsl:for-each select="/data/tags-all-entries/entry[@id = $ds-tags-filtered.system-id]/parent/item/@id">
        <xsl:call-template name="nav-tier" />
      </xsl:for-each>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $ds-tags-filtered.system-id and not(hide-from-header = 'Yes')]" />
      </xsl:call-template>
    </div>

    <div class="subnav-mobile hidden-desktop">
      <xsl:for-each select="/data/tags-all-entries/entry[@id = $ds-tags-filtered.system-id]/parent/item/@id">
        <xsl:call-template name="nav-tier">
          <xsl:with-param name="mobile" select="'yes'" />
        </xsl:call-template>
      </xsl:for-each>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $ds-tags-filtered.system-id and not(hide-from-header = 'Yes')]" />
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
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
        <xsl:with-param name="mobile" select="'yes'" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="subnav-group">
        <xsl:with-param name="group" select="/data/tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="nav-parent">

  <xsl:variable name="active-parent" select="/data/tags-all-entries/entry[ @id = $ds-tags-filtered.system-id ]/parent/item/@id" />
  <xsl:variable name="realID" select="@id" />
  <xsl:variable name="node" select="." />

  <li>
    <xsl:attribute name="class">
      <xsl:if test="$ds-tags-filtered.system-id = @id or $active-parent = @id or /data/tags-all-entries/entry[ @id = $active-parent and hide = 'No' ]/parent/item/@id = @id">
        <xsl:text>active</xsl:text>
      </xsl:if>
    </xsl:attribute>

    <a>
      <xsl:call-template name="url-tags" />
      <xsl:value-of select="tag" disable-output-escaping="yes" />
    </a>
  </li>

</xsl:template>


<xsl:template name="nav-full">

  <xsl:variable name="active-parent" select="/data/tags-all-entries/entry[ @id = $ds-tags-filtered.system-id ]/parent/item/@id" />
  <xsl:variable name="realID" select="@id" />
  <xsl:variable name="node" select="." />

  <li>
    <xsl:attribute name="class">
      <xsl:text>entry</xsl:text>
      <xsl:if test="$ds-tags-filtered.system-id = @id or $active-parent = @id or /data/tags-all-entries/entry[ @id = $active-parent and hide = 'No' ]/parent/item/@id = @id">
        <xsl:text> active</xsl:text>
      </xsl:if>
      <xsl:if test="/data/tags-all-entries/entry[@id]/parent[@items != 0]/item/@id = @id">
        <xsl:text> has-dropdown</xsl:text>
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
    <xsl:choose>
      <xsl:when test="/data/tags-all-entries/entry[@id]/parent[@items != 0]/item/@id = @id">
        <a href="#" class="arrow">
          <xsl:value-of select="tag" disable-output-escaping="yes" />
        </a>
      </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:call-template name="url-tags" />
          <xsl:value-of select="tag" disable-output-escaping="yes" />
        </a>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:if test="/data/tags-all-entries/entry[@id and hide = 'No']/parent[@items != 0]/item/@id = @id">
      <ul class="dropdown">
        <xsl:for-each select="/data/tags-all-entries/entry[parent/item/@id = $realID]">
          <li>
            <xsl:if test="/data/tags-all-entries/entry[@id]/parent[@items != 0]/item/@id = @id">
              <xsl:attribute name="class">has-dropdown</xsl:attribute>
            </xsl:if>
            <a>
              <xsl:call-template name="url-tags" />
              <xsl:value-of select="tag" disable-output-escaping="yes" />
            </a>
            <xsl:variable name="nestedID">
              <xsl:value-of select="@id" />
            </xsl:variable>
            <xsl:if test="/data/tags-all-entries/entry[@id]/parent[@items != 0]/item/@id = @id">
              <ul class="dropdown">
                <xsl:for-each select="/data/tags-all-entries/entry[parent/item/@id = $nestedID and hide = 'No']">
                  <li>
                    <a>
                      <xsl:call-template name="url-tags" />
                      <xsl:value-of select="tag" disable-output-escaping="yes" />
                    </a>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </li>
</xsl:template>


</xsl:stylesheet>