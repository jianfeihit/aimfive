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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/post.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
</head>

<body>

<div class="wrap" >	
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
	<div class="main_wrap" >
		<div class="bread_crumb">
			<?php echo $headguide;?>
		</div>
		

		<form method="post" id="mainForm" name="FORM" action="<?php echo WindUrlHelper::createUrl('bbs/post/' . $do . '/?_json=1&fid=' . $fid);?>" enctype="multipart/form-data">
		<div class="box_wrap post_page" style="width:960px;float:left;">
		<div class="main_sidebar" >
				<?php  if (!$loginUser->isExists()) { 
  Wind::import('APPS:u.service.helper.PwUserHelper'); 
  $_loginWay = PwUserHelper::getLoginMessage(); ?>
	<div class="box_wrap sidebar_login">
		<form id="J_login_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=dologin'; ?>" method="post">
		<dl>
			<dt id="J_sidebar_login_dt" class="cc">
				<i class="icon_username" title="请输入<?php echo htmlspecialchars($_loginWay, ENT_QUOTES, 'UTF-8');?>"></i><label for="J_username">用户名</label><input required type="text" class="input" id="J_username" name="username" placeholder="<?php echo htmlspecialchars($_loginWay, ENT_QUOTES, 'UTF-8');?>">
				<i class="icon_password" title="请输入密码"></i><label for="J_password">密　码</label><input required type="password" class="input" id="J_password" name="password" placeholder="密码">
			</dt>
			<dd class="associate"><a class="sendpwd" rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=findPwd'; ?>">找回密码</a><label for="head_checkbox" title="下次自动登录"><input type="checkbox" id="head_checkbox" name="rememberme" value="31536000">自动登录</label></dd>
			<dd class="operate"><button type="submit" id="J_sidebar_login" class="btn btn_big btn_submit">登录</button><a class="btn btn_big btn_error" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register'; ?>" rel="nofollow">立即注册</a></dd>
		</dl>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	</div>
<?php  } else { 
  $_group = $loginUser->getGroupInfo(); ?>
	<div class="box_wrap user_info">
		<ul class="cc"  style="text-align:center;">
			<li id="J_ava_ie6">
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=avatar&_left=avatar'; ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="120" height="120" alt="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" /></a>
			</li>
			<li >
				<div class="name" ><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>" class="username"  style="font-size:18px;"><?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?></a></div>
				<div class="level"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=right&_left=right'; ?>"><?php echo htmlspecialchars($_group['name'], ENT_QUOTES, 'UTF-8');?></a></div>
			
			</li>
		</ul>
	<?php  if (Wekit::C('site','medal.isopen')){ ?>
		<div class="medal_widget" id="J_medal_widget">
			<a href="javascript:;" class="next next_disabled J_lazyslide_next" title="下一组"><em></em></a>
			<a href="javascript:;" class="pre pre_disabled J_lazyslide_prev" title="上一组"><em></em></a>
			<div class="medal_list_wrap">
			<ul id="J_medal_widget_ul" class="cc J_lazyslide_list" style="width:900px;">
			<?php  
				$J_medals = Wekit::load('medal.srv.PwMedalCache')->getMyAndAutoMedal($loginUser->uid);
				$_medals = array_slice($J_medals, 0, 6, true);
				foreach ($_medals as $medal){
			
  if($medal['award_status'] !=4){ ?>
					<li class="doing"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  }else{ ?>
					<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  } 
  } ?>
			</ul>
			<textarea id="J_sidebar_medal_ta" style="display:none">
				<?php  foreach ($J_medals as $medal){ 
  if($medal['award_status'] !=4){ ?><li class="doing"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  }else{ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  } 
  } ?></textarea>
			</div>
		</div>
	<?php  } 
  
	$punchService = Wekit::load('space.srv.PwPunchService');
	list($punchOpen,$punchFriendOpen) = $punchService->getPunchConfig();
	if ($punchOpen) {
		list($punchStatus,$punchButton,$punchData) = $punchService->getPunch();
		$punchStatus = $punchStatus ? '' : 'punch_widget_disabled';
		list($monthDay,$weekDay) = $punchService->formatWeekDay(Pw::getTime());
	 ?>
	<div class="cc punch_widget_wrap">
		<div id="J_punch_main_tip" class="fl dn">
		<?php  if ($punchData) { ?>
			<div class="tips">
				<div class="core_arrow_top"><em></em><span></span></div>
				<?php echo htmlspecialchars($punchData['username'], ENT_QUOTES, 'UTF-8');?>已帮你领取<span class="red"><?php echo htmlspecialchars($punchData['cNum'], ENT_QUOTES, 'UTF-8');?></span><?php echo htmlspecialchars($punchData['cUnit'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($punchData['cType'], ENT_QUOTES, 'UTF-8');?>
			</div>
		<?php  } ?>
		</div>
		<div class="punch_widget <?php echo htmlspecialchars($punchStatus, ENT_QUOTES, 'UTF-8');?>" id="J_punch_widget">
			<div class="date"><?php echo htmlspecialchars($monthDay, ENT_QUOTES, 'UTF-8');?><span><?php echo htmlspecialchars($weekDay, ENT_QUOTES, 'UTF-8');?></span></div>
			<div class="cont"><a data-tips="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=punch&a=punchtip'; ?>" data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=punch&a=punch'; ?>" href="#" id="J_punch_mine" tabindex="-1" target="_blank"><?php echo htmlspecialchars($punchButton, ENT_QUOTES, 'UTF-8');?></a></div>
			<?php  if ($punchFriendOpen) { ?>
			<a data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=punch&a=friend'; ?>" href="#" id="J_punch_friend" class="help_ta" tabindex="-1" target="_blank">帮Ta打卡</a>
			<?php  } ?>
		</div>
	</div>
<?php  } ?>
	</div>
<?php  } 
  if ($loginUser->info['join_forum']) { 
	Wind::import('APPS:bbs.controller.ForumController');
	$myJoinForum = ForumController::splitStringToArray($loginUser->info['join_forum']);
	$myJoinForumCount = count($myJoinForum);
	
?>
<div class="box_wrap my_forum_list"><!--切换样式 my_forum_list_cur -->
	<h2 class="box_title J_sidebar_box_toggle">我的版块<span class="num"><?php echo htmlspecialchars($myJoinForumCount, ENT_QUOTES, 'UTF-8');?></span></h2>
	<ul>
	<?php  foreach ($myJoinForum as $v => $k) { ?>
		<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=thread&fid=', rawurlencode($v); ?>"><?php echo htmlspecialchars($k, ENT_QUOTES, 'UTF-8');?></a></li>
	<?php  } ?>
	</ul>
</div>
<?php  } ?>
<!--advertisement id='Site.Sider.User' sys='1'/-->
<pw-drag id="sidebar_1"/>
		<?php 
			$forumdb = Wekit::load('forum.srv.PwForumService')->getCommonForumList();
			if ($pwforum instanceof PwForumBo) {
				$__currentCateId = $pwforum->getCateId();
				$__currentFid = $pwforum->fid;
				!isset($forumdb[0][$__currentCateId]) && $__currentCateId = key($forumdb[0]);
			} else {
				$__currentCateId = key($forumdb[0]);
				$__currentFid = 0;
			}
		?>
		
<!--热点话题
<?php $__tpl_data = call_user_func_array(
								array(Wekit::load("SRV:tag.srv.PwTagService"), 
								"getHotTags"), 
								array('0','10')); 
  if($__tpl_data) {?>
<div class="box_wrap">
	<h2 class="box_title">热门话题</h2>
	<div class="tags_hot">
	<ul class="cc">
		<?php  foreach($__tpl_data as $k=>$v){ ?>
		<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=tag&a=view&name=', rawurlencode($v['tag_name']); ?>" class="title"><?php echo htmlspecialchars($v['tag_name'], ENT_QUOTES, 'UTF-8');?></a></li>
		<?php  } ?>
	</ul>
	</div>
</div>
 
<?php  } 
  ?>
-->
<?php  
	if ($loginUser->info['recommend_friend']) {
		$pFriends = Wekit::load('attention.srv.PwAttentionRecommendFriendsService')->getRecommentUser($loginUser);
		if ($pFriends) {
		$otherFriends = array_slice($pFriends,3);
		$pFriends = array_slice($pFriends,0,3);
 ?>
<div class="box_wrap" id="J_friend_maybe">
	<h2 class="box_title J_sidebar_box_toggle">可能认识的人</h2>
	<div class="side_may_list" id="J_friend_maybe_list" data-url="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=recommendfriend'; ?>">
	<?php 
		$i = 0;
		foreach($pFriends as $v){
			$pUid = $v['uid'];
			//if ($v['cnt'] < 1) continue;
			$class = ($i > 1) ? 'display:none;' : '';
			$class2 = ($i > 0) ? 'display:none;' : '';
			$load = ($i > 0) ? 'false' : 'true';
			$arrow = ($i == 0) ? '&uarr;' : '&darr;';
	 ?>
		<div class="J_friend_maybe_items">
			<dl>
				<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($pUid); ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($pUid,'small'), ENT_QUOTES, 'UTF-8');?>" width="50" height="50" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" data-type="small" /></a></dt>
				<dd>
					<p class="title"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($pUid); ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['username'], ENT_QUOTES, 'UTF-8');?></a></p>
					<p><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($pUid); ?>" class="core_follow J_friend_maybe_follow mr10" role="button" rel="nofollow">关注</a>
					<?php  if ($v['cnt']) { ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=samefriend&uid=', rawurlencode($pUid); ?>" class="unmore J_friend_view" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>个共同好友<?php echo $arrow;?></a>
					<?php  } ?>
					</p>
				</dd>
			</dl>
			<?php  if ($v['sameUser']) { ?>
			<div id="J_friend_related_<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" class="related J_friend_related" style="<?php echo htmlspecialchars($class2, ENT_QUOTES, 'UTF-8');?>" data-load="<?php echo htmlspecialchars($load, ENT_QUOTES, 'UTF-8');?>">
				
				<div class="menu_arrow"><em></em><span></span></div>
				<?php  
					$tmp = array();
					foreach($v['sameUser'] as $sk => $su){
						if (!trim($su)) continue;
						$tmp[] = sprintf('<a href="%s" class="J_user_card_show" data-uid="%d" target="_blank">%s</a>',WindUrlHelper::createUrl('space/index/run',array('uid'=>$sk)),$sk,$su);
					}
					$tmp = implode('、', $tmp);
				 ?>
				 您关注的人中： <?php echo $tmp;
  if($v['cnt'] > 3) {?>等<?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>人<?php  } ?> 也关注了Ta
			</div>
			<?php  } ?>
		</div>
	<?php 
		$i++;
		}
	 ?>
		
	</div>
</div>
<?php  }} ?>
<pw-drag id="sidebar_thread"/>
 
<ul class="ulNav">
		
			<li <?php if($menu=='fabu'){?> class="selected"<?php }?>><span class="bgStyle8">&nbsp;</span><a href="index.php?c=post&fid=2&type=tw" title="提问分享">提问</a></li>
			<li <?php if($menu=='fabu1'){?> class="selected"<?php }?>><span class="bgStyle8">&nbsp;</span><a href="index.php?c=post&fid=2&type=fx" title="提问分享">分享</a></li>
			<li <?php if($menu=='guanzhu'){?> class="selected"<?php }?>><span class="bgStyle9">&nbsp;</span><a href="index.php" title="我的关注">我的关注</a></li>
			<li<?php if($menu=='nanti' || $menu=='fenlei' || $menu=='hot' ){?> class="selected"<?php }?> ><span class="bgStyle10">&nbsp;</span><a href="index.php?c=forum&a=puzzle" title="难题">浏览</a></li>
			<li<?php if($menu=='liuyan'){?> class="selected"<?php }?>><span class="bgStyle12">&nbsp;</span><a href="index.php?m=message&c=message" title="留言板">留言板</a></li>
			<li<?php if($menu=='rizhi'){?> class="selected"<?php }?>><span class="bgStyle14">&nbsp;</span><a href="index.php?m=message&c=notice" title="日志">日志</a></li>
</ul>
<!--design role="segment" id="linkdemo"/-->

			</div>
		<div  style="width:760px;float:right;" >
			<nav>
				<div class="content_nav"  >
					<ul id="tabTypeHead">
					<?php  if ($action == 'reply') { ?>
						<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=reply&tid=', rawurlencode($tid); ?>">发表回复</a></li>
					<?php  } elseif ($action == 'modify') { ?>
						<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=post&a=modify&tid=', rawurlencode($tid),'&pid=', rawurlencode($pid); ?>">编辑帖子</a></li>
					<?php  } else { 
  foreach ($pwforum->getThreadType($loginUser) as $key => $value) { ?>
						<li class="<?php echo htmlspecialchars(Pw::isCurrent($special == $key), ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo htmlspecialchars(WindUrlHelper::createUrl('bbs/post/run/?fid=' . $fid . ($key != 'default' ? ('&special=' . $key) : '')), ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value[1], ENT_QUOTES, 'UTF-8');?></a></li>
						<?php  } 
  } ?>
					</ul>
				</div>
			</nav>
			<?php  $draftCount = Wekit::load('draft.PwDraft')->countByUid($loginUser->uid); ?>
			<div class="post_content" >
				<div id="J_draft_list" class="fr dn">
					<div class="pop_draft" id="J_draft_wrap">
						<div class="pop_loading"></div>
						<!--span class="not_content_mini">暂无草稿</span-->
					</div>
				</div>
				<hgroup class="title">
					<?php  if ($topictypes['topic_types']) {//主题分类 ?>
					<input type="hidden" name="topic_type_id" value="" id="J_topic_type_id" />
					<select id="J_sort_1" class="mr10" name="topictype"  style="display:none">
						<option value="0">请选择分类1</option>
						<?php  foreach($topictypes['topic_types'] as $v) { 
 if($t_type=='tw' || !$t_type){?>
						<option value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" <?php if ($v['id']==1){?>selected='selected'<?php }?>><?php echo htmlspecialchars(strip_tags($v['name']), ENT_QUOTES, 'UTF-8');?></option>
						<?php }else{?>
						<option value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" <?php if ($v['id']==2){?>selected='selected'<?php }?>><?php echo htmlspecialchars(strip_tags($v['name']), ENT_QUOTES, 'UTF-8');?></option>
						<?php }
  } ?>
					</select>
				
					<?php  }//主题分类结束 ?>
				<!-- 	
					<input name="atc_title" id="J_atc_title" value="<?php echo htmlspecialchars($atc_title, ENT_QUOTES, 'UTF-8');?>" class="input length_6 mr15"<?php echo htmlspecialchars(!empty($isTopic) ? ' required' : '', ENT_QUOTES, 'UTF-8');?> aria-required="true" placeholder="<?php echo htmlspecialchars(!empty($default_title) ? $default_title : '请输入标题', ENT_QUOTES, 'UTF-8');?>" title="请输入标题" data-max="<?php echo htmlspecialchars(Wekit::C('bbs', 'title.length.max'), ENT_QUOTES, 'UTF-8');?>"/><span id="J_title_tip"></span>
				 -->
				</hgroup>
		</div>
		<!--中间开始-->
	<div class="middleside1" style="min-height:630px;padding-top:10px;">
		<div class="infoOut" >
			<div class="tab_menu">
				<ul class="askshare">
					<?php if($t_type=='tw'){?><li onclick="javascript:window.location.href='?c=post&fid=2&type=tw'" >提问 </li><?php }
 if($t_type=='fx'){?><li onclick="javascript:window.location.href='?c=post&fid=2&type=fx'"  >分享</li><?php }?>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="tab_box"><!--tab1-->
				<div id="tw">
					<table class="deskTab" width="100%" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td>器件厂商<input type="text" class="textBorder"   name="vender" id="t_vender"  value="<?php echo htmlspecialchars($vender, ENT_QUOTES, 'UTF-8');?>"   <?php if($vender){?>disabled<?php }?>/></td>
							<td>器件型号 <input type="text" class="textBorder"  name="vtype"   id="t_vtype"  value="<?php echo htmlspecialchars($v_type, ENT_QUOTES, 'UTF-8');?>" <?php if($v_type){?>disabled<?php }?>/></td>
						</tr>
						<tr>
							<td colspan="2">标题 <input type="text" class="textBorder"  style="width:470px"   name="atc_title" id="J_atc_title" value="<?php echo htmlspecialchars($atc_title, ENT_QUOTES, 'UTF-8');?>" class="input length_6 mr15"<?php echo htmlspecialchars(!empty($isTopic) ? ' required' : '', ENT_QUOTES, 'UTF-8');?> aria-required="true" placeholder="<?php echo htmlspecialchars(!empty($default_title) ? $default_title : '请输入标题', ENT_QUOTES, 'UTF-8');?>" title="请输入标题" data-max="<?php echo htmlspecialchars(Wekit::C('bbs', 'title.length.max'), ENT_QUOTES, 'UTF-8');?>"/><span id="J_title_tip"></td>
						</tr>
						<?php if($t_type=='tw' || !$t_type){?>
						<tr>
							<td colspan="2">悬赏:<input type="text"   class="textBorder"  style="width:40px"  name="jf" id="jf"   <?php if($jf){?>value="<?php echo htmlspecialchars($jf, ENT_QUOTES, 'UTF-8');?>"  disabled<?php }else{?>value="2" <?php }?>>&nbsp;积分.当前可用分:<?php echo htmlspecialchars($jfa, ENT_QUOTES, 'UTF-8');?></td>
						</tr>
						<?php }?>
						<tr>
							<td colspan="2">
					<?php
PwHook::display(array($pwpost, "runDo"), array('createHtmlBeforeContent'), "", $__viewer);
?>
				<div class="c"></div>
				<div class="cc mb10">
					<div class="cm"  style="width:568px;">
						<div class="cw"  style="width:568px;">
							<?php  //$pwpost->displayHtmlFromBeforeContent(); 
 include("/var/www/html/data/compile/template/default/bbs/wind_editor.tpl"); ?>
						</div>
					</div>
				</div>
				<input type="hidden" value="<?php echo htmlspecialchars($pid, ENT_QUOTES, 'UTF-8');?>" name="pid" />
				<input type="hidden" value="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>" name="tid" />
				<input type="hidden" value="<?php echo htmlspecialchars($special, ENT_QUOTES, 'UTF-8');?>" name="special" />
				<div class="ft cc">
					<button type="submit" name="Submit" class="btn btn_submit btn_big fl mr10" id="J_post_sub">发布</button>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=draft&a=doAdd'; ?>" class="btn btn_big mr10" id="J_draftBtn">存为草稿</a>
					<a id="J_draft_lis_btn" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=draft&a=myDrafts'; ?>" class="my_drafts">草稿箱<span class="red" style="<?php  if (!$draftCount) { ?>display:none;<?php  } ?>">(<em id="J_draft_count"><?php echo htmlspecialchars($draftCount, ENT_QUOTES, 'UTF-8');?></em>)</span></a>
					<label for="reply_notice_label"><input name="reply_notice" id="reply_notice_label" type="checkbox" value="1" <?php echo htmlspecialchars($reply_notice, ENT_QUOTES, 'UTF-8');?> />有回复提醒我</label>
				</div>
						<!-- 	
							<textarea onfocus="if(this.value=='问题描述...') {this.value='';}this.style.color='#555';" onblur="if(this.value=='') {this.value='问题描述...';this.style.color='#555';}" style="width:560px; color:#555;height:400px;"" rows="20"    class="textBorder">问题描述...</textarea></td>
						-->
						</tr>
					</table>
		 		</div>
			</div>
		</div>
	</div><!--中间结束-->
		</div>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
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
<!--结束-->
<script>
Wind.use('jquery', 'global', 'ajaxForm', 'dialog', function() {
	$("#J_atc_title").focus();
	//主题分类
<?php  if ($topictypes['topic_types']) { ?>

	var CURRENT_TOPIC_TYPE = parseInt('<?php echo htmlspecialchars($defaultTopicType, ENT_QUOTES, 'UTF-8');?>'),					//默认主题分类
			PARENT_TOPIC_TYPE = parseInt('<?php echo htmlspecialchars($defaultParentTopicType, ENT_QUOTES, 'UTF-8');?>'),		//默认二级父主题分类
			SORT_CONFIG = $.parseJSON('<?php echo $subTopicTypesJson;?>');				//分类数据

	var sort_1 = $('#J_sort_1'), sort_2 = $('#J_sort_2');

	//选择当前主题分类
	if(PARENT_TOPIC_TYPE) {
		//二级主题
		sort_1.val(PARENT_TOPIC_TYPE);
		sortSelect(PARENT_TOPIC_TYPE, CURRENT_TOPIC_TYPE);
	}else if(!PARENT_TOPIC_TYPE && CURRENT_TOPIC_TYPE) {
		//只有一级
		sort_1.val(CURRENT_TOPIC_TYPE);
		sortSelect(CURRENT_TOPIC_TYPE);
	}

	sort_1.on('change', function(){
			sortSelect($(this).val());
	});

	//切换下拉
	function sortSelect(s1, s2){
		var data = SORT_CONFIG[s1], //二级分类对象
				arr = [];

		if(data) {
			//存在二级分类
				//arr.push('<option value="0">请选择分类</option>');
			$.each(data, function(i, o){
				arr.push('<option value="'+ i +'">'+ o +'</option>');
			});
			sort_2.html(arr.join('')).show();

			if(s2) {
				//选中第二级分类
				sort_2.val(s2);
			}
		}else{
			//不存在二级分类
			sort_2.hide().empty();
		}
	}
<?php  } ?>
	//主题分类结束

	//点击热门标签
	$('#J_hot_tag a').on('click', function(e){
		e.preventDefault();
		var $this = $(this),
			text = $this.text();

		//不可点
		if($this.parent().hasClass('disabled')) {
			return false;
		}

		//判断是否已经添加
		if(!$('ul.J_user_tag_ul input[value="'+ text +'"]').length) {
			$('ul.J_user_tag_ul').append('<li><a><span class="J_tag_name">'+ text +'</span><del class="J_user_tag_del" title="'+ text +'">×</del><input type="hidden" name="tagnames[]" value="'+ text +'"></a></li>');
		}
		$this.parent().addClass('disabled');
	});

	//删除标签后，修改热门标签状态
	$('ul.J_user_tag_ul').on('click', '.J_user_tag_del', function(e){
		$('#J_hot_tag > li[title="'+ $(this).attr('title') +'"]').removeClass('disabled');
	});


	var title = $('#J_atc_title'),
		content_editor = $('#J_wind_editor'),
		title_tip = $('#J_title_tip');

	<?php  if ($action == 'reply') { ?>
	//编辑页 后端不验证标题空 ie拿掉placeholder
	/*if($.browser.msie) {
		title.removeAttr('placeholder');
	}*/
	<?php  } ?>

	//标题字数统计
	;(function(title,title_tip) {
		var inputEvent = function() {
			var length = $.trim(title.val().length);
			var max = title.data('max');
			if(length > max) {
				title_tip.html('最多' + max + '个字，已经超出<span style="color:red;font-weight:bold;">'+ (length - max) +'</span>个字');
			}else {
				title_tip.html('');
			}
		}
		var title_0 = title[0];
		if($.browser.version == '9.0'){//IE9对下面两个事件支持有缺陷
			setInterval(function(){
				inputEvent();
			}, 64);
		}else if('oninput' in title_0){
			title.on('input',inputEvent);
		}else{//IE6/7/8
			title[0].onpropertychange = function() {
				if (window.event.propertyName == "value"){
					var $this = $(this);
					//处理placeholder的问题
					if($this.attr("placeholder") == $this.val()){
						return false;
					}
					inputEvent();
				}
			}
		}
	})(title,title_tip);

	//草稿
	;(function() {
		var draft_count = $('#J_draft_count'),		//草稿数
			draft_wrap = $('#J_draft_wrap'),		//列表内容
			draft_loaded = false;
		var  vender=$.trim($("#t_vender").val());
		var  vtype = $.trim($("#t_vtype").val());
		
		//存为草稿
		$('#J_draftBtn').on('click',function(e) {
			e.preventDefault();
			var $this = $(this),
				windeditor = content_editor.data('windeditor'),
				title_v = title.val(),
				//没有编辑器直接取textarea的值，目前没有做自动同步，需要用getValue获取编辑器的值
				content = windeditor ? windeditor.getValue() : content_editor.val();
			if(!$.trim(title_v) || !$.trim(content)) {
				Wind.Util.resultTip({
					follow : $this,
					error : true,
					msg : '帖子标题或内容不能为空'
				});
				return false;
			}
			
			$.post(this.href, {'atc_title':title_v,'atc_content':content,'vender':vender,'vtype':vtype}, function(data){
				if(data.state === 'success') {
					Wind.Util.resultTip({
						elem : $this,
						follow : true,
						msg : '保存成功'
					});
					draft_loaded = false;

					//+1
					draft_count.text(parseInt(draft_count.text())+1).parent().show();

					//清空
					draft_wrap.html('<div class="pop_loading"></div>');
				}else if(data.state === 'fail') {
					Wind.Util.resultTip({
						error : true,
						elem : $this,
						follow : true,
						msg : data.message
					});
				}
			}, 'json');
		});

		//获取草稿列表
		var draft_list_btn = $('#J_draft_lis_btn'),
			draft_list = $('#J_draft_list'),
			content_cache = {};

		draft_list_btn.on('click', function(e){
			e.preventDefault();
			var $this = $(this);

			draft_list.toggleClass('dn');
			draft_list_btn.toggleClass('up_current');

			if(!draft_loaded && draft_list_btn.hasClass('up_current')) {
				draft_loaded = true;
				//未请求数据
				var li_arr= [];
				$.getJSON($this.attr('href'), function(data){
					if(data.state === 'success') {
						if(!data.data.length) {
							draft_wrap.html('<div class="not_content_mini"><i></i>啊哦，草稿箱暂没有任何内容哦！</div>');
							return;
						}

						$.each(data.data, function(i, o){
							li_arr.push('<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=draft&a=doDelete&id='; ?>'+o.id+'" class="pop_close J_draft_del" title="删除草稿">[删除]</a><a href="" data-id="'+ o.id +'" class="insert J_draft_insert" title="载入草稿">[载入]</a><span class="J_draft_title">'+ o.title +'</span><span>'+ o.created_time +'</span></li>');

							//存入内容
							content_cache[o.id] = o.content;
							draft_list_btn.addClass('up_current');
						});
						draft_wrap.html('<ul>'+ li_arr.join('')+ '</ul>');

					}else if(data.state === 'fail'){
						Wind.Util.resultTip({
							error : true,
							msg : data.message
						});
						draft_loaded = false;
					}
				});

			}
		}).on('blur', function(){
			//失焦隐藏
			if(!h_lock) {
				draft_list.addClass('dn');
				draft_list_btn.removeClass('up_current');
			}
		});

		//聚焦判定
		var h_lock = false;
		draft_list.on('mouseenter', function(){
			h_lock = true;
		}).on('mouseleave', function(){
			draft_list_btn.focus();
			h_lock = false;
		});


		draft_list.on('click', 'a.J_draft_del', function(e){
			//删除草稿
			e.preventDefault();
			var $this = $(this);

			Wind.dialog({
				message : '确定删除该草稿内容？',
				type : 'confirm',
				isMask : false,
				follow : $this, //跟随触发事件的元素显示
				onOk : function () {
					$.getJSON($this.attr('href'), function(data){
						if(data.state === 'success') {
							$this.parent('li').remove();
							
							var c = parseInt(draft_count.text());
							draft_count.text(c-1);
							if(c <= 1) {
								draft_wrap.html('<div class="not_content_mini"><i></i>啊哦，草稿箱暂没有任何内容哦！</div>');
							}
						}else if(data.state === 'fail'){
							//global.js
							Wind.Util.resultTip({
								error : true,
								msg : data.message
							});
						}
					});
				}
			});
		}).on('click', 'a.J_draft_insert', function(e){
			//载入草稿
			e.preventDefault();
			var $this = $(this);
			Wind.dialog({
				message : '载入草稿内容将会覆盖当前内容，确定载入？',
				type : 'confirm',
				isMask : false,
				follow : $this, //跟随触发事件的元素显示
				onOk : function () {
					windeditor = content_editor.data('windeditor');		//编辑器对象
					title.val($this.siblings('.J_draft_title').text());					//写入标题
					windeditor.setContent(content_cache[$this.data('id')]);	//写入内容
				}
			});
		}).on('click', '.J_draft_title', function(e){
			//点击标题
			$(this).siblings('a.J_draft_insert').click();
		});
	})();


//切换发帖类型选项卡
$("#tabTypeHead").on('click', 'li:not(.current)', function(){
	window.onbeforeunload = $.noop;
	var title = $('#J_atc_title');
	var content = $('#J_wind_editor');
	var editor = content.data('windeditor');
	editor && editor.saveContent();
	var atc_title = $.trim(title.val());
    var atc_content = $.trim(content.val());

	
    if (atc_title != "" || (atc_content != "" && atc_content != "<br>")) {
		if(confirm('确认离开并放弃此页面内容?')){
			editor && editor.clear_local_data();
		}else{
			return false;
		}
	}else{
		editor && editor.clear_local_data();
	}
});

var forceTopic = '<?php echo htmlspecialchars($forceTopic, ENT_QUOTES, 'UTF-8');?>';//是否强制主题分类，1强制
/*
 * 提交
*/
	var word_tpl = '<div class="pop_sensitive">\
			<div class="pop_top J_drag_handle">\
				<a href="#" class="pop_close J_close">关闭</a>\
				<strong>提示</strong>\
			</div><div class="pop_cont">\
				<div class="not_content_mini" id="J_word_tip"></div>\
			</div>\
			<div class="pop_bottom" id="J_word_bototm"></div>\
			</div>',
			needcheck = ('<?php echo htmlspecialchars($needcheck, ENT_QUOTES, 'UTF-8');?>' == '1') ? true : false,		//是否审核
			post_btn =  $('#J_post_sub');							//提交按钮

	//点击发布
	$('#mainForm').on('submit', function(e){
		
		e.preventDefault();
		var vd= $("#t_vender");
		var vt= $("#t_vtype");
		var jf= $("#jf");
		var  vender=$.trim($("#t_vender").val());
		var  vtype = $.trim($("#t_vtype").val());
		
		var titleInput = $("#J_atc_title"),
			rx_tit = titleInput.val().replace(/\s*/g, '');
		var contentTextarea = $("#J_wind_editor"),
			editor = contentTextarea.data('windeditor');

	
		//校验标题和内容是否为空,发新帖时才校验
		if(POST_TYPE === Post_Type_Enum.NEW_POST && (rx_tit === ''|| contentTextarea.val().replace(/\s*/g, '') === '')){
			Wind.Util.resultTip({
				error : true,
				msg : '帖子标题或内容不能为空',
				follow : post_btn,
				callback: function(){
					if(!rx_tit) {
						titleInput.focus();
					}else{
						//editor.setFocus($(editor.editorDoc.body));
					}
				}
			});
			return;
		}
		
		//判断器件或者厂家是否为空
		if(vender=="" || vtype==""){
			Wind.Util.resultTip({
				error : true,
				msg : '厂家或器件不能为空',
				follow : post_btn,
				callback: function(){
					if(vender==""){
						vd.focus();
					}else{
						vt.focus();
					}
				}
			});
				return;
		}
		
	

	
		//针对不支持placeholder的浏览器优化处理
		if(document.createElement('input').placeholder !== '' && POST_TYPE === Post_Type_Enum.NEW_POST){
			if(titleInput.val() === titleInput.attr("placeholder")){
				Wind.Util.resultTip({
	 						error : true,
	 						msg : '帖子标题不能为空',
	 						follow : post_btn
	 					});
				return;
			}
		}
		
		//检查强制分类
		if(forceTopic == 1){
			var needPop = false;//是否需要弹窗显示分类
			var topicSelects = $('.post_page .title').find('select');
			topicSelects.each(function(i, item){
				var option = $(item).find('option:selected');
				//console.log(option.text(), $(item).val())
				if($(item).val() == 0){
					needPop = true;
				}
			});
			if(needPop === true){
				//如果满足条件，调用弹窗显示分类
				Wind.js(GV.JS_ROOT + 'pages/bbs/topicType.js?v=' + GV.JS_VERSION, function(){
					var url = GV.URL.TOPIC_TYPIC;
					var fid = '<?php echo htmlspecialchars($fid, ENT_QUOTES, 'UTF-8');?>';
					var topic = new ShowTopicPop({url: url, fid: fid, callback: function(data){
							if(data){
								needPop = false;
								$(data).each(function(i, item){
									if(i === 0){
										$("#J_sort_1").val(item.val);
										sortSelect(item.val);//调用页面里面的联动方法
									}
									if(i === 1){
										$("#J_sort_2").val(item.val);
									}
								});
								post_btn.click();
							}
						}});
						topic.init();
				});
				return false;
			}
		}
		//是否要审核
		if(needcheck) {
			Wind.dialog({
	 			message : '本版块内容需要管理员审核后才能正常显示！',
				type : 'confirm',
				isMask : false,
				okText : '发布',
				onOk : function () {
					needcheck = false;
					postSubmit();
				}
	 		});
		}else{
			//fix IE9 bug 包括 IE9兼容模式下的IE9文档模式，虽然version是7.0，但是和9.0一样
			if($.browser.msie){
				var form = $('#mainForm')[0];
				for(var i=0, len = form.elements.length; i< len; i++){
					var item = form.elements[i];
					if(item && item.type == 'application/x-shockwave-flash'){
						item.parentElement.removeChild(item);
					}
				}
			}

			postSubmit();
		}

	});

	var verify = false;
	<?php if ($hasVerifyCode) {?>
		//开启验证码
		verify = true;
	<?php }?>

	//帖子发布 ajax
	function postSubmit(){
		
		if(verify && Wind.Util.showVerifyPop(post_btn)) {
			//提交前验证码判断 未通过
			return false;
		}

		$('#mainForm').ajaxSubmit({
	 		dataType : 'json',
	 		beforeSerialize:function() {
	 			//同步编辑器的内容到textarea中
	 			//!TODO:编辑器组件里自动同步
	 			//content_editor.data('windeditor').saveContent();
	 		},
	 		beforeSubmit : function(data) {
	 		
			
	 			var title_tip = $('#J_atc_title');
				
	 			var max = parseInt(title_tip.data('max'));
	 			if($.trim(title_tip.val()).length > max) {
	 				title_tip.focus();
	 			}
	 				
	 			//global.js
	 			Wind.Util.ajaxBtnDisable(post_btn);
	 		},
		
	 		success : function(data, statusText, xhr, $form) {
			
	 			if(!data || !data.state){
	 				Wind.Util.resultTip({
	 						error : true,
	 						msg : '系统出错',
	 						follow : post_btn
	 					});
	 				return;
	 			}
			
	 			if(data.state == 'success') {
			
	 				//提交时页面跳转会触发onbeforeunload
	 				window.onbeforeunload = $.noop;
	 				//清除编辑器草稿
	 				content_editor.data('windeditor').clear_local_data();
	 				if(data.referer) {
	 					setTimeout(function(){
	 						location.href = data.referer;
	 					}, 10);
	 				}
	 			}else if(data.state == 'fail') {
	 				//global.js
	 				Wind.Util.ajaxBtnEnable(post_btn);
	 				var _data = data.data;
					
	 				if(_data) {

	 					if(_data.isVerified) {
	 						//审核
	 						Wind.dialog.html(word_tpl, {
	 							id : 'J_word_wrap',
	 							callback : function(){
	 								$('#J_word_tip').html(data.message +'<br>是否继续发布？');
	 								$('#J_word_bototm').html('<button type="button" id="J_word_change" class="btn btn_submit mr10">马上修改</button><button type="button" class="btn" id="J_word_subdirect">直接发布</button>');

	 								//马上修改
	 								wordCallback();
								
	 								//马上发布
	 								$('#J_word_subdirect').on('click', function(e){
									
	 									e.preventDefault();
	 									//增加action 参数
	 									$form[0].action = $form[0].action+'&verifiedWord=1';

	 									postSubmit();
	 									Wind.dialog.closeAll();
	 								});
	 							}
	 						});
	 					}
	 				}else{
	 					Wind.Util.resultTip({
	 						error : true,
	 						msg : data.message,
	 						follow : post_btn
	 					});
	 				}

		 		}
	 		}
		});
	}


	//敏感词回调
	function wordCallback(text){
		Wind.use('draggable', function(){
 			$('#J_word_wrap').draggable( { handle : '.J_drag_handle'} );
 		});

		//敏感词修改聚焦
		$('#J_word_change').on('click', function(e) {
 			e.preventDefault();
 			Wind.dialog.closeAll();

 			$('iframe.wind_editor_iframe')[0].contentWindow.document.body.focus();
 		});

	}

	<?php  if ($special == 'poll') { ?>
	//投票帖
	Wind.js(GV.JS_ROOT + 'pages/bbs/postVote.js?v=' + GV.JS_VERSION)
	<?php  } ?>

});
</script>
</body>
</html>