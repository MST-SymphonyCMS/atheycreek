<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="navbar">

  <nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle menu-activate">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{$root}"><img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjxzdmcgd2lkdGg9IjEyMXB4IiBoZWlnaHQ9IjIwcHgiIHZpZXdCb3g9IjAgMCAxMjEgMjAiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6c2tldGNoPSJodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2gvbnMiPgogICAgPCEtLSBHZW5lcmF0b3I6IFNrZXRjaCAzLjEuMSAoODc2MSkgLSBodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2ggLS0+CiAgICA8dGl0bGU+d29yZG1hcms8L3RpdGxlPgogICAgPGRlc2M+Q3JlYXRlZCB3aXRoIFNrZXRjaC48L2Rlc2M+CiAgICA8ZGVmcz48L2RlZnM+CiAgICA8ZyBpZD0iUGFnZS0xIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBza2V0Y2g6dHlwZT0iTVNQYWdlIj4KICAgICAgICA8ZyBpZD0id29yZG1hcmsiIHNrZXRjaDp0eXBlPSJNU0FydGJvYXJkR3JvdXAiIGZpbGw9IiNGRkZGRkYiPgogICAgICAgICAgICA8ZyBpZD0iSW1wb3J0ZWQtTGF5ZXJzIiBza2V0Y2g6dHlwZT0iTVNMYXllckdyb3VwIj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik04LjYzNjE2NDc3LDE5LjUzOTMxMDMgTDcuNzIwNzcyNzMsMTUuMDIwNjg5NyBMMy4yNzg0Mjg5OCwxNS4wMjA2ODk3IEwyLjM2MjM0NjU5LDE5LjUzOTMxMDMgTC0wLjA2MDc1LDE5LjUzOTMxMDMgTDQuNDA5MjA3MzksMC4zODgyNzU4NjIgTDYuNjQzODQwOTEsMC4zODgyNzU4NjIgTDExLjA4NjE4NDcsMTkuNTM5MzEwMyBMOC42MzYxNjQ3NywxOS41MzkzMTAzIEw4LjYzNjE2NDc3LDE5LjUzOTMxMDMgWiBNNS41MTMwNjI1LDQuMTI3NTg2MjEgTDMuNzA5MjAxNywxMi45NDk2NTUyIEw3LjI5LDEyLjk0OTY1NTIgTDUuNTEzMDYyNSw0LjEyNzU4NjIxIEw1LjUxMzA2MjUsNC4xMjc1ODYyMSBaIiBpZD0iRmlsbC0xIiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMTcuNDM3MzIxLDIuNDU5MzEwMzQgTDE3LjQzNzMyMSwxOS41MzkzMTAzIEwxNS4xMjEyMjczLDE5LjUzOTMxMDMgTDE1LjEyMTIyNzMsMi40NTkzMTAzNCBMMTEuODkwNDMxOCwyLjQ1OTMxMDM0IEwxMS44OTA0MzE4LDAuMzg4Mjc1ODYyIEwyMC42NDExOTMyLDAuMzg4Mjc1ODYyIEwyMC42NDExOTMyLDIuNDU5MzEwMzQgTDE3LjQzNzMyMSwyLjQ1OTMxMDM0IiBpZD0iRmlsbC0yIiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzAuNTEzNzU4NSwxOS41MzkzMTAzIEwzMC41MTM3NTg1LDEwLjg1MTcyNDEgTDI2LjI1OTE4NzUsMTAuODUxNzI0MSBMMjYuMjU5MTg3NSwxOS41MzkzMTAzIEwyMy45NDM3ODQxLDE5LjUzOTMxMDMgTDIzLjk0Mzc4NDEsMC4zODgyNzU4NjIgTDI2LjI1OTE4NzUsMC4zODgyNzU4NjIgTDI2LjI1OTE4NzUsOC43NTM3OTMxIEwzMC41MTM3NTg1LDguNzUzNzkzMSBMMzAuNTEzNzU4NSwwLjM4ODI3NTg2MiBMMzIuODI5MTYxOSwwLjM4ODI3NTg2MiBMMzIuODI5MTYxOSwxOS41MzkzMTAzIEwzMC41MTM3NTg1LDE5LjUzOTMxMDMiIGlkPSJGaWxsLTMiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0zNi43MjY4MjY3LDE5LjUzOTMxMDMgTDM2LjcyNjgyNjcsMC4zODgyNzU4NjIgTDQ0LjEzMTQyMzMsMC4zODgyNzU4NjIgTDQ0LjEzMTQyMzMsMi40NTkzMTAzNCBMMzkuMDQyMjMwMSwyLjQ1OTMxMDM0IEwzOS4wNDIyMzAxLDguODg4Mjc1ODYgTDQzLjQzMTQxNzYsOC44ODgyNzU4NiBMNDMuNDMxNDE3NiwxMC45NTkzMTAzIEwzOS4wNDIyMzAxLDEwLjk1OTMxMDMgTDM5LjA0MjIzMDEsMTcuNDY4OTY1NSBMNDQuMTMxNDIzMywxNy40Njg5NjU1IEw0NC4xMzE0MjMzLDE5LjUzOTMxMDMgTDM2LjcyNjgyNjcsMTkuNTM5MzEwMyIgaWQ9IkZpbGwtNCIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTUyLjk2MTU3MzksMTEuNzkzMTAzNCBMNTIuOTYxNTczOSwxOS41MzkzMTAzIEw1MC42NDYxNzA1LDE5LjUzOTMxMDMgTDUwLjY0NjE3MDUsMTEuNzkzMTAzNCBMNDcuMTE5MjE4NywwLjM4ODI3NTg2MiBMNDkuNjUwMDA4NSwwLjM4ODI3NTg2MiBMNTEuODAzODcyMiw4LjU2NDgyNzU5IEw1My45NTc3MzU4LDAuMzg4Mjc1ODYyIEw1Ni41MTU0NDg5LDAuMzg4Mjc1ODYyIEw1Mi45NjE1NzM5LDExLjc5MzEwMzQiIGlkPSJGaWxsLTUiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik03Mi42Njk0MjYxLDE4LjcwNTUxNzIgQzcxLjkxNTU3MzksMTkuNDA0ODI3NiA3MS4wMDAxODE4LDE5Ljc1NDQ4MjggNjkuNzA3ODYzNiwxOS43NTQ0ODI4IEM2OC4xNzI1NDU1LDE5Ljc1NDQ4MjggNjcuMTUwMTUwNiwxOS4xOTAzNDQ4IDY2LjQyMzIyMTYsMTguMzgyNzU4NiBDNjUuMTAzOTgwMSwxNi45MzAzNDQ4IDY1LjAyMjUxOTksMTQuNzUxNzI0MSA2NS4wMjI1MTk5LDkuOTY0MTM3OTMgQzY1LjAyMjUxOTksNS4xNzU4NjIwNyA2NS4xMDM5ODAxLDIuOTk3MjQxMzggNjYuNDIzMjIxNiwxLjU0NTUxNzI0IEM2Ny4xNTAxNTA2LDAuNzM3OTMxMDM0IDY4LjE3MjU0NTUsMC4xNzMxMDM0NDggNjkuNzA3ODYzNiwwLjE3MzEwMzQ0OCBDNzEuMDI3MTA1MSwwLjE3MzEwMzQ0OCA3MS45OTYzNDM3LDAuNTc2NTUxNzI0IDcyLjc1MDE5NiwxLjMwMjc1ODYyIEM3My42Mzg2NjQ4LDIuMTYzNDQ4MjggNzQuMDk2MzYwOCwzLjUzNTE3MjQxIDc0LjEyMzI4NDEsNS4xMjIwNjg5NyBMNzEuODA3ODgwNyw1LjEyMjA2ODk3IEM3MS44MDc4ODA3LDQuMjg4Mjc1ODYgNzEuNjQ2MzQwOSwzLjQ1NDQ4Mjc2IDcxLjIxNTU2ODIsMi45MTY1NTE3MiBDNzAuODkyNDg4NiwyLjUxMzEwMzQ1IDcwLjQzNDc5MjYsMi4yNDQxMzc5MyA2OS43MDc4NjM2LDIuMjQ0MTM3OTMgQzY4Ljk1NDAxMTQsMi4yNDQxMzc5MyA2OC40NjkzOTIsMi41NCA2OC4xNDYzMTI1LDIuOTcwMzQ0ODMgQzY3LjQ3MzIzMDEsMy44ODQ4Mjc1OSA2Ny4zMzc5MjMzLDUuNDE4NjIwNjkgNjcuMzM3OTIzMyw5Ljk2NDEzNzkzIEM2Ny4zMzc5MjMzLDE0LjUwOTY1NTIgNjcuNDczMjMwMSwxNi4wNDI3NTg2IDY4LjE0NjMxMjUsMTYuOTU3MjQxNCBDNjguNDY5MzkyLDE3LjM4NzU4NjIgNjguOTU0MDExNCwxNy42ODM0NDgzIDY5LjcwNzg2MzYsMTcuNjgzNDQ4MyBDNzAuNDM0NzkyNiwxNy42ODM0NDgzIDcwLjg5MjQ4ODYsMTcuMzg3NTg2MiA3MS4yMTU1NjgyLDE2Ljk4NDEzNzkgQzcxLjY0NjM0MDksMTYuNDQ2MjA2OSA3MS44MzQ4MDQsMTUuNjM5MzEwMyA3MS44MzQ4MDQsMTQuODA1NTE3MiBMNzQuMTUwMjA3NCwxNC44MDU1MTcyIEM3NC4xMjMyODQxLDE2LjQxOTMxMDMgNzMuNjExNzQxNSwxNy44NDQ4Mjc2IDcyLjY2OTQyNjEsMTguNzA1NTE3MiIgaWQ9IkZpbGwtNiIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTg0LjI1Njc5ODMsMTkuNTM5MzEwMyBMODEuNjE4MzE1MywxMS4zMDg5NjU1IEw3OS41MTc2MDgsMTEuMzA4OTY1NSBMNzkuNTE3NjA4LDE5LjUzOTMxMDMgTDc3LjIwMjg5NDksMTkuNTM5MzEwMyBMNzcuMjAyODk0OSwwLjM4ODI3NTg2MiBMODEuNTM3NTQ1NSwwLjM4ODI3NTg2MiBDODQuNDQ1MjYxNCwwLjM4ODI3NTg2MiA4Ni4wNjA2NTkxLDEuNjUyNDEzNzkgODYuMDYwNjU5MSw1Ljg0ODk2NTUyIEM4Ni4wNjA2NTkxLDguNTExMDM0NDggODUuNDE0NSwxMC4wNzE3MjQxIDgzLjc0NTI1NTcsMTAuODUxNzI0MSBMODYuNjc5ODk0OSwxOS41MzkzMTAzIEw4NC4yNTY3OTgzLDE5LjUzOTMxMDMgTDg0LjI1Njc5ODMsMTkuNTM5MzEwMyBaIE04MS41NjQ0Njg4LDIuNDU5MzEwMzQgTDc5LjUxNzYwOCwyLjQ1OTMxMDM0IEw3OS41MTc2MDgsOS4yNjQ4Mjc1OSBMODEuNTY0NDY4OCw5LjI2NDgyNzU5IEM4My4zNDE0MDYzLDkuMjY0ODI3NTkgODMuNzQ1MjU1Nyw3Ljg5MzEwMzQ1IDgzLjc0NTI1NTcsNS44NDg5NjU1MiBDODMuNzQ1MjU1NywzLjgzMTAzNDQ4IDgzLjM0MTQwNjMsMi40NTkzMTAzNCA4MS41NjQ0Njg4LDIuNDU5MzEwMzQgTDgxLjU2NDQ2ODgsMi40NTkzMTAzNCBaIiBpZD0iRmlsbC03IiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNODkuNjIyMTI3OCwxOS41MzkzMTAzIEw4OS42MjIxMjc4LDAuMzg4Mjc1ODYyIEw5Ny4wMjYwMzQxLDAuMzg4Mjc1ODYyIEw5Ny4wMjYwMzQxLDIuNDU5MzEwMzQgTDkxLjkzNzUzMTMsMi40NTkzMTAzNCBMOTEuOTM3NTMxMyw4Ljg4ODI3NTg2IEw5Ni4zMjYwMjg0LDguODg4Mjc1ODYgTDk2LjMyNjAyODQsMTAuOTU5MzEwMyBMOTEuOTM3NTMxMywxMC45NTkzMTAzIEw5MS45Mzc1MzEzLDE3LjQ2ODk2NTUgTDk3LjAyNjAzNDEsMTcuNDY4OTY1NSBMOTcuMDI2MDM0MSwxOS41MzkzMTAzIEw4OS42MjIxMjc4LDE5LjUzOTMxMDMiIGlkPSJGaWxsLTgiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMDAuMjU2ODMsMTkuNTM5MzEwMyBMMTAwLjI1NjgzLDAuMzg4Mjc1ODYyIEwxMDcuNjYwNzM2LDAuMzg4Mjc1ODYyIEwxMDcuNjYwNzM2LDIuNDU5MzEwMzQgTDEwMi41NzIyMzMsMi40NTkzMTAzNCBMMTAyLjU3MjIzMyw4Ljg4ODI3NTg2IEwxMDYuOTYwNzMsOC44ODgyNzU4NiBMMTA2Ljk2MDczLDEwLjk1OTMxMDMgTDEwMi41NzIyMzMsMTAuOTU5MzEwMyBMMTAyLjU3MjIzMywxNy40Njg5NjU1IEwxMDcuNjYwNzM2LDE3LjQ2ODk2NTUgTDEwNy42NjA3MzYsMTkuNTM5MzEwMyBMMTAwLjI1NjgzLDE5LjUzOTMxMDMiIGlkPSJGaWxsLTkiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMTguMjc2MTA4LDE5LjUzOTMxMDMgTDExNC44ODM3NzMsMTAuODc4NjIwNyBMMTEzLjIxNDUyOCwxNC4xODY4OTY2IEwxMTMuMjE0NTI4LDE5LjUzOTMxMDMgTDExMC44OTkxMjUsMTkuNTM5MzEwMyBMMTEwLjg5OTEyNSwwLjM4ODI3NTg2MiBMMTEzLjIxNDUyOCwwLjM4ODI3NTg2MiBMMTEzLjIxNDUyOCwxMC4wOTg2MjA3IEwxMTcuODQ1MzM1LDAuMzg4Mjc1ODYyIEwxMjAuMjE0NTg1LDAuMzg4Mjc1ODYyIEwxMTYuMzM3NjMxLDguMjk2NTUxNzIgTDEyMC43Nzk5NzQsMTkuNTM5MzEwMyBMMTE4LjI3NjEwOCwxOS41MzkzMTAzIiBpZD0iRmlsbC0xMCIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+PC9wYXRoPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4=" alt="Athey Creek"/></a>
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
