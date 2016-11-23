<?php

class SL_Model extends CI_Model {
	protected $table;

	public function __construct() {
		$this -> pdo = $this -> load -> database('pdo', true);
	}

	public function get_count($id=null) {		
		if(isset($id)) {
			$this -> pdo -> where(array($this -> table . '.id' => $id));
		}
		
		return $this -> pdo -> count_all_results($this->table);
	}

	public function get_index($per_page = 0, $page = 0) {
		$result['total'] = $this -> pdo -> count_all_results($this->table);

		if (!$result['total'])
			return $result;

		$this -> pdo -> order_by("id", "desc");
		$query = $this -> pdo -> get($this->table, $per_page, $page);
		$result['list'] = $query -> result_array();
		return $result;
	}

	public function get_content($id) {
		$query = $this -> pdo -> get_where($this->table, array('id' => $id));
		$result = $query -> result_array();
		return $result[0];
	}

	public function insert(Array $data) {
		$data['user_id']=$this->session->userdata('user_id');
		$data['created_at']=date("Y-m-d H:i:s");
		if ($this -> pdo -> insert($this->table, $data)) {
			return $this -> pdo -> insert_id();
		} else {
			return false;
		}
	}

	public function delete($id) {
		if($this->pdo->delete($this->table, array('id' => $id))) {
			return true;
		} else {
			return false;
		}
	}
}

