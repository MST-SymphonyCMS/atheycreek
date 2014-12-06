<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcemembers_roles_by_id extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'members-roles-by-id';
		public $dsParamConditionalizer = '(if any of ((if value of ({$ds-events-entry-by-id.member-role}) is not ()), (if value of ({$ds-events-entry-by-id-api.member-role}) is not ()), (if value of ({$ds-events-entry-by-id-preview.member-role}) is not ()), (if value of ({$ds-events-recurring-entry-by-id.member-role}) is not ()),(if value of ({$ds-events-recurring-entry-by-id-preview.member-role}) is not ()), (if value of ({$ds-locations-groups.leaders}) is not ())) is (yes))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamPARAMOUTPUT = array(
        'member'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-events-entry-by-id.member-role},{$ds-events-entry-by-id-api.member-role},{$ds-events-entry-by-id-preview.member-role},{$ds-events-recurring-entry-by-id.member-role},{$ds-events-recurring-entry-by-id-preview.member-role},{$ds-locations-groups.leaders}',
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-events-entry-by-id', '$ds-events-entry-by-id-api', '$ds-events-entry-by-id-preview', '$ds-events-recurring-entry-by-id', '$ds-events-recurring-entry-by-id-preview', '$ds-locations-groups', '$ds-events-entry-by-id.member-role', '$ds-events-entry-by-id-api.member-role', '$ds-events-entry-by-id-preview.member-role', '$ds-events-recurring-entry-by-id.member-role', '$ds-events-recurring-entry-by-id-preview.member-role', '$ds-locations-groups.leaders');
    }

    public function about()
    {
        return array(
            'name' => 'Members Roles by ID',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T20:06:56+00:00'
        );
    }

    public function getSource()
    {
        return '18';
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