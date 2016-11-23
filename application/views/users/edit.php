<section id="sl_user_edit">
	<?php echo validation_errors('<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>', '</div>') ?>
	<?php echo $this->session->flashdata('error_message'); ?>	
	<?php echo form_open_multipart() ?>
	<input type="hidden" id="message_no_email" value="<?php echo _('not_insert_email') ?>" />
	<input type="hidden" id="message_no_password" value="<?php echo _('not_insert_password') ?>" />
	<input type="hidden" id="message_invalid_email" value="<?php echo _('invalid_email') ?>" />
	<input type="hidden" id="message_invalid_password" value="<?php echo _('invalid_password') ?>" />
	<input type="hidden" id="message_exists_email" value="<?php echo _('exists_email') ?>" />
  <div class="form-group row">
  	<div class="col-md-8 col-xs-12">
    <label class="control-label" for="sl_email"><?php echo _('label_email') ?></label>
    <input type="email" class="form-control" id="sl_email" name="email" maxlength="255" value="<?php echo $data['content']['email'] ?>" readonly="readonly" />
   </div>
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_name"><?php echo _('label_name') ?></label>
    <input type="text" class="form-control" id="sl_name" name="name" maxlength="60" value="<?php echo $data['content']['name'] ?>" required="required" />
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_name"><?php echo _('label_nickname') ?></label>
    <input type="text" class="form-control" id="sl_nickname" name="nickname" maxlength="60" value="<?php echo $data['content']['nickname'] ?>" required="required" />
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_description"><?php echo _('label_description') ?></label>
    <input type="text" class="form-control" id="sl_description" name="description" value="<?php echo $data['content']['description'] ?>" maxlength="255" />
  </div>
  	<div class="form-group">
    	<label for="sl_photo"><?php echo _('label_photo') ?></label>
    	<?php if($data['content']['photo']): ?>			<a href="/uploads/users/<?php echo $data['content']['photo'] ?>" class="simple_image"><img width="100" height="100" src="/uploads/users/<?php echo $data['content']['photo'] ?>" alt="<?php echo $data['content']['nickname'] ?>" /></a>
		 <div class="checkbox">
		 	<label>
			<input type="checkbox" name="delete_photo" id="delete_photo" value="1" /> <?php echo _('label_delete_photo') ?>
			</label>
			<?php endif ?>
    	<input type="file" name="userfile" id="sl_photo" />
  	</div>
  <input type="submit" class="btn btn-primary" value="<?php echo _('submit') ?>" />      
	<?php echo form_close() ?>
</section>