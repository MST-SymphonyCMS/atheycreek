<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_latest extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-latest';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is ()), (if value of ({$pt1}) is (teachings))) is (yes))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '6';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'date';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '216' => 'no',
        '280' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title: unformatted',
        'description: unformatted',
        'date',
        'video-id',
        'day',
        'featured'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Teachings: Latest',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0RC1',
            'release-date' => '2014-08-26T14:50:10+00:00'
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