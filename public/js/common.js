$(document).ready(function(){
	$("a.simple_image").fancybox({
		'opacity'   : true,
		'overlayShow'        : true,
		'overlayColor': '#000000',
		'overlayOpacity'     : 0.9,
		'titleShow':true,
		'openEffect'  : 'elastic',
		'closeEffect' : 'elastic'
	});	

	if(!$('#myCanvas').tagcanvas({
	     outlineThickness : 1,
	     maxSpeed : 0.05,
	 			textFont: null,
	 			textColour: null,
	 			weight: true,   
	     depth : 1
	   },'tags')) {
	     // TagCanvas failed to load
	     $('#myCanvasContainer').hide();
	     $("#tags ul").css({'margin':0,'padding':0,'list-style':'none'});
	     $("#tags ul li").css({'float':'left','margin':'0 10px'});     
	  }

	$("#show_menu").click(function(){
		if($("aside").is(':visible')) {
			$("aside").animate({width:'0%'},300,function(){$("#div_black").hide();});	
		} else {
			$("aside").show();
			$("aside").animate({width:'65%'},300,function(){$("#div_black").show();});
		}
		return false;
	});
	
	$("#close_menu").click(function(){
		$("aside").animate({width:'0'},300,function(){$("#div_black").hide();$(this).hide()});
		return false;
	});
	
	$("#show_search_form").click(function(){
		if($("#s-search_form_layer").is(':visible')) {
			$("#s-search_form_layer").slideUp();			
		} else {
			$("#s-search_form_layer").slideDown();
			$("#s-search_form_layer").find('input:first').focus();
		}
	});
	
	$('.grid').masonry({
		  // set itemSelector so .grid-sizer is not used in layout
		  itemSelector: '.article',
		  // use element for option
		  columnWidth: '.article',
		  percentPosition: true
	});
	
	$(".btn-share").click(function(){
		var url=window.location.href+'view/'+$(this).parent().find('input:first').val();
		$("#sns_share a:first").attr('href','https://www.facebook.com/sharer/sharer.php?u='+url);
		$("#sns_share a:eq(1)").attr('href','https://twitter.com/home?status='+url);
		$("#sns_share a:eq(2)").attr('href','https://plus.google.com/share?url='+url);
		$("#sns_share_url").val(url);	
	});
	
	$(".new_comment_form textarea,.comment_comment_form textarea").focus(textarea_focus);
	
	function textarea_focus(){
		if($(this).attr('placeholder')) {
			if(confirm('로그인후 사용가능합니다. 지금 로그인 하시겠습니까?')) {
				location.href='/login?redirect=1';
			}
		}
	}		
	
	$(".comment-delete-button").click(function(){
		
		if(!confirm('정말로 삭제합니까?')) {
			return false;
		}
		
		var uri=$.uri.setUri($(this).attr('href'));
		var id=uri.segment(3);
		var r=$(this).parent().parent().parent();
		
		$.post('/communities/comments/delete/'+id, {
			'id' : id,
			//'category_id' : category_id,
			'json' : true
		}, function(data) {
			if(data.result=='success') {
				r.remove();
			} else {
				alert(data.message);
			}
		},'json');
		return false;
	});
	
		$(".comment-comment-delete-button").click(function(){
		
		if(!confirm('정말로 삭제합니까?')) {
			return false;
		}
		
		var uri=$.uri.setUri($(this).attr('href'));
		var id=uri.segments(3);
		var r=$(this).parent().parent().parent();	
		
		$.post('/communities/comments/comments/delete/'+id, {
			'id' : id,
		//	'category_id' : category_id,
			'json' : true
		}, function(data) {
			if(data.result=='success') {
				r.remove();
			} else {
				alert(data.message);
			}
		},'json');
		return false;
	});	
	
	$('#myModal').on('shown.bs.modal', function () {
		$("#sns_share_url").focus();
	});
	
	$("a.a_link").click(function(){
		$(this).parent().parent().find(".link_more").click();
		return false;
	});
	
	$(".link_more").click(function(){
		var ll=$(this).parent();
		var lll=$(this).parent().parent();
		var content_layer=ll.find('.content_text_layer');
		var a_link=ll.find('.a_link');
		var more=ll.find('.link_more');
		var aid=a_link.attr('href').split('/').pop();
		
	//	var h3=lll.find('h3').clone(false);
	//	var h3text=h3.find('a').text();
	//	h3.text(h3text).find('a').remove();
	//	lll.find('h3').replaceWith(h3);
		if(content_layer.is(':visible')) {
			content_layer.slideUp(function(){
				a_link.fadeIn();
				more.text('더보기');
				$('#sl_community_index .grid').masonry();				
			});
			
		} else {
			content_layer.load('/view/'+aid,function(){
				a_link.fadeOut();
				more.text('닫기');
				content_layer.slideDown(function(){
					$('#sl_community_index .grid').masonry();
				});
			});
		}
	});
	
	$(".comment_btn").click(function(){
		var pp=$(this).parent().parent().parent();
		if(pp.find('.comments').is(':visible')) {
			pp.find('.comments').slideUp(function(){
				$('#sl_community_index .grid').masonry();
			});			
		} else {
			$('.comments:visible').slideUp();			
			pp.find('.comments').slideDown(function(){
				$('#sl_community_index .grid').masonry();		
			});
		}
	});
	
	$(".recommend_form").submit(function(){
		var form=$(this);
		$.post($(this).attr('action'),{'id':$(this).find('input[name="id"]').val()},function(data){
			if(data.result=='success') {		
				form.find(".recommend_count").text(Number(form.find(".recommend_count").text())+1);
			} else {
				alert(data.message);
			}
		},'json');
		
		return false;
	});	
	
	$('.carousel').carousel();
});