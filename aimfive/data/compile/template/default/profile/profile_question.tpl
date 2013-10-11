<div class="content">
	<div class="profile_nav">
		<ul>
			<li ><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&_left=secret'; ?>">空间隐私</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&a=black&_left=secret'; ?>">黑名单</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password'; ?>">修改密码</a></li>
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password&a=question'; ?>">安全问题设置</a></li>
		</ul>
	</div>
	<form id="J_pw_edit" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password&a=dosetQ'; ?>" method="post">
	<div class="profile_ct">
		<dl class="cc">
			<dt>登录密码：</dt>
			<dd><span class="must_red">*</span><input id="J_old_pwd" data-checkurl="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password&a=checkOldPwd'; ?>" type="password" name="oldPwd" value="" class="input length_5"><span id="J_tip_oldPwd"></span></dd>
		</dl>
		<dl class="cc">
			<dt>安全问题：</dt>
			<dd><select id="J_question_list" class="select_5" name="question">
<?php if ($isSetSafeQ) {?>
				<option value="-2" selected>取消安全问题和答案</option>
<?php }else{?>
				<option value="-3" selected>无安全问题</option>
<?php }
 foreach ($safeQuestionList as $key => $value) {?>
				<option value="<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?></option>
<?php }?>
				<option value="-4">自定义安全问题</option>
			</select></dd>
		</dl>
		<dl id="J_question_dl" class="cc" style="display:none">
			<dt>自定义您的问题：</dt>
			<dd><input id="J_question_custom" type="text" name="myquestion" value="1" class="input length_5"><span id="J_tip_myquestion"></span></dd>
		</dl>
		<dl id="J_answer_dl" class="cc" style="display:none;">
			<dt>您的答案：</dt>
			<dd><input id="J_answer" type="text" name="answer" value="1" class="input length_5"><span id="J_tip_answer"></span></dd>
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