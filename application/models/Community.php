<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'SL.php';

class Community extends SL_Model {
	protected $table = 'communities';
	protected $content_table = 'community_contents';

	private function get_tag_search() {
		$this -> pdo -> select($this -> table . '.*,tags.name,tags.taggings_count');
		$this -> pdo -> join('taggings', 'taggings.taggable_id=' . $this -> table . '.id');
		$this -> pdo -> join('tags', 'tags.id=taggings.tag_id');
		$this -> pdo -> where(array('tags.name' => $this -> input -> get('tag'), 'taggings.taggable_type' => $this -> router -> fetch_class()));
		$this -> pdo -> group_by($this -> table . '.id');
	}

	private function get_search() {
		$result['search_type_title'] = _('label_title');
		switch($this -> input -> get('search_type')) {
			case 'title' :
				if ($this -> input -> get('search_word'))
					$this -> pdo -> like($this -> table . '.title', $this -> input -> get('search_word'));
				break;
			case 'content' :
				if ($this -> input -> get('search_word')) {
					$this -> pdo -> join($this -> content_table, $this->table.'.id='.$this->content_table.'.id');
					$this -> pdo -> like($this -> content_table . '.content', $this -> input -> get('search_word'));
				}
				$result['search_type_title'] = _('label_content');
				break;
			case 'titlencontent' :
				if ($this -> input -> get('search_word')) {
					$this -> pdo -> join($this -> content_table, $this->table.'.id='.$this->content_table.'.id');
					$this -> pdo -> like($this -> table . '.title', $this -> input -> get('search_word'));
					$this -> pdo -> or_like($this -> content_table.'.content', $this -> input -> get('search_word'));
					$query_where = 'WHERE (b.title LIKE CONCAT("%",:title,"%") OR bc.content LIKE CONCAT("%",:content,"%")) AND b.enable=1';
				}
				$result['search_type_title'] = _('label_title+content');
				break;
			/*	case 'nickname' :
			 if($this -> input -> get('search_word')) {
			 $this -> pdo -> join('users', 'poll_communities.user_id=users.id');
			 $this -> pdo -> like('users.nickname',$this -> input -> get('search_word'));
			 }
			 $result['search_type_title'] = _('label_nickname');
			 break; */
		}
		return $result;
	}

	public function get_index($per_page = 0, $page = 0) {
		if ($this -> input -> get('tag')) {
			$this -> get_tag_search();
		}

		if ($this -> input -> get('search_type')) {
			$result = $this -> get_search();
		}
		
		if($this->uri->segment($this->uri->total_segments()-1)=='view') {
			$iview=true;
			$vid=$this->uri->segment($this->uri->total_segments());
		} else {
			$iview=false;
		}
		
		if($iview)
			$this -> pdo -> where_not_in($this->table.'.id',$vid);
		
		$result['total'] = $this -> pdo -> count_all_results($this -> table);

		if (!$result['total'])
			return $result;

		if ($this -> input -> get('tag')) {
			$this -> get_tag_search();
		}

		$result['search_type_title'] = _('label_title');
		if ($this -> input -> get('search_type')) {
			$this -> get_search();
		}
		

		$this -> pdo -> select($this -> table . '.*,users.nickname,users.photo as user_photo');
		//$this -> pdo -> join($this->content_table, $this->content_table.'.id = '.$this->table.'.id');
		$this -> pdo -> join('users', $this->table.'.user_id = users.id');
		if($iview)
			$this -> pdo -> where_not_in($this->table.'.id',$vid);
				
		$this -> pdo -> where(array($this -> table . '.enable' => 1));
		$this -> pdo -> order_by($this -> table . '.id', 'desc');
		$query = $this -> pdo -> get($this -> table, $per_page, $page);
		$result['list'] = $query -> result_array();
		return $result;
	}

	public function get_comments($id) {
		
		$this -> pdo -> where(array('community_id' => $id));
		$result['total'] = $this -> pdo -> count_all_results('community_comments');

		if (!$result['total'])
			return $result;

		$this -> pdo -> select('community_comments.*,polls.title,users.nickname,users.photo');
		$this -> pdo -> from('community_comments');
		$this -> pdo -> join('polls', 'community_comments.poll_id = polls.id');
		$this -> pdo -> join('users', 'community_comments.user_id = users.id');
		$this -> pdo -> where(array('community_comments.community_id' => $id));
		$query = $this -> pdo -> get();
		$result['list'] = $query -> result_array();

		foreach ($result['list'] as $index => $value) {
			$result['list'][$index]['comments'] = $this -> get_comment_comments($value['id']);
		}

		return $result;
	}

	public function get_comment_comments($comment_id) {
		$this -> pdo -> where(array('community_comment_id' => $comment_id));
		$result['total'] = $this -> pdo -> count_all('community_comment_comments');

		if (!$result['total'])
			return $result;

		$this -> pdo -> select('community_comment_comments.*,polls.title,users.nickname,users.photo');
		$this -> pdo -> from('community_comment_comments');
		$this -> pdo -> join('polls', 'community_comment_comments.poll_id = polls.id');
		$this -> pdo -> join('users', 'community_comment_comments.user_id = users.id');
		$this -> pdo -> where(array('community_comment_id' => $comment_id));
		$query = $this -> pdo -> get();
		$result['list'] = $query -> result_array();

		return $result;
	}

	public function get_content($id) {
		$this -> pdo -> select($this -> table . '.*,'.$this -> content_table.'.content,users.nickname,users.photo as user_photo');
		$this -> pdo -> from($this -> table);
		$this -> pdo -> join($this -> content_table, $this -> table . '.id = '.$this -> content_table.'.id');
		$this -> pdo -> join('users', $this -> table . '.user_id = users.id');
		$this -> pdo -> where(array($this -> table . '.id' => $id));
		$query = $this -> pdo -> get();
		$result = $query -> result_array();

		return $result[0];
	}

	public function insert(Array $data) {
		if ($this -> pdo -> insert($this -> table,array('user_id' => $data['user_id'], 'title' => $data['title'],'description'=>$data['description'],'created_at'=>date("Y-m-d H:i:s")))) {
			$id = $this -> pdo -> insert_id();
			$this -> pdo -> insert($this -> content_table, array('id' => $id, 'content' => $_POST['content']));
			return $id;
		} else {
			return false;
		}
	}
	
	public function update(Array $data) {
		if ($this -> pdo -> update($this -> table,array('user_id' => $data['user_id'], 'title' => $data['title'],'description'=>$data['description'],'created_at'=>date("Y-m-d H:i:s")),array('id'=>$data['id']))) {
			$this -> pdo -> update($this -> content_table, array('content' => $_POST['content']),array('id' => $data['id']));
			return true;
		} else {
			return false;
		}
	}
	
	public function update_recommend_count_plus($id) {
		$this -> pdo -> set('recommend_count', 'recommend_count+1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}
	
	public function update_recommend_count_minus($id) {
		$this -> pdo -> set('recommend_count', 'recommend_count-1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}		

	public function update_count_plus($id) {
		$this -> pdo -> set('count', 'count+1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}

	public function update_count_minus($id) {
		$this -> pdo -> set('count', 'count-1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}

	public function update_comment_count_plus($id) {
		$this -> pdo -> set('comment_count', 'comment_count+1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}

	public function update_comment_count_minus($id) {
		$this -> pdo -> set('comment_count', 'comment_count-1', FALSE);
		$this -> pdo -> where('id', $id);
		$this -> pdo -> update($this -> table);
	}

}
