<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="head">

  <head>
    <xsl:comment>This is an installation of ChurchDeploy.com — The mission of Church Deploy is to build, as a community, the best church website framework possible and give it away, free of charge.</xsl:comment>
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
    <title>
      <xsl:value-of select="$page-title" />
    </title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="{$main-meta-description}" />
    <meta name="keywords" content="{$main-meta-keywords}" />
    <meta name="author" content="{$website-name}" />
    <meta name="application-name" content="{$website-name}" />
    <meta name="msapplication-tooltip" content="{$page-title}" />
    <meta name="msapplication-starturl" content="{$root}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{$root}" />
    <meta property="og:image" content="{$workspace}/assets/img/apple-touch-icon.png" />
    <meta property="og:title" content="{$page-title}" />
    <meta property="og:description" content="{$main-meta-description}" />

    <link rel="canonical" href="{$current-url}" />

    <link rel="dns-prefetch" href="{$root}" />
    <link rel="dns-prefetch" href="//www.google-analytics.com"/>
    <link rel="dns-prefetch" href="//use.typekit.com" />

    <link rel="shortcut icon" href="{$workspace}/assets/img/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/assets/img/apple-touch-icon.png" />

    <xsl:choose>
      <xsl:when test="contains($root, '.dev')">
        <link rel="stylesheet" href="{$workspace}/assets/build/styles/main.css" />
      </xsl:when>
      <xsl:otherwise>
        <link rel="stylesheet" href="{$workspace}/assets/build/styles/main.min.css" />
      </xsl:otherwise>
    </xsl:choose>

    <link rel="stylesheet" type="text/css" href="//cloud.typography.com/7076432/620626/css/fonts.css" />

  </head>

</xsl:template>


</xsl:stylesheet>
