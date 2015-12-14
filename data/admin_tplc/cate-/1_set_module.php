<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><span class="lead">&nbsp;&raquo; <a href="<?php echo site_url('cate');?>">分类管理</a> &raquo; 添加分类，请选择要操作的模块</span></td>
	</tr>
	</table>
</div></div>


<div class="table">
	<div class="left"><span class="red">*</span> 模块：</div>
	<select name="mid" id="mid">
	<option value="0">请选择模块</option>
	<?php $_i=0;$modulelist=(is_array($modulelist))?$modulelist:array();foreach($modulelist AS  $key=>$value){$_i++; ?>
	<option value="<?php echo $value[id];?>"><?php echo $value[title];?><?php if(!$value[status]){?>【模块已禁用】<?php } ?></option>
	<?php } ?>
	</select>
</div>
<div class="table">
	<div class="left">&nbsp;</div>
	<span class="clue_on">请选择要添加分类所属的模块</span>
</div>
<br />

<div class="table">
	<div class="left">&nbsp;</div>
	<input type="button" class="btn3" id="_phpok_submit" value=" 提交 " onclick="to_setup()">
</div>

<br /><br /><br /><br />
<script type="text/javascript">
function to_setup()
{
	var gotourl = "<?php echo site_url('cate,set');?>";
	var mid = getid("mid").value;
	if(!mid || mid == "0")
	{
		alert("请选择要操作的模块！");
		return false;
	}
	gotourl += "mid="+mid;
	direct(gotourl);
}
</script>
<?php $APP->tpl->p("footer","","0");?>