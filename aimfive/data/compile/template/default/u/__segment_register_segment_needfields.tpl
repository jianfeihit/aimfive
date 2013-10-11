<?php if (!function_exists("TPL_U_REGISTER_SEGMENT_NEEDFIELDS_AREA")) {function TPL_U_REGISTER_SEGMENT_NEEDFIELDS_AREA($field,$fieldinfo){?>

	<dl>
		<dt><label><?php echo htmlspecialchars($fieldinfo['title'], ENT_QUOTES, 'UTF-8');?>：</label></dt>
		<dd class="J_region_set"><span class="must_red">*</span>
			<div class="reg_ddtext">
				<span class="J_region_list">
				<span class="J_province mr5" data-id=""></span><span class="J_city mr5" data-id=""></span><span class="J_district mr5" data-id=""></span>
				</span>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?c=area'; ?>" class="J_region_change">选择</a>
			</div>
			<input class="J_areaid" type="hidden" name="<?php echo htmlspecialchars($field, ENT_QUOTES, 'UTF-8');?>" value="" />
		</dd>
		<dd id="J_reg_tip_<?php echo htmlspecialchars($field, ENT_QUOTES, 'UTF-8');?>" class="dd_r"></dd>
	</dl>

<?php }}?>
<?php if (!function_exists("TPL_U_REGISTER_SEGMENT_NEEDFIELDS_INPUT")) {function TPL_U_REGISTER_SEGMENT_NEEDFIELDS_INPUT($field,$fieldinfo){?>



	<dl>
		<dt><label><?php echo htmlspecialchars($fieldinfo['title'], ENT_QUOTES, 'UTF-8');?>：</label></dt>
		<dd><span class="must_red">*</span>
			<input name="<?php echo htmlspecialchars($field, ENT_QUOTES, 'UTF-8');?>" type="text" class="input length_4" value="">
		</dd>
		<dd id="J_reg_tip_<?php echo htmlspecialchars($field, ENT_QUOTES, 'UTF-8');?>" class="dd_r"></dd>
	</dl>

<?php }}?>