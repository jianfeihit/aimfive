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
	<form class="J_profile_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&a=docontact'; ?>" method="post">
	<div class="profile_ct">
		<!-- 
		<dl class="cc">
			<dt>支付宝：</dt>
			<dd>
				<input type="text" class="input length_5 mr10" name="alipay" value="<?php echo htmlspecialchars($userinfo['alipay'], ENT_QUOTES, 'UTF-8');?>"/>
		    </dd>
		</dl>
		 -->
		<dl class="cc">
			<dt>手机号码：</dt>
			<dd>
			<input type="text" class="input length_5 mr10" name="mobile" value="<?php echo htmlspecialchars($userinfo['mobile'], ENT_QUOTES, 'UTF-8');?>"/>
			<span class="f12 gray" id="J_profile_tip_mobile"></span>
			</dd>
		</dl>
		<dl class="cc">
			<dt>固定电话：</dt>
			<dd><input type="text" class="input length_5 mr10" name="telphone" value="<?php echo htmlspecialchars($userinfo['telphone'], ENT_QUOTES, 'UTF-8');?>"/><span class="f12 gray" id="J_profile_tip_telphone"></span></dd>
		</dl>
		<!-- 
		<dl class="cc">
			<dt>邮寄地址：</dt>
			<dd><input type="text" class="input length_5" name="address" value="<?php echo htmlspecialchars($userinfo['address'], ENT_QUOTES, 'UTF-8');?>"/></dd>
		</dl>
		<dl class="cc">
			<dt>邮编：</dt>
			<dd><input type="text" class="input length_5 mr10" name="zipcode" value="<?php echo htmlspecialchars($userinfo['zipcode'], ENT_QUOTES, 'UTF-8');?>"/><span class="f12 gray" id="J_profile_tip_zipcode"></span></dd>
		</dl>

		<h3>联系信息</h3>
				 -->
		<dl class="cc">
			<dt>电子邮箱：</dt>
			<dd>
			<input type="hidden" name="email">
			<?php echo htmlspecialchars($loginUser->info['email'], ENT_QUOTES, 'UTF-8');?> &nbsp;<a name="email" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&a=editemail&_tab=contact'; ?>" >修改</a>
			</dd>
		</dl>
		<!-- 
		<dl class="cc">
			<dt>阿里旺旺：</dt>
			<dd><input type="text" class="input length_5" name="aliww" value="<?php echo htmlspecialchars($userinfo['aliww'], ENT_QUOTES, 'UTF-8');?>"/></dd>
		</dl>
		<dl class="cc">
			<dt>QQ：</dt>
			<dd><input type="text" class="input length_5" name="qq" value="<?php echo htmlspecialchars($userinfo['qq'], ENT_QUOTES, 'UTF-8');?>"/></dd>
		</dl>
		<dl class="cc">
			<dt>MSN：</dt>
			<dd><input type="text" class="input length_5" name="msn" value="<?php echo htmlspecialchars($userinfo['msn'], ENT_QUOTES, 'UTF-8');?>"/></dd>
		</dl>
		 -->
		<dl class="cc">
			<dt>&nbsp;</dt>
			<dd><button type="submit" class="btn btn_submit btn_big mr10">提交</button></dd>
		</dl>
	</div>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
</div>


<div style="clear:both"></div>
<script>
Wind.ready(document, function(){
	Wind.use('jquery', 'global', GV.JS_ROOT +'pages/profile/profileIndex.js?v=' +GV.JS_VERSION);
});
</script>
<?php
PwHook::display(array($hookSrc, "runDo"), array('displayFootHtml'), "", $__viewer);
?>