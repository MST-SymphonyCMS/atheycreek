<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page-live">

  <xsl:if test="$pt1 = 'live'">
    <div class="broadcast-wrapper">
       <div class="container">
         <div class="row">
           <div class="span12">
            <xsl:choose>
              <xsl:when test="/data/status-all-entries/entry[name = 'ustream-status']/content = 'live'">
                <h2>Live Broadcast</h2>
              </xsl:when>
              <xsl:otherwise>
                <h2>Live Broadcast (Offline)</h2>
              </xsl:otherwise>
            </xsl:choose>
           </div>
         </div>
       </div>
     </div>
    <xsl:choose>
      <xsl:when test="/data/status-all-entries/entry[name = 'ustream-status']/content = 'live'">
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='broadcast-live']/content)" disable-output-escaping="yes" />
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='broadcast-offline']/content)" disable-output-escaping="yes" />
        <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>

</xsl:template>


</xsl:stylesheet>