<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcexml_ustream_status extends DynamicXMLDatasource {

		public $dsParamROOTELEMENT = 'xml-ustream-status';
		public $dsParamURL = 'http://api.ustream.tv/xml/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E';
		public $dsParamXPATH = '/results';
		public $dsParamCACHE = '999999';
		public $dsParamTIMEOUT = '6';


		public function about() {
			return array(
				'name' => 'XML: Ustream Status',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://simko.io/',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.5.0beta2',
				'release-date' => '2013-07-21T15:19:44+00:00'
			);
		}

		public function getSource() {
			return 'dynamic_xml';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
