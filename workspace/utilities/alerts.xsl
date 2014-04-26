<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="alerts">

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