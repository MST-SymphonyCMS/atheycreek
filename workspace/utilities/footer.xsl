<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="twitter">

  <div class="twitter">
    <div class="center">
      <i class="icon-twitter icon-medium"></i>
    </div>
    <h3>On Twitter</h3>
    <xsl:for-each select="/data/twitter-search/item[position() &lt; 2]">
      <p class="lead">
        <em>
          <xsl:value-of select="text" disable-output-escaping="yes" />
          <xsl:text>&#160;&#160;</xsl:text>
        </em>
      </p>
      <h4>
        <strong>
          <xsl:value-of select="substring(created-at,9,2)"/>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="substring(created-at,5,4)"/>
          <xsl:value-of select="substring-after(created-at,'+0000 ')" />
        </strong>
      </h4>
    </xsl:for-each>
  </div>

</xsl:template>


<xsl:template name="footer">

  <footer class="footer">
    <div class="container">
      <div class="content">
        <ul>
          <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') and hide = 'No' ]">
            <xsl:sort select="order" order="descending" />
            <xsl:call-template name="nav-parent" />
          </xsl:for-each>
          <li class="social">
            <a href="/"><i class="fi-social-twitter"></i></a>
          </li>
          <li class="social">
            <a href="/"><i class="fi-social-facebook"></i></a>
          </li>
          <li class="social">
            <a href="/"><i class="fi-social-vimeo"></i></a>
          </li>
          <li class="social">
            <a href="/"><i class="fi-social-spotify"></i></a>
          </li>
        </ul>
        <p>
          <xsl:text>© 1996—</xsl:text>
          <xsl:value-of select="$this-year" />
          <xsl:text>. </xsl:text>
          <a href="{$root}"><xsl:value-of select="$website-name" /></a>
          <xsl:text>. All&#160;rights&#160;reserved. Some photos courtesy of </xsl:text>
          <a href="http://fiftyfootshadows.net" target="_blank">John Carey</a>
          <xsl:text>.</xsl:text>
        </p>
      </div>
    </div>
  </footer>

</xsl:template>


</xsl:stylesheet>
