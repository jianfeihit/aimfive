<li>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($uid); ?>" class="face" target="_blank"><img src="<?php echo htmlspecialchars(Pw::getAvatar($uid), ENT_QUOTES, 'UTF-8');?>" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" width="30" height="30" alt="<?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?>"></a><div class="reply_content">
		<a class="J_user_card_show" data-uid="<?php echo htmlspecialchars($uid, ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($uid); ?>"><?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?></a>：<?php echo $content;?>
		<div>
			<span class="operate"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=report&type=post&type_id=', rawurlencode($pid); ?>" class="J_report J_qlogin_trigger report">举报</a><a href="" class="J_read_reply_single" data-username="<?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?>">回复</a></span>
			<span class="time"><?php echo htmlspecialchars(Pw::time2str($time, 'auto'), ENT_QUOTES, 'UTF-8');?></span>
		</div>
	</div>
</li>