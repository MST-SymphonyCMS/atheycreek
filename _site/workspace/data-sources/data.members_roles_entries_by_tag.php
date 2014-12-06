<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcemembers_roles_entries_by_tag extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'members-roles-entries-by-tag';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREQUIREDPARAM = '$pt1:43';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '152' => '{$ds-tags-filtered.system-id:43}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'member',
        'role'
    );

    public $dsParamINCLUDEDASSOCIATIONS = array(
        'member' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name',
                'photo',
                'email',
                'about: formatted',
                'phone-number',
                'anonymize'
            )
        ),
        'role' => array(
            'section_id' => '17',
            'field_id' => '132',
            'elements' => array(
                'role: unformatted'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-tags-filtered.system-id');
    }

    public function about()
    {
        return array(
            'name' => 'Members/Roles: Entries by tag',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T15:06:43+00:00'
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