<header <?php if(isset($data['admin'])): ?>class="no_fix"<?php endif ?>>
	<h1><a href="/"><?php echo _('page_title') ?></a></h1>
	<button type="button" class="btn" id="show_menu"><span class="hspan"><?php _('menu') ?></span></button>
	<div class="hidden-xs hidden-sm" style="position:absolute;top:0px;right:2%">
		<?php echo $Layout->element('search') ?>
	</div>
	<button type="button" class="btn hidden-md hidden-lg"  id="show_search_form"><span class="hspan"><?php _('search') ?></span></button>
</header>
