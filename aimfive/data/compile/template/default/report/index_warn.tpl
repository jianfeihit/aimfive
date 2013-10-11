<!--=============发送邮件弹窗=============-->
			<div class="pop_report">
				<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=report&a=addwarn'; ?>" method="post">
				<div class="pop_cont">
					<ul>
							<li>
							<?php  if($u_name){ 
  foreach ($u_name as $key => $v) { ?>
							<input type="checkbox" name="se_type[]" value="<?php echo htmlspecialchars($v['uid'], ENT_QUOTES, 'UTF-8');?>" ><?php echo htmlspecialchars($v['username'], ENT_QUOTES, 'UTF-8');?>&nbsp;&nbsp;
							<?php }
 }else{?>
								赶快成为互相关注好友吧!
							<?php }?>
							</li>
					</ul>
				</div>
				<div class="pop_bottom">
					<input type="hidden" name="tid" value="<?php echo htmlspecialchars($tid, ENT_QUOTES, 'UTF-8');?>">
					<input type="hidden" name="uid" value="<?php echo htmlspecialchars($loginuid, ENT_QUOTES, 'UTF-8');?>">
					<?php  if($u_name){ ?>
					<button type="submit" class="btn btn_submit" onclick="return check()">提交</button>
					<?php }?>
				</div>
				<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
			</div>
<!--=============发送邮件=============-->
<script>
	function check(){
		var text_state = $("input[name='textemail']").val();
			$("input[name='se_type[]']").each(function(){
			if($(this).attr("checked")){
				flag=true;
				return true;
			}else{
				flag=false;
				return false;
			}
			});
		return flag;
	}
$(function(){
	$("#J_report_pop strong").html('邀请关注');
})

</script>