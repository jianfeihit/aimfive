<?php if (!function_exists("NOTICE_SEGMENT_DEFAULT_MINILIST")) {function NOTICE_SEGMENT_DEFAULT_MINILIST($v){?>
<!--默认通知页面-->

<!--弹窗列表-->
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_system_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_system" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
				<?php echo $v['title'];?>
			</div>
			<div class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_DEFAULT_DETAIL")) {function NOTICE_SEGMENT_DEFAULT_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_system" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
					<?php echo $notice['extend_params']['content'];?>
				</div>
				<div class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&type=', rawurlencode($notice['typeid']); ?>">查看全部默认通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_DEFAULT_LIST")) {function NOTICE_SEGMENT_DEFAULT_LIST($v){?>



<!--页列表-->
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content">
			<?php  
				if ($v['title'] != $v['extend_params']['content'] && Pw::strlen($v['extend_params']['content']) > 49){
			 ?>
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detaillist&id=', rawurlencode($v['id']); ?>" class="open_up J_notice_show" data-role="down">展开&darr;</a>
			<?php 
				} 
			 ?>
			<div class="title J_notice_part">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_system_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_system" title="已读"></span>
				<?php  } ?>
				</span><?php echo $v['title'];?>
			</div>
			<div class="title J_notice_all" style="display:none;"></div>
			<div class="info">
				<span class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></span>
				<span class="operating"><span class="line">|</span><a class="J_msg_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=delete&id=', rawurlencode($v['id']); ?>">删除</a></span>
			</div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_DEFAULT_DETAILLIST")) {function NOTICE_SEGMENT_DEFAULT_DETAILLIST($detailList,$notice){?>



<!--页详情-->
	<span class="notice_tip_icon">
	<?php  if (!$notice['is_read']) { ?>
	<span class="icon_system_new" title="未读"></span>
	<?php  } else { ?>
	<span class="icon_system" title="已读"></span>
	<?php  } ?>
	</span><?php echo $notice['extend_params']['content'];?>
	<!-- div class="io"><span class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></span></div> -->

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_THREADREPLY_MINILIST")) {function NOTICE_SEGMENT_THREADREPLY_MINILIST($v){?>
<!--回复通知-->

<!--弹窗列表-->
	<?php 
			$ignoreString = $v['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$doIgnore = $v['is_ignore'] ? 0 : 1;
			if ($v['extend_params']['replyUser']) {
				$i = 0;
				foreach ($v['extend_params']['replyUser'] as $uid => $username) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run?uid='.$uid), $username, '、');
					$i++;
				}
				$replyUser = rtrim($replyUser, "、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	?>
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_system_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_system" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
				<?php echo $replyUser;?> 回复了您的主题帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($v['param']),'&pid=', rawurlencode($v['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['threadTitle'], ENT_QUOTES, 'UTF-8');?></a>》
			</div>
			<div class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_THREADREPLY_DETAIL")) {function NOTICE_SEGMENT_THREADREPLY_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
<div style="">
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<?php 
			$ignoreString = $notice['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$tips = $notice['is_ignore'] ? '<div class="tips" style="border-left:0;border-right:0;border-top:0;">您不会再收到 通知</div>' : '';
			$doIgnore = $notice['is_ignore'] ? 0 : 1;
			if ($notice['extend_params']['replyUser']) {
				$i = 0;
				foreach ($notice['extend_params']['replyUser'] as $uid=>$username) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run?uid='.$uid), $username, '、');
					$i++;
				}
				$replyUser = rtrim($replyUser, "、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	
 echo $tips;?>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_system" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
					<?php echo $replyUser;?> 回复了您的主题帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($notice['param']),'&pid=', rawurlencode($notice['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($notice['extend_params']['threadTitle'], ENT_QUOTES, 'UTF-8');?></a>》
				</div>
				<div class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
	   <a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=ignore&id=', rawurlencode($notice['id']),'&ignore=', rawurlencode($doIgnore); ?>" data-id="<?php echo htmlspecialchars($notice['id'], ENT_QUOTES, 'UTF-8');?>" data-type="此帖的回复" data-ignore="<?php echo htmlspecialchars($doIgnore, ENT_QUOTES, 'UTF-8');?>" data-tid="<?php echo htmlspecialchars($notice['extend_params']['postId'], ENT_QUOTES, 'UTF-8');?>" data-role="reply" class="fr J_notice_ignore"><?php echo htmlspecialchars($ignoreString, ENT_QUOTES, 'UTF-8');?></a>
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&type=', rawurlencode($notice['typeid']); ?>">查看全部回复通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_THREADREPLY_LIST")) {function NOTICE_SEGMENT_THREADREPLY_LIST($v){?>



<!--页列表-->
	<?php 
		$ignoreString = $v['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
		$doIgnore = $v['is_ignore'] ? 0 : 1;
		$type = $v['is_ignore'] ? 'false' : 'true';
		$replyUser = '';
		if (is_array($v['extend_params']['replyUser'])) {
			$i = 0;
			foreach ($v['extend_params']['replyUser'] as $uid => $username) {
				$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run?uid='.$uid), $username, '、');
				$i++;
			}
			$replyUser = rtrim($replyUser, "、");
			$i > 1 && $replyUser = $replyUser . "等".$i."人";
			
		}
	?>	
	<!--回复通知-->
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content">
			
			<div class="title J_notice_part"><span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_system_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_system" title="已读"></span>
				<?php  } ?>
				</span>
				<?php echo $replyUser;?> 回复了您的主题帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($v['param']),'&pid=', rawurlencode($v['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['threadTitle'], ENT_QUOTES, 'UTF-8');?></a>》
			</div>
			<div class="title J_notice_all" style="display:none;"></div>
			<div class="c"></div>
			<div class="info"><span class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></span><span class="operating"><span class="line">|</span><a class="J_msg_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=delete&id=', rawurlencode($v['id']); ?>">删除</a><span class="line">|</span><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=ignore&id=', rawurlencode($v['id']),'&ignore=', rawurlencode($doIgnore); ?>" data-id="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" data-type="<?php echo htmlspecialchars($type, ENT_QUOTES, 'UTF-8');?>" data-role="reply" data-tid="<?php echo htmlspecialchars($v['extend_params']['threadId'], ENT_QUOTES, 'UTF-8');?>" class="J_notice_ignore"><?php echo htmlspecialchars($ignoreString, ENT_QUOTES, 'UTF-8');?></a></span></div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_THREADREPLY_DETAILLIST")) {function NOTICE_SEGMENT_THREADREPLY_DETAILLIST($detailList,$notice){?>



<!--页详情-->
<div style="">
	<?php 
			$ignoreString = $notice['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$doIgnore = $notice['is_ignore'] ? 0 : 1;
			if ($notice['extend_params']['uids']) {
				$i = 0;
				foreach ($detailList['replyUsers'] as $v) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run?uid='.$v['uid']), $v['username'], '、');
					$i++;
				}
				$replyUser = rtrim($replyUser,"、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	?>
			<p><span class="notice_tip_icon"><span class="icon_system" title="已读"></span></span><?php echo $replyUser;?>&nbsp;回复了您的主题帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','read.php?tid=', rawurlencode($notice['param']); ?>" target="_blank"><?php echo htmlspecialchars($notice['extend_params']['threadTitle'], ENT_QUOTES, 'UTF-8');?></a>》</p>
</div>

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_MINILIST")) {function NOTICE_SEGMENT_ATTENTION_MINILIST($v){?>
<!--这个是关注消息的页面-->

<!--弹窗列表-->
<?php 
$array = array_slice($v['extend_params'],0,3); 
$countNum = count($v['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_follow_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_follow" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
			<?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($u['uid']); ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您
			</div>
			<div class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_DETAIL")) {function NOTICE_SEGMENT_ATTENTION_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
<?php 
$array = array_slice($notice['extend_params'],0,3); 
$countNum = count($notice['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<div class="tips" style="border-left:0;border-right:0;border-top:0;"><?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($u['uid']); ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您，<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=fans'; ?>" target="_blank">查看全部粉丝&nbsp;&gt;&gt;</a></div>
	<div class="J_hm_list my_message_follow">
	<?php  foreach($detailList['fans'] as $value){ ?>
		<dl class="cc">
			<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><img src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a></dt>
			<dd>
				<div class="name"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a></div>
				<?php  if (isset($detailList['follows'][$value['uid']])) { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=message&a=pop&uid=', rawurlencode($value['uid']); ?>" class="fr message J_send_msg_pop" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>"><em></em>写私信</a>
				<span class="core_unfollow">已关注</span>
				<?php  } else { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($value['uid']); ?>" class="core_follow J_msg_follow">加关注</a>
				<?php  } ?>
			</dd>
		</dl>
	<?php  } ?>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&type=', rawurlencode($notice['typeid']); ?>">查看全部关注通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_LIST")) {function NOTICE_SEGMENT_ATTENTION_LIST($v){?>



<!--页列表-->
<?php 
$array = array_slice($v['extend_params'],0,3); 
$countNum = count($v['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>"  style="display:none;"></div>
		<div class="content J_notice_content cp">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detaillist&id=', rawurlencode($v['id']); ?>" class="open_up J_notice_show" data-role="down">展开&darr;</a>
			<div class="title">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_follow_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_follow" title="已读"></span>
				<?php  } ?>
				</span><?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($u['uid']); ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您
			</div>
			<div class="title J_notice_all" style="display:none;"></div>
			<div class="info">
				<span class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></span>
				<span class="operating"><span class="line">|</span><a class="J_msg_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=delete&id=', rawurlencode($v['id']); ?>">删除</a></span>
			</div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_DETAILLIST")) {function NOTICE_SEGMENT_ATTENTION_DETAILLIST($detailList,$notice){?>



<!--页详情-->
	<div class="J_hm_list notice_follow_list ">
	<?php  foreach($detailList['fans'] as $value){ ?>
		<dl class="cc">
			<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><img src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a></dt>
			<dd>
				<div class="name"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a></div>
				<?php  if (isset($detailList['follows'][$value['uid']])) { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=message&a=pop&uid=', rawurlencode($value['uid']); ?>" class="fr message J_send_msg_pop" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>"><em></em>写私信</a>
				<span class="core_unfollow">已关注</span>
				<?php  } else { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($value['uid']); ?>" class="core_follow J_msg_follow">加关注</a>
				<?php  } ?>
			</dd>
		</dl>
	<?php  } ?>
	</div>

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_MASSMESSAGE_MINILIST")) {function NOTICE_SEGMENT_MASSMESSAGE_MINILIST($v){?>
<!--群发消息-->

<!--弹窗列表-->
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_system_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_system" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
				<?php  echo $v['title'] ? Pw::substrs($v['title'],43) : Pw::substrs(strip_tags($v['extend_params']['content'],true),43);?>
			</div>
			<div class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_MASSMESSAGE_DETAIL")) {function NOTICE_SEGMENT_MASSMESSAGE_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_system" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
					<?php  echo Pw::substrs($notice['title'],43); ?>
					<div><?php echo $notice['extend_params']['content'];?></div>
				</div>
				<div class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&type=', rawurlencode($notice['typeid']); ?>">查看全部群发通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_MASSMESSAGE_LIST")) {function NOTICE_SEGMENT_MASSMESSAGE_LIST($v){?>



<!--页列表-->
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content cp J_notice_content">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detaillist&id=', rawurlencode($v['id']); ?>" class="open_up J_notice_show" data-role="down">展开&darr;</a>
			<div class="title J_notice_part">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_system_new J_icon_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_system" title="已读"></span>
				<?php  } ?>
				</span><?php  echo $v['title'] ? Pw::substrs($v['title'],43) : Pw::substrs(strip_tags($v['extend_params']['content'],true),43);?>
			</div>
			<div class="title J_notice_all" style="display:none;padding-right:20px;"></div>
			<div class="info">
				<span class="time"><?php  echo Pw::time2str($v['modified_time'], 'auto');?></span>
				<span class="operating"><span class="line">|</span><a class="J_msg_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=delete&id=', rawurlencode($v['id']); ?>">删除</a></span>
			</div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_MASSMESSAGE_DETAILLIST")) {function NOTICE_SEGMENT_MASSMESSAGE_DETAILLIST($detailList,$notice){?>



<!--列表详情-->
<div>
	<span class="notice_tip_icon">
	<?php  if (!$notice['is_read']) { ?>
	<span class="icon_system_new" title="未读"></span>
	<?php  } else { ?>
	<span class="icon_system" title="已读"></span>
	<?php  } ?>
	</span>
	<?php  if ($notice['title']) { 
  echo Pw::substrs($notice['title'],43); ?><br />
	<?php  } 
 echo $notice['extend_params']['content'];?>
</div>

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_POSTREPLY_MINILIST")) {function NOTICE_SEGMENT_POSTREPLY_MINILIST($v){?>
<!--帖子回复提醒-->

<!--弹窗列表-->
	<?php 
			$ignoreString = $v['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$doIgnore = $v['is_ignore'] ? 0 : 1;
			if ($v['extend_params']['replyUser']) {
				$i = 0;
				foreach ($v['extend_params']['replyUser'] as $uid => $username) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run',array('uid'=>$uid)), $username, '、');
					$i++;
				}
				$replyUser = rtrim($replyUser, "、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	?>
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_system_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_system" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
				<?php echo $replyUser;?> 回复了您的回帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($v['extend_params']['threadId']),'&pid=', rawurlencode($v['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['postTitle'], ENT_QUOTES, 'UTF-8');?></a>》
			</div>
			<div class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_POSTREPLY_DETAIL")) {function NOTICE_SEGMENT_POSTREPLY_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=detail&id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<?php 
			$ignoreString = $notice['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$tips = $notice['is_ignore'] ? '<div class="tips" style="border-left:0;border-right:0;border-top:0;">您不会再收到 通知</div>' : '';
			$doIgnore = $notice['is_ignore'] ? 0 : 1;
			if ($notice['extend_params']['replyUser']) {
				$i = 0;
				foreach ($notice['extend_params']['replyUser'] as $uid => $username) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run',array('uid'=>$uid)), $username, '、');
					$i++;
				}
				$replyUser = rtrim($replyUser, "、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	
 echo $tips;?>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_system" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
					<?php echo $replyUser;?> 回复了您的回帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($notice['extend_params']['threadId']),'&pid=', rawurlencode($notice['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($notice['extend_params']['postTitle'], ENT_QUOTES, 'UTF-8');?></a>》
				</div>
				<div class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=ignore&id=', rawurlencode($notice['id']),'&ignore=', rawurlencode($doIgnore); ?>" data-id="<?php echo htmlspecialchars($notice['id'], ENT_QUOTES, 'UTF-8');?>" data-type="此帖的回复" data-ignore="<?php echo htmlspecialchars($doIgnore, ENT_QUOTES, 'UTF-8');?>" data-tid="<?php echo htmlspecialchars($notice['extend_params']['postId'], ENT_QUOTES, 'UTF-8');?>" class="fr J_notice_ignore"><?php echo htmlspecialchars($ignoreString, ENT_QUOTES, 'UTF-8');?></a>
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&type=', rawurlencode($notice['typeid']); ?>">查看全部回复通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_POSTREPLY_LIST")) {function NOTICE_SEGMENT_POSTREPLY_LIST($v){?>



<!--页列表-->
	<?php 
		$ignoreString = $v['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
		$doIgnore = $v['is_ignore'] ? 0 : 1;
		$type = $v['is_ignore'] ? 'false' : 'true';
		if ($v['extend_params']['replyUser']) {
			$i = 0;
			foreach ($v['extend_params']['replyUser'] as $uid => $username) {
				$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run',array('uid'=>$uid)), $username, '、');
				$i++;
			}
			$replyUser = rtrim($replyUser, "、");
			$i > 1 && $replyUser = $replyUser . "等".$i."人";
		}
	?>	
	<!--回复通知-->
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content">
			
			<div class="title J_notice_part">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_system_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_system" title="已读"></span>
				<?php  } ?>
				</span>
				<?php echo $replyUser;?> 回复了您的回帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=jump&tid=', rawurlencode($v['extend_params']['threadId']),'&pid=', rawurlencode($v['extend_params']['pid']); ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['postTitle'], ENT_QUOTES, 'UTF-8');?></a>》
			</div>
			<div class="title J_notice_all" style="display:none;"></div>
			<div class="c"></div>
			<div class="info"><span class="time"><?php  echo Pw::time2str($v['modified_time'],'auto');?></span><span class="operating"><span class="line">|</span><a class="J_msg_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=delete&id=', rawurlencode($v['id']); ?>">删除</a><span class="line">|</span><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=ignore&id=', rawurlencode($v['id']),'&ignore=', rawurlencode($doIgnore); ?>" data-id="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" data-type="<?php echo htmlspecialchars($type, ENT_QUOTES, 'UTF-8');?>" data-role="reply" data-tid="<?php echo htmlspecialchars($v['extend_params']['postId'], ENT_QUOTES, 'UTF-8');?>" class="J_notice_ignore"><?php echo htmlspecialchars($ignoreString, ENT_QUOTES, 'UTF-8');?></a></span></div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_POSTREPLY_DETAILLIST")) {function NOTICE_SEGMENT_POSTREPLY_DETAILLIST($detailList,$notice){?>



<!--页详情-->
	<?php 
			$ignoreString = $notice['is_ignore'] ? '开启回复提醒' : '关闭回复提醒';
			$doIgnore = $notice['is_ignore'] ? 0 : 1;
			if ($notice['extend_params']['uids']) {
				$i = 0;
				foreach ($detailList['replyUsers'] as $v) {
					$replyUser .= sprintf ('<a href="%s" target="_blank">%s</a> %s',WindUrlHelper::createUrl('space/index/run',array('uid'=>$v['uid'])), $v['username'], '、');
					$i++;
				}
				$replyUser = rtrim($replyUser,"、");
				$i > 1 && $replyUser = $replyUser . "等".$i."人";
			}
	?>
			<p>
			<span class="notice_tip_icon">
			<span class="icon_system" title="已读"></span>
			</span>
			<?php echo $replyUser;?>&nbsp;回复了您的回帖《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','read.php?tid=', rawurlencode($notice['extend_params']['threadId']); ?>#<?php echo htmlspecialchars($notice['param'], ENT_QUOTES, 'UTF-8');?>" target="_blank"><?php echo htmlspecialchars($notice['extend_params']['postTitle'], ENT_QUOTES, 'UTF-8');?></a>》</p>

<?php }}?>