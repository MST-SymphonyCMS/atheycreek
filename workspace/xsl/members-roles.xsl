<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-members-roles">
  <xsl:param name="component" />
  <xsl:param name="position" />
  <xsl:param name="entries" />

  <xsl:if test="count($entries)">
    <xsl:choose>
      <xsl:when test="$position = 'column-full-width'">
        <xsl:call-template name="members-roles-column-full-width">
          <xsl:with-param name="component" select="$component" />
          <xsl:with-param name="entries" select="$entries" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$position = 'column-center'">
      </xsl:when>
      <xsl:when test="$position = 'column-right'">
        <h4>Our Staff</h4>
        <xsl:call-template name="members-roles-column-right">
          <xsl:with-param name="component" select="$component" />
          <xsl:with-param name="entries" select="$entries" />
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:if>
</xsl:template>


<xsl:template name="members-roles-column-full-width">
  <xsl:param name="component" />
  <xsl:param name="entries" />

  <div class="members-roles members-roles-full-width">

    <div class="container">
      <xsl:variable name="items-per-row" select="2" />
      <xsl:for-each select="$entries[position() mod $items-per-row = 1]">
        <div class="row">
          <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
            <xsl:variable name="name">
              <xsl:value-of select="member/item/first-name" disable-output-escaping="yes" />
              <xsl:text> </xsl:text>
              <xsl:value-of select="member/item/last-name" disable-output-escaping="yes" />
            </xsl:variable>
            <xsl:variable name="phone">
              <xsl:call-template name="members-roles-phone-number-anonymize" />
            </xsl:variable>
            <xsl:variable name="email">
              <xsl:call-template name="members-roles-email-anonymize" />
            </xsl:variable>
            <div id="{member/item/first-name/@handle}-{member/item/last-name/@handle}">
              <xsl:choose>
                <xsl:when test="count($entries) = 1">
                  <xsl:attribute name="class">member col-md-6 col-md-offset-3</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="class">member col-md-6</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:call-template name="image-master">
                <xsl:with-param name="photo" select="member/item/photo/filename" />
                <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
                <xsl:with-param name="width" select="500" />
                <xsl:with-param name="height" select="500" />
                <xsl:with-param name="responsive" select="0" />
                <xsl:with-param name="circle" select="1" />
              </xsl:call-template>
              <h5 class="title">
                <xsl:value-of select="role/item/role" disable-output-escaping="yes" />
              </h5>
              <h3 class="name">
                <xsl:value-of select="$name" disable-output-escaping="yes" />
              </h3>
              <p class="contact-details">
                <span class="email glyphicon glyphicon-phone-alt" data-toggle="popover" data-placement="top" title="Phone" data-content="{$phone}"></span>
                <xsl:if test="string-length($email) &gt; 1">
                  <span class="phone glyphicon glyphicon-envelope" data-toggle="popover" data-placement="top" title="Email" data-html="true">
                    <xsl:attribute name="data-content">
                      <xsl:text>&lt;a href="mailto:</xsl:text>
                      <xsl:value-of select="$email"/>
                      <xsl:text>"&gt;</xsl:text>
                      <xsl:value-of select="$email"/>
                      <xsl:text>&lt;/a&gt;</xsl:text>
                    </xsl:attribute>
                  </span>
                </xsl:if>
              </p>
              <div class="description">
                <xsl:value-of select="member/item/about" disable-output-escaping="yes" />
              </div>
            </div><!-- .member -->
          </xsl:for-each>
        </div><!-- .row -->
      </xsl:for-each>
    </div><!-- .container -->
  </div><!-- .members-roles-full-width -->
</xsl:template>


<xsl:template name="members-roles-column-right">
  <xsl:param name="component" />
  <xsl:param name="entries" />

  <div class="members-roles members-roles-column-right">

    <xsl:for-each select="$entries">
      <xsl:variable name="name">
        <xsl:value-of select="member/item/first-name" disable-output-escaping="yes" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="member/item/last-name" disable-output-escaping="yes" />
      </xsl:variable>
      <xsl:variable name="email">
        <xsl:call-template name="members-roles-email-anonymize" />
      </xsl:variable>
      <xsl:variable name="phone">
        <xsl:call-template name="members-roles-phone-number-anonymize" />
      </xsl:variable>
      <xsl:variable name="photo">
        <xsl:value-of select="member/item/photo/filename"/>
      </xsl:variable>
      <xsl:variable name="anonymize">
        <xsl:value-of select="member/item/anonymize"/>
      </xsl:variable>

      <xsl:call-template name="members-roles-sidebar-entry">
        <xsl:with-param name="entries" select="$entries" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="email" select="$email" />
        <xsl:with-param name="phone" select="$phone" />
        <xsl:with-param name="photo" select="$photo" />
        <xsl:with-param name="anonymize" select="$anonymize" />
      </xsl:call-template>
    </xsl:for-each>
  </div><!-- .members-roles -->
</xsl:template>


<xsl:template name="members-roles-events-column-right">
  <xsl:param name="component" />
  <xsl:param name="entries" />

  <div class="members-roles members-roles-column-right">
    <h4>Our Staff</h4>
    <xsl:for-each select="$entries">
      <xsl:variable name="name">
        <xsl:value-of select="display" disable-output-escaping="yes" />
      </xsl:variable>
      <xsl:variable name="email">
        <xsl:call-template name="members-roles-email-events-anonymize" />
      </xsl:variable>
      <xsl:variable name="phone">
        <xsl:call-template name="members-roles-phone-number-events-anonymize" />
      </xsl:variable>
      <xsl:variable name="photo">
        <xsl:value-of select="photo/filename"/>
      </xsl:variable>
      <xsl:variable name="anonymize">
        <xsl:value-of select="anonymize"/>
      </xsl:variable>

      <xsl:call-template name="members-roles-sidebar-entry">
        <xsl:with-param name="entries" select="$entries" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="email" select="$email" />
        <xsl:with-param name="phone" select="$phone" />
        <xsl:with-param name="photo" select="$photo" />
        <xsl:with-param name="anonymize" select="$anonymize" />
      </xsl:call-template>
    </xsl:for-each>
  </div><!-- .members-roles -->
</xsl:template>


<xsl:template name="members-roles-sidebar-entry">
  <xsl:param name="component" />
  <xsl:param name="entries" />
  <xsl:param name="name" />
  <xsl:param name="email" />
  <xsl:param name="phone" />
  <xsl:param name="photo" />
  <xsl:param name="anonymize" />
  <xsl:param name="events" />

  <xsl:if test="position() != 1">
    <hr/>
  </xsl:if>
    <div class="member">
      <a title="Email {$name}">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="string-length($email) and $anonymize = 'No'">
              <xsl:text disable-output-escaping="yes">mailto:</xsl:text>
              <xsl:value-of select="$email" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>javascript:void(0)</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <xsl:call-template name="image-master">
          <xsl:with-param name="photo" select="$photo" />
          <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
          <xsl:with-param name="width" select="400" />
          <xsl:with-param name="height" select="400" />
          <xsl:with-param name="responsive" select="0" />
          <xsl:with-param name="circle" select="1" />
        </xsl:call-template>
        <div class="info">
          <h5>
            <xsl:value-of select="$name" disable-output-escaping="yes" />
          </h5>
          <div>
            <xsl:if test="string-length($email) and $anonymize = 'No'">
              <span class="email"><xsl:value-of select="$email" /></span>
            </xsl:if>
            <xsl:if test="string-length($phone)">
              <span class="phone"><xsl:value-of select="$phone" /></span>
            </xsl:if>
          </div>
        </div>
      </a>
    </div><!-- .member -->
</xsl:template>


<xsl:template name="members-roles-email-anonymize">
  <xsl:choose>
    <xsl:when test="member/item/anonymize = 'Yes' or not(string-length(member/item/email))">
      <xsl:text>&#140;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="member/item/email" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="members-roles-phone-number-anonymize">
  <xsl:choose>
    <xsl:when test="member/item/anonymize = 'Yes' or not(string-length(member/item/phone-number))">
      <xsl:value-of select="$main-phone" disable-output-escaping="yes" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="member/item/phone-number" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="members-roles-email-events-anonymize">
  <xsl:choose>
    <xsl:when test="anonymize = 'Yes' or not(string-length(email))">
      <xsl:text></xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="email" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="members-roles-phone-number-events-anonymize">
  <xsl:choose>
    <xsl:when test="anonymize = 'Yes' or not(string-length(phone-number))">
      <xsl:value-of select="$main-phone" disable-output-escaping="yes" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="phone-number" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>
