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

	<div class="locations locations-groups locations-groups-full-width">
		<div class="col-md-4">
			<ul class="list-group">
				<li class="list-group-item active">
					<a href="#welcome" data-toggle="tab">
						<xsl:text>Welcome</xsl:text>
						<span class="glyphicon glyphicon-chevron-right pull-right"></span>
					</a>
				</li>
				<xsl:for-each select="/data/locations-groups/entry">
					<li class="list-group-item">
						<a href="#{name-group/@handle}" data-toggle="tab">
							<xsl:value-of select="name-group"/>
							<xsl:text>&#160;&#160;</xsl:text>
							<xsl:if test="full = 'Yes'">
								<span class="label label-warning" style="position:relative;top:-1px;left:5px;">Full</span>
							</xsl:if>
							<xsl:if test="new = 'Yes'">
								<span class="label label-danger" style="position:relative;top:-1px;left:5px;">New</span>
							</xsl:if>
							<span class="glyphicon glyphicon-chevron-right pull-right"></span>
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div><!-- .col-md-4 -->
		<div class="col-md-8">
			<div class="tab-content">
				<div id="welcome" class="tab-pane active">
					<h4 class="locations-title">Home Groups at Athey Creek</h4>
					<hr/>
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
					  <h4 class="locations-title">
					  	<xsl:value-of select="name-group"/>
					  	<xsl:text>&#160;&#160;</xsl:text>
							<span>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="full = 'Yes'">
											<xsl:text>label label-warning</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>label label-success</xsl:text>
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
					  </h4>
					  <hr/>
					  <div class="row">
					  	<div class="col-md-6">
					  		<address>
									<strong>
										<xsl:value-of select="name-formal"/>
										<em> — Host</em>
									</strong>
									<br/>
									<xsl:call-template name="location-address"/>
								</address>
								<p class="meta">
									<em><xsl:value-of select="frequency"/></em>
									<br/>
									<em>
										<xsl:text>Children Welcome? </xsl:text>
										<xsl:choose>
											<xsl:when test="childcare = 'Yes'">
												<span class="green glyphicon glyphicon-thumbs-up"></span>
											</xsl:when>
											<xsl:otherwise>
												<span class="red glyphicon glyphicon-thumbs-down"></span>
											</xsl:otherwise>
										</xsl:choose>
									</em>
								</p>
								<xsl:if test="string-length(description)">
									<div class="description">
										<hr/>
										<xsl:value-of select="description" disable-output-escaping="yes"/>
									</div>
								</xsl:if>
					  	</div>
					  	<div class="col-md-6">
					  		<div class="locations locations-column-right">
		  			  		<img class="img-responsive">
		  							<xsl:attribute name="src">
		  								<xsl:text>http://maps.googleapis.com/maps/api/staticmap?center=</xsl:text>
		  								<xsl:choose>
		  									<xsl:when test="string-length(longitude) and string-length(latitude)">
		  									 	<xsl:value-of select="$latlon" />
		  									 	<xsl:text>&amp;zoom=14&amp;size=300x150&amp;markers=</xsl:text>
		  									 	<xsl:value-of select="$latlon" />
		  									</xsl:when>
		  									<xsl:otherwise>
		  										<xsl:value-of select="$address" />
		  									 	<xsl:text>&amp;zoom=14&amp;size=300x150&amp;markers=</xsl:text>
		  									 	<xsl:value-of select="$address" />
		  									</xsl:otherwise>
		  								</xsl:choose>
		  								<xsl:text>&amp;maptype=roadmap&amp;sensor=false&amp;scale=2&amp;style=saturation:-50&amp;visual_refresh=true</xsl:text>
		  							</xsl:attribute>
		  						</img>
		  						<div class="more">
		  							<a class="more-link" target="_blank">
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
		  								<xsl:text> View on Google Maps</xsl:text>
		  							</a>
		  							<a class="more-link">
		  								<xsl:attribute name="href">
		  									<xsl:text>http://maps.apple.com/maps?q=</xsl:text>
		  									<xsl:choose>
		  										<xsl:when test="string-length(address) = 0">
		  											<xsl:value-of select="$latlon"/>
		  										</xsl:when>
		  										<xsl:otherwise>
		  											<xsl:value-of select="$address"/>
		  										</xsl:otherwise>
		  									</xsl:choose>
		  								</xsl:attribute>
		  								<xsl:text> View on Apple Maps</xsl:text>
		  							</a>
		  						</div><!-- .more -->
					  		</div><!-- .locations -->
					  	</div>
					  </div>
					  <hr/>

					  <div class="column-full-width">
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
				  				<div class="col-md-6">
				  					<div class="members-roles members-roles-column-right">
				  						<div class="member">
					  						<a title="Email {/data/members-by-id/entry[@id = $leader-id]/display}" class="mailto">
					  							<xsl:attribute name="href">
					  								<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
					  								<xsl:value-of select="$email" />
					  							</xsl:attribute>
							  					<h4><xsl:value-of select="role/item"/></h4>
				  								<xsl:call-template name="image-master">
				  					        <xsl:with-param name="photo" select="/data/members-by-id/entry[@id = $leader-id]/photo/filename" />
				  					        <xsl:with-param name="default" select="anonymous-4fef5a675fd64-5459168309152.jpg" />
				  					        <xsl:with-param name="width" select="360" />
				  					        <xsl:with-param name="height" select="360" />
				  					        <xsl:with-param name="responsive" select="0" />
				  					        <xsl:with-param name="circle" select="1" />
				  					      </xsl:call-template>
				  					      <div class="info">
				  					      	<h5><xsl:value-of select="$name" disable-output-escaping="yes" /></h5>
				  					      	<div>
				  					      		<span class="email"><xsl:value-of select="$email" /></span>
				  					      		<span class="phone"><xsl:value-of select="$phone" /></span>
				  					      	</div>
				  					      </div>
					  						</a>
				  						</div><!-- .member -->
					  				</div> <!-- .members-roles -->
					  			</div><!-- .col-md-6 -->
				  			</xsl:for-each>
					  	</div><!-- .row -->
					  </div><!-- .column-full-width -->
					</div>
				</xsl:for-each>
			</div><!-- .tab-content -->
		</div><!-- .col-md-8 -->
	</div><!-- .row -->

</xsl:template>


<xsl:template name="locations-column-right">

	<xsl:param name="component" />
	<xsl:param name="entries" />

	<div class="locations locations-column-right">
		<h4>
			<xsl:call-template name="pluralize">
				<xsl:with-param name="singular" select="'Location'"  />
				<xsl:with-param name="plural"   select="'Locations'" />
				<xsl:with-param name="xpath"    select="$entries"    />
			</xsl:call-template>
		</h4>
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
					<h5>
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
						<img class="img-responsive">
							<xsl:attribute name="src">
								<xsl:text>http://maps.googleapis.com/maps/api/staticmap?center=</xsl:text>
								<xsl:choose>
									<xsl:when test="string-length(longitude) and string-length(latitude)">
									 	<xsl:value-of select="$latlon" />
									 	<xsl:text>&amp;zoom=14&amp;size=300x150&amp;markers=</xsl:text>
									 	<xsl:value-of select="$latlon" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$address" />
									 	<xsl:text>&amp;zoom=14&amp;size=300x150&amp;markers=</xsl:text>
									 	<xsl:value-of select="$address" />
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text>&amp;maptype=roadmap&amp;sensor=false&amp;scale=2&amp;style=saturation:-50&amp;visual_refresh=true</xsl:text>
							</xsl:attribute>
						</img>
						<div class="screen"></div>
						<address>
							<strong>
								<xsl:call-template name="location-name" />
							</strong>
							<br/>
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
							<br/>
							<div class="more">
								<a class="more-link" target="_blank">
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
									<xsl:text> View on Google Maps</xsl:text>
								</a>
								<a class="more-link">
									<xsl:attribute name="href">
										<xsl:text>http://maps.apple.com/maps?q=</xsl:text>
										<xsl:choose>
											<xsl:when test="string-length(address) = 0">
												<xsl:value-of select="$latlon"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$address"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:text> View on Apple Maps</xsl:text>
								</a>
							</div><!-- .more -->
						</address>
					</div>
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