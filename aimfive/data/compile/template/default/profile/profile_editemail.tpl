<div class="content">
	<div class="profile_nav">
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&_left=secret'; ?>" class="fr a_privacy">隐私设置</a>
	<ul>
<?php foreach ($_tabs as $key => $_item) {
	if (isset($_item['url']) && $_item['url']) {
?>
		<li class="<?php echo htmlspecialchars($_item['current'], ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo WindUrlHelper::createUrl($_item['url'], array('_tab' => $key));?>"><?php echo htmlspecialchars($_item['title'], ENT_QUOTES, 'UTF-8');?></a></li>
<?php } else { ?>
		<li class="<?php echo htmlspecialchars($_item['current'], ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=extends&_left=profile&_tab=', rawurlencode($key); ?>"><?php echo htmlspecialchars($_item['title'], ENT_QUOTES, 'UTF-8');?></a></li>
<?php 
	}
}?>
	</ul>
</div>
	<form id="J_pw_edit" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&a=doeditemail'; ?>" method="post" >
	<div class="profile_ct">
		<dl class="cc">
			<dt>登录密码：</dt>
			<dd><span class="must_red">*</span><input type="password" name="passwd" id="J_old_pwd" class="input length_5" data-checkurl=""><span id="J_tip_passwd"></span></dd>
		</dl>
		<dl class="cc">
			<dt>电子邮箱：</dt>
			<dd><span class="must_red">*</span>
			<input type="text" class="input length_5 J_email_match" name="email" value="<?php echo htmlspecialchars($userinfo['email'], ENT_QUOTES, 'UTF-8');?>"/><span id="J_tip_email"></span>
			</dd>
		</dl>
		<dl class="cc">
			<dt>&nbsp;</dt>
			<dd><button type="submit" class="btn btn_submit btn_big mr10">提交</button></dd>
		</dl>
	</div>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
</div>
<script>
Wind.ready(document, function(){
	Wind.use('jquery', 'global', 'ajaxForm', 'validate', GV.JS_ROOT +'pages/profile/profilePwdQa.js?v=' +GV.JS_VERSION);
});
</script>
