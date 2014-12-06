<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_recent_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-recent-filtered';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (teachings))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '10';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '192' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'slug',
        'filename',
        'book',
        'chapter',
        'speaker',
        'date',
        'poster',
        'video-id',
        'day'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'poster' => array(
            'section_id' => '8',
            'field_id' => '313',
            'elements' => array(
                'image'
            )
        ),
        'speaker' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Teachings: Recent (filtered)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0RC1',
            'release-date' => '2014-08-26T14:50:26+00:00'
        );
    }

    public function getSource()
    {
        return '13';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}