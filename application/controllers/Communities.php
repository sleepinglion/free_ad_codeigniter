<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'SL.php';

class Communities extends SL_Controller {
	public function index($page = 0) {
		$this -> load -> helper('sl');

		$this -> load -> model('Community');

		$config['per_page'] = 8;
		
		$data = $this -> Community -> get_index($config['per_page'], $page);

		
		$this->load->model('Tag');
		$data['tags']=$this->Tag->get_cloud('communities');
		
		
		if($data['total']) {
			$this -> load -> model('Community_photo');
			$this -> load -> model('Poll');
			foreach($data['list'] as $index=>$value) {
				$data['list'][$index]['photo'] = $this -> Community_photo -> get_index_photo($value['id']);
				$data['list'][$index]['comments'] = $this -> Community -> get_comments($value['id']);
				$data['polls'] = $this -> Poll -> get_index_by_community_id($value['id']);
			}
		}
		
		if($this->input->is_ajax_request()) {
			$data['result']='success';
			echo json_encode($data);
		} else {
			$this -> layout -> add_js('/js/index.js');
			$this -> layout -> render('communities/index', array('data' => $data));
		}
	}

	public function view($id) {
		if($this->input->is_ajax_request()) {
			$this -> load -> model('Community');
			$content = $this -> Community -> get_content($id);
			
			$this -> load -> model('Community_log');

			if (!$this -> Community_log -> check_exists($content['id'])) {
				$this -> Community -> update_count_plus($content['id']);
			}
			$this -> Community_log -> insert(array('community_id' => $content['id']));
			
			echo $content['content'];
			return true;
		}				
		
		$content=$this->view_content($id);
		
		$config['per_page'] = 8;

		$data = $this -> Community -> get_index($config['per_page'], 0);
		$this -> layout -> title_for_layout = _('default page title');
		
		$this->load->model('Tag');
		$data['tags']=$this->Tag->get_cloud('blogs');
		
		if($data['total']) {
			$this -> load -> model('Community_photo');
			$this -> load -> model('Poll');
			foreach($data['list'] as $index=>$value) {
				$data['list'][$index]['photo'] = $this -> Community_photo -> get_index_photo($value['id']);
				$data['list'][$index]['comments'] = $this -> Community -> get_comments($value['id']);
				$data['polls'] = $this -> Poll -> get_index_by_community_id($value['id']);
			}
		}
		
		$data['content'] = $content['content'];	
		$data['is_view'] = true;
		
		$this->load->model('Tag');
		$data['tags']=$this->Tag->get_cloud('communities');
		
		$this -> layout -> add_js('/js/view.js');
		$this -> layout -> render('communities/index', array('data' => $data));
	}

	protected function view_content($id) {
		$this -> load -> helper('sl');

		$this -> load -> model('Community');
		
		if(!$this -> Community -> get_count($id))
			show_404();
		
		$data['content'] = $this -> Community -> get_content($id);
		$data['content']['comments'] = $this -> Community -> get_comments($data['content']['id']);
		
		
		$this -> load -> model('Tag');
		$data['content']['tags'] = $this -> Tag -> get_index_by_taggable_id($data['content']['id']);

		$this -> load -> model('Poll');
		$data['content']['polls'] = $this -> Poll -> get_index_by_community_id($data['content']['id']);

		$this -> load -> model('Community_log');

		if (!$this -> Community_log -> check_exists($data['content']['id'])) {
			$this -> Community -> update_count_plus($data['content']['id']);
		}
		$this -> Community_log -> insert(array('community_id' => $data['content']['id']));
		

		$this -> load -> model('Community_photo');
		$data['content']['photo'] = $this -> Community_photo -> get_index_photo($data['content']['id']);
		
		return $data;
/*
		$this -> layout -> add_css('/css/plugin/jquery.fancybox-1.3.4.css');
		$this -> layout -> add_js('/js/plugin/jquery.uri.js');
		$this -> layout -> add_js('/js/plugin/jquery.fancybox.1.3.4.js');
		$this -> layout -> add_js('/js/boards/view.js'); */
	}

	public function edit($id) {
		if (!$this -> session -> userdata('admin')) {
			redirect('/');
		}
		
		$this -> load -> helper('sl');

		$this -> load -> library('form_validation');
		$this -> form_validation -> set_rules('title', _('title'), 'required|min_length[3]|max_length[60]');
		$this -> form_validation -> set_rules('description', _('description'), 'required|min_length[3]|max_length[60]');

		if ($this -> form_validation -> run() == FAlSE) {
			$this -> load -> model('Community');
			$data['content'] = $this -> Community -> get_content($id);
			
			$this -> load -> model('Tag');
			$data['tags'] = $this -> Tag -> get_index_by_taggable_id($data['content']['id']);
			
			$this -> load -> model('Community_photo');
			$data['content']['photo'] = $this -> Community_photo -> get_index_photo($data['content']['id']);
			
			$data['admin']=true;
			$this -> layout -> add_js('/ckeditor/ckeditor.js');
			$this -> layout -> add_js('/js/add.js');
			$this -> layout -> render('communities/edit', array('data' => $data));
		} else {
			$this -> load -> model('Community');
			$data = $this -> input -> post(NULL, TRUE);
			$data['id']=$id;
			$data['user_id'] = $this -> session -> userdata('user_id');
			if ($id = $this -> Community -> update($data)) {

				$clean['tag'] = explode(',', $data['tag']);
				foreach ($clean['tag'] as $index => $value) {
					$clean['tag'][$index] = trim($value);
				}
/*
				$this -> load -> model('Tag');
				$this -> Tag -> update(array('taggable_id' => $id, 'tags' => $clean['tag']));

				$this -> load -> model('Poll');
				$this -> Poll -> update(array('poll_community_id' => $id, 'polls' => $data['poll_title']));
*/
				$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => 'gg'));
				redirect('/');
			} else {
				redirect('/edit');
			}
		}
	}

	public function add() {
		if (!$this -> session -> userdata('admin')) {
			redirect('/');
		}

		$this -> load -> library('form_validation');
		$this -> form_validation -> set_rules('title', _('title'), 'required|min_length[3]|max_length[60]');
		$this -> form_validation -> set_rules('description', _('description'), 'required|min_length[3]|max_length[60]');

		if ($this -> form_validation -> run() == FAlSE) {
			$this -> layout -> add_js('/ckeditor/ckeditor.js');
			$this -> layout -> add_js('/js/add.js');
			$this -> layout -> render('communities/add', array('data' => array('admin'=>true)));
		} else {
			$data = $this -> input -> post(NULL, TRUE);

			if ($upload_data = $this -> _photo_upload()) {
				$data = $this -> input -> post(NULL, TRUE);
				$data['photo'] = $upload_data;
			} else {
				$data['admin']=true;				
				$this -> layout -> add_js('/ckeditor/ckeditor.js');
				$this -> layout -> add_js('/js/add.js');
				print_r($this -> upload -> display_errors());
				$this -> layout -> render('communities/add', array('data' => $data,'error' => $this -> upload -> display_errors()));
				return true;
			}

			$this -> load -> model('Community');
			$data['user_id'] = $this -> session -> userdata('user_id');
			if ($id = $this -> Community -> insert($data)) {


				$clean['tag'] = explode(',', $data['tag']);
				foreach ($clean['tag'] as $index => $value) {
					$clean['tag'][$index] = trim($value);
				}
				unset($index);
				unset($value);

				$this -> load -> model('Community_photo');
				foreach ($data['photo'] as $index => $value) {
					$value['community_id']=$id;
					$this->Community_photo->insert($value);
				}

				$this -> load -> model('Tag');
				$this -> Tag -> insert(array('taggable_id' => $id, 'tags' => $clean['tag']));

				$this -> load -> model('Poll');
				$this -> Poll -> insert(array('community_id' => $id, 'polls' => $data['poll_title']));

				$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => _('successfully add new article')));
				redirect('/');
			} else {
				$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => _('unable to add new article')));
				redirect('/add');
			}
		}
	}

	public function confirm_delete($id) {
		$this -> layout -> render('communities/confirm_delete', array('id' => $id));
	}

	public function delete($id) {
		$this -> load -> model('Community');
		if ($this -> Community -> delete($id)) {
			$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => 'delete'));
			redirect('communities');
		} else {
			$this -> session -> set_flashdata('message', array('type' => 'alert', 'message' => 'delete'));
			redirect('communities');
		}
	}
	
	public function load_share_pop() {
		
	}
	
	public function load_search_form() {
		
	}

	public function recommend() {
		$this -> load -> library('form_validation');
		$this -> form_validation -> set_rules('id', _('id'), 'required');
		
		$data=array('result'=>'error');

		if ($this -> form_validation -> run() == TRUE) {
			$this -> load -> model('Community_recommend_log');
			$id=$this->input->post('id');
			if ($this -> Community_recommend_log -> check_exists($id)) {
				$message=_('already recommended article');
				if(!$this->input->is_ajax_request())
					$this -> session -> set_flashdata('message', array('type' => 'warning', 'message' => $message));
			} else {
				$this -> Community_recommend_log -> insert(array('community_id' =>$id));
				
				$this -> load -> model('Community');
				$this -> Community -> update_recommend_count_plus($id);
				$message=_('already recommended article');
				if($this->input->is_ajax_request()) {
					$data['result']='success';
				} else {
					$this -> session -> set_flashdata('message', array('type' => 'success', 'message' => $message));
				}
			}
			if($this->input->is_ajax_request()) {
				$data['message']=$message;
				echo json_encode($data);
			} else {
				redirect('/');
			}
			//redirect('/view/'.$id);
		}		
	}

	private function _photo_upload() {
		$config['upload_path'] = './uploads/communities/';
		$config['allowed_types'] = 'gif|jpg|jpeg|png';
		$config['encrypt_name'] = true;
		//$config['max_size'] = '100';
		$config['max_width'] = '3000';
		$config['max_height'] = '3000';

		$this -> load -> library('upload', $config);
		$this -> upload -> initialize($config);

		if ($this -> upload -> do_multi_upload('photos')) {
			$data = $this -> upload -> get_multi_upload_data();

			$config['image_library'] = 'gd2';
			$config['create_thumb'] = TRUE;
			$config['maintain_ratio'] = FALSE;
			$config['width'] = 400;
			$config['height'] = 400;
			$config['thumb_marker'] = '';
			$this -> load -> library('image_lib', $config);
			
			foreach ($data as $key => $value) {
				$config['source_image'] = $value['full_path'];
				$config['new_image'] = 'thumb_' . $value['file_name'];
				
				$this->image_lib->initialize($config);
				$this -> image_lib -> resize();
			}
			return $data;
		} else {
			return false;
		}
	}
}
