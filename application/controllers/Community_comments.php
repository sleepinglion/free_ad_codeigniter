<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'SL.php';

class Community_comments extends SL_Controller {
	public function add() {
		$this -> load -> library('form_validation');
		$this -> form_validation -> set_rules('content', 'Content', 'required|min_length[2]');
		
		if ($this -> form_validation -> run() == TRUE) {
			$this -> load -> model('Community_comment');
			$data = $this -> input -> post(NULL, TRUE);
			$data['user_id'] = $this -> session -> userdata('user_id');
			if ($id = $this -> Community_comment -> insert($data)) {
				$this -> load -> model('Poll');
				$this -> Poll -> update_count_plus($data['poll_id']);
				
				$this -> load -> model('Community');
				$this -> Community -> update_comment_count_plus($data['community_id']);

				$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => 'delete'));
				redirect('communities/view/' . $data['community_id']);
			} else {
				$this -> session -> set_flashdata('error', array('type' => 'alert', 'message' => 'gg'));
				$this -> layout -> render('users/add', $data);
			}
		}
	}

	public function confirm_delete($id) {
		$this -> layout -> render('communities/comment/confirm_delete', array('id' => $id));
	}

	public function delete($id) {
		$this -> load -> model('Community_comment');
		$data = $this -> Community_comment -> get_content($id);

		if ($this -> Community_comment -> delete($data['id'])) {
			$this -> load -> model('Poll');
			$this -> Poll -> update_count_minus($data['poll_id']);
			
			$this -> load -> model('Community');
			$this -> Community -> update_comment_count_minus($data['community_id']);
			
			if($this->input->post('json')) {
				echo json_encode(array('result'=>'success'));
			} else {
				$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => 'delete'));
				redirect('communities/view/' . $data['community_id']);
			}
		} else {
			if($this->input->post('json')) {
				echo json_encode(array('result'=>'error'));
			} else {			
				$this -> session -> set_flashdata('message', array('type' => 'alert', 'message' => 'delete'));
				redirect('communities/view/' . $data['community_id']);
			}
		}
	}
}
