<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourceteachings_entry_by_id extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'teachings-entry-by-id';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (teachings))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '1';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamPARAMOUTPUT = array(
        'video-podcast'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-tags-filtered.system-id:43},{$pt2}',
        '216' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title: unformatted',
        'slug',
        'filename',
        'current-id',
        'book',
        'chapter',
        'description: formatted',
        'speaker',
        'date',
        'poster',
        'video',
        'day',
        'tags',
        'video-podcast'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'speaker' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name',
                'photo',
                'about: formatted'
            )
        ),
        'poster' => array(
            'section_id' => '8',
            'field_id' => '313',
            'elements' => array(
                'image'
            )
        ),
        'video' => array(
            'section_id' => '22',
            'field_id' => '183',
            'elements' => array(
                'title',
                'description',
                'date',
                'url',
                'player',
                'thumbnail',
                'uid'
            )
        ),
        'tags' => array(
            'section_id' => '15',
            'field_id' => '127',
            'elements' => array(
                'tag: unformatted'
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
            'name' => 'Teachings: Entry by ID',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-06T02:08:19+00:00'
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