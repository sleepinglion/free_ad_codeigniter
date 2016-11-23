<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo _('share') ?></h4>
      </div>
      <div class="modal-body">
      	<ul id="sns_share">
      		<li><a href="https://www.facebook.com/sharer/sharer.php?u=" target="_blank" class="s_facebook"> 페이스북</a></li>
      		<li><a href="https://twitter.com/home?status=" target="_blank"  class="s_twitter"> 트위터</a></li>
      		<li><a href="https://plus.google.com/share?url=" target="_blank" class="s_google"> 구글+</a></li>      		
      		<li><a href="mailto:<?php echo $this->session->userdata('email') ?>" class="s_mail"> 메일</a></li> 		      		      		      		      		      		      		
      	</ul>
      	<input type="text" id="sns_share_url" class="form-control" value="" />         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo _('close') ?></button>
      </div>
    </div>
  </div>
</div>