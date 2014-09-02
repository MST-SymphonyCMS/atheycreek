<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-locations">

	<xsl:param name="component" />
	<xsl:param name="entries" />
	<xsl:param name="position" />

	<xsl:if test="count($entries)">

		<xsl:choose>
			<xsl:when test="$position = 'column-full-width'">
				<xsl:call-template name="locations-column-full-width">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$position = 'column-center'">
			</xsl:when>
			<xsl:when test="$position = 'column-right'">
				<xsl:call-template name="locations-column-right">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>

	</xsl:if>
</xsl:template>


<xsl:template name="locations-column-full-width">
	<xsl:param name="component" />
	<xsl:param name="entries" />

	<br/><br/>
	<div class="row hg-box">
		<div class="span4 hg-sidebar">
			<ul class="nav nav-tabs nav-stacked">
				<li class="active">
					<a href="#welcome" data-toggle="tab">
						<i class="glyphicon-chevron-right pull-right visible-desktop"></i>
						<xsl:text>Welcome</xsl:text>
					</a>
				</li>
				<xsl:for-each select="/data/locations-groups/entry">
					<li>
						<a href="#{name-group/@handle}" data-toggle="tab">
							<i class="glyphicon-chevron-right pull-right visible-desktop"></i>
							<xsl:value-of select="name-group"/>
							<xsl:if test="full = 'Yes'">
								<span class="label allcaps" style="position:relative;top:-1px;left:5px;">Full</span>
							</xsl:if>
							<xsl:if test="new = 'Yes'">
								<span class="label label-warning allcaps" style="position:relative;top:-1px;left:5px;">New</span>
							</xsl:if>
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div><!-- .span4 -->
		<div class="span8">
			<div class="tab-content">
				<div id="welcome" class="tab-pane active">
					<xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='home-group-overview']/content)" disable-output-escaping="yes" />
				</div>
				<xsl:for-each select="/data/locations-groups/entry">
					<xsl:variable name="address">
						<xsl:call-template name="url-encode">
							<xsl:with-param name="str" select="concat(address, ' ', city, ' ', state, ' ', zip)" />
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="latlon">
						<xsl:value-of select="latitude" />
						<xsl:text>,</xsl:text>
						<xsl:value-of select="longitude" />
					</xsl:variable>
					<div id="{name-group/@handle}" class="tab-pane">
						<xsl:if test="string-length(alert) &gt; 0">
							<div class="alert alert-error" style="margin-top:15px;">
								<xsl:value-of select="alert"/>
							</div>
						</xsl:if>
					  <h3>
					  	<xsl:value-of select="name-group"/>
					  	<!-- <xsl:value-of select="city"/> -->
							<span class="badge pull-right allcaps" style="position:relative;top:12px">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="full = 'Yes'">
											<xsl:text>label label-warning pull-right allcaps</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>label label-success pull-right allcaps</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:choose>
									<xsl:when test="full = 'Yes'">
										<xsl:text>Full</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Open</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</span>
					  </h3>
					  <hr style="margin-top:-7px;"/>
					  <div class="row component component-text">
					  	<div class="span4">
					  		<address>
									<span>
										<xsl:value-of select="name-formal"/>
										<xsl:text> (Host)</xsl:text>
									</span>
									<br/>
									<xsl:call-template name="location-address"/>
								</address>
								<p>
									<span class="icon">t</span>
									<xsl:text> </xsl:text>
									<xsl:value-of select="frequency"/>
									<br/>
									<span style="position:relative;top:-15px;">
										<span class="icon" style="font-size:1.8em;position:relative;left:-3px;">/</span>
										<span style="position:relative;left:-4px">Childcare: </span>
										<xsl:choose>
											<xsl:when test="childcare = 'Yes'">
												<span class="label label-success allcaps">Yes</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="label label-important allcaps">No</span>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</p>
								<div style="position:relative;top:-15px;">
									<xsl:value-of select="description" disable-output-escaping="yes"/>
								</div>
					  	</div>
					  	<div class="span4">
					  		<img class="map-image" width="358px" height="294px">
									<xsl:attribute name="src">
										<xsl:text>http://maps.googleapis.com/maps/api/staticmap?center=</xsl:text>
										<xsl:choose>
											<xsl:when test="string-length(longitude) and string-length(latitude)">
											 	<xsl:value-of select="$latlon" />
											 	<xsl:text>&amp;zoom=14&amp;size=358x294&amp;markers=</xsl:text>
											 	<xsl:value-of select="$latlon" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$address" />
											 	<xsl:text>&amp;zoom=14&amp;size=358x294&amp;markers=</xsl:text>
											 	<xsl:value-of select="$address" />
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text>&amp;maptype=roadmap&amp;sensor=false&amp;scale=2&amp;style=saturation:-50&amp;visual_refresh=true</xsl:text>
									</xsl:attribute>
								</img>
								<div class="column-right" style="margin-top:0;">
									<a class="more" target="_blank">
										<xsl:call-template name="location-href">
											<xsl:with-param name="address" select="$address" />
										</xsl:call-template>
										<span class="icon">G</span>
										<xsl:text> View on Google Maps</xsl:text>
									</a>
								</div>

					  	</div>
					  </div>
					  <hr/>

					  <div class="column-full-width">
					  	<div class="component component-members-roles">
					  		<div class="row">
					  			<xsl:for-each select="leaders/item">
					  				<xsl:variable name="leader-id" select="member/item/@id" />
					  				<xsl:variable name="name">
											<xsl:value-of select="/data/members-by-id/entry[@id = $leader-id]/display" />
										</xsl:variable>
										<xsl:variable name="email">
											<xsl:value-of select="/data/members-by-id/entry[@id = $leader-id]/email" />
										</xsl:variable>
										<xsl:variable name="phone">
											<xsl:value-of select="/data/members-by-id/entry[@id = $leader-id]/phone-number" />
										</xsl:variable>
					  				<div class="entry clearfix odd first span4">
						  				<xsl:call-template name="members-roles-avatar">
													<xsl:with-param name="filename" select="/data/members-by-id/entry[@id = $leader-id]/photo/file/filename" />
													<xsl:with-param name="height" select="180" />
													<xsl:with-param name="width" select="180" />
												</xsl:call-template>
						  				<h4><xsl:value-of select="role/item"/></h4>
						  				<h3><xsl:value-of select="$name" disable-output-escaping="yes" /></h3>
						  				<div class="content">
						  					<div class="contact-info">
						  						<span class="phone"><xsl:value-of select="$phone" /></span>
						  						<span class="email">
						  							<a title="Email {/data/members-by-id/entry[@id = $leader-id]/display}" class="mailto">
															<xsl:attribute name="href">
																<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
																<xsl:value-of select="$email" />
															</xsl:attribute>
															<small class="email"><xsl:value-of select="$email" /></small>
														</a>
						  						</span>
						  					</div>
						  				</div>
						  			</div><!-- .entry -->
					  			</xsl:for-each>
					  		</div><!-- .row -->
					  	</div><!-- .component-members-roles -->
					  </div><!-- .column-full-width -->
					</div>
				</xsl:for-each>
			</div><!-- .tab-content -->
		</div><!-- .span8 -->
	</div><!-- .row -->

</xsl:template>


<xsl:template name="locations-column-right">

	<xsl:param name="component" />
	<xsl:param name="entries" />

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>
		<h3 class="header">
			<xsl:call-template name="pluralize">
				<xsl:with-param name="singular" select="'Location'"  />
				<xsl:with-param name="plural"   select="'Locations'" />
				<xsl:with-param name="xpath"    select="$entries"    />
			</xsl:call-template>
		</h3>
		<xsl:for-each select="$entries">
			<xsl:variable name="address">
				<xsl:call-template name="url-encode">
					<xsl:with-param name="str" select="concat(address, ' ', city, ' ', state, ' ', zip)" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="latlon">
				<xsl:value-of select="latitude" />
				<xsl:text>,</xsl:text>
				<xsl:value-of select="longitude" />
			</xsl:variable>
			<div class="wrapper">
				<xsl:call-template name="class-rows" />
				<xsl:if test="count($entries) > 1">
					<h5 style="font-family: 'ff-tisa-web-pro', Georgia, Times, serif; border-bottom: 1px solid #ddd; font-weight: normal; font-size: 16px; font-style:italic; padding-bottom: 10px; margin-bottom: 20px">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:text>DROPOFF</xsl:text>
							</xsl:when>
							<xsl:when test="position() = 2">
								<xsl:text>PICKUP</xsl:text>
							</xsl:when>
						</xsl:choose>
					</h5>
				</xsl:if>
				<xsl:if test="string-length(longitude) and string-length(latitude) or string-length(address)">
					<div class="map">
						<img>
							<xsl:attribute name="src">
								<xsl:text>http://maps.googleapis.com/maps/api/staticmap?center=</xsl:text>
								<xsl:choose>
									<xsl:when test="string-length(longitude) and string-length(latitude)">
									 	<xsl:value-of select="$latlon" />
									 	<xsl:text>&amp;zoom=14&amp;size=300x300&amp;markers=</xsl:text>
									 	<xsl:value-of select="$latlon" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$address" />
									 	<xsl:text>&amp;zoom=14&amp;size=300x300&amp;markers=</xsl:text>
									 	<xsl:value-of select="$address" />
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text>&amp;maptype=roadmap&amp;sensor=false&amp;scale=2&amp;style=saturation:-50&amp;visual_refresh=true</xsl:text>
							</xsl:attribute>
						</img>
						<div class="screen"></div>
						<address>
							<h5>
								<xsl:call-template name="location-name" />
							</h5>
							<xsl:choose>
								<xsl:when test="string-length(address) = 0">
									<strong>Latitude: </strong><xsl:value-of select="latitude"/>
									<br/>
									<strong>Longitude: </strong><xsl:value-of select="longitude"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="address" />
									<br />
									<xsl:value-of select="city" />
									<xsl:text>, </xsl:text>
									<xsl:value-of select="state" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="zip" />
								</xsl:otherwise>
							</xsl:choose>
						</address>
						<xsl:call-template name="edit-entry">
							<xsl:with-param name="component" select="$component"/>
						</xsl:call-template>
					</div>
					<a class="more" target="_blank">
						<xsl:attribute name="href">
							<xsl:text>http://maps.google.com/maps?q=</xsl:text>
							<xsl:choose>
								<xsl:when test="string-length(address) = 0">
									<xsl:value-of select="$latlon"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$address"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span class="icon">G</span>
						<xsl:text> View on Google Maps</xsl:text>
					</a>
				</xsl:if>
			</div>
		</xsl:for-each>
	</div>

</xsl:template>


<xsl:template name="location-name">
	<xsl:param name="node" select="."/>
	<xsl:choose>
		<xsl:when test="string-length(name-casual)">
			<xsl:value-of select="name-casual" disable-output-escaping="yes" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name-formal" disable-output-escaping="yes" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="location-address">
	<xsl:choose>
		<xsl:when test="string-length(address) = 0">
			<xsl:if test="latitude != '' and longitude != ''">
				<strong>Latitude: </strong><xsl:value-of select="latitude"/>
				<br/>
				<strong>Longitude: </strong><xsl:value-of select="longitude"/>
			</xsl:if>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="address" />
			<br />
			<xsl:value-of select="city" />
			<xsl:text>, </xsl:text>
			<xsl:value-of select="state" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="zip" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="location-href">
	<xsl:param name="address" />
	<xsl:attribute name="href">
		<xsl:text>http://maps.google.com/maps?q=</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length(address) = 0">
				<xsl:choose>
					<xsl:when test="latitude != '' and longitude != ''">
						<xsl:value-of select="latitude"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="longitude"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="city"/>
						<xsl:text>,</xsl:text>
						<xsl:value-of select="state"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="zip"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$address"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
</xsl:template>


</xsl:stylesheet>