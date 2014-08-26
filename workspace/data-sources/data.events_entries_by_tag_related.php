<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceevents_entries_by_tag_related extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'events-entries-by-tag-related';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '{$pt3:5}';
    public $dsParamSTARTPAGE = '{$pt2:1}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREQUIREDPARAM = '$pt5';
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '35' => 'later than now',
        '137' => '{$pt5}',
        '169' => '(if all of ((if value of ({$pt1}) is (events)), (if value of ({$pt4}) is (related))) is (yes))',
        '213' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'date'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Events: Entries by tag (related)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-04T23:42:32+00:00'
        );
    }

    public function getSource()
    {
        return '6';
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