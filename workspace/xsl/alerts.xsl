<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="alerts">

	<xsl:if test="/data/live-status/entry/status = 'live' or /data/ustream/status = 'live'">
    <div id="14097" class="alert alertLive">
      <!-- <button type="button" class="close" data-dismiss="alert">×</button> -->
      <div class="container">
        <p>Athey Creek is currently broadcasting live. <a href="/live/">Watch Live &#8594;</a></p>
      </div>
    </div>
	</xsl:if>

   <xsl:if test="/data/alerts-global">

    <xsl:for-each select="/data/alerts-global/entry">
      <div>

        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>

        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="type = 'warning'">
              <xsl:text>alert alert-error</xsl:text>
            </xsl:when>
            <xsl:when test="type = 'success'">
              <xsl:text>alert alert-success</xsl:text>
            </xsl:when>
            <xsl:when test="type = 'info'">
              <xsl:text>alert alert-info</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>alert</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <!-- <xsl:if test="can-be-closed = 'Yes'">
          <button type="button" class="close" data-dismiss="alert">×</button>
        </xsl:if> -->

        <div class="container">

          <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
          <xsl:if test="url">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url" />
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:text>_blank</xsl:text>
              </xsl:attribute>
              <xsl:text>More Info &#8594;</xsl:text>
            </a>
          </xsl:if>

        </div>

      </div>
    </xsl:for-each>


  </xsl:if>

  <xsl:if test="/data/alerts-entries-by-tag">

    <xsl:for-each select="/data/alerts-entries-by-tag/entry">

      <div>

        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>

        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="type = 'warning'">
              <xsl:text>alert alert-error</xsl:text>
            </xsl:when>
            <xsl:when test="type = 'success'">
              <xsl:text>alert alert-success</xsl:text>
            </xsl:when>
            <xsl:when test="type = 'info'">
              <xsl:text>alert alert-info</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>alert</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <!-- <xsl:if test="can-be-closed = 'Yes'">
          <button type="button" class="close" data-dismiss="alert">×</button>
        </xsl:if> -->

        <div class="container">

          <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
          <xsl:if test="url">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url" />
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:text>_blank</xsl:text>
              </xsl:attribute>
              <xsl:text>More Info &#8594;</xsl:text>
            </a>
          </xsl:if>

        </div>

      </div>

    </xsl:for-each>


  </xsl:if>


</xsl:template>


<xsl:template name="alerts-home">

  <div class="alerts">
    <xsl:comment><![CDATA[[if lt IE 9]> <div class="alert alert-error">
        <div class="container">
            <p>For the best experience on our site download a modern browser:
              <a href="https://www.google.com/chrome/">Google Chrome &#8594;</a>
            </p>
        </div>
      </div> <![endif]]]></xsl:comment>
    <xsl:call-template name="alerts" />
  </div>

</xsl:template>


</xsl:stylesheet>