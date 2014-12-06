<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcelocations_groups_search extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'locations-groups-search';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (search))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-search}',
        '286' => 'yes',
        '208' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name-group: formatted',
        'name-formal: formatted',
        'frequency: formatted',
        'description: formatted',
        'alert: formatted',
        'address',
        'city',
        'state',
        'zip',
        'latitude',
        'longitude',
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
                'role',
                'display-events'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-search');
    }

    public function about()
    {
        return array(
            'name' => 'Locations: Groups: Search',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0RC1',
            'release-date' => '2014-09-02T14:30:57+00:00'
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