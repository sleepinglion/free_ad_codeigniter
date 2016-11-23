<section id="sl_community_add">
	<?php echo validation_errors('<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>', '</div>') ?>
	<?php echo $this->session->flashdata('error_message'); ?>	
	<?php echo form_open_multipart(null,array('role'=>'form')) ?>
  	<div class="form-group">
  		<label for="sl_title"><?php echo _('label_title') ?></label>
  		<input type="text" class="form-control" id="sl_title" name="title" value="<?php echo set_value('title') ?>" maxlength="60" required="required" />
  	</div>
  	<div class="form-group" style="display:none">
   		<label for="sl_title"><?php echo _('poll_title') ?></label>
   		<ol id="poll_title">
   			<li><input type="text" class="form-control" name="poll_title[]" maxlength="60" value="찬성" /><input type="button" class="btn poll_delete" value="<?php echo _('delete') ?>" /></li>
   			<li><input type="text" class="form-control" name="poll_title[]" maxlength="60" value="반대" /><input type="button" class="btn poll_delete" value="<?php echo _('delete') ?>" /></li>   			
   		</ol>
    	<input type="button" id="poll_add" class="btn" value="<?php echo _('add') ?>" />
  	</div>
  	<div class="form-group">
  		<label for="sl_description"><?php echo _('label_description') ?></label>  		
  		<input type="text" id="sl_description" name="description" class="form-control" value="<?php echo set_value('description') ?>" maxlength="255" required="required" /> 
  	</div>
  	<div class="form-group">
  		<label for="sl_content"><?php echo _('label_content') ?></label>
  		<textarea id="sl_content" name="content" class="form-control" required="required"><?php echo set_value('content') ?></textarea>
  	</div>
  	<div class="form-group">
  		<label for="sl_tag"><?php echo _('label_tag') ?></label>
  		<input type="text" class="form-control" id="sl_tag" name="tag" value="<?php echo set_value('tag') ?>" maxlength="60" required="required" />
  	</div>
  	<div class="form-group" id="sl_photo">
    	<label for="sl_photo"><?php echo _('label_photo') ?></label>
    	<div class="new_photo_layer">
    		<input type="file" name="photos[]" required="required" accept="image/gif, image/jpeg, image/jpg, image/png"  />
				<input type="button" class="btn photo_delete" value="<?php echo _('delete') ?>" />    	
    	</div>
    	<input type="button" id="photo_add" class="btn" value="<?php echo _('add') ?>" />    	
  	</div>
  	<input type="submit" class="btn btn-primary" value="<?php echo _('submit') ?>" />
	<?php echo form_close() ?>
</section>