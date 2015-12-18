<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<script type="text/javascript">
function tab_set(v)
{
	getid("_tab_main").className = "out";
	getid("_tab_smtp").className = "out";
	getid("_tab_video").className = "out";
	getid("_tab_ext").className = "out";
	getid("_msg_main").style.display = "none";
	getid("_msg_smtp").style.display = "none";
	getid("_msg_video").style.display = "none";
	getid("_msg_ext").style.display = "none";
	getid("_tab_"+v).className = "over";
	getid("_msg_"+v).style.display = "";
}

function setting_web(t)
{
	if(t == "html")
	{
		$("#html_setting").show();
	}
	else
	{
		$("#html_setting").hide();
	}
}
</script>
<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><span class="lead">&nbsp;&raquo; 网站信息配置</span></td>
	</tr>
	</table>
</div></div>

<div class="tab">
	<table cellpadding="0" cellspacing="0">
	<tr>
		<td width="150px">&nbsp;</td>
		<td class="over" id="_tab_main" title="网站信息" onclick="tab_set('main')">网站信息</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_smtp" title="SMTP邮件发送通知设置" onclick="tab_set('smtp')">邮件通知设置</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_video" title="视频参数设置" onclick="tab_set('video')">视频设置</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_ext" title="其他设置" onclick="tab_set('ext')">其他设置</td>
		<td width="10px">&nbsp;</td>
		<td>（<span style="color:red;">*</span> 号必填）</td>
	</tr>
	</table>
</div>


<form method="post" action="<?php echo site_url('setting,setok');?>id=<?php echo $groupid;?>" onsubmit="return to_submit();">

<div id="_msg_main">
	<div class="table">
		<div class="left">网站名称：</div>
		<input type="text" name="sitename" id="sitename" class="long_input" value="<?php echo $rs[sitename];?>">
	</div>

	<div class="table">
		<div class="left">标题附加字：</div>
		<input type="text" name="seotitle" id="seotitle" class="long_input" value="<?php echo $rs[seotitle];?>">
	</div>

	<div class="table">
		<div class="left">网站网址：</div>
		<input type="text" name="siteurl" id="siteurl" class="long_input" value="<?php echo $rs[siteurl];?>">
		<span class="clue_on">[输入网址，最后要带/]</span>
	</div>

	<div class="table">
		<div class="left">动态页首页：</div>
		<input type="text" name="indexphp" id="indexphp" value="<?php echo $rs[indexphp];?>">
		<span class="clue_on">[默认或是为空使用index.php，如要修改，请同时修改前台的常量HOME_PAGE参数]</span>
	</div>

	<div class="table">
		<div class="left">网站关键字：</div>
		<input type="text" name="keywords" id="keywords" class="long_input" value="<?php echo $rs[keywords];?>">
		<span class="clue_on">[多个关键字用英文逗号隔开，用于SEO]</span>
	</div>

	<div class="table">
		<div class="left">网站描述：</div>
		<input type="text" name="description" id="description" class="long_input" value="<?php echo $rs[description];?>">
		<span class="clue_on">[简单描述一下站点的信息，用于SEO]</span>
	</div>

	<div class="table">
		<div class="left">网站LOGO：</div>
		<input type="text" name="logo" id="logo" value="<?php echo $rs[logo];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('logo')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('logo')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('logo')">
	</div>
</div>

<div id="_msg_smtp">
	<div class="table">
		<div class="left">SMTP服务器：</div>
		<input type="text" name="smtp_server" id="smtp_server" value="<?php echo $rs[smtp_server];?>">
	</div>
	<div class="table">
		<div class="left">端口：</div>
		<input type="text" name="smtp_port" id="smtp_port" class="short_input" value="<?php echo $rs[smtp_port];?>">
		<span class="clue_on">默认是 25</span>
	</div>
	<div class="table">
		<div class="left">编码：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="smtp_charset" value="gbk"<?php if($rs[smtp_charset] == "gbk"){?> checked<?php } ?> /></td>
			<td>&nbsp;GBK &nbsp; &nbsp;</td>
			<td><input type="radio" name="smtp_charset" value="utf8"<?php if($rs[smtp_charset] == "utf8"){?> checked<?php } ?> /></td>
			<td>&nbsp;UTF-8 &nbsp; &nbsp;</td>
			<td class="clue_on">国内邮件服务器一般不支持UTF-8，建议您使用GBK</td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">SSL：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="smtp_ssl" value="1"<?php if($rs[smtp_ssl]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="smtp_ssl" value="0"<?php if(!$rs[smtp_ssl]){?> checked<?php } ?> /></td>
			<td>&nbsp;禁用 &nbsp; &nbsp;</td>
			<td class="clue_on">一般情况下不需要启用此功能（Google邮箱需要启用此功能）</td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">登录账号：</div>
		<input type="text" name="smtp_user" id="smtp_user" value="<?php echo $rs[smtp_user];?>">
	</div>
	<div class="table">
		<div class="left">登录密码：</div>
		<input type="password" name="smtp_pass" id="smtp_pass" value="<?php echo $rs[smtp_pass];?>">
	</div>
	<div class="table">
		<div class="left">回复邮箱：</div>
		<input type="text" name="smtp_reply" id="smtp_reply" value="<?php echo $rs[smtp_reply];?>">
	</div>
	<div class="table">
		<div class="left">管理员邮箱：</div>
		<input type="text" name="smtp_admin" id="smtp_admin" value="<?php echo $rs[smtp_admin];?>">
	</div>
	<div class="table">
		<div class="left">发件人名称：</div>
		<input type="text" name="smtp_fromname" id="smtp_fromname" value="<?php echo $rs[smtp_fromname];?>">
		<span class="clue_on">未设置，将使用系统的：Webmaster</span>
	</div>

	<div class="table">
		<div class="left">注册通知：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="smtp_reg" value="1"<?php if($rs[smtp_reg]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="smtp_reg" value="0"<?php if(!$rs[smtp_reg]){?> checked<?php } ?> /></td>
			<td>&nbsp;禁用 &nbsp; &nbsp;</td>
			<td class="clue_on"> 不推荐使用</td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">订单通知：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="smtp_order" value="1"<?php if($rs[smtp_order]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="smtp_order" value="0"<?php if(!$rs[smtp_order]){?> checked<?php } ?> /></td>
			<td>&nbsp;禁用 &nbsp; &nbsp;</td>
			<td class="clue_on"> 不推荐使用</td>
		</tr>
		</table>
	</div>
</div>

<div id="_msg_video">
	<div class="table">
		<div class="left">视频宽高：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="video_width" id="video_width" value="<?php echo $rs[video_width];?>" class="short_input"></td>
			<td>&nbsp;px 【宽】，</td>
			<td><input type="text" name="video_height" id="video_height" value="<?php echo $rs[video_height];?>" class="short_input"></td>
			<td>&nbsp;px 【高】</td>
			<td></td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">默认预览图片：</div>
		<input type="text" name="video_image" id="video_image" value="<?php echo $rs[video_image];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('video_image')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('video_image')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('video_image')">
	</div>
</div>

<div id="_msg_ext">
	<div class="table">
		<div class="left">网站状态：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="site_status" value="1"<?php if($rs[site_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="site_status" value="0"<?php if(!$rs[site_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;关闭 &nbsp;</td>
			<td class="clue_on">关闭网站时请写上关闭说明</td>
			<td></td>
			<td></td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">关闭说明：</div>
		<input type="text" name="close_reason" id="close_reason" class="long_input" value="<?php echo $rs[close_reason];?>">
	</div>
	<div class="table">
		<div class="left">注册控制：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="reg_status" value="1"<?php if($rs[reg_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="reg_status" value="0"<?php if(!$rs[reg_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;关闭 &nbsp;</td>
			<td class="clue_on">禁用注册功能，会员将不能注册成为新会员</td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">禁用注册说明：</div>
		<input type="text" name="close_reg" id="close_reg" class="long_input" value="<?php echo $rs[close_reg];?>">
	</div>
	<div class="table">
		<div class="left">登录控制：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="login_status" value="1"<?php if($rs[login_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="login_status" value="0"<?php if(!$rs[login_status]){?> checked<?php } ?> /></td>
			<td>&nbsp;关闭 &nbsp;</td>
			<td class="clue_on">禁用登录功能，网站会员将不能登录！</td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">禁用登录说明：</div>
		<input type="text" name="close_log" id="close_log" class="long_input" value="<?php echo $rs[close_log];?>">
	</div>
	<div class="table">
		<div class="left">搜索关联图片：</div>
		<select name="search_thumb" id="search_thumb">
		<option value="">不关联</option>
		<?php $_i=0;$gdlist=(is_array($gdlist))?$gdlist:array();foreach($gdlist AS  $key=>$value){$_i++; ?>
		<option value="<?php echo $value[pictype];?>"<?php if($rs[search_thumb] == $value[pictype]){?> selected<?php } ?>><?php echo $value[picsubject];?></option>
		<?php } ?>
		</select>
	</div>
	<div class="table">
		<div class="left">购物车图片：</div>
		<select name="cart_thumb" id="cart_thumb">
		<option value="">不关联</option>
		<?php $_i=0;$gdlist=(is_array($gdlist))?$gdlist:array();foreach($gdlist AS  $key=>$value){$_i++; ?>
		<option value="<?php echo $value[pictype];?>"<?php if($rs[cart_thumb] == $value[pictype]){?> selected<?php } ?>><?php echo $value[picsubject];?></option>
		<?php } ?>
		</select>
	</div>
	<div class="table">
		<div class="left">账单地址：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="cart_address" value="1"<?php if($rs[cart_address]){?> checked<?php } ?> /></td>
			<td>&nbsp;启用 &nbsp; &nbsp;</td>
			<td><input type="radio" name="cart_address" value="0"<?php if(!$rs[cart_address]){?> checked<?php } ?> /></td>
			<td>&nbsp;关闭 &nbsp;</td>
			<td class="clue_on">启用后将支持客户单独填写账单地址（适合外贸类网站）</td>
		</tr>
		</table>
	</div>

	<div class="table">
		<div class="left">搜索分页数量：</div>
		<input type="text" name="search_page" id="search_page" style="width:50px;" value="<?php echo $rs[search_page];?>" />
	</div>
	<div class="table">
		<div class="left">访问方式：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="radio" name="site_type" value="html"<?php if($rs[site_type] == "html"){?> checked<?php } ?> onclick="setting_web('html')" /></td>
			<td>&nbsp;静态页 &nbsp; &nbsp;</td>
			<td><input type="radio" name="site_type" value="rewrite"<?php if($rs[site_type] == "rewrite"){?> checked<?php } ?> onclick="setting_web('rewrite')" /></td>
			<td>&nbsp;伪静态 &nbsp; &nbsp;</td>
			<td><input type="radio" name="site_type" value=""<?php if(!$rs[site_type]){?> checked<?php } ?> onclick="setting_web('')" /></td>
			<td>&nbsp;动态页 &nbsp;</td>
			<td class="clue_on">&nbsp;</td>
		</tr>
		</table>
	</div>
	
	<div id="html_setting"<?php if($rs[site_type] != "html"){?> style="display:none;"<?php } ?>>
		<div class="table">
			<div class="left">HTML网址：</div>
			<input type="text" name="sitehtml" id="sitehtml" class="long_input" value="<?php echo $rs[sitehtml];?>">
			<span class="clue_on">[输入网址，最后要带/，如http://demo3.phpok.com/zh/]</span>
		</div>

		<div class="table">
			<div class="left">静态页目录：</div>
			<input type="text" name="html_folder" id="html_folder" value="<?php echo $rs[html_folder];?>">
			<span class="clue_on">[必须以“/”结尾，根目录存储请设置为“/”，为空使用html/<?php echo $_SESSION[sys_lang_id];?>/ <span class="red"> 请慎重设置，相对于根目录！</span>]</span>
		</div>
	</div>

	<div class="table">
		<div class="left">百度联盟：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="baidu_union_verify" id="baidu_union_verify" class="long_input" value="<?php echo $rs[baidu_union_verify];?>" /></td>
		</tr>
		</table>
	</div>

	<div class="table">
		<div class="left">搜索引挈验证：</div>
		<span class="clue_on">[网站所有权验证，填写相关搜索引擎的网站验证代码，将显示在前台页面头部HEAD区内]</span>
	</div>
	<div class="table">
		<div class="left">谷歌：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="google_site_verification" id="google_site_verification" class="long_input" value="<?php echo $rs[google_site_verification];?>" /></td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">雅虎：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="yahoo_site_key" id="yahoo_site_key" class="long_input" value="<?php echo $rs[yahoo_site_key];?>" /></td>
		</tr>
		</table>
	</div>
	<div class="table">
		<div class="left">必应：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="ms_site_validate" id="ms_site_validate" class="long_input" value="<?php echo $rs[ms_site_validate];?>" /></td>
		</tr>
		</table>
	</div>
</div>

<div class="table">
	<div class="left">&nbsp;</div>
	<input type="submit" class="btn2" id="_phpok_submit" name="article_submit" value="提交"<?php if(!$if_modify){?> disabled<?php } ?>>
</div>

</form>

<script type="text/javascript">
function to_submit()
{
	getid("_phpok_submit").disabled = true;
}
tab_set("main");
</script>
<?php $APP->tpl->p("footer","","0");?>