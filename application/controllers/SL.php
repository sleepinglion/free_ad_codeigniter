<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SL_Controller extends CI_Controller {
	public function __construct() {
		parent::__construct();

		/* i18n locale */
		$locale = 'ko_KR.UTF-8';

		if (!function_exists('_'))
			echo '없어!!';

		putenv("LC_ALL=" . $locale);
		setlocale(LC_ALL, $locale);
		bindtextdomain('messages', APPPATH . DIRECTORY_SEPARATOR . 'language');
		textdomain('messages');
		bind_textdomain_codeset('messages', 'UTF-8');



		$this -> load -> helper('url');
		$this -> load -> helper('form');
		$this -> load -> library('session');
		$this -> load -> library('layout', array('title_for_layout' => 'default'));
		
		$this -> layout -> title_for_layout = _('default page title');		
		$this -> layout -> add_css('/css/bootstrap.min.css');
		$this -> layout -> add_css('/css/plugin/jquery.fancybox-1.3.4.css');
		$this -> layout -> add_css('/css/index.css');
		$this -> layout -> add_js('/js/jquery-2.1.1.min.js');
		$this -> layout -> add_js('/js/bootstrap.min.js');
		$this -> layout -> add_js('/js/masonry.pkgd.min.js');
		$this -> layout -> add_js('/js/plugin/jquery.uri.js');
		$this -> layout -> add_js('/js/plugin/jquery.tagcanvas.min.js');
		$this -> layout -> add_js('/js/plugin/jquery.fancybox.1.3.4.js');
		$this -> layout -> add_js('/js/common.js');
	}
	
	public function setting_pagination(Array $config) {			
		$this -> load -> library('pagination');


		$config['base_url'] = base_url() . $this -> router -> fetch_class();


		$config['full_tag_open'] = '<div class="text-center"><ul class="pagination">';
		$config['full_tag_close'] = '</ul></div><!--pagination-->';

		$config['first_link'] = '&laquo; First';
		$config['first_tag_open'] = '<li class="prev page">';
		$config['first_tag_close'] = '</li>';

		$config['last_link'] = 'Last &raquo;';
		$config['last_tag_open'] = '<li class="next page">';
		$config['last_tag_close'] = '</li>';

		$config['next_link'] = 'Next &rarr;';
		$config['next_tag_open'] = '<li class="next page">';
		$config['next_tag_close'] = '</li>';

		$config['prev_link'] = '&larr; Previous';
		$config['prev_tag_open'] = '<li class="prev page">';
		$config['prev_tag_close'] = '</li>';

		$config['cur_tag_open'] = '<li class="active"><a href="">';
		$config['cur_tag_close'] = '</a></li>';

		$config['num_tag_open'] = '<li class="page">';
		$config['num_tag_close'] = '</li>';
		$config['next_link'] = '▶';
		$config['prev_link'] = '◀';
		// $config['display_pages'] = FALSE;
		//
		$config['anchor_class'] = 'follow_link';
		
		if (count($_GET) > 0) {
			$config['suffix'] = '?' . http_build_query($_GET, '', "&");
			$config['first_url'] = $config['base_url'].'?'.http_build_query($_GET);
		}
		$this -> pagination -> initialize($config);
	}
}
