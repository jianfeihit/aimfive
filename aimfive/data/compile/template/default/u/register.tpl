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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/register.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<style>
.footerStyle {
    background: none repeat scroll 0 0 #010000;
    bottom: 0;
    color: #575556;
    font-size: 12px;
    left: 0;
	height:30px;
	line-height:30px;
    position: absolute;
    text-align: center;
    width: 100%;
}
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
	</div>
</header>
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
		<div class="box_wrapa register cc">
			<h2 class="reg_head">欢迎注册成为 <?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?> 会员</h2>
			<div class="reg_cont_wrap">
				<div class="reg_cont">
					<form id="J_register_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=dorun'; ?>" method="POST">
					<div class="reg_form">
						<?php if ($config['type'] == 2) {?>
						<dl>
							<dt><label for="J_reg_invitecode">邀请码：</label></dt>
							<dd><span class="must_red">*</span><input id="J_reg_invitecode" name='invitecode' type="text" aria-required="true" class="input length_4" value="<?php echo htmlspecialchars($invitecode, ENT_QUOTES, 'UTF-8');?>"><br/>
						<?php if ($config['invite.pay.open']) {?><a href="index.php?m=bbs&c=invite">购买邀请码</a> <?php }?>
							</dd>
							<dd class="dd_r" id="J_reg_tip_invitecode">本站开启邀请注册，请填写邀请码</dd>
						</dl>
						<div class="invite_box_wrap" style="display:none">
							<div class="invite_box">
								<div class="hd"><a href="" class="fr">收起&uarr;</a><strong class="b">购买邀请码</strong></div>
								<div class="tips">在线支付成功后将自动返回至注册页面并显示邀请码。<br>如果返回后没有显示邀请码，请到电子邮箱查收或联系站长。</div>
								<div class="ct">
									<ul>
										<li><em>电子邮箱：</em><span><input type="email" class="input" ></span><span class="tips_icon_error">电子邮箱格式错误</span></li>
										<li><em>支付金额：</em><span class="s2 mr10">1元</span>有效期1天</li>
										<li><em>&nbsp;</em><button type="button" class="btn btn_submit">立即付款</button></li>
									</ul>
								</div>
							</div>
						</div>
						<?php }elseif ($invite) {?>
						<input type="hidden" name="invite" value="<?php echo htmlspecialchars($invite, ENT_QUOTES, 'UTF-8');?>" />
						<?php }?>
						<dl>
							<dt><label for="J_reg_email">电子邮箱：</label></dt>
							<dd>
								<div id="J_email_list" class="fl mail_down" style="display:;margin-top:27px;"></div>
								<span class="must_red">*</span><input aria-required="true" autocomplete="off" id="J_reg_email" data-id="email" name="email" type="text" class="input length_4" value="<?php echo htmlspecialchars($data['email'], ENT_QUOTES, 'UTF-8');?>" onchange="addname()";>
							</dd>
							<dd class="dd_r" id="J_reg_tip_email" role="tooltip" aria-hidden="true"></dd>
						</dl>
						<dl>
							<dt><label for="J_reg_password">密码：</label></dt>
							<dd><span class="must_red">*</span><input aria-required="true" id="J_reg_password" data-id="password" name="password" type="password" class="input length_4" value="<?php echo htmlspecialchars($data['password'], ENT_QUOTES, 'UTF-8');?>"></dd>
							<dd class="dd_r" id="J_reg_tip_password" role="tooltip" aria-hidden="true"></dd>
						</dl>
						<dl>
							<dt><label for="J_reg_repassword">确认密码：</label></dt>
							<dd><span class="must_red">*</span><input aria-required="true" id="J_reg_repassword" data-id="repassword" name="repassword" type="password" class="input length_4" value="<?php echo htmlspecialchars($data['repassword'], ENT_QUOTES, 'UTF-8');?>"></dd>
							<dd class="dd_r" id="J_reg_tip_repassword" role="tooltip" aria-hidden="true"></dd>
						</dl>
							<dl>
							<dt><label for="J_reg_username">昵称：</label></dt>
							<dd><span class="must_red">*</span><input aria-required="true" id="J_reg_username" data-id="username" name="username" type="text" class="input length_4 J_reg_input" value="<?php echo htmlspecialchars($data['username'], ENT_QUOTES, 'UTF-8');?>"></dd>
							<dd class="dd_r" id="J_reg_tip_username" role="tooltip" aria-hidden="true"></dd>
						</dl>
						<?php if ($config['active.phone']) {?>
						<dl id="J_moblie_dl">
							<dt><label for="">手机号码：</label></dt>
							<dd><span class="must_red">*</span><input type="hidden" id="J_reg_mobile_hide" name="mobile"><input id="J_reg_mobile" data-counttime="90" type="text" aria-required="true" class="input length_4" value=""></dd>
							<dd class="dd_r"><button style="display:none;" id="J_show_mcode" name="mobile" type="button" class="btn mr5">获取验证码</button><span class="dd_r" id="J_reg_tip__mobile" role="tooltip" aria-hidden="true"></span><span id="J_mcode_tip" class="reg_tips" style="display:none;">验证码已发送到<span id="J_send_mobile"></span><a href="" id="J_mobile_change" class="s4">（修改号码）</a>超过90秒未收到验证码，请点击重新发送。<button id="J_mcode_resend" class="btn disabled" type="button" disabled>90秒后重新发送</button></span></dd>
						</dl>
						<dl id="J_mcode_dl">
							<dt><label for="">手机验证码：</label></dt>
							<dd><span class="must_red">*</span><input id="J_reg_mobileCode" name="mobileCode" type="text" class="input length_4" value=""></dd>
							<dd class="dd_r"><span class="dd_r" id="J_reg_tip_mobileCode" role="tooltip" aria-hidden="true"></span></dd>
						</dl>
						<?php }
 if ($config['active.check']) {?>
						<dl class="cc">
							<dt><label for="J_reg_regreason">注册原因：</label></dt>
							<dd><span class="must_red">*</span><textarea id="J_reg_regreason" data-id="regreason" name="regreason" class="length_4"></textarea></dd>
							<dd id="J_reg_tip_regreason" class="dd_r"></dd>
						</dl>
						<?php }
 foreach ($config['active.field'] as $field) {
							//if ($config['active.phone'] && $field == 'mobile') continue;
							$fieldsInfo = $needFields[$field];
						
 PwHook::segment("TPL:u.register_segment_needfields", array($field, $fieldsInfo), "{$fieldsInfo['segment']}", "register_segment_needfields", $__viewer); 
 }
 if ($verify) {?>
						<dl class="cc dl_cd">
							<dt><label for="J_reg_code">验证码：</label></dt>
							<dd>
								<span class="must_red">*</span>
								<div class="cc mb5" style="height:30px;"><input id="J_reg_code" data-id="code" name="code" type="text" class="input length_4 fl"></div>
								<div id="J_register_verify"></div>
							</dd>
							<dd class="dd_r"><div id="J_reg_tip_code"></div></dd>
						</dl>
						<?php }?>
						<dl>
							<dt>&nbsp;</dt>
							<dd><button class="btn btn_big btn_submit mr20" type="submit">同意以下协议并注册</button></dd>
						</dl>
						<div class="agreements">
						<div><a id="J_agreements_btn" href="" class="s4" title="点击显示本协议">《本站协议规章内容》</a></div>
						<pre id="J_agreements_content" style="display:none;"><?php echo $config['protocol'];?></pre></div>
					</div>
					<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
				</div>
			</div>
			<div class="reg_side">
				<div class="reg_side_cont">
					<p class="mb10">已经有帐号？</p>
					<p><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&backurl=', rawurlencode($backurl); 
 if ($invite) {?>&invite=<?php echo htmlspecialchars($invite, ENT_QUOTES, 'UTF-8');
 }?>" class="btn btn_big">立即登录</a></p>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
Wind.use('jquery', 'global', 'validate', 'emailAutoMatch', function(){

	<?php if ($verify) {?>
	/*
	 * 更换验证码
	*/
		var reg_code = $('#J_reg_code');
		Wind.Util.getVerifyTemp({
			wrap : $('#J_register_verify'),
			afterClick : function(){
				$('#J_reg_tip_code').html('');
				reg_code.val('');
			}
		});
	<?php }?>
	
	//聚焦时默认提示
	var focus_tips = {
		invitecode : '本站开启邀请注册，请填写邀请码',
		username : '<?php echo htmlspecialchars($nameReg, ENT_QUOTES, 'UTF-8');?>',
		password : '<?php echo htmlspecialchars($pwdReg, ENT_QUOTES, 'UTF-8');?>',
		repassword : '请再输入一遍您上面填写的密码',
		email : '请填写真实的电子邮箱',
		regreason : '注册原因是管理员判断是否审核通过的主要参考依据',
		mobileCode : '请填写收到的手机验证码',
		qq : '',
		msn : '',
		aliww : '',
		code : ''
	};
	
	//密码强度
	var passwordRank = {
		1 : '<span class="pwd_strength_1"></span>弱',
		2 : '<span class="pwd_strength_2"></span>弱',
		3 : '<span class="pwd_strength_3"></span>中',
		4 : '<span class="pwd_strength_4"></span>强'
	};
	
	var register_form = $("#J_register_form"),
			reg_username = $('#J_reg_username'),						//用户名表单
			reg_password = $('#J_reg_password'),						//密码表单
			reg_tip_password = $('#J_reg_tip_password');		//密码提示区

	//validate插件修改了remote ajax验证返回的response处理方式；增加密码强度提示 passwordRank
	register_form.validate({
		//debug : true,
		errorPlacement: function(error, element) {
			//错误提示容器
			$('#J_reg_tip_'+ element[0].name).html(error);
		},
		errorElement: 'span',
		errorClass : 'tips_icon_error',
		validClass		: 'tips_icon_success',
		onkeyup : false,
		focusInvalid : false,
		rules: {
			invitecode : {
				required	: true,
				remote		: {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkInvitecode'; ?>",
					type : 'post',
					dataType: "json",
					data : {
						invitecode : function(){
							return $("#J_reg_invitecode").val();
						}
					}
				}
			},
			username: {
				required	: true,
				remote		: {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkusername'; ?>",
					type : 'post',
					dataType: "json",
					data : {username : function(){
							return $("#J_reg_username").val();
						}
					}
						   //返回的信息就是messagesss
				}
			},
			password : {
				required: true,
				remote : {
					url : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkpwd'; ?>',		//验证密码
					dataType: "json",
					type : 'post',
					data : {
						username : function(){
							return reg_username.val();
						},
						pwd : function(){
							return reg_password.val();
						}
					}
				}
			},
			repassword : {
				required : true,
				equalTo : '#J_reg_password'
			},
			email : {
				required : true,
				email : true,
				remote : {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkemail'; ?>",
					dataType: "json",
					type : 'post',
					data : {
						email :  function(){
							return $("#J_reg_email").val();
						}
					}
				}
			},
			regreason : {
				required : true,
				maxlength : 500
			},
			mobileCode : {
				required : true,
				remote : {
					url : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=mobile&a=checkmobilecode'; ?>',		//验证手机验证码
					dataType: "json",
					type : 'post',
					data : {
						mobileCode : function(){
							return $('#J_reg_mobileCode').val();
						},
						mobile : function(){
							return $('#J_reg_mobile').val();
						}
					}
				}
			},
			qq : {
				required : true
			},
			msn : {
				required : true
			},
			aliww : {
				required : true
			},
			code : {
				required : true,
				remote : {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=verify&a=check'; ?>",
					dataType: "json",
					type : 'post',
					data : {
						code :  function(){
							return reg_code.val();
						}
					}
				}
			}
		},
		highlight	: false,
		unhighlight	: function(element, errorClass, validClass) {
			var tip_elem = $('#J_reg_tip_'+ element.name);
			if(element.value){
				tip_elem.html('<span class="'+ validClass +'" data-text="text"><span>');
			}
		},
		onfocusin	: function(element){
			var id = element.name;
			$('#J_reg_tip_'+ id).html('<span class="reg_tips" data-text="text">'+ focus_tips[id] +'</span>');
			$(element).parents('dl').addClass('current');
			
			if(id == 'password') {
				//密码则添加强度验证
				
				$(element).on('keyup', function(e){
					
					//过滤tab键
					if(e.keyCode !== 9) {

						$.post('<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkpwdStrong'; ?>', {
							pwd : reg_password.val()
						}, function(data){
							//已失焦，则显示强度
							if(reg_tip_password.data('blur')) {
								return false;
							}
							if(data.state === 'success') {
								reg_tip_password.html(passwordRank[data.message['rank']]);
							}else if(data.state === 'fail'){
								reg_tip_password.html('');
							}
						}, 'json');

						//移除失焦标识
						reg_tip_password.removeData('blur');
					}
					
				});
			}
		},
		onfocusout	:  function(element){
			var _this = this;
			$(element).parents('dl').removeClass('current');
			
			if(element.name === 'email') {
				//邮箱匹配点击后，延时处理
				setTimeout(function(){
					element.value = $.trim(element.value);
					_this.element(element);
				}, 150);
			}else{
			
				if(element.name === 'password'){
					//防止重复绑定
					$(element).off('keyup');
					
					//失焦标识
					reg_tip_password.data('blur', 'blur');
				}
				_this.element(element);
				
			}
			
		},
		messages: {
			invitecode : {
				required : '邀请码不能为空'
			},
			username : {
				required	: '昵称不能为空',
				remote : '昵称已存在' //ajax验证默认提示
			},
			password : {
				required : '密码不能为空',
				remote : '密码不合要求' //ajax验证默认提示
			},
			repassword : {
				required : '确认密码不能为空',
				equalTo : '两次输入的密码不一致。请重新输入'
			},
			email : {
				required : '邮箱不能为空',
				email : '请输入正确的电子邮箱地址',
				remote : '该电子邮箱已被注册，请更换别邮箱' //ajax验证默认提示
			},
			regreason : {
				required	: '注册原因不能为空',
				maxlength	: '注册原因描述内容过长，不能超过500字'
			},
			mobileCode : {
				required	: '手机验证码不能为空'
			},
			qq : {
				required	: 'QQ不能为空'
			},
			msn : {
				required	: 'MSN不能为空'
			},
			aliww : {
				required	: '阿里旺旺不能为空'
			},
			code : {
				required	: '验证码不能为空',
				remote : '验证码不正确或已过期' //ajax验证默认提示
			}
		}
	});
	
	
	//邮箱后缀匹配
	$('#J_reg_email').emailAutoMatch();
	
	//注册协议
	$('#J_agreements_btn').on('click', function(e){
		e.preventDefault();
		$('#J_agreements_content').toggle();
	});

	register_form.find('dl:first input:text:visible').focus().parents('dl').addClass('current');


<?php if ($config['active.phone']) {?>
	//手机验证
	window.M_CHECK = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=sendmobile'; ?>';
	window.M_CHECK_MOBILE = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register&a=checkmobile'; ?>';
	Wind.js(GV.JS_ROOT +'pages/u/regMobileCheck.js?v='+ GV.JS_VERSION);

<?php }?>

});
function addname(){
	var einfo = $("#J_reg_email").val();
	$("#J_reg_username").val(einfo);
}
</script>
</body>
</html>
