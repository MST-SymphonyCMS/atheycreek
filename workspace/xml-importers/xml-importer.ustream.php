<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterUstream extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'UStream',
				'author'		=> array(
					'name'			=> 'Jonathan Simcoe',
					'email'			=> 'jdsimcoe@gmail.com'
				),
				'description'	=> 'Ustream',
				'file'			=> __FILE__,
				'created'		=> '2011-12-29T02:19:14+00:00',
				'updated'		=> '2014-08-11T21:18:52+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '199',
    'xpath' => '.',
    'php' => '"ustream-status"',
  ),
  1 => 
  array (
    'field' => '200',
    'xpath' => 'status/node()',
    'php' => 'str_replace(array(\'<![CDATA[\',\']]>\'), \'\', $value)',
  ),
),
				'included-elements'	=> '/xml/results',
				'namespaces'		=> array (
  -1 => 
  array (
    'field' => '',
    'name' => '',
    'uri' => '',
  ),
),
				'source'			=> 'http://api.ustream.tv/xml/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E',
				'timeout'			=> '60',
				'section'			=> '25',
				'unique-field'		=> '199'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

