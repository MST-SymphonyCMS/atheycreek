<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcelayouts_default extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'layouts-default';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '1';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '73' => 'Default',
        '222' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name: unformatted',
        'column-full-width',
        'column-center',
        'column-right'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'column-full-width' => array(
            'section_id' => '9',
            'field_id' => '115',
            'elements' => array(
                'label: unformatted'
            )
        ),
        'column-center' => array(
            'section_id' => '9',
            'field_id' => '115',
            'elements' => array(
                'label: unformatted'
            )
        ),
        'column-right' => array(
            'section_id' => '9',
            'field_id' => '115',
            'elements' => array(
                'label: unformatted'
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
            'name' => 'Layouts: Default',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-04T23:12:18+00:00'
        );
    }

    public function getSource()
    {
        return '11';
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