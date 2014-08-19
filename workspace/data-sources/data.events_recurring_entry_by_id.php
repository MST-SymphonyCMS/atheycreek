<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceevents_recurring_entry_by_id extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'events-recurring-entry-by-id';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (events))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '1';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$pt2';
    public $dsParamPARAMOUTPUT = array(
        'member-role',
        'verses'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

    public $dsParamFILTERS = array(
        'system:id' => '{$pt2}',
        '214' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name: unformatted',
        'frequency: unformatted',
        'description: formatted',
        'locations',
        'member-role',
        'downloads',
        'tags',
        'childcare',
        'images',
        'verses'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'tags' => array(
            'section_id' => '3',
            'field_id' => '337',
            'elements' => array(
                'title'
            )
        ),
        'downloads' => array(
            'section_id' => '10',
            'field_id' => '71',
            'elements' => array(
                'file',
                'link'
            )
        ),
        'images' => array(
            'section_id' => '8',
            'field_id' => '313',
            'elements' => array(
                'image'
            )
        ),
        'locations' => array(
            'section_id' => '5',
            'field_id' => '27',
            'elements' => array(
                'name-formal: unformatted',
                'name-casual: unformatted',
                'address',
                'city',
                'state',
                'zip',
                'latitude',
                'longitude'
            )
        ),
        'verses' => array(
            'section_id' => '4',
            'field_id' => '333',
            'elements' => array(
                'passage',
                'content',
                'version'
            )
        ),
        'member-role' => array(
            'section_id' => '18',
            'field_id' => '326',
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
            'name' => 'Events: Recurring: Entry by ID',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0RC1',
            'release-date' => '2014-08-19T20:22:05+00:00'
        );
    }

    public function getSource()
    {
        return '21';
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