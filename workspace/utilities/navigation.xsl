<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="navbar">

  <nav class="navbar navbar-inverse hidden-desktop" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle menu-activate">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{$root}">Athey Creek</a>
      </div>
    </div>
  </nav>

</xsl:template>

<xsl:template name="side-menu">

  <div class="snap-drawers">
    <div class="snap-drawer snap-drawer-right">
      <div class="brand">
        <a href="{$root}"><span class="icon icon-logo"></span></a>
      </div>
      <ul class="menu">
        <xsl:for-each select="/data/tags-all-entries/entry[not(parent/item) and not(hide-nav = 'Yes')]">
          <xsl:call-template name="subnav-entry" />
        </xsl:for-each>
<!--         <li class="social">
          <div id="facebook-side" class="facebook-side" data-url="http://2015.thegospelcoalition.org/" data-text="The Gospel Coalition 2015 National Conference" data-title="Like"></div>
        </li>
        <li class="social">
          <div id="twitter-side" class="twitter-side" data-url="http://2015.thegospelcoalition.org/" data-text="The Gospel Coalition 2015 National Conference" data-title="Tweet"></div>
        </li> -->
      </ul>
    </div>
  </div>

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
