<section id="sl_community_index">
	<div class="grid js-masonry" data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 200 }' style="float:left;width:100%">
			<?php if($data['total']): ?>
			<?php foreach($data['list'] as $index=>$content): ?>					
		<div class="article col-xs-12 col-sm-6 col-md-4 col-lg-3">		
  		<article class="community_contents">
  			<?php echo $content['content'] ?>
  		</article>
  	</div>
  		<?php endforeach ?>
  		<?php endif?>  		  	
	</div>	
</section>