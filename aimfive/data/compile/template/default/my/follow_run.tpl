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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/fans.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
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
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_1"), "runDo"), array(), "", $__viewer);
?>
		<a   href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>"  class="username" title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,12), ENT_QUOTES, 'UTF-8');?><em ></em></a>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_2"), "runDo"), array(), "", $__viewer);
?>
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
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=avatar&_left=avatar'; ?>"><em class="icon_profile"></em>设置</a>
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
		<div class="bread_crumb">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'); ?>" class="home" title="<?php echo Wekit::C("site", "info.name"); ?>">首页</a><em>&gt;</em>
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>">我关注的人</a><?php if($type){?><em>&gt;</em><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&type=', rawurlencode($type); ?>"><?php echo htmlspecialchars($typeArr[$type], ENT_QUOTES, 'UTF-8');?></a><?php }?>
		</div>
		<div class="maina cc">
			<div class="main_body">
				<div class="main_content cc">
					<div class="box_wrap fans_page">			
						<nav>
<div class="content_nav">
	<ul>
		<li class="<?php echo Pw::isCurrent($li == 'follow');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>">我关注的人</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'fans');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=fans'; ?>">我的粉丝</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'invite');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=invite'; ?>">邀请好友</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'friend');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=friend'; ?>">找人</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'visitor');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=visitor'; ?>">访问脚印</a></li>
	</ul>
</div>
</nav>
						<div class="content_type">
							<ul class="cc">
								<li class="<?php echo htmlspecialchars($classCurrent[0], ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>">全部</a></li>
								<?php  foreach ($typeArr as $key => $value) { ?>
								<li class="line"></li><li class="<?php echo htmlspecialchars($classCurrent[$key], ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&type=', rawurlencode($key); ?>"><?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?></a></li>
								<?php  } ?>
							</ul>
						</div>
						<?php  if ($follows) { ?>
						<div class="fans_list">
							<?php  foreach ($follows as $key => $value) { 
								$birthday = $value['byear'] ? '生日：' . $value['byear'] . '年'.$value['bmonth'].'月'.$value['bday'].'日' : '';
								$profile = $value['profile'] ? '  自我介绍：'.$value['profile'] : '';
							?>
							<div class="fr">
								<div id="J_group_check_list_<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" data-id="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="sort_down J_group_check_list" style="display:none;">
									<ul></ul>
									<a href="" class="add J_group_creat_show" data-id="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>">创建新分组</a>
								</div>
							</div>
							<dl class="cc J_friends_items">
								<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['touid']); ?>" data-uid="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="J_user_card_show"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['touid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=message&c=message&a=pop&username=', rawurlencode($value['username']); ?>" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" class="called J_send_msg_pop">打招呼</a></dt>
								<dd>
									<div class="title">
										<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['touid']); ?>" data-uid="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="name J_user_card_show"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a>
										<?php  $gender = $value['gender'] == 1 ? 'women' : 'man';
											$online = Pw::checkOnline($value['lastvisit']) ? 'ol' : 'unol';
										 ?>
										<span class="<?php echo htmlspecialchars($gender, ENT_QUOTES, 'UTF-8');?>_<?php echo htmlspecialchars($online, ENT_QUOTES, 'UTF-8');?>"></span>
									</div>
									<div class="num">
										关注<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=follows&uid=', rawurlencode($value['touid']); ?>"><?php echo htmlspecialchars($value['follows'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>粉丝<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=fans&uid=', rawurlencode($value['touid']); ?>"><?php echo htmlspecialchars($value['fans'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>帖子<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&c=thread&uid=', rawurlencode($value['touid']); ?>"><?php echo htmlspecialchars($value['postnum'], ENT_QUOTES, 'UTF-8');?></a>
									</div>
									<div class="action"><?php echo htmlspecialchars($birthday, ENT_QUOTES, 'UTF-8');?></div>
									<div class="action"><?php echo htmlspecialchars($profile, ENT_QUOTES, 'UTF-8');?> </div>
									<div class="sort">
										<a href="" id="J_group_trigger_<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="J_group_trigger" data-id="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>">
										<?php  
											if ($userType[$value['touid']]) {
												$userTypeNames = implode(',',$userType[$value['touid']]);
											} else {
												$userTypeNames = '未分组';
											}
										 ?>
										<span class="J_group_names" title="<?php echo htmlspecialchars($userTypeNames, ENT_QUOTES, 'UTF-8');?>"><?php  if ($userType[$value['touid']]) { 
 echo htmlspecialchars(FollowController::bulidGroup($userType[$value['touid']]), ENT_QUOTES, 'UTF-8');
  } else { ?>未分组<?php  } ?></span><em class="core_arrow"></em></a>
									</div>
									<div class="attribute">
										<?php  if (isset($fans[$value['touid']])) { ?><span class="mnfollow" title="互相关注">互相关注</span><?php  } ?>
										<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=delete&uid=', rawurlencode($value['touid']); ?>" class="core_unfollow J_unfollow_btn J_friends_unfollow" style="display:none;">取消关注</a>
									</div>
								</dd>
							</dl>
							<?php  } ?>
							<div class=""><?php $__tplPageCount=(int)$count;
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
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?></div>
						</div>
						<?php  } elseif ($recommend) { ?>
						<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=batchadd'; ?>" method="post" id="J_nofollow_form">
<!--无关注人时-->
						<div class="nofollow_list J_check_wrap">
							<div class="hd">啊哦，你还没有关注任何人，赶紧先关注些人！</div>
							<ul class="cc">
								<?php  foreach ($recommend as $value) { ?>
								<li><a data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" class="J_user_card_show" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'middle'), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="90" height="90" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a><label title="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>"><input class="J_check" type="checkbox" name="uids[]" value="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></label></li>
								<?php  } ?>
							</ul>
							<div class="ft">
								<button type="submit" class="btn btn_big btn_submit disabled" disabled="true" id="J_nofollow_btn"><span class="add"></span>关注</button>
								<label class="w"><input class="J_check_all" type="checkbox">全选</label>
							</div>
						</div>
<!--无关注人时结束-->	
						<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
						<?php  } else { ?>
						<div class="nofollow_list J_check_wrap">
							<div class="hd">啊哦，该分组还没有关注的人，试试将关注的人添加到该分组！</div>

						</div>
						<?php  } ?>
					</div>
				</div>
			</div>
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
<?php  } ?>

<pw-drag id="sidebar_1" />
<!-- 
<?php  if ($loginUser->isExists()) { ?>
	<div class="box_wrap">
		<h2 class="box_title J_sidebar_box_toggle">我的应用</h2>
		<div class="my_app_list">
			<ul>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=vote&c=my'; ?>"><span class="icon_vote"></span>投票</a></li>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=like&c=mylike'; ?>"><span class="icon_like"></span>喜欢</a></li>
				<?php  if (Wekit::C('site','medal.isopen')){ ?>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=medal'; ?>"><span class="icon_medal"></span>勋章</a></li>
				<?php }
 if (1 == Wekit::C('site', 'task.isOpen')) {?>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=task'; ?>"><span class="icon_task"></span>任务</a></li>
				<?php }?>
			</ul>
		</div>
	</div>
<?php  } ?>
 -->
<!--advertisement id='Site.Sider.User' sys='1'/-->
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
<pw-drag id="sidebar_thread" />
 
				<?php  if ($follows) { ?>
				<div class="box_wrap">
					<h2 class="box_title">我关注的人</h2>
					<div class="side_cate_list">
						<ul id="J_side_group_list" class="cc">
							<li>
								<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>" class="title"><span class="">全部</span><em>(<?php echo htmlspecialchars($loginUser->info['follows'], ENT_QUOTES, 'UTF-8');?>)</em></a>
							</li>
							<?php  foreach ($typeArr as $key => $value) { ?>
							<li id="J_side_group_<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>">
								<?php  if ($key > 0) { ?>
								<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=deleteType&id=', rawurlencode($key); ?>" class="icon_del J_group_del" data-id="<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>">删除</a>
								<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=editType&id=', rawurlencode($key); ?>" class="icon_edit J_group_edit" data-id="<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>" data-name="<?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?>">编辑</a>
								<?php  } ?>
								<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&type=', rawurlencode($key); ?>" class="title"><span class="J_name"><?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?></span><em>(<?php  echo isset($typeCounts[$key]) ? $typeCounts[$key]['count'] : 0; ?>)</em></a>
							</li>
							<?php  } ?>
						</ul>
						<a href="" class="add" id="J_creat_group_side">创建新分组</a>
					</div>
				</div>
				<?php  } ?>
			</div>
		</div>
	</div>
<ul style="display:none;" id="J_group_check_ul">
	<?php  foreach ($typeArr as $k => $v) { ?>
	<li><label><input class="J_group_name" type="checkbox" data-id="<?php echo htmlspecialchars($k, ENT_QUOTES, 'UTF-8');?>" data-value="<?php echo htmlspecialchars($v, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v, ENT_QUOTES, 'UTF-8');?></label></li>
	<?php  } ?>
</ul>
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
var GRROUP_DATA = '<?php echo WindJson::encode(FollowController::bulidUserType($userType), 'UTF-8');?>';

Wind.use('jquery', 'global', 'ajaxForm', 'dialog', function(){
<?php  if ($follows) { ?>
	//有关注
	Wind.js(GV.JS_ROOT +'pages/my/fansFollow.js?v='+ GV.JS_VERSION);
/*
 * 取消关注，删除行
*/
	var f_lock = false;
	$('a.J_friends_unfollow').on('click', function(e){
		e.preventDefault();
		var $this = $(this);

		//锁定
		if(f_lock) {
			return false;
		}
		f_lock = true;

		$.post($this.attr('href'), function(data){
			f_lock = false;
			if(data.state == 'success') {
				$this.parents('dl').slideUp(function(){
					$(this).remove();

					//删完了
					if(!$('.J_friends_items').length) {
						location.reload();
					}
				});
			}else if(data.state == 'fail'){
				//global.js
				Wind.Util.resultTip({
					error : true,
					msg : data.message,
					follow : $this
				});
			}
		}, 'json');
	});

	$('#J_group_check_ul').data({
		'saveList' : function(elem, type, id){
			//保存分组
			Wind.Util.ajaxMaskShow();
			$.post("<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=savetype'; ?>", {
				uid : elem.data('id'),
				id : id,
				type : (type ? 1 : 0)
			}, function(data){
				Wind.Util.ajaxMaskRemove();
				if(data.state === 'success') {

				}else if(data.state === 'fail') {
					Wind.Util.resultTip({
						error : true,
						follow : elem,
						msg : data.message
					});
				}
			}, 'json');
		},
		'saveCreat' : function(btn){
			//保存创建
			var creat_wrap = $('#J_group_creat_wrap');
			$.post("<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=addtype'; ?>", { name : $('#J_group_creat_input').val() }, function(data){
				if(data.state === 'success') {
					var _data = data.data;
					creat_wrap.remove();
					btn.show();
					
					//所有列表写入新创建分组
					var list = $('div.J_group_check_list > ul');
					list.append('<li><label><input type="checkbox" data-id="'+ _data.id +'" data-value="'+ _data.name +'" class="J_group_name">'+ _data.name +'</label></li>');
					
					//选中新创建的
					var cur_list = btn.parents('.J_group_check_list');
					cur_list.find('ul > li:last input:checkbox').prop('checked', true);
					//保存列表
					$('#J_group_check_ul').data('saveList')($('#J_group_trigger_'+cur_list.data('id')), 1, _data.id);

					var newest = cur_list.find('ul > li:last input:checkbox');
					newest.prop('checked', true);
					//checkListGroup.js
					setGroupNames(newest);

					//右侧栏写入新分组
					$('#J_side_group_list').append('<li id="J_side_group_'+ _data.id +'"><a class="icon_del J_group_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=deleteType'; ?>&id='+ _data.id +'" data-id="'+ _data.id +'">删除</a><a data-name="'+ _data.name +'" data-id="'+ _data.id +'" class="icon_edit J_group_edit" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=follow&c=editType&a=%29'; ?>&id='+ _data.id +'">编辑</a><a class="title" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>&type='+ _data.id +'"><span class="J_name">'+ _data.name +'</span><em>(0)</em></a></li>');

				}else if(data.state === 'fail'){
					Wind.Util.resultTip({
						error : true,
						follow : creat_wrap,
						msg : data.message
					});
				}
			}, 'json');
		}
	});

	$('#J_side_group_list').data({
		save : function(elem, url){
			var group_edit_input = $('#J_group_edit_input'),
				id = elem.data('id');
			$.post(url, {
				id : elem.data('id'),
				name : elem.val()
			}, function(data){
				if(data.state === 'success') {
					var _data = data.data,
						li = $('#J_side_group_'+ id);
					if(li.length) {
						//编辑
						li.find('.J_name').text(_data.name);
						li.find('.J_group_edit').data('name', _data.name);
					}else{
						//所有列表写入新创建分组
						var list = $('div.J_group_check_list > ul');
						list.append('<li><label><input type="checkbox" data-id="'+ _data.id +'" data-value="'+ _data.name +'" class="J_group_name">'+ _data.name +'</label></li>');

						//右侧栏写入新分组
						$('#J_side_group_list').append('<li id="J_side_group_'+ _data.id +'"><a class="icon_del J_group_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=deleteType'; ?>&id='+ _data.id +'" data-id="'+ _data.id +'">删除</a><a data-name="'+ _data.name +'" data-id="'+ _data.id +'" class="icon_edit J_group_edit" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=follow&c=editType&a=%29'; ?>&id='+ _data.id +'">编辑</a><a class="title" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow'; ?>&type='+ _data.id +'"><span class="J_name">'+ _data.name +'</span><em>(0)</em></a></li>');
					}

					var group_edit_wrap = $('#J_group_edit_wrap');
					group_edit_wrap.siblings('li:hidden').show();
					$('#J_creat_group_side').show();
					group_edit_wrap.remove();
				}else if(data.state === 'fail'){
					Wind.Util.resultTip({
						error : true,
						elem : elem,
						follow : true,
						msg : data.message
					});
				}
			}, 'json');
		},
		creatsave :  '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=addtype'; ?>',
		editsave : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=follow&a=editType'; ?>',
		deltip : '确定要删除该分组吗？<br><span class="gray">此分组下的人不会被取消关注</span>'
	});
	Wind.js(GV.JS_ROOT +'pages/common/checkListGroup.js?v='+ GV.JS_VERSION);
	
<?php  } else { ?>
	/*
	 * 无关注
	*/
	var nofollow_btn = $('#J_nofollow_btn');
	$('input:checkbox').prop('checked', false);
	//复选框
	$('input.J_check_all').on('change', function(){
		if(this.checked) {
			nofollow_btn.prop('disabled', false).removeClass('disabled');
		}else{
			nofollow_btn.prop('disabled', true).addClass('disabled');
		}
	});

	var checks = $('input.J_check');

	checks.on('change', function(){
		if (checks.filter(':checked').length > 0) {
			nofollow_btn.prop('disabled', false).removeClass('disabled');
		}else{
			nofollow_btn.prop('disabled', true).addClass('disabled');
		}
	});

	$('#J_nofollow_form').ajaxForm({
		dataType : 'json',
		beforeSubmit : function(){
			//global.js
			Wind.Util.ajaxBtnDisable(nofollow_btn);
		},
		success : function(data){
			if(data.state == 'success') {
				location.reload();
			}else if(data.state == 'fail'){
				Wind.Util.ajaxBtnEnable(nofollow_btn, false);
				Wind.Util.resultTip({
					error : true,
					follow : nofollow_btn,
					msg : data.message
				});
			}
		}
	});
	


<?php  } ?>

	

});
</script>
</body>
</html>