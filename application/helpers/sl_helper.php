<?php  

if ( ! defined('BASEPATH')) exit('No direct script access allowed');


function tag_restore($tags) {
	if(!is_array($tags))
		return '';
	
	$cc=count($tags);
	
	if(!$cc)
		return '';
	
	$tag_s='';
	foreach($tags as $index=>$value) {
		$tag_s.=$value['name'];
		if($index+1<$cc)
			$tag_s.=',';
	}
	return $tag_s;
}

	//인자로 들어오는 값을 2번 쓰는 잉여함수
function bar_color($index) {
	$dd=$index%4;
	
	switch($dd) {
		case 0 :
			return 'success';
			break;
		case 1 :
			return 'info';
			break;
		case 2 : 
			return 'warning';
			break;
		case 3 :
			return 'danger';
			break;
	}
}

function sl_show_anchor($url,$title,Array $options=array()) {
	$_SERVER['REQUEST_URI_PATH'] = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
	$segments = explode('/', $_SERVER['REQUEST_URI_PATH']);
	
	if(isset($segments[2]))
		$page=$segments[2];
	
	if($_SERVER['QUERY_STRING']) {
		$url=$url.'?'.$_SERVER['QUERY_STRING'];
		
		if(isset($page)) {
		$url=$url.'&page='.$page;
		}		
	} else {
		if(isset($page)) {
		$url=$url.'?page='.$page;
		}
	}
	
	return anchor($url,$title,$options);
}

function sl_index_anchor($url,$title,Array $options=array()) {
	parse_str($_SERVER['QUERY_STRING'], $qs_a);
	$count=count($qs_a);
	
	if($count) {
		if(isset($qs_a['page'])) {
			$url.='/'.$qs_a['page'];
			
			if($count>1) {
				$url.='?'.str_replace('&page='.$qs_a['page'],'',$_SERVER['QUERY_STRING']);
			}
		} else {
				$url.='?'.$_SERVER['QUERY_STRING'];
		}
		

	}
	
	return anchor($url,$title,$options);
}
?>