<li>
				<div class="replyDiv_1" >
					<div class="nameTime">
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($read['created_userid']); ?>" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>" target="_blank"><img src="<?php echo htmlspecialchars(Pw::getAvatar($read['created_userid']), ENT_QUOTES, 'UTF-8');?>" class="J_avatar" data-type="middle" alt="<?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?>"></a>
					<p  class="name"><?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?></p>
					<p>
					<?php  if ($loginUser->getPermission('view_ip_address')) { ?><span title="IP: <?php echo htmlspecialchars($read['created_ip'], ENT_QUOTES, 'UTF-8');?>" class="fl">来自：<?php echo htmlspecialchars($read['ipfrom'], ENT_QUOTES, 'UTF-8');?></span> <?php }?>&nbsp;&nbsp;&nbsp;<span >发布于：<?php echo htmlspecialchars(Pw::time2str($read['created_time']), ENT_QUOTES, 'UTF-8');?></span>
				</p>
					
					<div class="clear"></div>
					</div>
					<div style="position:relative;"><span class="lou J_floor_copy" title="复制此楼地址" <?php  if($read['lou'] == 0) {?> data-type="main"<?php  } ?> data-hash="read_<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($threadDisplay->getFloorName($read['lou']), ENT_QUOTES, 'UTF-8');?><sup>#</sup></span>
				
					</div>
					<?php  if ($read['disabled'] == 1) { ?>
						<div class="inside_logs"><span class="red">该帖需要审核通过后才能显示</span></div>
					<?php  } 
  if (!empty($read['istopped'])) { ?>
			<div class="inside_logs"><span class="org">帖内置顶</span>&nbsp;&nbsp;&ndash;&nbsp;&nbsp;<?php echo htmlspecialchars($users[$read['topped_userid']]['username'], ENT_QUOTES, 'UTF-8');?>&nbsp;&nbsp;&ndash;&nbsp;&nbsp;<?php echo htmlspecialchars(Pw::time2str($read['topped_time']), ENT_QUOTES, 'UTF-8');?></div>
					<?php  } ?>
					<p ><?php echo $read['content'];?></p>
					<?php  if ($read['modified_time']) { ?>
				<div class="edit_log">[<?php echo htmlspecialchars($read['modified_username'], ENT_QUOTES, 'UTF-8');?>于<?php echo htmlspecialchars(Pw::time2str($read['modified_time']), ENT_QUOTES, 'UTF-8');?>编辑了帖子]</div>
				<?php  } ?>
				</div>
		<td class="box_wrap floor_bottom" valign="bottom">
		<?php  if ($threadDisplay->attach && $attach = $threadDisplay->attach->getList($read['pid'])) { 
  if ($attach['pic']) { 
  $_isShowSmall = (count($attach['pic']) >= 5); ?>
			<div class="read_attach_pic">
				<?php  if ($_isShowSmall) { ?>
				<div class="hd">
					<div class="fr"><a href="javascript:;" class="current J_big_images">大图</a><span>|</span><a href="javascript:;" class="J_small_images">小图</a></div>
					<h2>图片</h2>
				</div>
				<?php  } ?>
				<div class="ct">
					<ul class="cc big_img J_gallery_list" style="display:<?php echo htmlspecialchars($_isShowSmall ? 'none' : '', ENT_QUOTES, 'UTF-8');?>">
						<?php  foreach ($attach['pic'] as $key => $value) { ?>
						<li class="J_gallery_items"><span class="J_attach_img_wrap"><div class="img_info J_img_info"><?php  if ($value['descrip']) { ?><p>描述：<?php echo htmlspecialchars($value['descrip'], ENT_QUOTES, 'UTF-8');?></p><?php  } ?><p>图片：<?php echo htmlspecialchars($value['name'], ENT_QUOTES, 'UTF-8');
  if ($threadPermission['deleteatt']) { ?><a class="J_read_img_del w" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=attach&a=delete&aid=', rawurlencode($value['aid']); ?>">[删除]</a><?php  } ?></p></div><a data-big="<?php echo htmlspecialchars($value['url'], ENT_QUOTES, 'UTF-8');?>" href="javascript:;"><?php echo $value['img'];?></a></span></li>
						<?php  } ?>
					</ul>
					<?php  if ($_isShowSmall) { ?>
					<ul class="cc small_img J_gallery_list">
						<?php  foreach ($attach['pic'] as $key => $value) { ?>
						<li class="J_gallery_items"><a data-big="<?php echo htmlspecialchars($value['url'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo htmlspecialchars($value['url'], ENT_QUOTES, 'UTF-8');?>" target="_blank"><img onerror="this.onerror=null;this.className='J_error';" src="<?php echo htmlspecialchars($value['miniUrl'], ENT_QUOTES, 'UTF-8');?>" width="125" height="125" alt=""></a></li>
						<?php  } ?>
					</ul>
					<?php  } ?>
				</div>
			</div>
			<?php  } 
  if ($attach['downattach']) { ?>
			<div class="read_attach_downattach">
				<dl>
					<dt class="cc">
						<span class="name">附件名称/大小</span>
						<span class="cost">下载次数</span>
						<span class="time">最后更新</span>
						<span class="operate"></span>
					</dt>
					<?php  foreach ($attach['downattach'] as $key => $value) { ?>
					<dd class="cc" id="J_att_<?php echo htmlspecialchars($value['aid'], ENT_QUOTES, 'UTF-8');?>">
						<span class="name" title="<?php echo htmlspecialchars($value['descrip'], ENT_QUOTES, 'UTF-8');?>"><span class="file_list_wrap"><span class="file_icon_<?php echo htmlspecialchars($value['ext'], ENT_QUOTES, 'UTF-8');?>"></span></span><a class="J_attach_post_buy" data-cost="<?php  if ($value['cost']) { ?>true<?php  } ?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=attach&a=download&aid=', rawurlencode($value['aid']); ?>" data-credit="<?php echo htmlspecialchars($loginUser->getCredit($value['ctype']), ENT_QUOTES, 'UTF-8');?>" data-countrel="#J_attach_count_<?php echo htmlspecialchars($value['aid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value['name'], ENT_QUOTES, 'UTF-8');?></a>&nbsp;(<?php echo htmlspecialchars($value['size'], ENT_QUOTES, 'UTF-8');?>KB)&nbsp;</span>
						<span class="cost"><span class="" id="J_attach_count_<?php echo htmlspecialchars($value['aid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value['hits'], ENT_QUOTES, 'UTF-8');?></span></span>
						<span class="time"><?php echo htmlspecialchars(Pw::time2str($value['created_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></span>
						<span class="operate">
							<?php  if ($value['cost']) { ?>
							售价<span class="org mr10"><?php echo htmlspecialchars($value['cost'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($creditBo->cType[$value['ctype']], ENT_QUOTES, 'UTF-8');?></span><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=attach&a=record&aid=', rawurlencode($value['aid']); ?>" title="查看记录" class="mr10 fn J_buy_record" data-aid="<?php echo htmlspecialchars($value['aid'], ENT_QUOTES, 'UTF-8');?>">[记录]</a>
							<?php  } 
  if ($threadPermission['deleteatt']) { ?><a class="J_attach_post_del" data-rel="#J_att_<?php echo htmlspecialchars($value['aid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=attach&a=delete&aid=', rawurlencode($value['aid']); ?>">[删除]</a><?php  } ?>
						</span>
					</dd>
					<?php  } ?>
				</dl>
			</div>
			<?php  } 
  } 

PwHook::display(array($threadDisplay, "runDo"), array('createHtmlAfterContent',$read), "", $__viewer);

  if ($read['lou'] == 0) { ?>
			<div class="read_appbtn_wrap">
				<?php  if (!$read['pid']) { ?>
				<a role="button" rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=like&c=mylike&a=doLike&typeid=1&fromid=', rawurlencode($read['tid']); ?>" data-tid="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" data-fid="<?php echo htmlspecialchars($fid, ENT_QUOTES, 'UTF-8');?>" class="icon_read_like J_like_btn J_qlogin_trigger" data-role="main">
					<span>喜欢</span><em class="J_like_count"><?php echo htmlspecialchars($read['like_count'], ENT_QUOTES, 'UTF-8');?></em>
				</a>
				<?php  } 

PwHook::display(array($threadDisplay, "runDo"), array('createHtmlContentBottom',$read), "", $__viewer);
?>
			</div>
			<?php  } 
  if (!$read['pid']) { ?>
			<div style="<?php echo htmlspecialchars(empty($read['lastLikeUsers']) ? 'display:none' : '', ENT_QUOTES, 'UTF-8');?>" id="J_read_like_list" class="read_like_list cc">
				<h4 class="J_read_like_tit">最新喜欢：</h4>
				<?php  if ($read['lastLikeUsers']) { 
  foreach ($read['lastLikeUsers'] as $likeuser) { ?>
				<a class="J_user_card_show" data-uid="<?php echo htmlspecialchars($likeuser['uid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($likeuser['uid']); ?>"><img  class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($likeuser['uid']), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" alt="<?php echo htmlspecialchars($likeuser['username'], ENT_QUOTES, 'UTF-8');?>" /><span title="<?php echo htmlspecialchars($likeuser['username'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars(Pw::substrs($likeuser['username'],6), ENT_QUOTES, 'UTF-8');?></span></a>
					<?php  } 
  } ?>
			</div>
			<?php  } ?>
			<div id="app_read_floor_<?php echo htmlspecialchars($read['lou'], ENT_QUOTES, 'UTF-8');?>"></div>
			<?php  if ($read['lou'] == 0) { ?>
			<div id="cloudwind_read_content"></div>
			<?php  } 
  if ($users[$read['created_userid']]['bbs_sign']) { 
 
				$_signheight = (isset($groupRight[$users[$read['created_userid']]['groupid']]['sign_max_height']) && $groupRight[$users[$read['created_userid']]['groupid']]['sign_max_height']) ? $groupRight[$users[$read['created_userid']]['groupid']]['sign_max_height'] : 200;
				?>
			<div class="signature" style="max-height:<?php echo htmlspecialchars($_signheight, ENT_QUOTES, 'UTF-8');?>px;maxHeight:<?php echo htmlspecialchars($_signheight, ENT_QUOTES, 'UTF-8');?>px;"><table width="100%"><tr><td><?php echo $users[$read['created_userid']]['bbs_sign'];?></td></tr></table></div>
			<?php  } 
  if ($read['lou'] == 0) { ?>
			<pw-drag id="readFloorbot_segment"/>
			<?php  } ?>
	
			<div class="floor_bottom_tips cc">
				<?php  $type =  !$read['pid'] ? 'thread' : 'post'; $type_id = !$read['pid'] ? $read['tid'] : $read['pid']; ?>
				<span class="fr">
					<?php if ($read['lou'] == 0 && $canLook && Pw::getstatus($read['tpcstatus'], PwThread::STATUS_OPERATORLOG)) { ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=read&a=log&tid=', rawurlencode($read['tid']),'&fid=', rawurlencode($read['fid']); ?>" class="mr10 J_post_top J_qlogin_trigger" id="J_inside_logs">查看操作记录</a>
					<?php }
  if ($operateReply['toppedreply'] && $read['lou']){ 
  if (!$read['topped']){ ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=dotoppedreply&topped=1&tid=', rawurlencode($read['tid']),'&lou=', rawurlencode($read['lou']),'&pid=', rawurlencode($read['pid']); ?>" class="mr10 J_post_top J_qlogin_trigger">帖内置顶</a>
						<?php  } else { ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=dotoppedreply&topped=0&tid=', rawurlencode($read['tid']),'&lou=', rawurlencode($read['lou']),'&pids%5B%5D=', rawurlencode($read['pid']); ?>" class="mr10 J_post_top J_qlogin_trigger">取消置顶</a>
						<?php  } 
  } 
  if ($operateReply['read']){ ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=doinspect&tid=', rawurlencode($read['tid']),'&lou=', rawurlencode($read['lou']),'&pids%5B%5D=', rawurlencode($read['pid']); ?>" class="mr10 J_read_mark J_qlogin_trigger">已阅</a>
					<?php  } 
  if ($loginUser->getPermission('allow_report')) { ?>
					<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=report&type=', rawurlencode($type),'&type_id=', rawurlencode($type_id); ?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" class="mr10 J_report J_qlogin_trigger">举报</a>
					<?php  } 
  if ($operateReply) { ?>
					<label for="label_<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>"><input name="pids[]" id="label_<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" type="checkbox" value="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" class="J_check checkbox">管理</label>
					<?php  } ?>
				</span>
				<?php  if ($read['lou'] != 0 && (!$pwforum->forumset['locktime'] || ($read['created_time'] + $pwforum->forumset['locktime'] * 86400) > Pw::getTime())) { ?>
				<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=fastreply&tid=', rawurlencode($tid),'&pid=', rawurlencode($read['pid']); ?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" class="a_reply J_read_reply" data-topped="<?php echo htmlspecialchars(empty($read['istopped']) ? 'false' : 'true', ENT_QUOTES, 'UTF-8');?>">回复<span style="<?php echo htmlspecialchars($read['replies'] > 0 ? '' : 'display:none', ENT_QUOTES, 'UTF-8');?>">(<?php echo htmlspecialchars($read['replies'], ENT_QUOTES, 'UTF-8');?>)</span></a>
				<?php  } else { ?>
				<a rel="nofollow" href="#floor_reply" data-hash="floor_reply" class="a_reply" id="J_readreply_main">回复</a>
				<?php  } 
  if ($read['pid']) { ?>
				<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=like&c=mylike&a=doLike&typeid=2&fromid=', rawurlencode($read['pid']); ?>" data-tid="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" data-fid="<?php echo htmlspecialchars($fid, ENT_QUOTES, 'UTF-8');?>" class="a_like J_like_btn J_qlogin_trigger">喜欢</a><span style="<?php echo htmlspecialchars($read['like_count'] ? '' : 'display:none', ENT_QUOTES, 'UTF-8');?>">(<a class="J_like_user_btn a_like_num" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=like&c=like&a=getLast&typeid=2&fromid=', rawurlencode($read['pid']); ?>"><?php echo htmlspecialchars($read['like_count'], ENT_QUOTES, 'UTF-8');?></a>)</span>
				<?php  } 

PwHook::display(array($threadDisplay, "runDo"), array('createHtmlForThreadButton',$read), "", $__viewer);
?>
			</div>
			<div style="display:none;" class="J_reply_wrap" id="J_reply_wrap_<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars(empty($read['istopped']) ? '' : '_topped', ENT_QUOTES, 'UTF-8');?>"><div class="pop_loading"></div></div>
		</td>
			</li>