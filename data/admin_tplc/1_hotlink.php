<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><ul>
	<?php $_i=0;$rslist=(is_array($rslist))?$rslist:array();foreach($rslist AS  $key=>$value){$_i++; ?>
	<li><a href="javascript:;void(0);" title="<?php echo $value[title];?>" onclick="add_hotpanel('<?php echo $value[id];?>','<?php echo $value[title];?>','<?php echo $value[linkurl];?>')"><table>
		<tr>
			<td><img src="./app/admin/view/images/ico/<?php echo $value[ico] ? $value[ico] : 'list.gif';?>" /></td>
			<td><?php echo $value[title];?></td>
		</tr>
		</table></a>
	</li>
	<?php } ?>
</ul>