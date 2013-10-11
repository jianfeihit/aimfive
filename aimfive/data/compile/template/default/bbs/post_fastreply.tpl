<div class="reply_list"  style="width:360px;">
	<div class="core_arrow_top"><em></em><span></span></div>
		<div class="c"></div>
		<div class="reply_quick cc">
			<dl class="ct cc">
				<dt><img class="J_avatar" data-type="small" src="<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid,'small'), ENT_QUOTES, 'UTF-8');?>" width="50" height="50" alt="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" /></dt>
				<dd>
					<div class="arrow"><em></em><span></span></div>
					<textarea name="atc_content" id="J_reply_ta_<?php echo htmlspecialchars($pid, ENT_QUOTES, 'UTF-8');?>" style="height:40px;" class="J_at_user_textarea" placeholder="我也说两句"></textarea>
				</dd>
			</dl>
			<div class="ft cc J_reply_ft">
				<div class="operate">
					<a href="" class="a_face J_insert_emotions" data-emotiontarget="#J_reply_ta_<?php echo htmlspecialchars($pid, ENT_QUOTES, 'UTF-8');?>">表情</a>
				</div>
				<button type="submit" data-tid="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>" data-pid="<?php echo htmlspecialchars($pid, ENT_QUOTES, 'UTF-8');?>" class="btn btn_submit disabled J_reply_sub" disabled="disabled" data-action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=doreply&_getHtml=2'; ?>">回复</button>
			
			</div>
		</div>
	<div class="J_reply_page_list">	<ul id="J_reply_ul_<?php echo htmlspecialchars($pid, ENT_QUOTES, 'UTF-8');?>">
		<?php  foreach ($replydb as $key => $read) { ?>
		<li>
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($read['created_userid']); ?>" class="face" target="_blank"><img src="<?php echo htmlspecialchars(Pw::getAvatar($read['created_userid']), ENT_QUOTES, 'UTF-8');?>" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" width="30" height="30" alt="<?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?>"></a><div class="reply_content">
				<a class="J_user_card_show" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($read['created_userid']); ?>"><?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?></a>：<?php echo $read['content'];?>
				<div>
					<span class="operate"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=report&type=post&type_id=', rawurlencode($read['pid']); ?>" class="J_report J_qlogin_trigger report">举报</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($tid),'&pid=', rawurlencode($read['pid']); ?>">查看</a><a href="" class="J_read_reply_single" data-username="<?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?>">回复</a></span>
					<span class="time"><?php echo htmlspecialchars(Pw::time2str($read['created_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></span>
				</div>
			</div>
		</li>
		<?php  } ?>
	</ul>
	<div class="J_pages_wrap"><?php $__tplPageCount=(int)$count;
$__tplPagePer=(int)$perpage;
$__tplPageTotal=(int)0;
$__tplPageCurrent=(int)$page;
if($__tplPageCount > 0 && $__tplPagePer > 0){
$__tmp = ceil($__tplPageCount / $__tplPagePer);
($__tplPageTotal !== 0 &&  $__tplPageTotal < $__tmp) || $__tplPageTotal = $__tmp;}
$__tplPageCurrent > $__tplPageTotal && $__tplPageCurrent = $__tplPageTotal;
if ($__tplPageTotal > 1) {
 
$_page_min = max(1, $__tplPageCurrent-3);
$_page_max = min($__tplPageTotal, $__tplPageCurrent+3);
?>
<div class="pages">
<?php  if ($__tplPageCurrent > $_page_min) { 
	$_page_i = $__tplPageCurrent-1;
?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=replylist&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?></div></div>
</div>