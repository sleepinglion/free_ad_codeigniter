<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'SL.php';

class Community_photo extends SL_Model {
	protected $table = 'community_photos';

	public function get_index_photo($community_id) {
		$this -> pdo -> where(array($this -> table . '.community_id' => $community_id));
		$result['total'] = $this -> pdo -> count_all_results($this -> table);

		if (!$result['total'])
			return $result;

		$this -> pdo -> order_by($this -> table . '.id', 'asc');
		$this -> pdo -> where(array($this -> table . '.community_id' => $community_id));
		$query = $this -> pdo -> get($this -> table);
		$result['list'] = $query -> result_array();
		return $result;
	}

	public function insert(Array $data) {
		if ($this -> pdo -> insert($this -> table, array('community_id' => $data['community_id'], 'file_name' => $data['file_name'], 'origin_name' => $data['orig_name'], 'raw_name' => $data['raw_name'], 'ext' => $data['file_ext'], 'size' => $data['file_size'], 'width' => $data['image_width'], 'height' => $data['image_height'], 'type' => $data['image_type']))) {
			return $this -> pdo -> insert_id();
		} else {
			return false;
		}
	}

}
