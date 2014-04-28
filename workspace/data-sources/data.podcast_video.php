<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcepodcast_video extends SectionDatasource {

		public $dsParamROOTELEMENT = 'podcast-video';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '1000';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'271' => 'yes',
				'216' => 'no',
				'280' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title: unformatted',
				'filename',
				'book',
				'chapter',
				'description: unformatted',
				'speaker: first-name',
				'speaker: last-name',
				'date',
				'poster: image',
				'video-duration',
				'video-540-filesize',
				'video-720-filesize',
				'video-podcast-url',
				'hide'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Podcast: Video',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek.dev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.5',
				'release-date' => '2014-04-08T22:08:07+00:00'
			);
		}

		public function getSource() {
			return '13';
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
