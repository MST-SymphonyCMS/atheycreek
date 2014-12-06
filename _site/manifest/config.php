<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '100',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'session_gc_divisor' => '10',
			'version' => '2.5.2',
			'cookie_prefix' => 'sym-',
			'association_maximum_rows' => '5',
			'cell_truncation_length' => '75',
			'admin-path' => 'admin',
			'enable_xsrf' => 'no',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
			'disable_regular_rules' => 'no',
			'disable_upscaling' => 'no',
			'disable_proxy_transform' => 'no',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'useragent' => 'Symphony/2.5.2',
			'sitename' => 'Athey Creek Christian Fellowship',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Los_Angeles',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
			'ip_whitelist' => null,
		),
		########


		###### MEMBERS ######
		'members' => array(
			'cookie-prefix' => 'sym-members',
			'section' => '1',
			'identity' => '5',
		),
		########


		###### EMAIL ######
		'email' => array(
			'default_gateway' => 'sendmail',
		),
		########


		###### EMAIL_SENDMAIL ######
		'email_sendmail' => array(
			'from_name' => 'atheycreek',
			'from_address' => 'noreply@atheycreek.com',
		),
		########


		###### EMAIL_SMTP ######
		'email_smtp' => array(
			'from_name' => 'Symphony',
			'from_address' => 'noreply@atheycreek.com',
			'host' => '127.0.0.1',
			'port' => '25',
			'secure' => 'no',
			'auth' => '0',
			'username' => null,
			'password' => null,
		),
		########


		###### MAPTOFRONT ######
		'maptofront' => array(
			'fallback' => 'home',
			'map_sub_to_front' => 'yes',
		),
		########


		###### SEARCH_INDEX ######
		'search_index' => array(
			're-index-per-page' => '20',
			're-index-refresh-rate' => '0.5',
			'get-param-prefix' => null,
			'get-param-keywords' => 'keywords',
			'get-param-per-page' => 'per-page',
			'get-param-sort' => 'sort',
			'get-param-direction' => 'direction',
			'get-param-sections' => 'sections',
			'get-param-page' => 'page',
			'default-sections' => 'teachings,teachings-series,teachings-tags,text,events-recurring,events,downloads,locations',
			'default-per-page' => '20',
			'default-sort' => 'score',
			'default-direction' => 'desc',
			'excerpt-length' => '250',
			'min-word-length' => '3',
			'max-word-length' => '30',
			'stem-words' => 'yes',
			'build-entries' => 'no',
			'mode' => 'like',
			'log-keywords' => 'yes',
			'indexes' => 'a:9:{i:10;a:3:{s:6:\\"fields\\";a:3:{i:0;s:4:\\"name\\";i:1;s:4:\\"file\\";i:2;s:4:\\"tags\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:206;s:2:\\"no\\";}}i:6;a:3:{s:6:\\"fields\\";a:4:{i:0;s:4:\\"name\\";i:1;s:4:\\"date\\";i:2;s:11:\\"description\\";i:3;s:9:\\"locations\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:213;s:2:\\"no\\";}}i:21;a:3:{s:6:\\"fields\\";a:4:{i:0;s:4:\\"name\\";i:1;s:9:\\"frequency\\";i:2;s:11:\\"description\\";i:3;s:9:\\"locations\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:214;s:2:\\"no\\";}}i:3;a:3:{s:6:\\"fields\\";a:3:{i:0;s:3:\\"tag\\";i:1;s:11:\\"description\\";i:2;s:6:\\"parent\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:57;s:2:\\"no\\";}}i:27;a:3:{s:6:\\"fields\\";a:1:{i:0;s:5:\\"title\\";}s:9:\\"weighting\\";s:1:\\"1\\";s:7:\\"filters\\";a:1:{i:233;s:2:\\"no\\";}}i:15;a:3:{s:6:\\"fields\\";a:1:{i:0;s:3:\\"tag\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:217;s:2:\\"no\\";}}i:7;a:3:{s:6:\\"fields\\";a:2:{i:0;s:7:\\"content\\";i:1;s:4:\\"tags\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:1:{i:209;s:2:\\"no\\";}}i:13;a:3:{s:6:\\"fields\\";a:8:{i:0;s:5:\\"title\\";i:1;s:8:\\"filename\\";i:2;s:4:\\"book\\";i:3;s:7:\\"chapter\\";i:4;s:11:\\"description\\";i:5;s:7:\\"speaker\\";i:6;s:3:\\"seo\\";i:7;s:14:\\"search-display\\";}s:9:\\"weighting\\";s:1:\\"1\\";s:7:\\"filters\\";a:2:{i:125;s:3:\\"105\\";i:216;s:2:\\"no\\";}}i:5;a:3:{s:6:\\"fields\\";a:12:{i:0;s:10:\\"name-group\\";i:1;s:9:\\"frequency\\";i:2;s:11:\\"description\\";i:3;s:5:\\"alert\\";i:4;s:7:\\"address\\";i:5;s:4:\\"city\\";i:6;s:5:\\"state\\";i:7;s:3:\\"zip\\";i:8;s:7:\\"leaders\\";i:9;s:3:\\"new\\";i:10;s:4:\\"full\\";i:11;s:9:\\"childcare\\";}s:9:\\"weighting\\";s:1:\\"2\\";s:7:\\"filters\\";a:2:{i:286;s:3:\\"yes\\";i:208;s:2:\\"no\\";}}}',
			'synonyms' => 'a:0:{}',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_members_sortby' => '4',
			'section_members_order' => 'desc',
			'section_misc_sortby' => '14',
			'section_misc_order' => 'asc',
			'section_tags_sortby' => '23',
			'section_tags_order' => 'asc',
			'section_locations_sortby' => '304',
			'section_locations_order' => 'asc',
			'section_verses_sortby' => '24',
			'section_verses_order' => 'asc',
			'section_events_sortby' => '35',
			'section_events_order' => 'desc',
			'section_text_sortby' => '201',
			'section_text_order' => 'asc',
			'section_images_sortby' => '297',
			'section_images_order' => 'desc',
			'section_sections_sortby' => '115',
			'section_sections_order' => 'asc',
			'section_downloads_sortby' => null,
			'section_downloads_order' => 'asc',
			'section_layouts_sortby' => '78',
			'section_layouts_order' => 'desc',
			'section_teachings_sortby' => '109',
			'section_teachings_order' => 'desc',
			'section_events-types_sortby' => null,
			'section_events-types_order' => 'asc',
			'section_teachings-tags_sortby' => '127',
			'section_teachings-tags_order' => 'asc',
			'section_members-roles-types_sortby' => '132',
			'section_members-roles-types_order' => 'asc',
			'section_members-roles_sortby' => '242',
			'section_members-roles_order' => 'asc',
			'section_videos_sortby' => '185',
			'section_videos_order' => 'desc',
			'section_events-recurring_sortby' => '244',
			'section_events-recurring_order' => 'asc',
			'section_twitter_sortby' => '194',
			'section_twitter_order' => 'desc',
			'section_status_sortby' => null,
			'section_status_order' => 'asc',
			'section_alerts_sortby' => null,
			'section_alerts_order' => 'asc',
			'section_teachings-series_sortby' => '240',
			'section_teachings-series_order' => 'asc',
			'section_featured_sortby' => '265',
			'section_featured_order' => 'asc',
			'section_structure_sortby' => '23',
		),
		########


		###### HTML5_DOCTYPE ######
		'html5_doctype' => array(
			'exclude_pagetypes' => null,
		),
		########


		###### TWITTER_SEARCH ######
		'twitter_search' => array(
			'consumer_key' => 'yC9KqWq71Qo1zyNUFbhpyg',
			'consumer_secret' => 'hYU647QU8zmhgRHVVx0wsUO9VIgdXQmuJJNWOf2pg',
			'bearer_token' => 'AAAAAAAAAAAAAAAAAAAAAC72SgAAAAAAE%2FYHwilwf2DRcCJwjgm%2BPGlDt6M%3DTYQjnIOksKE1hp9FPwJxsk0o4BYbp9e21qMRVg',
			'access_token' => '394456256-4c1XXgtifMnhDzvcvcYwRJ4gaacgtZglbvP2VjPg',
			'access_secret' => 'fxelWdiDzBl6mpQ1NvmKm7wPq9NNzw3YcFkP3AsNE8E',
		),
		########


		###### GLOBALRESOURCELOADER ######
		'globalresourceloader' => array(
			'ds-names' => 'layouts_default,layouts_ds_tags_entries_by_tag,misc_all_entries,search_suggestions,tags_all_entries,tags_filtered',
			'ds-pages' => '5,7',
		),
		########


		###### DATABASE ######
		'database' => array(
			'character_set' => 'utf8',
			'character_encoding' => 'utf8',
			'runtime_character_set_alter' => '1',
			'query_caching' => 'default',
			'host' => '127.0.0.1',
			'port' => '3306',
			'user' => 'root',
			'password' => 'Simkiss77',
			'db' => 'atheycreek',
			'tbl_prefix' => 'sym_',
		),
		########


		###### S3UPLOAD_FIELD ######
		's3upload_field' => array(
			'access-key-id' => 'AKIAIIXJYK33WRXGYTDA',
			'secret-access-key' => '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',
			'cache-control' => '86400',
		),
		########


		###### CONTENT-TYPE-MAPPINGS ######
		'content-type-mappings' => array(
			'xml' => 'text/xml; charset=utf-8',
			'text' => 'text/plain; charset=utf-8',
			'css' => 'text/css; charset=utf-8',
			'json' => 'application/json; charset=utf-8',
		),
		########
	);
