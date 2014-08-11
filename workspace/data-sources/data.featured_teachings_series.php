<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcefeatured_teachings_series extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'featured-teachings-series';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '1';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

    public $dsParamFILTERS = array(
        '269' => 'yes',
        '233' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title: unformatted',
        'poster'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'poster' => array(
            'section_id' => '8',
            'field_id' => '59',
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
            'name' => 'Featured: Teachings: Series',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T19:36:17+00:00'
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