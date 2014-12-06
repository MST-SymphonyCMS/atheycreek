<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcelocations_groups extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'locations-groups';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is (home-groups)), (if value of ({$current-page}) is (json))) is (yes))';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamPARAMOUTPUT = array(
        'leaders'
        );
    public $dsParamSORT = 'city';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '286' => 'yes',
        '208' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name-group: unformatted',
        'name-formal: unformatted',
        'name-casual: unformatted',
        'frequency: unformatted',
        'description: formatted',
        'alert: unformatted',
        'address',
        'city',
        'state',
        'zip',
        'latitude',
        'longitude',
        'tags',
        'leaders',
        'new',
        'full',
        'childcare'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'leaders' => array(
            'section_id' => '18',
            'field_id' => '320',
            'elements' => array(
                'member',
                'role',
                'display'
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
            'name' => 'Locations: Groups',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2014-12-05T21:21:08+00:00'
        );
    }

    public function getSource()
    {
        return '5';
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