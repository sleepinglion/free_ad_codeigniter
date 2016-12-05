<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'SL.php';

class Article_photo extends SL_Model {
	protected $table = 'article_photos';

	public function get_index_photo($article_id) {
		$this -> pdo -> where(array($this -> table . '.article_id' => $article_id));
		$result['total'] = $this -> pdo -> count_all_results($this -> table);

		if (!$result['total'])
			return $result;

		$this -> pdo -> order_by($this -> table . '.id', 'asc');
		$this -> pdo -> where(array($this -> table . '.article_id' => $article_id));
		$query = $this -> pdo -> get($this -> table);
		$result['list'] = $query -> result_array();
		return $result;
	}

	public function insert(Array $data) {
		if ($this -> pdo -> insert($this -> table, array('article_id' => $data['article_id'], 'file_name' => $data['file_name'], 'origin_name' => $data['orig_name'], 'raw_name' => $data['raw_name'], 'ext' => $data['file_ext'], 'size' => $data['file_size'], 'width' => $data['image_width'], 'height' => $data['image_height'], 'type' => $data['image_type']))) {
			return $this -> pdo -> insert_id();
		} else {
			return false;
		}
	}

}
