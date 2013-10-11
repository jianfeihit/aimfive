<?php  if ($replies) { 
  foreach ($replies as $key => $value) { ?>
	<dl class="cc">
		<dt><a class="J_user_card_show" data-uid="<?php echo htmlspecialchars($value['created_userid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['created_userid']); ?>"><img class="J_avatar" data-type="small" src="<?php echo htmlspecialchars(Pw::getAvatar($value['created_userid']), ENT_QUOTES, 'UTF-8');?>" width="30" height="30" /></a></dt>
		<dd>
			<p class="content"><a class="J_user_card_show" data-uid="<?php echo htmlspecialchars($value['created_userid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['created_userid']); ?>"><?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?></a>：<em><?php echo $value['content'];?></em><span>(<?php echo htmlspecialchars(Pw::time2str($value['created_time'], 'auto'), ENT_QUOTES, 'UTF-8');?>)</span></p>
			<p class="repeat_btn"><a data-user="<?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?>" href="" class="J_feed_single">回复</a></p>
		</dd>
	</dl>
	<?php  } 
  if ($count > 6) { ?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&a=fresh&uid=', rawurlencode($fresh['created_userid']),'&id=', rawurlencode($fresh['id']); ?>">查看全部回复>></a>
	<?php  } 
  } ?>