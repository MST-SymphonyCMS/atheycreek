<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceevents_recurring_all_entries_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'events-recurring-all-entries-filtered';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is (meetings)), (if value of ({$pt1}) is (events))) is (yes)) ';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

    public $dsParamFILTERS = array(
        '214' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'name: unformatted',
        'frequency: unformatted',
        'downloads',
        'images',
        'verses',
        'type'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'downloads' => array(
            'section_id' => '10',
            'field_id' => '71',
            'elements' => array(
                'file'
            )
        ),
        'images' => array(
            'section_id' => '8',
            'field_id' => '313',
            'elements' => array(
                'image',
                'position',
                'height',
                'color'
            )
        ),
        'verses' => array(
            'section_id' => '4',
            'field_id' => '24',
            'elements' => array(
                'passage'
            )
        ),
        'type' => array(
            'section_id' => '19',
            'field_id' => '143',
            'elements' => array(
                'type: unformatted'
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
            'name' => 'Events: Recurring: All entries (filtered)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T17:47:08+00:00'
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