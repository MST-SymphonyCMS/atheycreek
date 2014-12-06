<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceustream extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'ustream';
    public $dsParamURL = 'http://api.ustream.tv/xml/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/xml/results/status';
    public $dsParamCACHE = 1;
    public $dsParamTIMEOUT = 10;

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Ustream',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.1',
            'release-date' => '2014-09-21T03:25:43+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}