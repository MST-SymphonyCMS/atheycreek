<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_entries_by_year_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-entries-by-year-filtered';
		public $dsParamConditionalizer = '(if all of ((if value of ({$pt1}) is (teachings)), (if value of ({$pt2}) is (year))) is (yes))';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '{$pt5:10}';
    public $dsParamSTARTPAGE = '{$pt4:1}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREQUIREDPARAM = '$pt3';
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '109' => '{$pt3}-01-01 to {$pt3}-12-01-31',
        '216' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'title: unformatted',
        'slug',
        'filename',
        'current-id',
        'book',
        'chapter',
        'description: unformatted',
        'speaker',
        'date',
        'tags'
    );

    public $dsParamINCLUDEDASSOCIATIONS = array(
        'speaker' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name',
                'first-name',
                'last-name'
            )
        ),
        'tags' => array(
            'section_id' => '15',
            'field_id' => '127',
            'elements' => array(
                'tag: unformatted'
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
            'name' => 'Teachings: Entries by year (filtered)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T21:33:31+00:00'
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