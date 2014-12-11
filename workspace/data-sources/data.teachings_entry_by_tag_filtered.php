<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_entry_by_tag_filtered extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-entry-by-tag-filtered';
		public $dsParamConditionalizer = '(if all of ((if value of ({$pt1}) is (teachings)), (if value of ({$pt2}) is (tag))) is (yes))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '{$pt5:10}';
    public $dsParamSTARTPAGE = '{$pt4:1}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$pt3';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '124' => '{$pt3}',
        '216' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'title: unformatted',
        'slug',
        'filename',
        'book',
        'chapter',
        'description: unformatted',
        'speaker',
        'date',
        'tags'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'tags' => array(
            'section_id' => '15',
            'field_id' => '127',
            'elements' => array(
                'tag: unformatted'
            )
        ),
        'speaker' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name'
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
            'name' => 'Teachings: Entry by tag (filtered)',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2014-12-11T00:12:33+00:00'
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