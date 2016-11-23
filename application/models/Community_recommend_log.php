<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'SL.php';

class Community_recommend_log extends SL_Model {
	protected $table='community_recommend_logs';
	
	public function check_exists($id) {
		$this -> pdo -> where(array('community_id' => $id, 'ip'=>ip2long($_SERVER['REMOTE_ADDR'])));
		if(intval($this -> pdo -> count_all_results($this->table))) {
			return true;
		} else {
			return false;
		}
	}
	
	public function insert(Array $data) {
		$data['user_id']=$this->session->userdata('user_id');
		$data['ip']=ip2long($_SERVER['REMOTE_ADDR']);
		$data['created_at']=date("Y-m-d H:i:s");
		if ($this -> pdo -> insert($this->table, $data)) {
			return $this -> pdo -> insert_id();
		} else {
			return false;
		}
	}
}

