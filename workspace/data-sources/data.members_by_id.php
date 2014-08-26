<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcemembers_by_id extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'members-by-id';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREQUIREDPARAM = '$ds-members-roles-by-id';
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-members-roles-by-id}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'photo',
        'email',
        'phone-number',
        'anonymize',
        'display'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-members-roles-by-id');
    }

    public function about()
    {
        return array(
            'name' => 'Members by ID',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T18:37:57+00:00'
        );
    }

    public function getSource()
    {
        return '1';
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