<section id="sl_communities_index">
	<?php if($data['total']): ?>
	<?php foreach($data['list'] as $index=>$value): ?>
	<div class="article col-xs-12 col-sm-6 col-md-4 col-lg-4">		
		<article>
			<h3><?php echo anchor('/view/'.$value['id'],$value['title'])  ?></a></h3>
			<a href="/view/<?php echo $value['id'] ?>"><img class="img-responsive" src="/uploads/communities/thumb_<?php echo $value['photo'] ?>" alt="<?php echo $value['title'] ?>" /></a>
			<div>
				<a href="/view/<?php echo $value['id'] ?>">
				<?php echo $value['description'] ?>
				</a>
				</div>			
		</article>
	</div>
	<?php endforeach ?>
	<?php else: ?>
		<article>
		<?php echo _('no_data') ?>
		</article>
	<?php endif ?>
	<div id="sl_index_bottom_menu">
		<?php echo $Layout->element('search'); ?>		
		<?php if($this->session->userdata('admin')): ?>
			<?php echo anchor('/add','<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'._('new_link'),array('class'=>"btn btn-default col-xs-12 col-md-2")) ?>
		<?php endif ?>
	</div>
</section>
