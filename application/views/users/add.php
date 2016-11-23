<section id="sl_user_new">
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
    <input type="email" class="form-control" id="sl_email" name="email" maxlength="255" value="<?php echo set_value('email'); ?>" />
   </div>
  	<div class="col-md-4 col-xs-12">
    	<label for="check_email_available_button" style="visibility:hidden"><?php echo _('label_check_email_available') ?></label>  		
  		<input type="button" id="check_email_available_button" class="form-control btn btn-success" value="<?php echo _('check_email_available') ?>" />
  	</div>
  </div>
  <div class="form-group row">
  	<div class="col-md-12 col-xs-12">  	
    <label class="control-label" for="sl_password"><?php echo _('label_password') ?></label>
    <input type="password" class="form-control" id="sl_password" name="password" value="<?php echo set_value('password') ?>" maxlength="255" required="required" />
   </div>
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_password_confirm"><?php echo _('label_password_confirm') ?></label>
    <input type="password" class="form-control" id="sl_password_confirm" name="password_confirm" value="<?php echo set_value('password_confirm'); ?>" maxlength="255" required="required" />
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_name"><?php echo _('label_name') ?></label>
    <input type="text" class="form-control" id="sl_name" name="name" maxlength="60" value="<?php echo set_value('name') ?>"  required="required" />
  </div>
  <div class="form-group">
    <label class="control-label" for="sl_name"><?php echo _('label_nickname') ?></label>
    <input type="text" class="form-control" id="sl_nickname" name="nickname" maxlength="60" value="<?php echo set_value('nickname') ?>" required="required" />
  </div>  
  <div class="form-group">
    <label class="control-label" for="sl_description"><?php echo _('label_description') ?></label>
    <input type="text" class="form-control" id="sl_description" name="description" maxlength="255" value="<?php echo set_value('description') ?>" required="required" />
  </div>
  	<div class="form-group">
    	<label for="sl_photo"><?php echo _('label_photo') ?></label>
    	<input type="file" name="userfile" id="sl_photo"  />
  	</div>  
  <input type="submit" class="btn btn-primary" value="<?php echo _('submit') ?>" />      
	<?php echo form_close() ?>
</section>