<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcepodcast_video extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'podcast-video';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '1000';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '271' => 'yes',
        '216' => 'no',
        '280' => 'no',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title: unformatted',
        'filename',
        'book',
        'chapter',
        'description: unformatted',
        'speaker',
        'date',
        'poster',
        'video-duration',
        'video-540-filesize',
        'video-720-filesize',
        'video-podcast-url',
        'hide'
    );

    public $dsParamINCLUDEDASSOCIATIONS = array(
        'speaker' => array(
            'section_id' => '1',
            'field_id' => '318',
            'elements' => array(
                'first-name',
                'last-name'
            )
        ),
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
            'name' => 'Podcast: Video',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0beta2',
            'release-date' => '2014-08-05T20:47:56+00:00'
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