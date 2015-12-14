<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><style type="text/css">
.listpic{margin:0;padding:0}
.listpic li{float:left;width:19%;border:1px solid #0C5870;margin:5px 0 0 6px;list-style:none;}
.listpic .l{height:20px;overflow:hidden;}
.listpic .img{margin:3px 0;text-align:center;height:150px;overflow:hidden;}
</style>
<div class="main" style="border:0;">
<ul class="listpic">
	<?php $_i=0;$rslist=(is_array($rslist))?$rslist:array();foreach($rslist AS  $key=>$value){$_i++; ?>
	<li><div onMouseOver="this.style.backgroundColor='#52EBC9'" onMouseOut="this.style.backgroundColor=''" style="padding:5px;cursor:default;">
		<div class="img"><img src="<?php echo $value[thumb] ? $value[thumb] : './app/admin/view/images/nopic.gif';?>" border="0" onclick="phpjs_preview('<?php echo $value[thumb_id];?>')" class="hander" /></div>
		<?php if($ifcate){?>
		<div><b>分类：</b><?php echo $value[cate_name] ? $value[cate_name] : '<span class="darkblue">未设置</span>';?></div>
		<?php } ?>
		<div class="l"><b>主题：</b><span style="<?php echo $value[style];?>"><?php echo $value[title];?></span><?php if($value[istop]){?> <span class="red">[顶]</span><?php } ?><?php if($value[isvouch]){?> <span class="darkblue">[荐]</span><?php } ?><?php if($value[isbest]){?> <span class="darkred">[精]</span><?php } ?> <?php if($value[identifier]){?><span class="clue_on">【<?php echo $value[identifier];?>】</span><?php } ?></div>
		<?php if($m_rs[if_biz] && $value[price]){?>
		<div><b>售价：</b><?php echo sys_format_price($value[price],$value[price_currency]);?></div>
		<?php } ?>
		<div><b>时间：</b><?php echo date('Y-m-d H:i',$value[post_date]);?></div>
		<?php $_i=0;$mlist=(is_array($mlist))?$mlist:array();foreach($mlist AS  $k=>$v){$_i++; ?>
		<div class="l"><b><?php echo $v;?>：</b><?php echo $value[$k];?></div>
		<?php } ?>
		<div>
			<table>
			<tr>
				<td><input type="checkbox" value="<?php echo $value[id];?>" /></td>
				<td><input type="text" class="center" style="width:40px;" id="taxis_<?php echo $value[id];?>" value="<?php echo $value[taxis];?>" alt="排序" /></td>
				<td><div id="status_<?php echo $value['id'];?>"><a href="javascript:status(<?php echo $value[id];?>,<?php echo intval($value['status']);?>);void(0);" class="status<?php echo intval($value['status']);?>"></a></div></td>
				<?php if($m_rs[if_reply]){?><td><a href="<?php echo site_url('reply');?>tid=<?php echo $value[id];?>" class="btn reply" title="留言"></a></td><?php } ?>
				<td><a href="<?php echo site_url('list,set');?>id=<?php echo $value[id];?>" class="btn edit" title="编辑"></a></td>
				<td><a href="javascript:del(<?php echo $value['id'];?>);void(0);" class="btn del" title="删除"></a></td>
			</tr>
			</table>
		</div>
	</div></li>
	<?php } ?>
</ul>
<div class="clear"></div>
</div>