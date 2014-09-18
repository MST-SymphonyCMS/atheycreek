<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcejson_ustream extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'json-ustream';
    public $dsParamURL = 'http://api.ustream.tv/json/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E';
    public $dsParamFORMAT = 'json';
    public $dsParamXPATH = '/';
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
            'name' => 'JSON: Ustream',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://atheycreek.dev',
                'email' => 'jdsimcoe@gmail.com'),
            'version' => 'Symphony 2.5.0',
            'release-date' => '2014-09-18T21:47:30+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}