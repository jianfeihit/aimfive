<div class="content" >
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
	<div class="profile_work">
		<ul id="J_work_list">
			<li class="hd">
				<span class="fr"><a id="J_work_add" href="#" class="btn btn_submit fn f12">+添加工作经历</a></span>
				<span class="unit">工作单位</span>
				<span class="time">工作时间</span>
				<span class="unit1">职位</span>
				<span class="unit1">项目经验</span>
			</li>
			<li id="J_work_op_wrap" class="li_add" style="display:none;">
				<form id="J_work_form" action="#" method="post">
					<span class="fr"><button type="submit" class="btn btn_submit mr5">保存</button><a href="#" class="btn" id="J_work_cancl">取消</a><input id="J_edit_id" type="hidden" name="id" /></span>
					<span class="unit">
							<input id="J_work_company" name="company" type="text" class="length_4 input"  style="width:100px;"/>
					</span>
					<span class="time">
						<select class="mr5" name="startYear" id="J_starty"><option value="">年</option>
						<?php foreach ($years as $_year) {?>
							<option value="<?php echo htmlspecialchars($_year, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_year, ENT_QUOTES, 'UTF-8');?></option>
						<?php }?>
						</select><select class="mr10" name="startMonth" id="J_startm"><option value="">月</option>
						<?php foreach ($months as $_month) {?>
							<option value="<?php echo htmlspecialchars($_month, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_month, ENT_QUOTES, 'UTF-8');?></option>
						<?php }?></select><span class="mr10">到</span><select class="mr5" name="endYear" id="J_endy"><option value="">年</option>
						<?php foreach ($years as $_year) {?>
							<option value="<?php echo htmlspecialchars($_year, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_year, ENT_QUOTES, 'UTF-8');?></option>
						<?php }?></select><select class="mr10" name="endMonth" id="J_endm"><option value="">月</option>
						<?php foreach ($months as $_month) {?>
							<option value="<?php echo htmlspecialchars($_month, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_month, ENT_QUOTES, 'UTF-8');?></option>
						<?php }?></select>
					</span>
					<p>
					<span class="unit1">
							<input  name="zhiwei" type="text" class="length_4 input" style="width:100px;"  />
					</span>
					<span class="unit2">
							<input  name="jingyan" type="text" class="length_4 input"  style="width:100px;"/>
					</span>
					</p>
				<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
			</li>
<?php if ($count > 0) {
 foreach ($list as $id => $item) {?>
			<li>
				<span class="fr"><a href="#" class="mr20 J_work_edit" data-id="<?php echo htmlspecialchars($item['id'], ENT_QUOTES, 'UTF-8');?>" data-company="<?php echo htmlspecialchars($item['company'], ENT_QUOTES, 'UTF-8');?>" data-starty="<?php echo htmlspecialchars($item['starty'], ENT_QUOTES, 'UTF-8');?>" data-startm="<?php echo htmlspecialchars($item['startm'], ENT_QUOTES, 'UTF-8');?>" data-endy="<?php echo htmlspecialchars($item['endy'], ENT_QUOTES, 'UTF-8');?>" data-endm="<?php echo htmlspecialchars($item['endm'], ENT_QUOTES, 'UTF-8');?>">编辑</a><a class="J_work_del" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&a=delete&page=', rawurlencode($page),'&id=', rawurlencode($id); ?>">删除</a></span>
				<span class="unit"><?php echo htmlspecialchars($item['company'], ENT_QUOTES, 'UTF-8');?></span>
				<span class="time"><?php echo htmlspecialchars($item['starty'], ENT_QUOTES, 'UTF-8');?>年<?php echo htmlspecialchars($item['startm'], ENT_QUOTES, 'UTF-8');?>月&nbsp;至&nbsp;
				<?php if (!$item['endy']) {?>今<?php }else{
 echo htmlspecialchars($item['endy'], ENT_QUOTES, 'UTF-8');?>年<?php echo htmlspecialchars($item['endm'], ENT_QUOTES, 'UTF-8');?>月<?php }?></span>
				<span class="unit1"><?php if($item['zhiwei']){
 echo htmlspecialchars($item['zhiwei'], ENT_QUOTES, 'UTF-8');
 }else{?>未填写<?php }?></span>
				<span class="unit2"><?php if($item['jingyan']){
 echo htmlspecialchars($item['jingyan'], ENT_QUOTES, 'UTF-8');
 }else{?>未填写<?php }?></span>
			</li>
<?php }
 }else{?>
		<li class="tac p20" id="J_work_none">你还没添加工作经历，<a href="#" class="s4">立即添加&gt;&gt;</a></li>
<?php }?>
		
		</ul>
		<?php $__tplPageCount=(int)$count;
$__tplPagePer=(int)0;
$__tplPageTotal=(int)$page_total;
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
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?>
	</div>
</div>

<div style="clear:both"></div>
<script>
var URL_WORK_ADD = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&a=add'; ?>',			//添加工作url
	URL_WORK_EDIT = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=profile&c=work&a=edit'; ?>';		//编辑工作url
Wind.ready(document, function(){
	Wind.use('jquery', 'global', GV.JS_ROOT +'pages/profile/profileWork.js?v=' +GV.JS_VERSION);
});
</script>