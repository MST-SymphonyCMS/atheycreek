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

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>
		<xsl:if test="$pt1 = 'staff'">
			<h3 class="header">Our Staff</h3>
		</xsl:if>

		<xsl:variable name="items-per-row" select="3" />
		<xsl:for-each select="$entries[position() mod $items-per-row = 1]">
			<div class="row">
	      <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
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
					<div id="{member/item/first-name/@handle}-{member/item/last-name/@handle}">
						<xsl:choose>
							<xsl:when test="count($entries) = 1">
								<xsl:call-template name="class-rows">
									<xsl:with-param name="class" select="'span4 offset4'" />
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="count($entries) = 2">
								<xsl:call-template name="class-rows">
									<xsl:with-param name="class" select="'span6'" />
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="class-rows">
									<xsl:with-param name="class" select="'span4'" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:call-template name="image-master">
			        <xsl:with-param name="photo" select="member/item/photo/filename" />
			        <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
			        <xsl:with-param name="width" select="360" />
			        <xsl:with-param name="height" select="360" />
			        <xsl:with-param name="responsive" select="0" />
			        <xsl:with-param name="circle" select="1" />
			      </xsl:call-template>
						<h4>
							<xsl:value-of select="role/item/role" disable-output-escaping="yes" />
						</h4>
						<h3>
							<xsl:value-of select="$name" disable-output-escaping="yes" />
						</h3>
						<div class="content">
							<div class="contact-info">
								<span class="phone">
									<xsl:value-of select="$phone" />
								</span>
								<span class="email">
									<a title="Email {$name}">
										<xsl:attribute name="href">
											<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
											<xsl:value-of select="$email" />
										</xsl:attribute>
										<xsl:value-of select="$email" />
									</a>
								</span>
							</div>
							<xsl:value-of select="member/item/about" disable-output-escaping="yes" />
						</div>
					</div>
				</xsl:for-each>
			</div>
		</xsl:for-each>

	</div>

</xsl:template>


<xsl:template name="members-roles-column-right">

	<xsl:param name="component" />
	<xsl:param name="entries" />

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<h3 class="header">Our Staff</h3>

		<ul class="contacts nav nav-tabs nav-stacked">
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
				<li>
					<xsl:call-template name="class-rows" />
					<a title="Email {$name}" class="mailto">
						<xsl:if test="member/item/anonymize = 'No' or string-length(member/item/email)">
							<xsl:attribute name="href">
								<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
								<xsl:value-of select="$email" />
							</xsl:attribute>
						</xsl:if>
						<div class="pull-left">
							<xsl:call-template name="image-master">
				        <xsl:with-param name="photo" select="member/item/photo/filename" />
				        <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
				        <xsl:with-param name="width" select="144" />
				        <xsl:with-param name="height" select="144" />
				        <xsl:with-param name="responsive" select="0" />
				        <xsl:with-param name="circle" select="1" />
				      </xsl:call-template>
						</div>
						<div class="info">
							<h4>
								<xsl:value-of select="$name" disable-output-escaping="yes" />
							</h4>
							<div>
								<span class="email"><xsl:value-of select="$email" /></span><br />
								<span class="phone"><xsl:value-of select="$phone" /></span>
							</div>
						</div>
					</a>
				</li>
			</xsl:for-each>
			<a href="/about/staff/" class="more">
				<span class="icon">g</span>
				<xsl:text>Meet our staff</xsl:text>
			</a>
		</ul>
	</div>

</xsl:template>


<xsl:template name="members-roles-events-column-right">

	<xsl:param name="component" />
	<xsl:param name="entries" />

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<h3 class="header">Our Staff</h3>

		<ul class="contacts nav nav-tabs nav-stacked">
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
				<li>
					<xsl:call-template name="class-rows" />
					<a title="Email {$name}" class="mailto">
						<xsl:if test="anonymize = 'No' or string-length(email)">
							<xsl:attribute name="href">
								<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
								<xsl:value-of select="$email" />
							</xsl:attribute>
						</xsl:if>

						<div class="pull-left">
							<xsl:call-template name="image-master">
				        <xsl:with-param name="photo" select="photo/filename" />
				        <xsl:with-param name="default" select="'anonymous-4fef5a675fd64-5459168309152.jpg'" />
				        <xsl:with-param name="width" select="144" />
				        <xsl:with-param name="height" select="144" />
				        <xsl:with-param name="responsive" select="0" />
				        <xsl:with-param name="circle" select="1" />
				      </xsl:call-template>
						</div>
						<div class="info">
							<h4>
								<xsl:value-of select="$name" disable-output-escaping="yes" />
							</h4>
							<div>
								<span class="email"><xsl:value-of select="$email" /></span><br />
								<span class="phone"><xsl:value-of select="$phone" /></span>
							</div>
						</div>
					</a>
				</li>
			</xsl:for-each>
			<a href="/about/staff/" class="more">
				<span class="icon">g</span>
				<xsl:text>Meet our staff</xsl:text>
			</a>
		</ul>
	</div>

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
			<xsl:text>&#140;</xsl:text>
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
