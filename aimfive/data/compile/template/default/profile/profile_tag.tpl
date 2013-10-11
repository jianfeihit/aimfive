<div class="content" style="width:700px;">
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
	<div class="cool_tags">
		<div class="hd">添加描述自己职业、兴趣爱好等方面的词语，让更多人找到你，让你找到更多同类</div>
		<div class="ct">
			<h3><strong>输入并添加新标签：</strong></h3>
			<form id="J_tag_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=doAdd'; ?>" method="post" >
			<p><input type="text" class="input length_5 mr10" placeholder="可以设置你的兴趣爱好、职业、话题等关键词" name="tagName"/><button type="submit" class="btn btn_success disabled" id="J_tag_add">添加标签</button></p>
			<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
			<h3><strong>我的标签：</strong>还可以添加 <span id="J_tag_count"><?php echo htmlspecialchars($allowNum, ENT_QUOTES, 'UTF-8');?></span> 个标签</h3>
<?php if ($mytags) {?>
			<p class="cool_has_tags" id="J_my_tags">
<?php foreach ($mytags as $key => $tag) {?>
				<span class="rel J_tag_rel" data-tag="<?php echo htmlspecialchars($tag['name'], ENT_QUOTES, 'UTF-8');?>"><em><?php echo htmlspecialchars($tag['name'], ENT_QUOTES, 'UTF-8');?></em><a class="del J_tag_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=doDelete&tagid=', rawurlencode($tag['tag_id']); ?>" data-tagid="<?php echo htmlspecialchars($tag['tag_id'], ENT_QUOTES, 'UTF-8');?>">×</a></span>
<?php }?>
			</p>
			<p id="J_my_tags_none" class="not_content_mini" style="display:none;">您还没有添加个人标签！</p>
<?php } else {?>
			<p class="cool_has_tags" id="J_my_tags" style="display:none;"></p>
			<p id="J_my_tags_none" class="not_content_mini"><i></i>您还没有添加个人标签！</p>
<?php }
 if ($hotTags) {?>
			<h3><?php if($total > 1){?><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=hot'; ?>" class="more J_change_tags" data-rel="J_hot_tags" data-add="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=doAddByid'; ?>">换一组</a><?php }?><strong>热门标签：</strong></h3>
			<p class="cool_hot_tags" id="J_hot_tags">
<?php foreach ($hotTags as $key => $tag) {?>
				<a class="J_tag_hot_add" data-tagid="<?php echo htmlspecialchars($tag['tag_id'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=doAddByid&tagid=', rawurlencode($tag['tag_id']); ?>"><?php echo htmlspecialchars($tag['name'], ENT_QUOTES, 'UTF-8');?></a>
<?php }?>
			</p>
<?php }?>
			<div style="display:none">
			<h3><a href="" class="more J_change_tags" data-rel="J_like_tags">换一组</a><strong>猜你喜欢：</strong></h3>
			<ul class="cc cool_like_tags" id="J_like_tags">
				<li>
					<img src="" width="50" height="50" class="face" alt="头像" />
					<div class="content">
						<p><a href="" class="name">色拉油</a></p>
						<p class="descrip"><a href="">东西</a><a href="">很多的</a><a href="">其他</a></p>
						<p><a href="" class="core_follow">关注</a></p>
					</div>
				</li>
				<li>
					<img src="" width="50" height="50" class="face" />
					<div class="content">
						<p><a href="" class="name">色拉油</a></p>
						<p class="descrip"><a href="">东西</a><a href="">很多的</a><a href="">其他</a></p>
						<p><a href="" class="core_follow">关注</a></p>
					</div>
				</li>
				<li>
					<img src="" width="50" height="50" class="face" />
					<div class="content">
						<p><a href="" class="name">色拉油</a></p>
						<p class="descrip"><a href="">东西</a><a href="">很多的</a><a href="">其他</a></p>
						<p><a href="" class="core_follow">关注</a></p>
					</div>
				</li>
				<li>
					<img src="" width="50" height="50" class="face" />
					<div class="content">
						<p><a href="" class="name">色拉油</a></p>
						<p class="descrip"><a href="">东西</a><a href="">很多的</a><a href="">其他</a></p>
						<p><a href="" class="core_follow">关注</a></p>
					</div>
				</li>
			</ul>
			</div>
		</div>
		<div class="ft">
			<h4>什么是标签?</h4>
			<p>·标签是自定义描述自己职业、兴趣爱好的关键词，让更多人找到你，让你找到更多的朋友。</p>
		</div>
	</div>
</div>

<div style="clear:both"></div>
<script>
var TAG_DEL = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=tag&a=doDelete'; ?>',
	TAG_REL = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=my&c=friend&a=search&usertag='; ?>';
//core.js
Wind.ready(document, function(){
	//引入js组件
	Wind.use('jquery', 'global', 'ajaxForm', GV.JS_ROOT +'pages/profile/profileTag.js?v=' +GV.JS_VERSION);
});
</script>