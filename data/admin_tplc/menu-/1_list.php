<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td width="130px"><span class="lead">&nbsp;&raquo; 导航菜单</span></td>
		<td align="right"><a href="<?php echo site_url('menu,set');?>" class="button">添加新导航</a></td>
	</tr>
	</table>
</div></div>

<div class="main">
<table width="100%" style="layout:fixed;" cellpadding="0" cellspacing="0">
<tr>
	<td class="t_sub" width="50px">ID</td>
	<td class="t_sub" width="30px">状态</td>
	<td class="t_sub">名称</td>
    <td class="t_sub">链接</td>
	<td class="t_sub" width="40px">排序</td>
	<td class="t_sub" width="45px">操作</td>
</tr>
<?php $_i=0;$rslist=(is_array($rslist))?$rslist:array();foreach($rslist AS  $key=>$value){$_i++; ?>
<tr class="tr_out" onMouseOver="over_tr(this)" onMouseOut="out_tr(this)">
	<td align="center" class="tc_left"><?php echo $value[id];?></td>
	<td align="center" class="tc_right" id="status_<?php echo $value[id];?>"><a href="javascript:status(<?php echo $value[id];?>,<?php echo intval($value[status]);?>);void(0);" class="status<?php echo intval($value[status]);?>"></a></td>
	<td class="tc_right">&nbsp;<?php if($value[parentid]){?>　　（子菜单）<?php } ?><?php echo $value[title];?></td>
	<td class="tc_right">&nbsp;<?php echo $value[link];?></td>
	<td align="center" class="tc_right"><?php echo $value[taxis] ? $value[taxis] : '-';?></td>
	<td align="center" class="tc_right">
		<a href="<?php echo site_url('menu,set');?>id=<?php echo $value[id];?>" class="btn edit" title="编辑"></a>
		<a href="javascript:to_del(<?php echo $value['id'];?>);void(0);" class="btn del" title="删除"></a>
	</td>
</tr>
<?php } ?>
</table>
</div>
<script type="text/javascript">
function to_del(id)
{
	if(!id)
	{
		alert("操作非法");
		return false;
	}
	var q = confirm("确定要删除此信息吗？删除后是不能恢复的");
	if(q != 0)
	{
		var url = base_url + base_func + "=ajax_del&id="+id;
		var msg = get_ajax(url);
		if(!msg) msg = "error: 操作非法";
		if(msg == "ok")
		{
			direct(window.location.href);
		}
		else
		{
			alert(msg);
			return false;
		}
	}
}

//更改权限状态
function status(id,t)
{
	if(!id)
	{
		alert("操作非法");
		return false;
	}
	var url = base_url + base_func + "=ajax_status&id="+id;
	var msg = get_ajax(url);
	if(msg == "ok")
	{
		var n_t = t == 1 ? 0 : 1;
		$("#status_"+id+" > a").attr("class","status"+n_t);
		$("#status_"+id+" > a").attr("href","javascript:status("+id+","+n_t+");void(0)");
		return true;
	}
	else
	{
		if(!msg) msg = "error: 操作非法";
		alert(msg);
		return false;
	}
}

</script>
<?php $APP->tpl->p("footer","","0");?>