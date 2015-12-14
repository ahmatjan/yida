<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><span class="lead">&nbsp;&raquo; 分类管理</span></td>
		<td align="right"><a href="<?php echo site_url('cate,set');?>" class="button">添加新分类</a></td>
	</tr>
	</table>
</div></div>

<div class="main">
<table width="100%" style="layout:fixed;" cellpadding="0" cellspacing="0">
<tr>
	<td class="t_sub" width="50px">ID</td>
	<td class="t_sub" width="35px">状态</td>
	<td class="t_sub" width="120px">模块</td>
	<td class="t_sub">名称</td>
	<td class="t_sub" width="55px">分页数</td>
	<td class="t_sub" width="55px">排序</td>
	<td class="t_sub" width="64px">操作</td>
</tr>
<?php $_i=0;$catelist=(is_array($catelist))?$catelist:array();foreach($catelist AS  $key=>$value){$_i++; ?>
<tr class="tr_out" onMouseOver="over_tr(this)" onMouseOut="out_tr(this)">
	<td align='center' class="tc_left"><?php echo $value[id];?></td>
	<?php $status = intval($value[status]);?>
	<td align="center" class="tc_right" id="status_<?php echo $value[id];?>"><a href="javascript:cate_status(<?php echo $value[id];?>,<?php echo $status;?>);void(0);" class="status<?php echo $status;?>"></a></td>
	<td align="center" class="tc_right"><?php echo $value[title] ? $value[title] : '-';?></td>
	<td align='left' class="tc_right" style="<?php echo $value[style];?>;padding:2px 0;">&nbsp;<?php echo $value[space];?><?php echo $value[cate_name];?> <span class="clue_on">[<?php echo $value[identifier];?>]</span><?php if($value[ifspec]){?>【单页信息】<?php } ?></td>
	<?php if($ifmodify){?>
	<td align="center" class="tc_right"><?php if(!$value[ifspec]){?><input type="text" class="list_short_input" value="<?php echo $value[psize];?>" onblur="update_psize(<?php echo $value[id];?>,this.value)" /><?php }else{ ?>-<?php } ?></td>
	<td align="center" class="tc_right"><input type="text" class="list_short_input" value="<?php echo $value[taxis];?>" onblur="update_taxis(<?php echo $value[id];?>,this.value)" /></td>
	<?php }else{ ?>
	<td align="center" class="tc_right"><?php if(!$value[ifspec]){?><?php echo intval($value[psize]);?><?php }else{ ?>-<?php } ?></td>
	<td align="center" class="tc_right"><?php echo intval($value[taxis]);?></td>
	<?php } ?>
	<td align="center" class="tc_right">
		<a href="<?php echo site_url('cate,set');?>cateid=<?php echo $value[id];?>" class="btn add" title="添加子分类"></a>
		<a href="<?php echo site_url('cate,set');?>id=<?php echo $value[id];?>" class="btn edit" title="编辑当前分类"></a>
		<a href="javascript:cate_del(<?php echo $value['id'];?>);void(0);" class="btn del" title="删除当前分类"></a>
	</td>
</tr>
<?php } ?>
</table>
</div>

<div class="notice"><div class="p">
	友情提示：【修改分页数及排序，无需更新，当光标离开即自动更新】<span id="cate_update_ajax_ok"></span>
</div></div>

<?php $APP->tpl->p("footer","","0");?>