<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-search">

	<xsl:param name="component" select="'search'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<div class="search search-full-width">
		<form class="search-form" action="get">
		  <xsl:call-template name="form-search-action" />
		  <xsl:if test="$url-sections">
		  	<input type="hidden" name="sections" value="{$url-sections}" />
		  </xsl:if>
		  <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
		</form>
		<hr/>
		<xsl:if test="$url-keywords">
			<div class="search-facets">
				<div class="container">
					<div class="row">
						<h4>Filter Results</h4>
						<ul class="tag-list">
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings%2Cteachings-series%2Cteachings-tags%2Ctext%2Cevents-recurring%2Cevents%2Cdownloads%2Clocations">
									<xsl:if test="$url-sections = '' or $url-sections = 'teachings,teachings-series,teachings-tags,text,events-recurring,events,downloads,locations'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Show All</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=downloads">
									<xsl:if test="$url-sections = 'downloads'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Downloads</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=events">
									<xsl:if test="$url-sections = 'events'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Events</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=events-recurring">
									<xsl:if test="$url-sections = 'events-recurring'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Bible Studies</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=text">
									<xsl:if test="$url-sections = 'text'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Pages</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings">
									<xsl:if test="$url-sections = 'teachings' or $url-sections = 'teachings,teachings-tags,teachings-series'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Teachings</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings-series">
									<xsl:if test="$url-sections = 'teachings-series' or $url-sections = 'teachings,teachings-tags,teachings-series'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Teaching Series</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings-tags">
									<xsl:if test="$url-sections = 'teachings-tags' or $url-sections = 'teachings,teachings-tags,teachings-series'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Teaching Tags</xsl:text>
								</a>
							</li>
							<li class="tag-list-item">
								<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=locations">
									<xsl:if test="$url-sections = 'locations'">
										<xsl:attribute name="class">active</xsl:attribute>
										<span class="glyphicon glyphicon-ok"></span>
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
									<xsl:text>Home Groups</xsl:text>
								</a>
							</li>
						</ul><!-- .tag-list -->
					</div><!-- .row -->
				</div><!-- .container -->
			</div><!-- .search-facets -->
			<hr/>
		</xsl:if>
		<div class="search-results">
			<div class="container">
				<div class="row">
					<xsl:choose>
						<!-- This tests for whether there are Search Results or not -->
						<xsl:when test="$url-keywords">
							<h4>
								<xsl:choose>
									<xsl:when test="$entries/../pagination/@total-entries">
										<xsl:value-of select="$entries/../pagination/@total-entries" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>No</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> </xsl:text>
								<xsl:call-template name="pluralize">
									<xsl:with-param name="singular" select="'search result'" />
									<xsl:with-param name="plural" select="'search results'" />
									<xsl:with-param name="xpath" select="$entries/../pagination/@total-entries" />
								</xsl:call-template>
								<xsl:text> for: </xsl:text>
								<em>
									<xsl:text>“</xsl:text>
									<strong>
										<xsl:call-template name="truncate">
										  <xsl:with-param name="node" select="$url-keywords" />
										  <xsl:with-param name="length" select="25" />
										</xsl:call-template>
									</strong>
									<xsl:text>”</xsl:text>
								</em>
							</h4>
							<div>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="not(/data/search-suggestions/word = $url-keywords) and count(/data/search-suggestions/word) &gt; 0 or not(/data/alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(/data/alternative-keywords/keyword/@alternative)">col-md-8</xsl:when>
										<xsl:otherwise>col-md-12</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:if test="not(count($entries)) and $url-keywords">
									<div class="more">
										<xsl:if test="not(contains($current-query-string, '%27'))">
											<p class="empty-suggestion">Your search did not yield any results. Try wrapping quotes around your search. (e.g. “Jesus Christ”)</p>
											<a class="more-link">
												<xsl:attribute name="href">
													<xsl:value-of select="$root"/>
													<xsl:text>/search/?keywords='</xsl:text>
													<xsl:call-template name="plus">
														<xsl:with-param name="text" select="$url-keywords" />
													</xsl:call-template>
													<xsl:text>'</xsl:text>
													<xsl:if test="$url-sections">
														<xsl:text>&amp;sections=</xsl:text>
														<xsl:value-of select="$url-sections"/>
													</xsl:if>
												</xsl:attribute>
												<xsl:text>Wrap Search with Quotes</xsl:text>
											</a>
										</xsl:if>
										<xsl:if test="$url-sections">
											<xsl:text>&#160;</xsl:text>
											<a class="more-link" href="{$root}/search/?keywords={$url-keywords}">
												<xsl:attribute name="href">
													<xsl:value-of select="$root"/>
													<xsl:text>/search/?keywords=</xsl:text>
													<xsl:call-template name="plus">
														<xsl:with-param name="text" select="$url-keywords" />
													</xsl:call-template>
												</xsl:attribute>
												<xsl:text>Or Try Searching Everywhere</xsl:text>
											</a>
										</xsl:if>
									</div>
									<div class="search-empty">
										<span class="glyphicon glyphicon-search"></span>
									</div>
								</xsl:if>
								<xsl:for-each select="$entries">
									<xsl:variable name="tag">
										<xsl:value-of select="tags/item/@id" />
									</xsl:variable>
									<xsl:variable name="search-component">
										<xsl:choose>
											<xsl:when test="@section = 'downloads'">
												<xsl:text>downloads</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'events'">
												<xsl:text>events</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'events-recurring'">
												<xsl:text>events-recurring</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'teachings'">
												<xsl:text>teachings</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'teachings-series'">
												<xsl:text>teachings-series</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'teachings-tags'">
												<xsl:text>teachings-tags</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'text'">
												<xsl:text>text</xsl:text>
											</xsl:when>
											<xsl:when test="@section = 'locations'">
												<xsl:text>locations</xsl:text>
											</xsl:when>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="id">
										<xsl:value-of select="@id"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="@section = 'downloads'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a target="_blank">
													<xsl:attribute name="href">
														<xsl:choose>
															<xsl:when test="//data/downloads-search/entry[@id = $id]/link">
																<xsl:value-of select="//data/downloads-search/entry[@id = $id]/link"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$root"/>
																<xsl:text>/workspace/uploads/downloads/</xsl:text>
																<xsl:value-of select="//data/downloads-search/entry[@id = $id]/file/filename"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/downloads-search/entry[@id = $id]/name" disable-output-escaping="yes" />
														<span class="label label-default">Downloads</span>
													</h5>
													<div class="meta">
														<xsl:text>Show associated teachings</xsl:text>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'events'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
												    <xsl:call-template name="url-prefix">
												      <xsl:with-param name="handle" select="'events'" />
												    </xsl:call-template>
														<xsl:value-of select="@id" />
														<xsl:text>/</xsl:text>
														<xsl:value-of select="//data/events-search/entry[@id = $id]/name/@handle" />
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/events-search/entry[@id = $id]/name" disable-output-escaping="yes" />
														<span class="label label-default">
															<xsl:text>Event</xsl:text>
														</span>
													</h5>
													<div class="meta">
														<xsl:call-template name="timespan-format">
															<xsl:with-param name="date" select="//data/events-search/entry[@id = $id]/date/date" />
														</xsl:call-template>
													</div>
													<div class="description">
														<xsl:call-template name="truncate">
															<xsl:with-param name="node">
																<xsl:call-template name="remove-html">
																	<xsl:with-param name="text" select="//data/events-search/entry[@id = $id]/description" />
																</xsl:call-template>
															</xsl:with-param>
														</xsl:call-template>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'events-recurring'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
												    <xsl:call-template name="url-prefix">
												      <xsl:with-param name="handle" select="'events'" />
												    </xsl:call-template>
														<xsl:value-of select="@id" />
														<xsl:text>/</xsl:text>
														<xsl:value-of select="//data/events-recurring-search/entry[@id = $id]/name/@handle" />
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/events-recurring-search/entry[@id = $id]/name" disable-output-escaping="yes" />
														<span class="label label-default">Bible Study</span>
													</h5>
													<div class="meta">
														<xsl:value-of select="//data/events-recurring-search/entry[@id = $id]/frequency" disable-output-escaping="yes" />
													</div>
													<div class="description">
														<xsl:call-template name="truncate">
															<xsl:with-param name="node">
																<xsl:call-template name="remove-html">
																	<xsl:with-param name="text" select="//data/events-recurring-search/entry[@id = $id]/description" />
																</xsl:call-template>
															</xsl:with-param>
														</xsl:call-template>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'teachings'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
												    <xsl:call-template name="url-prefix">
												      <xsl:with-param name="handle" select="'teachings'" />
												    </xsl:call-template>
														<xsl:value-of select="@id" />
														<xsl:text>/</xsl:text>
														<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/title/@handle" />
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/title" disable-output-escaping="yes" />
														<span class="label label-default">Teachings</span>
													</h5>
													<div class="meta">
														<xsl:call-template name="format-date">
														  <xsl:with-param name="date" select="//data/teachings-entries-search/entry[@id = $id]/date/date/start/@iso" />
														  <xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
														</xsl:call-template>
														<xsl:text> • </xsl:text>
														<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/book/item" />
														<xsl:text> </xsl:text>
														<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/chapter" />

													</div>
													<div class="description">
			                			<xsl:call-template name="truncate">
			                        <xsl:with-param name="node" select="//data/teachings-entries-search/entry[@id = $id]/description" />
			                        <xsl:with-param name="length" select="300" />
			                      </xsl:call-template>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'teachings-series'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
												    <xsl:call-template name="url-prefix">
												      <xsl:with-param name="handle" select="'teachings'" />
												    </xsl:call-template>
														<xsl:text>series/</xsl:text>
														<xsl:value-of select="@id" />
														<xsl:text>/</xsl:text>
														<xsl:value-of select="//data/teachings-series-search/entry[@id = $id]/title/@handle" />
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/teachings-series-search/entry[@id = $id]/title" disable-output-escaping="yes" />
														<span class="label label-default">Teaching Series</span>
													</h5>
													<div class="meta">
														<xsl:text> (</xsl:text>
														<xsl:value-of select="count(//data/teachings-series-search/entry[@id = $id]/teachings/item)" />
														<xsl:text>&#160;teachings)</xsl:text>
													</div>
													<xsl:if test="string-length(//data/teachings-series-search/entry[@id = $id]/description)">
														<xsl:value-of select="//data/teachings-series-search/entry[@id = $id]/description" disable-output-escaping="yes"/>
													</xsl:if>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'teachings-tags'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
												    <xsl:call-template name="url-prefix">
												      <xsl:with-param name="handle" select="'teachings'" />
												    </xsl:call-template>
														<xsl:text>tag/</xsl:text>
														<xsl:value-of select="@id" />
														<xsl:text>/</xsl:text>
														<xsl:value-of select="//data/teachings-tags-search/entry[@id = $id]/tag/@handle" />
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/teachings-tags-search/entry[@id = $id]/tag" disable-output-escaping="yes" />
														<span class="label label-default">Teaching Tags</span>
													</h5>
													<div class="meta">
														<xsl:text>Show associated teachings</xsl:text>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'text'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$root"/>
														<xsl:value-of select="//data/tags-all-entries/entry[@id = //data/text-all-entries/entry[@id = $id]/tags/item/@id]/path"/>
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/tags-all-entries/entry[@id = //data/text-all-entries/entry[@id = $id]/tags/item/@id]/title" disable-output-escaping="yes" />
														<span class="label label-default">Page</span>
													</h5>
													<div class="description">
														<xsl:call-template name="truncate">
															<xsl:with-param name="node">
																<xsl:call-template name="remove-html">
																	<xsl:with-param name="text" select="//data/text-all-entries/entry[@id = $id]/content" />
																</xsl:call-template>
															</xsl:with-param>
														</xsl:call-template>
													</div>
												</a>
											</div>
										</xsl:when>
										<xsl:when test="@section = 'locations'">
											<div>
												<xsl:call-template name="search-entry-class" />
												<a target="_blank">
													<xsl:attribute name="href">
														<xsl:value-of select="$root"/>
														<xsl:text>/home-groups/#</xsl:text>
														<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/name-group/@handle"/>
													</xsl:attribute>
													<h5>
														<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/name-group" disable-output-escaping="yes" />
														<span class="label label-default">Home Group</span>
													</h5>
													<div class="description">
														<address>
															<strong>
																<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/name-formal"/>
																<xsl:text> (Host)</xsl:text>
															</strong>
															<br/>
															<xsl:if test="string-length(//data/locations-groups-search/entry[@id = $id]/address)">
																<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/address"/>
																<br/>
															</xsl:if>
															<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/city"/>
															<xsl:text>, </xsl:text>
															<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/state"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="//data/locations-groups-search/entry[@id = $id]/zip"/>
														</address>
														<xsl:call-template name="truncate">
															<xsl:with-param name="node">
																<xsl:call-template name="remove-html">
																	<xsl:with-param name="text" select="//data/locations-groups-search/entry[@id = $id]/description" />
																</xsl:call-template>
															</xsl:with-param>
														</xsl:call-template>
													</div>
												</a>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div><!-- .col-md-8 or .col-md-12 -->
							<xsl:if test="not(/data/search-suggestions/word = $url-keywords) and count(/data/search-suggestions/word) &gt; 0 or not(/data/alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(/data/alternative-keywords/keyword/@alternative)">
								<div class="col-md-4">
									<div class="search-suggestions">
										<xsl:if test="not(/data/search-suggestions/word = $url-keywords) and count(/data/search-suggestions/word) &gt; 0">
											<div class="suggest">
												<h5>Did You Mean?</h5>
												<ul class="tag-list">
													<xsl:for-each select="/data/search-suggestions/word">
														<li class="tag-list-item">
															<a href="{$root}/search/?sections={$url-sections}&amp;keywords={.}">
																<xsl:value-of select="." disable-output-escaping="yes" />
															</a>
														</li>
													</xsl:for-each>
												</ul>
											</div>
										</xsl:if>
										<xsl:if test="not(/data/alternative-keywords/keyword = $url-keywords) and count(/data/alternative-keywords/keyword) &gt; 0 and string-length(//alternative-keywords/keyword/@alternative)">
											<div class="suggest">
												<h4>Alt keywords</h4>
												<span class="hyphen">—</span>
												<xsl:for-each select="/data/alternative-keywords/keyword">
													<a href="{$root}/search/?sections={$url-sections}&amp;keywords={@alternative}">
														<xsl:value-of select="@alternative" disable-output-escaping="yes" />
													</a>
													<xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
												</xsl:for-each>
											</div>
										</xsl:if>
									</div>
								</div><!-- .col-md-4 -->
							</xsl:if>
						</xsl:when>
						<!-- No Search results so show an empty page -->
						<xsl:otherwise>
							<div class="search-empty">
								<span class="glyphicon glyphicon-search"></span>
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</div><!-- .row -->
			</div><!-- .container -->
		</div><!-- .search-results -->
		<xsl:if test="$entries/../pagination">
			<div class="search-pagination">
				<hr/>
				<div class="container">
					<div class="row">
						<xsl:call-template name="pagination-search">
							<xsl:with-param name="pagination" select="$entries/../pagination" />
						</xsl:call-template>
					</div><!-- .row -->
				</div><!-- .container -->
			</div><!-- .search-pagination -->
		</xsl:if>
	</div><!-- .search-full-width -->

</xsl:template>


<xsl:template name="search-entry-class">

	<xsl:call-template name="class-rows">
		<xsl:with-param name="class">
			<xsl:text>type-</xsl:text>
			<xsl:value-of select="@section" disable-output-escaping="yes" />
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>


<xsl:template name="pagination-search">

	<xsl:param name="pagination" />

	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" />
			<xsl:text>/search/?</xsl:text>
			<xsl:if test="$url-keywords">
				<xsl:text>keywords=</xsl:text>
				<xsl:value-of select="$url-keywords" />
			</xsl:if>
			<xsl:if test="$url-sections">
				<xsl:text>&amp;sections=</xsl:text>
				<xsl:value-of select="$url-sections" />
			</xsl:if>
			<xsl:text>&amp;page=</xsl:text>
			<xsl:value-of select="'$'" />
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>


</xsl:stylesheet>
