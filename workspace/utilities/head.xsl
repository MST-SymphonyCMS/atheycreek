<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  

<xsl:template name="head">

  <xsl:variable name="page-title">
    <xsl:if test="string-length($pt1)">
      <xsl:for-each select="/data/tags-all-entries/entry[@id = $pt1]">
        <xsl:choose>
          <xsl:when test="string-length(description)">
            <xsl:value-of select="description" />
          </xsl:when>
          <xsl:when test="string-length(tag)">
            <xsl:value-of select="tag" />
          </xsl:when>
        </xsl:choose>
        <xsl:if test="string-length(description) or string-length(tag)">
          <xsl:text disable-output-escaping="yes"> | </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    <xsl:value-of select="$main-pagetitle" />
  </xsl:variable>

  <xsl:variable name="version">2.0.1</xsl:variable>

  <head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title><xsl:value-of select="$page-title" /></title>

    <meta name="description" content="{$main-meta-description}" />
    <meta name="keywords" content="{$main-meta-keywords}" />
    <meta name="author" content="{$website-name}" />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/assets/img/spacer.gif" data-loading="{$workspace}/assets/img/loading.gif" />

    <link href="{$workspace}/assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/assets/img/apple-touch-icon.png" />

    <link rel="stylesheet" href="{$workspace}/assets/build/main.css" />
    <link rel="stylesheet" href="{$root}/custom/" />
<!--     <link rel="stylesheet" href="{$root}/custom/?page={$ds-tags-filtered.tag}" /> -->
    <link rel="canonical" href="{$current-url}" />

    <link rel="dns-prefetch" href="{$root}" />
    <link rel="dns-prefetch" href="http://use.typekit.com" />

    <xsl:call-template name="typekit"/>

  </head>

</xsl:template>


</xsl:stylesheet>
