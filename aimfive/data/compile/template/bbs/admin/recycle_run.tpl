<!doctype html>
<html>
<head>
<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','c','name'), ENT_QUOTES, 'UTF-8');?></title>
<link href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','css'), ENT_QUOTES, 'UTF-8');?>/admin_style.css?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<script>
//全局变量，是Global Variables不是Gay Video喔
var GV = {
	JS_ROOT : "<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/",																									//js目录
	JS_VERSION : "<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>",																										//js版本号
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token ajax全局
	REGION_CONFIG : {},
	SCHOOL_CONFIG : {},
	URL : {
		LOGIN : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','loginUrl'), ENT_QUOTES, 'UTF-8');?>',																													//后台登录地址
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',																										//图片目录
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=area'; ?>',					//地区
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=school'; ?>'				//学校
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/jquery.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>

</head>
<body>
<div class="wrap J_check_wrap">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=recycle'; ?>">主题回收站</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=recycle&a=reply'; ?>">回复回收站</a></li>
		</ul>
	</div>
	<div class="h_a">搜索</div>
	<form method="post" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=recycle'; ?>">
	<div class="search_type cc mb10">
		<div class="ul_wrap">
			<ul class="cc">
				<li><label>关键字：</label><input class="input length_3" name="keyword" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['keyword'], ENT_QUOTES, 'UTF-8');?>"></li>
				<li><label>所属版块：</label><select name="fid" class="select_3"><option value="0">所有版块</option><?php echo $option_html;?></select></li>
				<li><label>作者：</label><input class="input length_3" name="author" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['author'], ENT_QUOTES, 'UTF-8');?>"></li>
				<li><label>发帖时间：</label><input class="input length_2 J_date" name="created_time_start" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['created_time_start'], ENT_QUOTES, 'UTF-8');?>"> 至 <input class="input length_2 J_date" name="created_time_end" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['created_time_end'], ENT_QUOTES, 'UTF-8');?>"></li>
				<li><label>删除人：</label><input class="input length_3" name="operator" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['operator'], ENT_QUOTES, 'UTF-8');?>"></li>
				<li><label>删除时间：</label><input class="input length_2 J_date" name="operate_time_start" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['operate_time_start'], ENT_QUOTES, 'UTF-8');?>"> 至 <input class="input length_2 J_date" name="operate_time_end" autoComplete="off" type="text" value="<?php echo htmlspecialchars($url['operate_time_end'], ENT_QUOTES, 'UTF-8');?>"></li>
			</ul>
		</div>
		<div class="btn_side">
			<button class="btn" type="submit">搜索</button>
		</div>
	</div> 
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>

	<form class="J_ajaxForm" data-role="list" action="#" method="post">
			<?php  if ($threaddb) { ?>
	<div class="table_list">
		<table width="100%">
			<colgroup>
				<col width="65">
				<col>
				<col width="100">
				<col width="120">
				<col width="100">
				<col width="120">
				<col>
			</colgroup>
			<thead>
				<tr>
					<td><label class="mr10"><input class="J_check_all" data-checklist="J_check_x" data-direction="x" type="checkbox">全选</label></td>
					<td>标题</td>
					<td>作者</td>
					<td>发帖时间</td>
					<td>删除人</td>
					<td>删除时间</td>
					<td>删除理由</td>
				</tr>
			</thead>
			<tbody>
				<?php  foreach ($threaddb as $key => $value) { ?>
				<tr>
					<td><input type="checkbox" class="J_check" name="tids[]" value="<?php echo htmlspecialchars($value[tid], ENT_QUOTES, 'UTF-8');?>" data-xid="J_check_x" data-yid="J_check_y" /></td>
					<td>
						<?php echo htmlspecialchars($value['subject'], ENT_QUOTES, 'UTF-8');?>
						<!-- div>[来自版块 - <a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=bbs&c=thread&fid=', rawurlencode($value['fid']); ?>" target="_blank"><?php echo htmlspecialchars($forumname[$value['fid']]['name'], ENT_QUOTES, 'UTF-8');?></a>]</div-->
					</td>
					<td><?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?></td>
					<td><?php echo htmlspecialchars(Pw::time2str($value['created_time']), ENT_QUOTES, 'UTF-8');?></td>
					<td><?php echo htmlspecialchars($value['operate_username'], ENT_QUOTES, 'UTF-8');?></td>
					<td><?php echo htmlspecialchars(Pw::time2str($value['operate_time']), ENT_QUOTES, 'UTF-8');?></td>
					<td><?php echo htmlspecialchars($value['reason'], ENT_QUOTES, 'UTF-8');?></td>
				</tr>
				<?php  } ?>
			</tbody>
		</table>
		<div class="p10">
			<?php $__tplPageCount=(int)$count;
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
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?page=', rawurlencode($_page_i),'&m=bbs&c=recycle'; 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?>
		</div>
	</div>
			<?php  } else { ?>
			<div class="not_content_mini"><i></i>啊哦，没有符合条件的内容！</div>
			<?php  } 
  if ($threaddb) { ?>
	<div class="btn_wrap">
		<div class="btn_wrap_pd" id="J_sub_wrap">
			<label class="mr10"><input class="J_check_all" data-checklist="J_check_y" data-direction="y" type="checkbox">全选</label>
			<button type="submit" class="btn btn_submit J_ajax_submit_btn" data-subcheck="true" data-action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=recycle&a=doRevertTopic'; ?>">还原</button>
			<button type="submit" class="btn J_ajax_submit_btn" data-subcheck="true" data-msg="确定要删除吗？" data-action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=recycle&a=doDeleteTopic'; ?>">删除</button>
		</div>
	</div>
	<?php  } ?>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
</div>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
</body>
</html>