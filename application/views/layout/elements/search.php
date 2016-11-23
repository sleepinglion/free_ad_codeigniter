<form class="form-inline sl_search_form" role="form" method="get">
	<select name="search_type" class="form-control" style="display:none">
			<option value="title"><?php echo _('label_title') ?></option>
			<option value="content"><?php echo _('label_content') ?></option>
			<option value="titlencontent" selected="selected"><?php echo _('label_title+content') ?></option>
		</select>
		<div class="input-group col-xs-8 col-xs-offset-3">
			<input type="search" name="search_word" class="form-control" value="<?php if($this->input->get('search_word')): ?><?php echo $this->input->get('search_word') ?><?php endif ?>" placeholder="<?php echo _('insert search word') ?>" maxlength="60" required="required" />
			<span class="input-group-btn">
				<input type="submit" class="btn btn-default" value="<?php echo _('Search') ?>" />
			</span>
		</div>
</form>