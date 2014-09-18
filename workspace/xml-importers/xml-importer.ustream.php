<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterUstream extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Ustream',
				'author'		=> array(
					'name'			=> 'Jonathan Simcoe',
					'email'			=> 'jdsimcoe@gmail.com'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2014-09-18T22:37:50+00:00',
				'updated'		=> '2014-09-18T23:55:39+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '341',
    'xpath' => '.',
    'php' => '"ustream-status"',
  ),
  1 => 
  array (
    'field' => '342',
    'xpath' => 'status/node()',
    'php' => 'str_replace(array(\\\'<![CDATA[\\\',\\\']]>\\\'), \\\'\\\', $value)',
  ),
),
				'included-elements'	=> '/xml/results',
				'namespaces'		=> array (
  -1 => 
  array (
    'name' => '',
    'uri' => '',
    'field' => '',
  ),
),
				'source'			=> 'http://api.ustream.tv/xml/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E',
				'timeout'			=> '60',
				'section'			=> '29',
				'unique-field'		=> '341'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

