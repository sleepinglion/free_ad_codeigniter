$(document).ready(function(){
	var page=1;	
	$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			var t_page=page+1;
			
			if(page*8>=$("#total_article").val())
				return true;
			
			var aid=$.uri.segment(1);
			
			$.get('/communities/'+page*8,{'id':aid},function(data){
				if(data.result=='success') {
					if(Number(data.total)) {
						$.each(data.list,function(index,value) {
							var article=$("#copy_template").clone(true);
							article.addClass('article');
							article.find("#article00").addClass('carousel').addClass('slide');
							if(value.photo.total) {
								$.each(value.photo.list,function(photo_index,photo_value) {
									if(photo_index) {
										var new_item=article.find('.carousel .carousel-inner .item').clone(true);									
										new_item.find('img').attr('src','/uploads/communities/thumb_'+photo_value.file_name);
										article.find('.carousel .carousel-inner').append(new_item);
									} else {
										article.find('.carousel .carousel-inner .item img').attr('src','/uploads/communities/thumb_'+photo_value.file_name);
										article.find('.carousel .carousel-inner .item img').attr('alt',value.title);
									}
									var new_index=(page*8);
									article.find('.carousel').attr('id','article'+new_index).attr('data-ride','carousel'+new_index);
									if(value.photo.total<2) {
										article.find('.left').remove();
										article.find('.right').remove();
									} else {
										article.find('.left').attr('href','#article'+new_index);
										article.find('.right').attr('href','#article'+new_index);
									}
								});
								article.find('.carousel .carousel-inner .item:first').addClass('active');
							}
							article.find('.sl_content_title a').text(value.title).attr('href','/view/'+value.id);
							article.find('.sl_content_text a').text(value.description).attr('href','/view/'+value.id);
							article.find('.create_info img').attr('src','/uploads/users/thumb_'+value.user_photo);
							article.find('.create_info img').attr('alt',value.title);							
							article.find('.create_info p:first').text(value.nickname);
							article.find('.create_info p:eq(1)').text(value.created_at);
							article.find('.comment_count').text(value.comment_count);
							article.find('.recommend_count').text(value.recommend_count);
							article.find('.carousel').carousel();
							$("#copy_template").before(article);
							$("#sl_community_index .grid").masonry('appended',article,true);
						});
						page+=1;						
					} else {
						
					}
				} else {
					alert(data.message);
				}
			},'json');
		}
	});
});