<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<?php if($tlist && count($tlist)>0){?>
<div class="main">
<table width="100%" style="layout:fixed;" cellpadding="0" cellspacing="0">
<tr>
	<td class="t_sub" width="50%"><div align="left">&nbsp; 未审核数据统计</div></td>
	<td class="t_sub">&nbsp;</td>
</tr>
<tr class="tr_out">
	<?php $_i=0;$tlist=(is_array($tlist))?$tlist:array();foreach($tlist AS  $key=>$value){$_i++; ?>
	<td class="<?php echo ($key+1)%2 ? 'tc_left' : 'tc_right';?>" height="25px">
		&nbsp; &nbsp;<?php echo $value[title];?>： <span class="red"><?php echo $value[total];?></span>
		<?php if($value[mid]){?>
		<a href="javascript:parent.addpanel('<?php echo $value[mid];?>','<?php echo $value[title];?>','<?php echo $sys_app->url('list','module_id='.$value[mid]);?>');void(0);">查看</a>
		<?php } ?>
	</td>
	<?php if($_i%2===0){echo '</tr><tr>';}?>
	<?php } ?>
</tr>
</table>
</div>
<?php } ?>

<div class="main">
<table width="100%" style="layout:fixed;" cellpadding="0" cellspacing="0">
<tr>
	<td class="t_sub" width="50%"><div align="left">&nbsp; 数据统计</div></td>
	<td class="t_sub">&nbsp;</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;主题总数： <span class="darkblue"><?php echo $title_total;?></span>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;回复总数： <span class="darkblue"><?php echo $reply_total;?></span>
	</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;订单总数： <span class="darkblue"><?php echo $order_total;?></span>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;附件总数： <span class="darkblue"><?php echo $files_total;?></span>
	</td>
</tr>
</table>
</div>


<div class="main">
<table width="100%" style="layout:fixed;" cellpadding="0" cellspacing="0">
<tr>
	<td class="t_sub" width="50%"><div align="left">&nbsp; 服务器环境，<a href="<?php echo site_url('home,info');?>" target="_blank" style="color:#FFF;">点此查看PHPINFO信息</a></div></td>
	<td class="t_sub">&nbsp;</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;服务器系统： <span class="darkblue"><?php echo php_uname();?></span>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;PHP版本：<span class="darkblue"><?php echo PHP_VERSION;?></span>
	</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;附件上传： <span class="darkblue"><?php echo get_cfg_var("upload_max_filesize");?></span>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;GD信息：<span class="darkblue"><?php echo $gdinfo;?></span>
	</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;服务器引挈： <span class="darkblue"><?php echo $_SERVER['SERVER_SOFTWARE'];?></span>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;PHP运行方式：<span class="darkblue"><?php echo php_sapi_name();?></span>
	</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;Socket支持： <span class="darkblue"><?php echo function_exists('socket_accept') ? '<span class="darkblue">支持</span>' :'<span class="red">不支持</span>';?>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;程序最长运行时间：<span class="darkblue"><?php echo get_cfg_var('max_execution_time');?> 秒</span>
	</td>
</tr>
<tr class="tr_out">
	<td class="tc_left" height="25px">
		&nbsp; &nbsp;自动定义全局变量： <?php echo function_exists('register_globals') ? '<span class="darkblue"><b>YES</b></span>' :'<span class="red"><b>NO</b></span>';?>
	</td>
	<td class="tc_right">
		&nbsp; &nbsp;使用URL打开文件：<?php echo function_exists('allow_url_fopen') ? '<span class="darkblue">是，允许</span>' : '<span class="red">不允许</span>';?>
	</td>
</tr>
</table>
</div>
<?php $APP->tpl->p("footer","","0");?>