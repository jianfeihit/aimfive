<div class="content">
	<div class="profile_nav">
		<ul>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&_left=secret'; ?>">空间隐私</a></li>
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&a=black&_left=secret'; ?>">黑名单</a></li>
			<li ><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password'; ?>">修改密码</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=password&a=question'; ?>">安全问题设置</a></li>
		</ul>
	</div>
	<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=secret&a=doblack'; ?>" method="post">
	<div class="profile_ct">
		<div class="tips mb15">
			<div class="tips_icon">被列入黑名单的用户，将不能关注你，给你私信，并且屏蔽该用户对你的@和回复提醒</div>
		</div>
		<div id="blacklist_set" class="cc">
				<div class="user_select_input cc J_user_tag_wrap">
					<ul class="fl J_user_tag_ul">
					<?php  foreach ($blacklist as $value) { ?>
					<li><a href="javascript:;">
						<span class="J_tag_name"><?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?></span>
						<del class="J_user_tag_del" title="<?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?>">×</del>
						<input type="hidden" name="blacklist[]" value="<?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?>">
						</a>
					</li>
					<?php  } ?>
					</ul>
					<input class="J_user_tag_input" type="text" data-name="blacklist[]" />
				</div>
		</div>
		<dl class="ft">
			<dd>
				<button class="btn btn_submit btn_big" id="J_secret_sub" type="submit">提交</button>
			</dd>
		</dl>
	</div>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
</div>
<script>
Wind.ready(document, function(){
	Wind.use('jquery', 'global', 'ajaxForm', function(){
		//黑名单
		$('#J_secret_sub').on('click', function(e){
			e.preventDefault();
			var $this = $(this);
			setTimeout(function(){
				$this.parents('form').ajaxSubmit({
					dataType : 'json',
					success : function(data){
						if(data.state == 'success') {
							Wind.Util.resultTip({
								msg : '操作成功'
							});
						}else if(data.state == 'fail') {
							Wind.Util.resultTip({
								error : true,
								msg : data.message
							});
						}
					}
				});
			}, 150)
		});
	});
});
</script>