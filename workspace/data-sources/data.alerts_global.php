<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcealerts_global extends SectionDatasource {

		public $dsParamROOTELEMENT = 'alerts-global';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';


		public $dsParamFILTERS = array(
				'263' => 'later than now',
				'227' => 'yes',
				'221' => 'no',
		);


		public $dsParamINCLUDEDELEMENTS = array(
				'url',
				'content: formatted',
				'expiration',
				'can-be-closed',
				'type'
		);


		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Alerts: Global',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.5',
				'release-date' => '2014-03-21T23:34:36+00:00'
			);
		}

		public function getSource() {
			return '26';
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
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
