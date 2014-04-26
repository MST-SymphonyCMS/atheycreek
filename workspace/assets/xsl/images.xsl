<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-images">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">

		<xsl:choose>
			<xsl:when test="count($entries) = 1">
				<xsl:call-template name="images-single">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="position" select="$position" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="images-multiple">
					<xsl:with-param name="component" select="$component" />
					<xsl:with-param name="position" select="$position" />
					<xsl:with-param name="entries" select="$entries" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:if>

</xsl:template>


<xsl:template name="images-single">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<xsl:for-each select="$entries">

			<div>
				<xsl:if test="color">
					<xsl:attribute name="class">
						<xsl:text>outer</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="background != ''">
						<xsl:attribute name="style">
							<xsl:text>background-image:url('</xsl:text>
							<xsl:value-of select="background" />
							<xsl:text>');</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="style">
							<xsl:text>background-color:#</xsl:text>
							<xsl:value-of select="color" />
							<xsl:text>;</xsl:text>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<div class="container">
					<div>
						<xsl:call-template name="class-rows">
							<xsl:with-param name="class" select="'image'" />
						</xsl:call-template>
						<img src="/workspace/assets/img/spacer.gif">
							<xsl:attribute name="style">
								<xsl:text>height:</xsl:text>
								<xsl:value-of select="height" />
								<xsl:text>px; width:100%;</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="data-responsimage">
								<xsl:value-of select="image/filename" />
							</xsl:attribute>
							<xsl:attribute name="data-responsimage-anchor">
								<xsl:choose>
									<xsl:when test="position = 'Top left'"     >1</xsl:when>
									<xsl:when test="position = 'Top center'"   >2</xsl:when>
									<xsl:when test="position = 'Top right'"    >3</xsl:when>
									<xsl:when test="position = 'Middle left'"  >4</xsl:when>
									<xsl:when test="position = 'Middle center'">5</xsl:when>
									<xsl:when test="position = 'Middle right'" >6</xsl:when>
									<xsl:when test="position = 'Bottom left'"  >7</xsl:when>
									<xsl:when test="position = 'Bottom center'">8</xsl:when>
									<xsl:when test="position = 'Bottom right'" >9</xsl:when>
									<xsl:otherwise>5</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</img>
						<xsl:call-template name="edit-entry">
							<xsl:with-param name="component" select="$component"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<xsl:if test="color">
				<div class="padder">
					<xsl:attribute name="style">
						<xsl:text>position:relative; margin-bottom:</xsl:text>
						<xsl:value-of select="height" />
						<xsl:text>px;</xsl:text>
					</xsl:attribute>
					<xsl:text>&#160;</xsl:text>
				</div>
			</xsl:if>
		</xsl:for-each>

	</div>

</xsl:template>


<xsl:template name="images-multiple">

	<xsl:param name="component" />
	<xsl:param name="position" />
	<xsl:param name="entries" />


		<div id="frontCarousel" class="carousel slide">
	    <div class="carousel-inner">
			  <xsl:for-each select="$entries">
			    <div>
			    	<xsl:attribute name="class">
			    		<xsl:choose>
			    			<xsl:when test="position() = 1">
			    				<xsl:text>item active</xsl:text>
			    			</xsl:when>
			    			<xsl:otherwise>
			    				<xsl:text>item</xsl:text>
			    			</xsl:otherwise>
			    		</xsl:choose>
			    	</xsl:attribute>
			      <div class="row">
		          <a>
		            <xsl:attribute name="href">
		              <xsl:value-of select="uri" />
		            </xsl:attribute>

		            <img style="width:100%" class="inline" data-responsimage-anchor="5" src="/workspace/assets/img/spacer.gif">
		              <xsl:attribute name="data-responsimage">
		                <xsl:value-of select="image/filename" />
		              </xsl:attribute>
		            </img>
		          </a>
			      </div>
						<div class="carousel-caption">
							<a href="{uri}">
								<h3>
									<em class="verse"><xsl:value-of select="caption"/></em>
								</h3>
							</a>
						</div>
			    </div>
			  </xsl:for-each>
	    </div>
	    <a class="left carousel-control" href="#frontCarousel" data-slide="prev">&lt;</a>
	    <a class="right carousel-control" href="#frontCarousel" data-slide="next">&gt;</a>
	  </div>



</xsl:template>


</xsl:stylesheet>