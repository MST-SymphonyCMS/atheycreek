<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcetags_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'tags-filtered';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'yes';
    public $dsParamPARAMOUTPUT = array(
        'system:id'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '19' => '{$pt1:home}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'tag: unformatted',
        'slug',
        'layout',
        'parent'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'layout' => array(
            'section_id' => '11',
            'field_id' => '73',
            'elements' => array(
                'name: unformatted',
                'column-full-width',
                'column-center',
                'column-right'
            )
        ),
        'parent' => array(
            'section_id' => '3',
            'field_id' => '19',
            'elements' => array(
                'tag: unformatted',
                'slug'
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
            'name' => 'Tags: Filtered',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-04T20:04:10+00:00'
        );
    }

    public function getSource()
    {
        return '3';
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