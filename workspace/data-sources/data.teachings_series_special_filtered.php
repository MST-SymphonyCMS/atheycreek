<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_series_special_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-series-special-filtered';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is ()), (if value of ({$pt1}) is (teachings))) is (yes))';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '4';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

    public $dsParamFILTERS = array(
        '268' => 'yes',
        '233' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title: unformatted',
        'poster'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'poster' => array(
            'section_id' => '8',
            'field_id' => '313',
            'elements' => array(
                'image'
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
            'name' => 'Teachings: Series: Special (filtered)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-13T18:19:07+00:00'
        );
    }

    public function getSource()
    {
        return '27';
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