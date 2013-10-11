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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/css'.Wekit::getGlobal('theme','debug'); ?>/style.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
</head>
<style>
.job1 {height:40px; ling-height:40px;}
</style>
<body <?php echo $space->space['backbround'];?>>
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
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.wav" type="audio/wav" />
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.mp3" type="audio/mp3" />
		<div style='overflow:hidden;width:0;float:left'><embed src='<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.wav' width='0' height='0' AutoStart='true' type='application/x-mplayer2'></embed></div>
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
		<div class="main cc">
			<div class="main_sidebar">
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
		<div class="space_content" style="width:780px">
			<div >
				<div class="space_profile">
					<h3>
						<?php  if ($space->tome == 2){ ?>
						<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&_tab=profile'; ?>" class="edit">编辑</a>
						<?php  } ?>
						<strong>基本资料</strong>
					</h3>
					<dl class="cc">
						<dt>头像:</dt>
						<dd><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($space->spaceUid,'big'), ENT_QUOTES, 'UTF-8');?>" data-type="big" width="180" height="180" /></dd>
					</dl>
					<dl class="cc">
						<dt>姓名</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['realname'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<dl class="cc">
						<dt>性别</dt>
						<dd><?php if($space->spaceUser['gender']==1){?>女<?php }else{?>男<?php }?></dd>
					</dl>
					<?php  if ($space->allowView('constellation')){ ?>
					<dl class="cc">
						<dt>出生日期</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['byear'], ENT_QUOTES, 'UTF-8');?>年<?php echo htmlspecialchars($space->spaceUser['bmonth'], ENT_QUOTES, 'UTF-8');?>月<?php echo htmlspecialchars($space->spaceUser['bday'], ENT_QUOTES, 'UTF-8');?>日</dd>
					</dl>
					<?php  } ?>	
					
					<dl class="cc">
						<dt>职位:</dt>
						<dd>
						<?php  if ($job['zhiwei']){ 
 echo htmlspecialchars($job['zhiwei'], ENT_QUOTES, 'UTF-8');
 }else{ ?>
						暂未填写
						<?php }?>
						</dd>
					</dl>
					
					<dl class="cc">
						<dt>工作单位</dt>
						<dd>
						<?php  if ($job['company']){ 
 echo htmlspecialchars($job['company'], ENT_QUOTES, 'UTF-8');
 }else{ ?>
						暂未填写
						<?php }?>
						</dd>
					</dl>
					<?php  if ($space->allowView('local')){ ?>
					<dl class="cc">
						<dt>现居住地</dt>
						<dd><?php echo htmlspecialchars($address, ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<?php  } 
  if ($space->allowView('nation')){ ?>
					<dl class="cc">
						<dt>家乡</dt>
						<dd><?php echo htmlspecialchars($home, ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<?php  } ?>
						<dl class="cc">
						<dt>个人主页:</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['homepage'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
						<dl class="cc">
						<dt>自我简介:</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['profile'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
						<dl class="cc">
						<dt>帖子签名:</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['bbs_sign'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>	
					<dl class="cc">
						<dt>注册日期</dt>
						<dd><?php echo htmlspecialchars(Pw::time2str($space->spaceUser['regdate'], 'Y年m月d日'), ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<dl class="cc">
						<dt>最后登录</dt>
						<dd><?php echo htmlspecialchars(Pw::time2str($space->spaceUser['lastvisit'], 'Y年m月d日'), ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
				</div>
			<?php  if ($space->allowView('aliwangwang') || $space->allowView('qq') || $space->allowView('msn') || $space->allowView('mobile')){ ?>
				<div class="space_profile">
					<h3>
					<?php  if ($space->tome == 2){?>
						<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&a=contact&_tab=contact'; ?>" class="edit">编辑</a>
					<?php  } ?>
						<strong>联系方式</strong>
					</h3>
					<dl class="cc">
						<dt>Email:</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['email'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<?php  if ($space->allowView('mobile')){ ?>
					<dl class="cc">
						<dt>手机号码</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['mobile'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<?php  } 
  if ($space->allowView('telphone')){ ?>
					<dl class="cc">
						<dt>固定电话:</dt>
						<dd><?php echo htmlspecialchars($space->spaceUser['telphone'], ENT_QUOTES, 'UTF-8');?></dd>
					</dl>
					<?php  } ?>	
				</div>
			<?php  } ?>	
			<!-- 
				<?php
PwHook::display(array(PwSimpleHook::getInstance("space_profile"), "runDo"), array($space), "", $__viewer);
?>
				 -->
			 	<?php if($jobAll){?>
 				 <div class="space_profile">
					<h3>
						<a href="?m=profile&c=work&_tab=work" class="edit">编辑</a>
						<strong>工作经历</strong>
					</h3>
					<table width="100%">
							<tr>
									<td width="30%">工作单位</td>
									<td width="30%">工作时间</td>
									<td width="10%" >职位</td>
									<td width="30%">项目经验</td>
							</tr>
						<?php foreach($jobAll as $k=>$v){?>
							<tr class="job1">
										<td><?php echo htmlspecialchars($v['company'], ENT_QUOTES, 'UTF-8');?></td>
										<td><?php echo htmlspecialchars($v['starty'], ENT_QUOTES, 'UTF-8');?>年<?php echo htmlspecialchars($v['startm'], ENT_QUOTES, 'UTF-8');?>月&nbsp;至&nbsp;
										<?php if($v['endy']==0 && $v['endm']==0){?>
										今
										<?php }else{
 echo htmlspecialchars($v['endy'], ENT_QUOTES, 'UTF-8');?>年<?php echo htmlspecialchars($v['endm'], ENT_QUOTES, 'UTF-8');?>月
										<?php }?>
										</td>
										<td><?php echo htmlspecialchars($v['zhiwei'], ENT_QUOTES, 'UTF-8');?></td>
										<td><?php echo htmlspecialchars($v['jingyan'], ENT_QUOTES, 'UTF-8');?></td>
							</tr>
						<?php }?>
					</table>
				</div>
				<?php }
 if($schoolAll){?>
 				 <div class="space_profile">
					<h3>
					<a href="?m=profile&c=education&_tab=education" class="edit">编辑</a>
						<strong>教育经历</strong>
					</h3>
					<table width="100%">
							<tr>
									<td width="15%">学历</td>
									<td width="35%">学校名称</td>
									<td width="15%" >入学年份</td>
									<td width="35%">专业</td>
							</tr>
						<?php foreach($schoolAll as $k=>$v){?>
							<tr class="job1">
										<td><?php echo htmlspecialchars($v['xueli'], ENT_QUOTES, 'UTF-8');?></td>
										<td><?php echo htmlspecialchars($v['name'], ENT_QUOTES, 'UTF-8');?></td>
										<td><?php echo htmlspecialchars($v['start_time'], ENT_QUOTES, 'UTF-8');?></td>
										<td><?php echo htmlspecialchars($v['major'], ENT_QUOTES, 'UTF-8');?></td>
							</tr>
						<?php }?>
					</table>
				</div>
				<?php }
 if($showTag){?>
 				 <div class="space_profile">
					<h3>
					<a href="?m=profile&c=tag&_tab=tag" class="edit">编辑</a>
						<strong>技术专长爱好</strong>
					</h3>
					<table width="100%">
							<tr>
									<td>我的标签:</td>
							</tr>
						
							<tr class="job1">
										<td><?php foreach($showTag as $k=>$v){?><span style="padding-left:5px;"><?php echo htmlspecialchars($v['name'], ENT_QUOTES, 'UTF-8');
 }?></span></td>
							</tr>
						
					</table>
				</div>
				<?php }?>
				 <div class="space_profile">
					<h3>
						<strong>账户信息</strong>
					</h3>
					<dl  class="cc">
						<dt style="width:auto">
						积分:<?php echo htmlspecialchars($space->spaceUser['credit2'], ENT_QUOTES, 'UTF-8');?>　
						功力:<?php echo htmlspecialchars($space->spaceUser['credit3'], ENT_QUOTES, 'UTF-8');?>　
						<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=thread&uid=', rawurlencode($space->spaceUid); ?>"><em>帖子:</em><span><?php echo htmlspecialchars($space->spaceUser['postnum'], ENT_QUOTES, 'UTF-8');?></span></a>　
						<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=fans&uid=', rawurlencode($space->spaceUid); ?>"><em>粉丝:</em><span><?php echo htmlspecialchars($space->spaceUser['fans'], ENT_QUOTES, 'UTF-8');?></span></a>　
						<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=follows&uid=', rawurlencode($space->spaceUid); ?>"><em>关注:</em><span><?php echo htmlspecialchars($space->spaceUser['follows'], ENT_QUOTES, 'UTF-8');?></span></a></dt>
					</dl>
				
				</div>
			</div>
			
		</div>
		</div>
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
<script>
//引入js组件
Wind.use('jquery', 'global', 'dialog', 'ajaxForm', 'tabs', 'draggable', 'uploadPreview', function(){
	Wind.js(GV.JS_ROOT +'pages/space/space_index.js?v='+ GV.JS_VERSION);
});
</script>
</body>
</html>