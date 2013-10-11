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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/css/base.css" rel="stylesheet" type="text/css" />
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/public/css/index.css" rel="stylesheet" type="text/css" />
</head>
<body  class="backBg">
<?php 
$_errMsg = $url ? '登录' : '登录';
//TODO 不一样的登录提示类型
if ($_GET['_type'] == 2) {
$_errMsg = '为保证帐户安全，请重新登录';
}
?>
			<div    class="loginDiv">
				<div >
					<form id="J_u_login_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=dorun'; ?>" method="post" >
						<dl >
							<dd><input id="J_u_login_username" data-id="username" name="username" type="text"   class="mailText"  aria-required="true" value=""></dd>
							<dd id="J_u_login_tip_username" role="tooltip" aria-hidden="true" class="mailText" class="dd_r"  style="left:480px;top:335px" ></dd>
						</dl>
						<dl >
							<dd><input id="J_u_login_password" data-id="password" name="password" type="password" aria-required="true" class="passwordText" value=""></dd>
							<a href="javascript:window.location.href='?m=u&c=findPwd'"  class="passwordText"  style="left:510px;width:50px;height:50px;">&nbsp;&nbsp;</a>
							<dd id="J_u_login_tip_password" role="tooltip" aria-hidden="true" class="mailText" class="dd_r"  style="left:480px;top:390px" ></dd>
						</dl>
						<!-- 
						<dl >
							<dt>&nbsp;</dt>
							<dd><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=findPwd'; ?>" class="fr mr10">找回密码</a><input name="rememberme" value="31536000" type="checkbox" class="checkbox" id="cktime"><label for="cktime">自动登录</label></dd>
						</dl> -->
						<dl >
							<dt>&nbsp;</dt>
							<dd><button   class="personalLogin"  type="submit">个人登录</button>
							<input type="hidden" name="backurl" value="<?php echo htmlspecialchars($url, ENT_QUOTES, 'UTF-8');?>">
							<input type="hidden" name="invite" value="<?php echo htmlspecialchars($invite, ENT_QUOTES, 'UTF-8');?>" />
							</dd>
							<p class="mb20"><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=register'; 
 if ($invite) {?>?invite=<?php echo htmlspecialchars($invite, ENT_QUOTES, 'UTF-8');
 }?>"  class="fastRegister"  class="btn btn_big" style="left:380px;">免费注册</a></p>
						</dl>
					<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
				</div>
			</div>

<script>
Wind.use('jquery', 'global', 'validate', 'ajaxForm', function(){
	
	//聚焦时默认提示
	var focus_tips = {
		username : '<?php echo htmlspecialchars($loginWay, ENT_QUOTES, 'UTF-8');?>',
		password : '',
		answer : '',
		myquestion : '',
		code : ''
	};

	var login_qa = $('#J_login_qa'), $qa_html = $('<dl id="J_qa_wrap" class="cc">\
							<dt><label for="J_login_question">安全问题</label></dt>\
							<dd><select id="J_login_question" name="question" class="select_4"></select></dd>\
						</dl>\
						<dl class="cc">\
							<dt><label for="J_login_answer">您的答案</label></dt>\
							<dd><input id="J_login_answer" name="answer" type="text" class="input length_4" value=""></dd>\
							<dd id="J_u_login_tip_answer" class="dd_r"></dd>\
						</dl>');
	var _statu = '',
		login_tip_username = $('#J_u_login_tip_username');

	var u_login_form = $("#J_u_login_form"),
			u_login_username = $('#J_u_login_username');

	u_login_form.validate({
		errorPlacement: function(error, element) {
			//错误提示容器
			$('#J_u_login_tip_'+ element[0].name).html(error);
		},
		errorElement: 'span',
		errorClass : 'tips_icon_error',
		validClass		: 'tips_icon_success',
		onkeyup : false, //remote ajax
		focusInvalid : false,
		rules: {
			username: {
				required	: true,
				//nameCheck : true
				remote		: {
					url : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=checkname'; ?>',
					//beforeSend : '', //取消startRequest方法
					dataType: "json",
					type : 'post',
					data : {
						'username' : function(){
							return u_login_username.val();
						}
					},
					complete : function(jqXHR, textStatus){
						if(!textStatus === 'success') {
							return false;
						}
						var data = $.parseJSON(jqXHR.responseText);
						if(data.state === 'success') {
							if(data.message.safeCheck){
								var q_arr = [];
								$.each(data.message.safeCheck, function(i, o){
									q_arr.push('<option value="'+ i +'">'+ o +'</option>')
								});
								$qa_html.find('#J_login_question').html(q_arr.join(''));
								login_qa.html($qa_html).show();
								_statu = data.message._statu;
							}else{
								login_qa.html('')
							};
							login_tip_username.html('<span class="tips_icon_success"><span>');
						}else{
							login_tip_username.html('<span class="tips_icon_error"><span>' + data.message);
						}
					}
				}
			},
			password : {
				required	: true/*,
				remote : {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=checkpwd'; ?>",
					dataType: "json",
					type : 'post',
					data : {
						username :  function(){
							return u_login_username.val();
						},
						password : function(){
							return $('#J_u_login_password').val();
						}
					}
				}*/
			},
			code : {
				required : true,
				remote : {
					url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=verify&a=check'; ?>",
					dataType: "json",
					data : {
						code :  function(){
							return $("#J_login_code").val();
						}
					}
				}
			},
			question : {
				required : true
			},
			answer : {
				required : true,
				remote : {
					url : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=u&c=login&a=checkquestion'; ?>',
					dataType: "json",
					type : 'post',
					ignoreRepeat : true,
					data : {
						question : function(){
							if($('#J_login_myquestion').length) {
								return $('#J_login_myquestion').val();
							}else{
								return $('#J_login_question').val();
							}
						},
						answer :  function(){
							return $("#J_login_answer").val();
						},
						_statu : function(){
							return _statu;
						}
					}
				}
			}
		},
		highlight	: false,
		unhighlight	: function(element, errorClass, validClass) {
			if(element.name === 'password') {
				$('#J_u_login_tip_password').html('');
				return;
			}
			//$('#J_u_login_tip_'+ $(element).data('id')).html('<span class="'+ validClass +'" data-text="text"><span>');
		},
		onfocusin	: function(element){
			var name = element.name;
			$(element).parents('dl').addClass('current');
			$('#J_u_login_tip_'+ name).html('<span class="reg_tips" data-text="text"></span>');
		},
		onfocusout	:  function(element){
			$(element).parents('dl').removeClass('current');
			//$('#J_u_login_tip_'+ $(element).data('id')).html('');
			if(element.name === 'username'){
				this.element(element);
			}
		},
		messages : {
			username : {
				required	: '帐号不能为空'
			},
			password : {
				required : ''
			},
			code : {
				required	: '验证码不能为空',
				remote : '验证码不正确或已过期' //ajax验证默认提示
			},
			myquestion : {
				required	: '自定义问题不能为空',
				remote : ''
			},
			answer : {
				required	: '问题答案不能为空'
			}
		},
		submitHandler:function(form) {
			var btn = $(form).find('button:submit');
			
			$(form).ajaxSubmit({
				dataType : 'json',
				beforeSubmit : function(){
					//global.js
					Wind.Util.ajaxBtnDisable(btn);
				},
				success : function(data, statusText, xhr, $form) {
					if(data.state === 'success') {
					
						//是否需要设置验证问题
						if(data.message.check) {
							$.post(data.message.check.url, function (data) {
								//引入所需组件并显示弹窗
								Wind.use('dialog', function (){
									Wind.Util.ajaxBtnEnable(btn);
									Wind.dialog.html(data, {
										id: 'J_login_question_wrap',
										isDrag: true,
										isMask: false,
										onClose: function(){
											u_login_username.focus();
										},
										callback: function(){
											$('#J_login_question_wrap input:text:visible:first').focus();
										}
									});

								});
							}, 'html');
						}else{
							window.location.href = data.referer;
						}
						
					}else if(data.state === 'fail'){
						//global.js
						Wind.Util.ajaxBtnEnable(btn);

						if(data.message.qaE) {
							//回答安全问题
							return;
						}
						
						if(RegExp('答案').test(data.message)) {
							//配合ignoreRepeat 处理问题答案不修改 再次验证
							$('#J_u_login_tip_answer').html('<span for="J_login_answer" generated="true" class="tips_icon_error">'+ data.message +'</span>');
						}else{
							//global.js
							Wind.Util.resultTip({
								elem : btn,
								error : true,
								msg : data.message,
								follow : true
							});
						}
						
					}
				}
			});
		}
	});

	u_login_form.on('change', '#J_login_question', function(){
		if($(this).val() == '-4') {
			$('#J_qa_wrap').after('<dl id="J_myquestion_wrap" class="cc"><dt><label>自定义问题</label></dt><dd><input id="J_login_myquestion" type="text" name="myquestion" value="" class="input length_4"></dd><dd class="dd_r" id="J_u_login_tip_myquestion"></dd></dl>');
		}else{
			$('#J_myquestion_wrap').remove();
		}
	});


	//聚焦第一个input
	u_login_form.find('input.input:visible:first').focus();

});
</script>
</body>
</html>
