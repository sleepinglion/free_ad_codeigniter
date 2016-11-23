<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'SL.php';

class Home extends SL_Controller {
	public function index() {
		$this->load->model('Tag');
		$data['tags']=$this->Tag->get_cloud('poll_communities');
		
		$this->layout->add_js('/js/plugin/jquery.tagcanvas.min.js');
		$this->layout->add_js('/js/index.js');
		$this->layout->render('home/index',array('data'=>$data));
	}
}
