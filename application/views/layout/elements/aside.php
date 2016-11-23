<aside>
	<div id="aside_top">
		<h2><?php echo _('menu') ?></h2>
		<a id="close_menu" class="btn_close" href="#"><i class="glyphicon glyphicon-remove"></i></a>
	</div>
	<ul>
		<!-- <li><?php echo anchor('/',_('Show By Category')) ?></li> -->
		<li>
			<?php echo anchor('/',_('Show By Tag')) ?>
			<?php echo $Layout->element('tag_cloud'); ?>			
		</li>
		<!-- <li><?php echo anchor('/',_('Show My Commented')) ?></li> -->
	</ul>
</aside>	