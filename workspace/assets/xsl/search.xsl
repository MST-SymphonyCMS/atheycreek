<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-search">

	<xsl:param name="component" select="'search'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<div class="title-wrapper">
		<div class="container">
			<div class="row">
				<div class="span12">
					<h2>
						<xsl:text>Search</xsl:text>
						<em></em>
						<xsl:if test="$url-keywords">
							<xsl:text>: </xsl:text>
							<em class="none">
								<xsl:choose>
									<xsl:when test="$entries/../pagination/@total-entries">
										<xsl:value-of select="$entries/../pagination/@total-entries" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>no</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> </xsl:text>
								<xsl:call-template name="pluralize">
									<xsl:with-param name="singular" select="'search result'" />
									<xsl:with-param name="plural" select="'search results'" />
									<xsl:with-param name="xpath" select="$entries/../pagination/@total-entries" />
								</xsl:call-template>
								<xsl:text> for </xsl:text>
								<xsl:text>“</xsl:text>
								<strong>
									<xsl:value-of select="$url-keywords" disable-output-escaping="yes" />
								</strong>
								<xsl:text>”</xsl:text>
							</em>
						</xsl:if>
					</h2>
				</div>
			</div>
		</div>
	</div>

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<div class="row">
			<div class="span8 offset2">
				<div class="search visible-desktop">
					<form method="get">
						<xsl:call-template name="form-search-action"/>
						<a>
							<xsl:call-template name="url-search-home" />
							<span class="icon">s</span>
						</a>
						<xsl:choose>
							<xsl:when test="$url-sections">
								<input type="hidden" name="sections" value="{$url-sections}" />
							</xsl:when>
							<xsl:otherwise>
								<input type="hidden" name="sections" value="teachings,teachings-series,teachings-tags,text,events-recurring,events,downloads" />
							</xsl:otherwise>
						</xsl:choose>
						<input name="keywords" class="keywords" value="{$url-keywords}" onclick="this.select()" autocomplete="off" />
					</form>
					<p>Type and hit enter. You can search our entire site. Try <span onclick="$('.search input.keywords').val('Jesus');">Jesus</span>, <span onclick="$('.search input.keywords').val('Baptism');">Baptism</span> or <span onclick="$('.search input.keywords').val('Wilsonville');">Wilsonville</span>&#160;..</p>
				</div>
			</div>
		</div>
		<div class="entries results">
			<div class="row">
				<div class="span8">
					<xsl:if test="not(count($entries)) and $url-keywords">
						<p><strong>Sorry about that!</strong><br />Please, try another search or head to the <a href="{$root}">homepage</a></p>
						<xsl:if test="$url-sections">
							<br />
							<p>Try <a href="{$root}/search/?keywords={$url-keywords}">searching everywhere</a></p>
						</xsl:if>
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
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="id">
							<xsl:value-of select="@id"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="@section = 'downloads'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$component"/>
									</xsl:call-template>
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
										<h3>
											<span class="icon">F</span>
											<xsl:value-of select="//data/downloads-search/entry[@id = $id]/name" disable-output-escaping="yes" />
											<span class="label">Downloads</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'events'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
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
										<h3>
											<xsl:value-of select="//data/events-search/entry[@id = $id]/name" disable-output-escaping="yes" />
											<span>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '25'">
															<xsl:text>label men nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '26'">
															<xsl:text>label women nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '31'">
															<xsl:text>label college nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '30'">
															<xsl:text>label highschool nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '29'">
															<xsl:text>label jrhigh nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '28'">
															<xsl:text>label gradeschool nohover color-only</xsl:text>
														</xsl:when>
														<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '27'">
															<xsl:text>label children nohover color-only</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>label allchurch nohover color-only</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:choose>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '25'">
														<xsl:text>Men's </xsl:text>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '26'">
														<xsl:text>Women's </xsl:text>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '31'">
														<xsl:text>1824 </xsl:text>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '30'">
														<xsl:text>High School </xsl:text>>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '29'">
														<xsl:text>Jr. High </xsl:text>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '28'">
														<xsl:text>Grade School </xsl:text>
													</xsl:when>
													<xsl:when test="//data/events-search/entry[@id = $id]/tags/item/@id = '27'">
														<xsl:text>Children's </xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>All Church </xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text>Event</xsl:text>
											</span>
										</h3>
										<div class="date">
											<span class="icon">t</span>
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
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="no" />
										</div>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'events-recurring'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
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
										<h3>
											<xsl:value-of select="//data/events-recurring-search/entry[@id = $id]/name" disable-output-escaping="yes" />
											<span class="label">Bible Study</span>
										</h3>
										<div class="date">
											<span class="icon">r</span>
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
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="no" />
										</div>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
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
										<h3>
												<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/title" disable-output-escaping="yes" />
												<span class="hyphen">—</span>
												<span class="meta">
													<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/book/item" />
													<xsl:text> </xsl:text>
													<xsl:value-of select="//data/teachings-entries-search/entry[@id = $id]/chapter" />
												</span>
												<span class="label">Teachings</span>
										</h3>
										<div class="description">
                			<xsl:call-template name="truncate">
                        <xsl:with-param name="node" select="//data/teachings-entries-search/entry[@id = $id]/description" />
                        <xsl:with-param name="length" select="300" />
                      </xsl:call-template>
										</div>
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="yes" />
										</div>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-series'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
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
										<h3>
												<xsl:value-of select="//data/teachings-series-search/entry[@id = $id]/title" disable-output-escaping="yes" />
												<span class="meta">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="//data/teachings-series-search/entry[@id = $id]/teachings/@items" />
													<xsl:text>&#160;teachings)</xsl:text>
												</span>
												<span class="label">Teaching Series</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-tags'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
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
										<h3>
												<span class="icon">z</span>
												<xsl:value-of select="//data/teachings-tags-search/entry[@id = $id]/tag" disable-output-escaping="yes" />
												<span class="hyphen">—</span>
												<span class="meta">
													<xsl:text>Show associated teachings</xsl:text>
												</span>
												<span class="label">Teaching Tags</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'tags'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-tags-by-text">
											<xsl:with-param name="tag" select="$id"/>
										</xsl:call-template>
										<h3>
												<xsl:value-of select="//data/tags-all-entries/entry[@id = $id]/tag" disable-output-escaping="yes" />
												<xsl:if test="//data/tags-all-entries/entry[@id = $id]/parent/item">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="//data/tags-all-entries/entry[@id = $id]/parent/item/tag"/>
													<xsl:text>) </xsl:text>
												</xsl:if>
												<span class="label page">Page</span>
										</h3>
										<div class="description">
											<xsl:call-template name="truncate">
												<xsl:with-param name="node">
													<xsl:call-template name="remove-html">
														<xsl:with-param name="text" select="//data/text-search/entry[tags/item/@id = $id]/content" />
													</xsl:call-template>
												</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="yes" />
										</div>
									</a>
								</div>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</div>
				<xsl:if test="$url-keywords">
					<div class="span4 filters">
						<xsl:if test="not(//search-suggestions/word = $url-keywords) and count(//search-suggestions/word) &gt; 0 or not(//alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(//alternative-keywords/keyword/@alternative)">
							<div class="suggestions">
								<xsl:if test="not(//search-suggestions/word = $url-keywords) and count(//search-suggestions/word) &gt; 0">
									<div class="suggest">
										<h4>Did you mean</h4>
										<span class="hyphen">—</span>
										<xsl:for-each select="//search-suggestions/word">
											<a href="{$root}/search/?sections={$url-sections}&amp;keywords={.}">
												<xsl:value-of select="." disable-output-escaping="yes" />
											</a>
											<xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</div>
								</xsl:if>
								<xsl:if test="not(//alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(//alternative-keywords/keyword/@alternative)">
									<div class="suggest">
										<h4>Alt keywords</h4>
										<span class="hyphen">—</span>
										<xsl:for-each select="//alternative-keywords/keyword">
											<a href="{$root}/search/?sections={$url-sections}&amp;keywords={@alternative}">
												<xsl:value-of select="@alternative" disable-output-escaping="yes" />
											</a>
											<xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</div>
								</xsl:if>
							</div>
						</xsl:if>
						<xsl:if test="$url-sections and $url-sections != 'teachings,teachings-series,teachings-tags,text,events-recurring,events,downloads'">
							<div class="sections">
								<p><a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings%2Cteachings-series%2Cteachings-tags%2Ctext%2Cevents-recurring%2Cevents%2Cdownloads">Turn off</a> section filtering to see all results</p>
							</div>
						</xsl:if>
						<div class="filter">
							<h4>Search sections</h4>
							<div class="collection">
								<ul>
									<li>
										<xsl:if test="$url-sections = 'teachings,teachings-series,teachings-tags,text,events-recurring,events,downloads'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings%2Cteachings-series%2Cteachings-tags%2Ctext%2Cevents-recurring%2Cevents%2Cdownloads">
											<span class="icon">J</span>
											<xsl:text> Show all</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'downloads'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=downloads">
											<span class="icon">J</span>
											<xsl:text> Downloads</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'events'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=events">
											<span class="icon">J</span>
											<xsl:text> Events</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'events-recurring'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=events-recurring">
											<span class="icon">J</span>
											<xsl:text> Bible Studies</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'text'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=text">
											<span class="icon">J</span>
											<xsl:text> Pages</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings">
											<span class="icon">J</span>
											<xsl:text> Teachings</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings-series'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings-series">
											<span class="icon">J</span>
											<xsl:text> Teaching Series</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings-tags'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/search/?keywords={$url-keywords}&amp;sections=teachings-tags">
											<span class="icon">J</span>
											<xsl:text> Teaching Tags</xsl:text>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
		<xsl:call-template name="pagination-search">
			<xsl:with-param name="pagination" select="$entries/../pagination" />
		</xsl:call-template>
	</div>

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
