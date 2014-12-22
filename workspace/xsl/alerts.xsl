<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="alerts">

	<xsl:if test="/data/live-status/entry/status = 'live' or /data/ustream/status = 'live'">
    <div id="14097" class="alert alert-danger">
      <div class="container">
        <span>Athey Creek is currently broadcasting live.</span>
        <a href="/live/">Watch Live &#8594;</a>
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
            <xsl:when test="urgent = 'Yes'">
              <xsl:text>alert alert-danger</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>alert alert-success</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <div class="container">
          <span>
            <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
          </span>
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
            <xsl:when test="urgent = 'Yes'">
              <xsl:text>alert alert-danger</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>alert alert-success</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <div class="container">
          <span>
            <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
          </span>
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