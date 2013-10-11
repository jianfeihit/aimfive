<!doctype html>
<html>
<head>
	<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','title'), ENT_QUOTES, 'UTF-8');?> - 电子社区</title>
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="generator" content="phpwind v<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','version'), ENT_QUOTES, 'UTF-8');?>" />
<meta name="description" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','description'), ENT_QUOTES, 'UTF-8');?>" />
<meta name="keywords" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','keywords'), ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/core.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/style.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<style>
#bread_crumb{display:none}
.bread_crumb{display:none}
</style>
<!-- <base id="headbase" href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','base'), ENT_QUOTES, 'UTF-8');?>/" /> -->
<?php echo Wekit::C('site', 'css.tag');?>
<script>
//全局变量 Global Variables
var GV = {
	JS_ROOT : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/',										//js目录
	JS_VERSION : '<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>',											//js版本号(不能带空格)
	JS_EXTRES : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','extres'), ENT_QUOTES, 'UTF-8');?>',
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token $.ajaxSetup data
	U_CENTER : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space'; ?>',		//用户空间(参数 : uid)
<?php 
$loginUser = Wekit::getLoginUser();
if ($loginUser->isExists()) {
?>
	//登录后
	U_NAME : '<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>',										//登录用户名
	U_AVATAR : '<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>',							//登录用户头像
<?php 
}
?>
	U_AVATAR_DEF : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg',					//默认小头像
	U_ID : parseInt('<?php echo htmlspecialchars($loginUser->uid, ENT_QUOTES, 'UTF-8');?>'),									//uid
	REGION_CONFIG : '',														//地区数据
	CREDIT_REWARD_JUDGE : '<?php echo $loginUser->showCreditNotice();?>',			//是否积分奖励，空值:false, 1:true
	URL : {
		LOGIN : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login'; ?>',										//登录地址
		QUICK_LOGIN : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=fast'; ?>',								//快速登录
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',										//图片目录
		CHECK_IMG : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=showverify'; ?>',							//验证码图片url，global.js引用
		VARIFY : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=verify&a=get'; ?>',									//验证码html
		VARIFY_CHECK : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=verify&a=check'; ?>',							//验证码html
		HEAD_MSG : {
			LIST : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=notice&a=minilist'; ?>'							//头部消息_列表
		},
		USER_CARD : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=card'; ?>',								//小名片(参数 : uid)
		LIKE_FORWARDING : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=doreply'; ?>',							//喜欢转发(参数 : fid)
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=area'; ?>',									//地区数据
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=school'; ?>',								//学校数据
		EMOTIONS : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=emotion&type=bbs'; ?>",					//表情数据
		CRON_AJAX : '<?php echo htmlspecialchars($runCron, ENT_QUOTES, 'UTF-8');?>',											//计划任务 后端输出执行
		FORUM_LIST : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=forum&a=list'; ?>',								//版块列表数据
		CREDIT_REWARD_DATA : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&a=showcredit'; ?>',					//积分奖励 数据
		AT_URL: '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=remind'; ?>',									//@好友列表接口
		TOPIC_TYPIC: '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=forum&a=topictype'; ?>'							//主题分类
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<?php
PwHook::display(array(PwSimpleHook::getInstance("head"), "runDo"), array(), "", $__viewer);
?>
	<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/forum.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
	<link href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','css'), ENT_QUOTES, 'UTF-8');?>/editor_content.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<style>
.aPre{
	cursor:url(<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/common/pre.cur),auto;
}
.aNext{
	cursor:url(<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/common/next.cur),auto;right:0;
}
.header_wrap{display:none}
</style>
</head>
<body>

<div class="wrap">
	<?php if ($site_info_notice = Wekit::C('site','info.notice')) {?>
<style>.header_wrap{top:29px;}body{padding-top:75px;}</style><div id="notice"><?php echo htmlspecialchars($site_info_notice, ENT_QUOTES, 'UTF-8');?></div>
<?php }?>
<header class="header_wrap">
	<div id="J_header" class="header cc">
		<div class="logo">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'); ?>">
				<?php  if($__css = Wekit::C('site', 'css.logo')) { ?>
				<!--后台logo上传-->
				<img src="<?php echo htmlspecialchars(Pw::getPath($__css), ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>" style="padding-top:5px;">
				<?php  } else { ?>
				<img src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/images'; ?>/logo.png" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>" style="padding-top:5px;">
				<?php  } ?>
			</a>
		</div>
		<!--
		<div class="header_search" role="search">
			<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=search&c=s'; ?>" method="post">
				<input type="text" id="s" aria-label="搜索关键词" accesskey="s" placeholder="搜索其实很简单" x-webkit-speech speech name="keyword"/>
				<button type="submit" aria-label="搜索"><span>搜索</span></button>
			<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
		</div>
		-->
		<?php  if (!$loginUser->isExists()) { ?>
<div class="header_login">
	<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_3"), "runDo"), array(), "", $__viewer);
?><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login'; ?>">登录</a><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register'; ?>">注册</a>
</div>
<?php  } else {
	if ($pwforum && $pwforum->isForum()) {
		$_tmpfid = $pwforum->fid;
		$_tmpcid = $pwforum->getCateId();
	} else {
		$_tmpfid = 0;
		$_tmpcid = $pwforum ? $pwforum->getCateId() : '0';
	}
?>
<!--
	<a class="header_login_btn" id="J_head_forum_post" role="button" aria-label="快速发帖"  href="#" title="快速发帖" tabindex="-1"   onclick="javascript:window.location.href='?c=post&fid=2'"><span class="inside"><span class="header_post" >发帖</span></span></a>
	-->
	
	<?php 
		$messageCount = $loginUser->info['notices'] + $loginUser->info['messages'];
		$messageClass = $messageCount ? 'header_message' : 'header_message header_message_none';
	?>
	<a class="header_login_btn" id="J_head_msg_btn" tabindex="0" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=message'; ?>" aria-haspopup="J_head_msg_pop" aria-label="消息菜单,按pagedown打开菜单,tab键导航,esc键关闭"><span class="inside"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?>">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></span></a>
	<!--消息下拉菜单-->
	<div id="J_head_msg_pop" tabindex="0" aria-label="消息下拉菜单,按ESC键关闭菜单" class="header_menu_wrap my_message_menu" style="display:none;">
		<div class="header_menu cc">
			<div class="header_menu_hd" id="J_head_pl_hm"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?> header_message_down">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></div>
			<div id="J_head_msg" class="my_message_content"><div class="pop_loading"></div></div>
		</div>
	</div>
	<div class="header_login_later">
		<!-- <?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_1"), "runDo"), array(), "", $__viewer);
?>
		<a   href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>"  class="username" title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,12), ENT_QUOTES, 'UTF-8');?><em ></em></a>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_2"), "runDo"), array(), "", $__viewer);
?> -->
		<div class="fl">
		<div role="menu" class="header_menu_wrap my_menu_wrap" style="margin:0;color:#FFFFFF">
			<div>
				<?php 
				$_url = '';
				$_panelManage = false;
				if ($loginUser->getPermission('panel_bbs_manage')) {
					$_url = 'manage/content/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_user_manage')) {
					$_url = 'manage/user/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_report_manage')) {
					$_url = 'manage/report/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_recycle_manage')) {
					$_url = 'manage/recycle/run';
					$_panelManage = true;
				}
				if ($_panelManage) {
				?>
					
					<a href="<?php echo WindUrlHelper::createUrl($_url);?>" rel="nofollow"><em class="icon_system"></em>前台管理</a>
				<?php } if (Pw::getstatus($loginUser->info['status'], PwUser::STATUS_ALLOW_LOGIN_ADMIN) || Pw::inArray(3, $loginUser->groups)) {?>
					<a href="<?php echo htmlspecialchars(Wind::getComponent('router')->getRoute('pw')->checkUrl('admin.php'), ENT_QUOTES, 'UTF-8');?>" target="_blank" rel="nofollow"><em class="icon_admin" ></em>系统后台</a>
				<?php  } ?>
				
					<a href="index.php?m=space&c=profile" rel="nofollow"><em class="icon_system"></em>个人资料</a>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&_left=secret'; ?>"><em class="icon_profile"></em>设置</a>
					<?php
PwHook::display(array(PwSimpleHook::getInstance("header_my"), "runDo"), array(), "", $__viewer);
?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=logout'; ?>" rel="nofollow"><em class="icon_quit"></em>退出</a>
			
			</div>
		</div>
		</div>
	</div>
	<?php  if ($loginUser->info['message_tone'] > 0 && $messageCount > 0) { ?>
	<audio autoplay="autoplay">
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.wav" type="audio/wav" />
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.mp3" type="audio/mp3" />
		<div style='overflow:hidden;width:0;float:left'><embed src='<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.wav' width='0' height='0' AutoStart='true' type='application/x-mplayer2'></embed></div>
	</audio>
	<?php  } 
  } ?>
	</div>
</header>
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/css/base.css" rel="stylesheet" type="text/css" />
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/css/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/js/jquery-1.7.1.min.js"></script>
<script language="javascript" src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/js/tab.js"></script>
<?php 
if ($child) {
foreach ($child as $ck => $cv) {
	 if ($currentId == $ck){
?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>">
<?php  }else{ ?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>" style="display:none">
<?php  } ?>
		<ul class="cc">
			<?php  foreach($cv as $_v){
				$current = $_v['current'] ? 'current' : '';
			?>
			<li class="<?php echo htmlspecialchars($current, ENT_QUOTES, 'UTF-8');?>"><?php echo $_v['name'];?></li>
			<?php  } ?>
		</ul>
	</div>
<?php }} ?>
<div class="tac"> </div>
	<div class="main_wrap">
		<pw-tpl id="main_segment"/>
		<div class="bread_crumb">
			<?php echo $headguide;?>
		</div>
		<pw-tpl id="first_segment"/>
		<div id="app_test"></div>
		<div id="cloudwind_read_top"></div>
		<input type="hidden" id="js-tid" value="$tid" />
		<div class="read_page" id="J_posts_list">
			<div class="container floor"  ">
<?php  foreach ($readdb as $key => $read) { ?>
<a name="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>"></a><?php  if ($read['lou'] == $count-1) { ?><a name="a"></a><?php  } ?>
<div id="cloudwind_read_readfloor_<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>"></div>
<?php if($key==0){?>
	<!--左开始-->
	<div class="leftside" style="width:436px;">
		<div class="myName">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($read['created_userid']); ?>" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>" target="_blank"><img src="<?php echo htmlspecialchars(Pw::getAvatar($read['created_userid']), ENT_QUOTES, 'UTF-8');?>" class="J_avatar" data-type="middle" alt="<?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?>"></a>
			<p>
			<span class="<?php echo htmlspecialchars($users[$read['created_userid']]['gender']==1 ? 'women' : 'man', ENT_QUOTES, 'UTF-8');?>_<?php echo htmlspecialchars(($_isol = Pw::checkOnline($users[$read['created_userid']]['lastvisit'])) ? 'ol' : 'unol', ENT_QUOTES, 'UTF-8');?>" title="<?php echo htmlspecialchars($_isol ? '在线' : '离线', ENT_QUOTES, 'UTF-8');?>"></span><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=profile'; ?>" class="J_user_card_show mr5" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?></a>
			<?php if ($operateReply['ban']) {?>
			<span class="J_post_manage_col" data-role="readbar"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=manage&a=ban&tid=', rawurlencode($tid),'&uid=', rawurlencode($read['created_userid']); ?>" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>" class="J_dialog_post fn org w"  style="font-size:12px;">[禁止]</a></span>
			<?php }?>
			</p>
		<div><?php echo htmlspecialchars($ltitle[$users[$read['created_userid']]['groupid']], ENT_QUOTES, 'UTF-8');
  if ($read['created_userid']) { ?>
			<!--发私信加关注-->
				<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($read['created_userid']); ?>" data-uid="<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>" class="follow J_read_follow J_qlogin_trigger">加关注</a>
				<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=message&a=pop&username=', rawurlencode($read['created_username']); ?>" class="message J_send_msg_pop J_qlogin_trigger" data-name="<?php echo htmlspecialchars($read['created_username'], ENT_QUOTES, 'UTF-8');?>">写私信</a>
				<?php
PwHook::display(array($threadDisplay, "runDo"), array('createHtmlForUserButton',$users[$read['created_userid']], $read), "", $__viewer);

  } ?>
		</div>
		</div><div class="clear"></div>
		<div class="question">
			<span><?php  if ($threadInfo['topic_type'] && ($topicTypename = $threadDisplay->getTopicTypeName($threadInfo['topic_type']))) { ?><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=thread&fid=', rawurlencode($pwforum->fid),'&type=', rawurlencode($threadInfo['topic_type']); ?>" style="color:#FFFFFF">[<?php echo $topicTypename;?>]</a><?php  } ?>
				
			</span>
			<p><?php echo htmlspecialchars($threadInfo['subject'], ENT_QUOTES, 'UTF-8');?></p>
			<div class="clear"></div>
		</div>
		<div class="date">
			<span class="colorGray">发布于：<?php echo htmlspecialchars(Pw::time2str($read['created_time']), ENT_QUOTES, 'UTF-8');?></span>
				<?php  if ($loginUser->uid && ($read['created_userid'] == $loginUser->uid || $threadPermission['edit'])) { ?>
				 <a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=modify&tid=', rawurlencode($tid),'&pid=', rawurlencode($read['pid']); ?>">[编辑]</a>
				<?php  } ?>
			<p><b><?php echo htmlspecialchars($read['v_type'], ENT_QUOTES, 'UTF-8');?></b></p>
		</div>
		<div class="date">
			<span class="colorBlack">来自：<?php echo htmlspecialchars($read['ipfrom'], ENT_QUOTES, 'UTF-8');?></span>
			<p> 浏览 <span><?php echo htmlspecialchars($threadInfo['hits'], ENT_QUOTES, 'UTF-8');?></span> | 回复 <span><?php echo htmlspecialchars($threadInfo['replies'], ENT_QUOTES, 'UTF-8');?></span> | <a href="javascript:click_concerned(<?php echo htmlspecialchars($read['tid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>)">关注</a></p>
		</div>
		<div class="quecontent"  style="height:140px;overflow-y: scroll;">
			<?php  if ($read['disabled'] == 1) { ?>
						<div class="inside_logs"><span class="red">该帖需要审核通过后才能显示</span></div>
					<?php  } 
  if ($read['lou'] != 0 && $read['subject']) { ?>
			<div class="inside_title"><?php echo htmlspecialchars($read['subject'], ENT_QUOTES, 'UTF-8');?></div>
			<?php  } ?>
			<p><?php echo $read['content'];?></p>
			<?php  if ($read['modified_time']) { ?>
				<div class="edit_log">[<?php echo htmlspecialchars($read['modified_username'], ENT_QUOTES, 'UTF-8');?>于<?php echo htmlspecialchars(Pw::time2str($read['modified_time']), ENT_QUOTES, 'UTF-8');?>编辑了帖子]</div>
				<?php  } ?>
		</div>
		
		<p class="appendixStyle"><?php if($read['topic_type']==1){?>悬赏点数：<?php echo htmlspecialchars($read['jf'], ENT_QUOTES, 'UTF-8');?>点<?php }?>
				&nbsp;
			<span class="positionSpan">
			<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=warn&loginuid=', rawurlencode($loginuid),'&tid=', rawurlencode($read['tid']); ?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" class="mr10 J_report J_qlogin_trigger">邀请关注</a>
			<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=email&loginuid=', rawurlencode($loginuid),'&tid=', rawurlencode($read['tid']); ?>" data-pid="<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>" class="mr10 J_report J_qlogin_trigger">邮件邀请</a>
			</span></span>
		</p>
	
		<div class="finishOff">
				<?php if($read['topic_type']==1){?>
			<h3 class="titleBase">
				<span>解决办法</span>
			</h3>
			<div class="finishTetx">
				<?php if($read['is_ok']==0){?>
				<p  style="min-height:50px;">未解决</p>
				<?php }else{?>
				<p  style="min-height:50px;">【<?php echo htmlspecialchars($threadDisplay->getFloorName($read['back_lou']), ENT_QUOTES, 'UTF-8');?>】 <?php echo mb_substr($read['p_content'],0,100,'utf-8');?></p>
				<?php }?>
			</div>
			<?php }else{
  if ($readdb[0]['created_userid'] == $loginUser->uid)  { ?>
			<span  style="float:right;font-size:12px;color:red" >注:添加完补充信息,点击空白处即可.</span>
			<?php }?>
			<h3 class="titleBase">
					
				<span>补充内容</span>
				
			</h3>
		
						<div  >
			
				<?php if(!$read['add_content']){
  if ($readdb[0]['created_userid'] == $loginUser->uid)  { ?>
							<textarea rows="3" cols="65"  onblur="addcontent(<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['tid'], ENT_QUOTES, 'UTF-8');?>)"  id="adcont"  ></textarea>
					<?php }else{?>
							<textarea rows="3" cols="65"  disabled>暂时没有补充的内容!</textarea>
					<?php }
 }else{?>
				<textarea rows="3" cols="65"  disabled><?php echo htmlspecialchars($read['add_content'], ENT_QUOTES, 'UTF-8');?></textarea>
				<?php }?>
					
			</div>
			<?php }?>
		</div>
		<?php  if ($showReply) { ?>
			<!--快速回复-->
			<div class="floor cc"  style="margin-top:30px;">
				<table width="100%" style="table-layout:fixed;" class="floor_table">
					<tr>
						<td class="floor_reply box_wrap" >
							<div class="fl"><div class="floor_arrow"><em></em><span></span></div></div>
							<?php  if (!$loginUser->isExists()) { ?>
								<div class="reply_login_tips">
									您需要登录后才可以回帖，<a href="#floor_reply" rel="nofollow" class="J_qlogin_trigger">登录</a>&nbsp;或者&nbsp;<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register'; ?>">注册</a>
								</div>
							<?php  } else { ?>
							<div class="reply_toolbar_wrap">
								<div class="reply_toolbar cc">
									<a href="" style="display:;"  tabindex="-1" rel="nofollow" class="icon_face J_insert_emotions" data-emotiontarget="#J_reply_quick_ta">表情</a>
								</div>
								<textarea name="atc_content" aria-label="快速回复" id="J_reply_quick_ta" class="J_at_user_textarea" placeholder="我也说两句"></textarea>
							</div>
							<div class="J_reply_ft" id="J_reply_ft">
								<button type="submit" data-tid="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>" data-action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=doreply&_getHtml=1'; ?>" class="btn btn_submit disabled" disabled="disabled" id="J_reply_quick_btn">回复</button>
							</div>
							<?php  } ?>
						</td>
					</tr>
				</table>
			</div>
			<!--快速回复结束-->
			<?php  } ?>
			<pw-tpl id="read_bottom"/>
			<div id="cloudwind_read_bottom"></div>
	</div>
	
	<!--左结束-->
	<?php }
 }?>
	<!--中间开始-->
	<div class="middleside" style="width:430px;height:740px;">
		<h3 class="titleBase">
				<span class="buleBg">讨论</span>
				<p> 浏览 <span><?php echo htmlspecialchars($threadInfo['hits'], ENT_QUOTES, 'UTF-8');?></span> | 回复 <span><?php echo htmlspecialchars($threadInfo['replies'], ENT_QUOTES, 'UTF-8');?></span> | <a href="javascript:click_concerned(<?php echo htmlspecialchars($read['tid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>)">关注</a></p>
			</h3>
		<ul class="talkList"  >
		<?php  foreach ($readdb as $key => $read) { 
 if($key>0){?>
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
  if ($readdb[0]['created_userid'] == $loginUser->uid)  { 
 if($readdb[0]['is_ok']==0  && $readdb[0]['topic_type']==1){?>
								<a href="javascript:goods(<?php echo htmlspecialchars($read['tid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['created_userid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['pid'], ENT_QUOTES, 'UTF-8');?>,<?php echo htmlspecialchars($read['lou'], ENT_QUOTES, 'UTF-8');?>)" >最佳答案</a>
							<?php  } 
  } 
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
			
			
			<?php }
  } ?>
				<span id="floor_reply"></span>
		</ul>

		
	</div><!--中间结束-->
<?php  if ($read['lou'] == 0) { ?>
<pw-drag id="readFloor_segment"/>
<?php  } ?>
 


	<div class="clear"></div>
<div class="content" style="padding-top:30px;">
	<div class="leftside" style="width:436px;">
		<h3 class="titleBase"> <span>相关讨论</span>	&nbsp;</h3>
		<ul class="talkSel">
			<li>
				<p class="paddL"><a href="#">dewhide回家额我还ifh</a></p>
				<div class="date margintop0">
					<span><a href="#">郭涛</a></span> <span class="colorGray">中国北京</span>
					<p>浏览 <span>6</span> | 回复 <span>1</span> | 关注 <span>3</span></p>
				</div>
				<span class="posR">xxxxxxxxxx</span>
			</li>
			<li>
				<p class="paddL"><a href="#">dewhide回家额我还ifh</a></p>
				<div class="date margintop0">
					<span><a href="#">郭涛</a></span> <span class="colorGray">中国北京</span>
					<p>浏览 <span>6</span> | 回复 <span>1</span> | 关注 <span>3</span></p>
				</div>
				<span class="posR">xxxxxxxxxx</span>
			</li>
			<li>
				<p class="paddL"><a href="#">dewhide回家额我还ifh</a></p>
				<div class="date margintop0">
					<span><a href="#">郭涛</a></span> <span class="colorGray">中国北京</span>
					<p>浏览 <span>6</span> | 回复 <span>1</span> | 关注 <span>3</span></p>
				</div>
				<span class="posR">xxxxxxxxxx</span>
			</li>
		</ul>
	</div>
	<div class="middleside1" style="width:440px;">
		<h3 class="titleBase"> <span>资源推荐</span>	&nbsp;</h3>
		<div class="resource">
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
			<p><a href="#">&middot; doof金额解放军凤姐芙蓉街放入诶就芙蓉街非人非而金夫人</a></p>
		</div>
	</div>
	<div class="clear"></div>
</div>
</div>

			<?php $__tplPageCount=(int)$count;
$__tplPagePer=(int)$perpage;
$__tplPageTotal=(int)$totalpage;
$__tplPageCurrent=(int)$page;
if($__tplPageCount > 0 && $__tplPagePer > 0){
$__tmp = ceil($__tplPageCount / $__tplPagePer);
($__tplPageTotal !== 0 &&  $__tplPageTotal < $__tmp) || $__tplPageTotal = $__tmp;}
$__tplPageCurrent > $__tplPageTotal && $__tplPageCurrent = $__tplPageTotal;
if ($__tplPageTotal > 1) {
 
$_page_min = max(1, $__tplPageCurrent-1);
$_page_max = min($__tplPageTotal, $__tplPageCurrent+1);
?>
<div class="floor_page">
<?php  if ($__tplPageCurrent > $_page_min) { 
$_page_i = $__tplPageCurrent-1;
?>
<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','read.php?tid=', rawurlencode($tid),'&fid=', rawurlencode($fid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($urlargs ? '&' . http_build_query($urlargs) : '', ENT_QUOTES, 'UTF-8');?>" class="pre" title="上一页">上一页</a>
<?php  } else { ?>
<span class="pre">上一页</span>
<?php  } 
  if ($__tplPageCurrent < $_page_max) {
$_page_i = $__tplPageCurrent+1;
?>
<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','read.php?tid=', rawurlencode($tid),'&fid=', rawurlencode($fid),'&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($urlargs ? '&' . http_build_query($urlargs) : '', ENT_QUOTES, 'UTF-8');?>" class="next" title="下一页">下一页</a>
<?php  } else { ?>
<span class="next">下一页</span>
<?php  } ?>
</div> 
<?php } ?>
			<div class="read_pages_wrap cc" id="floor_reply">
			</div>
		</div>
		<?php  if ($operateReply) { ?>
		<div id="J_post_manage_main" class="core_pop_wrap J_post_manage_pop" style="display:none;position:fixed;_position:absolute;">
			<div class="core_pop">
				<div style="width:250px;">
					<div class="pop_top"><a href="#" id="J_post_manage_close" class="pop_close">关闭</a><strong>帖子操作</strong>(已选中&nbsp;<span class="red" id="J_post_checked_count">1</span>&nbsp;篇&nbsp;&nbsp;<a href="" class="s4" id="J_post_manage_checkall" data-type="check">全选</a>)</div>
					<div class="pop_cont">
						<div class="pop_operat_list">
							<ul class="cc J_post_manage_col" data-role="read">
								<?php  if ($operateReply['delete']){ ?><li><a data-type="delete" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=delete'; ?>">删除</a></li><?php  } 
  if ($operateReply['unite']){ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=unite'; ?>">合并</a></li><?php  } 
  if ($operateReply['split']){ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=split'; ?>">拆分</a></li><?php  } 
  if ($operateReply['shield']){ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=shield'; ?>">屏蔽</a></li><?php  } 
  if ($operateReply['remind']){ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=masingle&a=remind'; ?>">提醒</a></li><?php  } ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php  } ?>
	</div>
	<!--.main-wrap,#main End-->
<div class="tac">
 <br />
 
</div>
<div class="footer_wrap">
	<div class="footer">
		<pw-drag id="footer_segment"/>
		<div class="bottom">
		欢迎您进入Aimfive电子社区
		</div>
		<p>Powered by <a href="/" target="_blank" rel="nofollow">Aimfive</a> &copy;2003-2103 <a href="/" target="_blank" rel="nofollow">Aimfive.com</a> <a href="/" target="_blank" rel="nofollow"><?php echo htmlspecialchars(Wekit::C('site','info.icp'), ENT_QUOTES, 'UTF-8');?></a></p>
		<p><?php echo Wekit::C('site','statisticscode');?></p>
	</div>
	
</div>

<!--返回顶部-->
<a href="#" rel="nofollow" role="button" id="back_top" tabindex="-1">返回顶部</a>

</div>

<textarea id="J_like_user_ta" class="dn">
	<div id="" class="core_pop_wrap" style="position:absolute;">
		<div class="core_pop">
			<div class="floot_like_pop">
				<div class="pop_top"><a href="#" class="pop_close J_like_user_close">关闭</a>最新喜欢</div>
				<div class="pop_cont">
					<ul class="cc J_like_user_list"></ul>
				</div>
			</div>
		</div>
	</div>
</textarea>

<script>
var TID = '<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>';
Wind.use('jquery', 'global', 'dialog', function(){
<?php  if(!$is_design) { 
  if ($loginUser->isExists()) { ?>
	//已登录

	//管理操作
	Wind.js(GV.JS_ROOT +'pages/bbs/threadManage.js?v='+ GV.JS_VERSION);

	$('a.J_read_mark').on('click', function(e) {
		e.preventDefault();
		var $this = $(this);
		$.post(this.href, function(data) {
			Wind.Util.resultTip({
				error : (data.state == 'success' ? false : true),
				elem : $this,
				follow : true,
				msg : data.message[0]
			});
		}, 'json');
	});

	//加关注
	$('a.J_read_follow').on('click', function(e) {
		e.preventDefault();
		var $this = $(this);
		Wind.Util.ajaxMaskShow();
		$.getJSON( this.href, function(data) {
			Wind.Util.ajaxMaskRemove();
			if(data.state == 'success') {
				$this.removeClass('follow').addClass('unfollow').text('已关注');
				Wind.Util.resultTip({
					msg : data.message[0],
					follow : $this
				});

				$('#J_user_card_'+ $this.data('uid')).remove();
			}else if( data.state == 'fail' ) {
				Wind.Util.resultTip({
					error : true,
					msg : data.message[0],
					follow : $this
				});
			}
		});
	});

	<?php  if ($operateReply['toppedreply'] && $read['lou']){ ?>
	//帖内置顶
	(function(){
		var top_lock = false;
		$('a.J_post_top').on('click', function(e){
			e.preventDefault();
			var $this = $(this),
				topped = $this.data('topped');

			if(top_lock) {
				return false;
			}
			top_lock = true;
			$.post(this.href, function(data){
				if(data.state == 'success') {
					Wind.Util.resultTip({
						follow : $this,
						msg : data.message[0],
						callback : function(){
							location.reload();
						}
					});
				}else if(data.state == 'fail') {
					Wind.Util.resultTip({
						error : true,
						follow : $this,
						msg : data.message[0]
					});
					top_lock = false;
				}
			}, 'json');
		})
	})();
		<?php  } 
  } ?>


	// 阅读页的常用交互
	Wind.js(GV.JS_ROOT +'pages/bbs/read.js?v='+ GV.JS_VERSION);

	// 投票帖
	if($('ul.J_vote_item, a.J_vote_list_show').length) {
		Wind.js(GV.JS_ROOT +'pages/bbs/readVote.js?v='+ GV.JS_VERSION);
	}

	// 购买记录
	if($('#J_content_sell, #J_attach_buy, a.J_buy_record, .J_attach_post_del, a.J_attach_post_buy').length) {
		Wind.js(GV.JS_ROOT + 'pages/bbs/buyRecords.js?v=' + GV.JS_VERSION);
	}

	//媒体播放
	if( $('div.J_audio,div.J_video').length ) {
		Wind.js(window.GV.JS_ROOT + 'pages/bbs/media_play.js?v=' + GV.JS_VERSION);
	}


<?php  if(false != Wekit::C('bbs', 'read.image_lazy')) { ?>
	// 图片懒加载
	Wind.js(GV.JS_ROOT + 'util_libs/lazyload.js?v=' + GV.JS_VERSION, function(){
		$("img.J_lazy").lazyload({
	        effect: 'fadeIn',
	        error: function(settings){
	        	$(this).attr("src", '#').removeClass("J_lazy")
	        }
	    });
	});
<?php  } 
  } ?>
});


	function goods(tid,uid,pid,lou){
		$.getJSON('read.php?c=read&a=ajaxGoods',{tid:tid,uid:uid,pid:pid,lou:lou},function(msg){
					Wind.Util.resultTip({
						msg : msg.info,
						callback : function(){
							location.reload();
						}
					});
		});
	}

	function addcontent(uid,tid){
		var con = $("#adcont").val();
		if(con!=''){
			$.getJSON('read.php?c=read&a=ajaxaddcon',{tid:tid,con:con},function(msg){
					Wind.Util.resultTip({
						msg : msg.info,
						callback : function(){
							location.reload();
						}
					});
			});
		}
	}
	
	
</script>

<?php
PwHook::display(array($threadDisplay, "runDo"), array('runJs'), "", $__viewer);
?>
<pw-end/>
</body>
</html>