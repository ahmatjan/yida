<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<script type="text/javascript">
function to_link(t)
{
	var turl = base_file + "?"+base_ctrl+"=link&"+base_func+"="+t+"&input_id=link_url";
	Layer.init(turl,550,400);
}

</script>

<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><span class="lead">&nbsp;&raquo; <a href="<?php echo site_url('list');?>module_id=<?php echo $module_id;?>&"><?php echo $m_rs[title];?></a> &raquo; 添加/编辑信息</span></td>
	</tr>
	</table>
</div></div>

<div class="tab">
	<table cellpadding="0" cellspacing="0">
	<tr>
		<td width="150px">&nbsp;</td>
		<td class="over" id="_tab_main" title="主要内容信息，其中红色星号信息为必填" onclick="tab_set('main')">主要信息</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_ext" title="非必填的扩展字段均在这里使用" onclick="tab_set('ext')">可选扩展</td>
		<td width="10px">&nbsp;</td>
		<td>（<span style="color:red;">*</span> 号必填）</td>
	</tr>
	</table>
</div>

<form method="post" action="<?php echo site_url('list,setok');?>module_id=<?php echo $module_id;?>&id=<?php echo $id;?><?php if($_hotid){?>&_hotid=<?php echo $_hotid;?><?php } ?>" onsubmit="return to_submit();">

<div id="style_setting" style="display:none;">
	<div>
		<textarea style="width:98%;height:60px;" id="style" name="style"><?php echo $rs[style];?></textarea>
	</div>
	<div style="margin-top:5px;">
		<input type="button" class="btn2" value="加粗" onclick="style_set('font-weight:bold');">
		<input type="button" class="btn2" value="斜体" onclick="style_set('font-style:italic');">
		<input type="button" class="btn3" value="下划线" onclick="style_set('text-decoration:underline');">
		<select name="color" onchange="style_color(this.value);">
		<option value="">默认颜色</option>
		<option value="red" style="color:red;">红色</option>
		<option value="darkred" style="color:darkred;">深红色</option>
		<option value="green" style="color:green;">绿色</option>
		<option value="darkgreen" style="color:darkgreen;">深绿色</option>
		<option value="blue" style="color:blue;">蓝色</option>
		<option value="darkblue" style="color:darkblue;">深蓝色</option>
		<option value="purple" style="color:purple;">紫色</option>
		<option value="yellow" style="color:yellow;">黄色</option>
		<option value="gold" style="color:gold;">金色</option>
		<option value="saddlebrown" style="color:saddlebrown;">棕色</option>
		</select>
		<input type="button" value="清空" class="btn2" onclick="$('#style').attr('value','');" />
		<input type="button" value="关闭" class="btn2" onclick="Layer.over();" />
	</div>
	<div class="clue_on" style="margin-top:5px;">填写完CSS后，点击关闭即可，无需提交操作</div>
</div>


<div id="_msg_main">

	<?php if($ifcate){?>
	<div class="table">
		<div class="left"><span class="red">*</span> 分类：</div>
		<input type="hidden" id="cate_id" name="cate_id" value="<?php echo $rs[cate_id];?>" />
		<input type="hidden" id="cate_string" name="cate_string" value="<?php echo $cate_string;?>" />
		<input type="button" id="cate_open_string" value="<?php if($cate_id && $cate_rs[cate_name]){?><?php echo $cate_rs[cate_name];?><?php }else{ ?>请选择分类<?php } ?>" onclick="open_cate('<?php echo $module_id;?>')" class="catebtn" />
	</div>
	<?php } ?>

	<?php if($m_rs[if_biz]){?>
	<div class="table">
		<div class="left"><b><span class="red">电子商务</span></b>：</div>
		<fieldset class="biz">
			<div class="biz_div">
			价格：<input type="text" name="price" id="price" value="<?php echo $rs[price];?>" class="short_input" />
			货币：
			<?php if($curlist){?>
			<select name="price_currency">
				<?php $_i=0;$curlist=(is_array($curlist))?$curlist:array();foreach($curlist AS  $key=>$value){$_i++; ?>
				<option value="<?php echo $value[code];?>"<?php if($currency == $value[code]){?> selected<?php } ?>><?php echo $value[title];?>（<?php echo $value[code];?>）<?php if(!$value[status]){?>【禁用】<?php } ?></option>
				<?php } ?>
			</select>
			<?php }else{ ?>
			<select name="price_currency"><option value="RMB">人民币（RMB）</option></select>
			<?php } ?>
			&nbsp;
			</div>
			<div class="biz_div">
				重量：<input type="text" name="weight" id="weight" class="short_input" value="<?php echo $rs[weight];?>">
				<span class="clue_on"> 单位是：Kg</span>
			</div>
			<div class="biz_div">
				数量：<input type="text" name="qty" id="qty" class="short_input" value="<?php echo $rs[qty];?>">
				<input type="checkbox" name="is_qty" id="is_qty"<?php if($rs[is_qty]){?> checked<?php } ?>> <span class="clue_on">启用数量统计请打上勾</span>
			</div>
			<div class="biz_div">
				单位：<input type="text" name="qty_unit" id="qty_unit" class="short_input" value="<?php echo $rs[qty_unit];?>">
				<span class="clue_on">设置数量使用的单位，如：个，颗等</span>
			</div>
		</fieldset>
	</div>
	<?php } ?>


	<div class="table">
		<div class="left"><span class="red">*</span> <?php if($m_rs[title_nickname]){?><?php echo $m_rs[title_nickname];?><?php }else{ ?>主题<?php } ?>：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="subject" id="subject" class="long_input" value="<?php echo $rs[title];?>"></td>
			<td>&nbsp;</td>
			<td><select name="target" id="target">
			<option value="0">当前窗口</option>
			<option value="1"<?php if($rs[target]){?> selected<?php } ?>>新窗口</option>
			</select></td>
			<td>&nbsp;</td>
			<td><a href="javascript:Layer.inline('style_setting',430,145);void(0);" title="请将CSS写在文本框中，不超过200字符，不熟悉CSS请留空" class="btn reply"></a></td>
			<?php if($m_rs[if_propety]){?>
			<td>&nbsp;</td>
			<td><input type="checkbox" name="istop" id="istop" value="1"<?php if($rs[istop]){?>checked<?php } ?>></td>
			<td class="red"><label for="istop">&nbsp;置顶 &nbsp;</label></td>
			<td><input type="checkbox" name="isvouch" id="isvouch" value="1"<?php if($rs[isvouch]){?>checked<?php } ?>></td>
			<td class="darkblue"><label for="isvouch">&nbsp;推荐 &nbsp;</label></td>
			<td><input type="checkbox" name="isbest" id="isbest" value="1"<?php if($rs[isbest]){?>checked<?php } ?>></td>
			<td class="darkred"><label for="isbest">&nbsp;精华</label></td>
			<?php } ?>
		</tr>
		</table>
	</div>

	<?php if($m_rs[if_subtitle]){?>
	<div class="table">
		<div class="left"><?php if($m_rs[subtitle_nickname]){?><?php echo $m_rs[subtitle_nickname];?><?php }else{ ?>副主题<?php } ?>：</div>
		<input type="text" name="subtitle" id="subtitle" value="<?php echo $rs[subtitle];?>" class="long_input">
		<span class="clue_on"> 如需要，请填写</span>
	</div>
	<?php }else{ ?>
	<input type="hidden" id="subtitle" name="subtitle" value="" />
	<?php } ?>

	<?php if($m_rs[if_sign_m]){?>
	<div class="table">
		<div class="left"><span class="red">*</span> <?php if($m_rs[sign_nickname]){?><?php echo $m_rs[sign_nickname];?><?php }else{ ?>标识串<?php } ?>：</div>
			<?php if($id && $m_rs[lock_identifier]){?>
			<input type="hidden" id="identifier" name="identifier" value="<?php echo $rs[identifier];?>" />
			<input type="text" value="<?php echo $rs[identifier];?>" disabled style="color:gray;background:#eee;">
			<?php }else{ ?>
			<input type="text" name="identifier" id="identifier" value="<?php echo $rs[identifier];?>" onblur="to_check_one('<?php echo intval($id);?>','identifier',true,true)">
			<?php } ?>
		<span class="clue_on"> <span id="identifier_note" class="red"></span> 仅限字母、下划线及数字。</span>
	</div>
	<?php } ?>


	<?php if($m_rs[if_url_m]){?>
	<div class="table">
		<div class="left"><?php if($m_rs[if_url_m] == 2){?><span class="red">*</span> <?php } ?>链接网址：</div>
		<input type="text" name="link_url" id="link_url" class="long_input" value="<?php echo $rs[link_url];?>">
		<input type="button" class="btn2" value="模块" onclick="to_link('module')" />
		<input type="button" class="btn2" value="分类" onclick="to_link('cate')" />
		<input type="button" class="btn2" value="主题" onclick="to_link('subject')" />
		<input type="button" class="btn2" value="清空" onclick="$('#link_url').attr('value','');" />
	</div>
	<?php } ?>

	<?php if($m_rs[if_thumb]){?>
	<input type="hidden" name="thumb_id" id="thumb_id" value="<?php echo $rs[thumb] ? $rs[thumb_id] : '';?>">
	<div class="table">
		<div class="left">
			<div style="padding-bottom:3px;"><?php if($m_rs[if_thumb_m]){?><span class="red">*</span> <?php } ?>缩略图：</div>
			<div style="padding-bottom:3px;"><input type="button" class="btn2" value="选择" onclick="phpjs_img('thumb_id','thumb_view');" /> &nbsp;</div>
			<input type="button" value="删除" class="btn2" onclick="phpjs_clear_img('thumb_id','thumb_view')" /> &nbsp;
		</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td align="left" id="thumb_view"><?php if($rs[thumb]){?><img src="<?php echo $rs[thumb];?>" width="80px" height="80px" border="0" /><?php }else{ ?><img src="./app/admin/view/images/nopic.gif" border="0" /><?php } ?></td>
		</tr>
		<tr>
			<td><span style="color:red;"><?php echo $m_rs['inpic_desc'];?></span></td>
		</tr>
		</table>
	</div>
	<?php } ?>

	<?php if($m_rs[if_des]){?>
	<div class="table">
		<div class="left">摘要：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><?php echo sys_fckeditor('note',$rs[note],'120px','680px');?></td>
		</tr>
		<tr>
			<td style="padding-top:4px" class="clue_on">简要描述当前主题的内容，建议不要超过240个字符（含HTML代码），约80个中文字（能调用主题都可以调用相应的摘要）</td>
		</tr>
		</table>
	</div>
	<?php }else{ ?>
	<input type="hidden" id="note" name="note" value="" />
	<?php } ?>

	<?php $_i=0;$extlist_must=(is_array($extlist_must))?$extlist_must:array();foreach($extlist_must AS  $key=>$value){$_i++; ?>
	<?php echo $value;?>
	<?php } ?>

</div>

<div id="_msg_ext">

	<?php if(!$m_rs[if_sign_m]){?>
	<div class="table">
		<div class="left"><?php if($m_rs[sign_nickname]){?><?php echo $m_rs[sign_nickname];?><?php }else{ ?>标识串<?php } ?>：</div>
			<?php if($id && $m_rs[lock_identifier]){?>
			<input type="hidden" id="identifier" name="identifier" value="<?php echo $rs[identifier];?>" />
			<input type="text" value="<?php echo $rs[identifier];?>" disabled style="color:gray;background:#eee;">
			<?php }else{ ?>
			<input type="text" name="identifier" id="identifier" value="<?php echo $rs[identifier];?>" onblur="to_check_one('<?php echo intval($id);?>','identifier',true,false)">
			<?php } ?>
		<span class="clue_on"> <span id="identifier_note" class="red"></span> 仅限字母、下划线及数字。</span>
	</div>
	<?php } ?>

	<div class="table">
		<div class="left">模板文件：</div>
		<input type="text" name="tplfile" id="tplfile" value="<?php echo $rs[tplfile];?>">
		<span class="clue_on"> 不带后缀，不设置将使用系统自带模板文件：msg_<?php echo $m_rs[identifier];?></span>
	</div>

	<div class="table">
		<div class="left">显示：</div>
		<input type="radio" name="hidden" value="0"<?php if(!$rs[hidden]){?> checked<?php } ?> /> 显示
		&nbsp; 
		<input type="radio" name="hidden" value="1"<?php if($rs[hidden]){?> checked<?php } ?> /> 隐藏
		<span class="clue_on"> 隐藏后列表中不体现，但用户仍可访问</span>
	</div>
	<div class="table">
		<div class="left">点击次数：</div>
		<input type="text" name="hits" id="hits" class="short_input" value="<?php echo $rs[hits];?>">
	</div>

	<?php if($m_rs[if_hits]){?>
	<div class="table">
		<div class="left">好评与差评：</div>
		<input type="text" name="good_hits" id="good_hits" class="short_input" value="<?php echo $rs[good_hits];?>"> －
		<input type="text" name="bad_hits" id="bad_hits" class="short_input" value="<?php echo $rs[bad_hits];?>">
	</div>
	<?php }else{ ?>
	<input type="hidden" name="good_hits" value="<?php echo $rs[good_hits];?>" />
	<input type="hidden" name="bad_hits" value="<?php echo $rs[bad_hits];?>" />
	<?php } ?>

	<div class="table">
		<div class="left"><span class="red">*</span> 发布人：</div>
		<select name="author_type" id="author_type">
		<option value="admin"<?php if($rs[author_type] == "admin"){?> selected<?php } ?>>管理员</option>
		<option value="user"<?php if($rs[author_type] == "user"){?> selected<?php } ?>>会员</option>
		<option value="guest"<?php if($rs[author_type] == "guest"){?> selected<?php } ?>>游客</option>
		</select>
		<input type="text" name="author" id="author" value="<?php echo $rs[author] ? $rs[author] : $_SESSION[admin_name];?>">
	</div>

	<div class="table">
		<div class="left"><span class="red">*</span> 发布时间：</div>
		<input type="text" name="post_date" id="post_date" onfocus="show_date('post_date',true);" value="<?php echo date('Y-m-d H:i:s',$rs[post_date]);?>">
		<span class="clue_on"> 时间格式是：YYYY-MM-DD hh:ii:ss</span>
	</div>

	<div class="table">
		<div class="left">IP：</div>
		<input type="text" name="ip" value="<?php echo $rs[ip];?>">
		<span class="clue_on"> IP地址格式如：127.0.0.1，不清楚请不要留空或是保持显示值</span>
	</div>

	<?php if($id){?>
	<div class="table">
		<div class="left">排序：</div>
		<input type="text" name="taxis" id="taxis" value="<?php echo intval($rs[taxis]);?>" size="10">
		<input type="button" onclick="set_taxis_time('taxis');" class="btn4" value="时间戳排序">
		<span class="clue_on">值越大越往前靠</span>
	</div>
	<?php } ?>

	<?php if($m_rs[if_point]){?>
	<div class="table">
		<div class="left">积分：</div>
		<input type="text" name="points" id="points" class="short_input" value="<?php echo $rs[points];?>">
	</div>
	<?php } ?>

	<div class="table">
		<div class="left">SEO关键字：</div>
		<input type="text" name="keywords" id="keywords" value="<?php echo $rs[keywords];?>" class="long_input">
		<span class="clue_on"></span>
	</div>

	<div class="table">
		<div class="left">&nbsp;</div>
		<span class="clue_on">这些信息将在title中的keywords体现，多个关键字请用英文逗号隔开</span>
	</div>

	<div class="table">
		<div class="left">SEO描述：</div>
		<input type="text" name="description" id="description" value="<?php echo $rs[description];?>" class="long_input">
		<span class="clue_on">内容描述，仅限SEO使用</span>
	</div>

	<div class="table">
		<div class="left">静态页模式：</div>
		<select name="htmltype" id="htmltype">
			<option value="cateid"<?php if($rs[htmltype] == "cateid"){?> selected<?php } ?>>HTML目录/语言ID/模块标识/分类标识/*.html</option>
			<option value="date"<?php if($rs[htmltype] == "date"){?> selected<?php } ?>>HTML目录/语言ID/年月/日/*.html</option>
			<option value="mid"<?php if($rs[htmltype] == "mid"){?> selected<?php } ?>>HTML目录/语言ID/模块标识/*.html</option>
			<option value="root"<?php if($rs[htmltype] == "root"){?> selected<?php } ?>>HTML目录/语言ID/*.html（注意不能为：index标识）</option>
		</select>
	</div>

</div>

<div class="table">
	<div class="left">&nbsp;</div>
	<input type="submit" class="btn3" id="_phpok_submit" name="article_submit" value="提交">
</div>

</form>

<script type="text/javascript">
var sign_nickname = "<?php echo $m_rs[sign_nickname] ? $m_rs[sign_nickname] : '标识串';?>";
var title_nickname = "<?php echo $m_rs[title_nickname] ? $m_rs[title_nickname] : '主题';?>";
var titleid = "<?php echo intval($id);?>";//主题ID
tab_set("main");
<?php $_i=0;$extlist=(is_array($extlist))?$extlist:array();foreach($extlist AS  $key=>$value){$_i++; ?>
	<?php if($value[input] == "opt"){?>
	phpjs_parent_opt('<?php echo $value[default_val];?>','<?php echo $value[identifier];?>','<?php echo $value[id];?>','<?php echo $value[link_id];?>');
	<?php }elseif($value[input] == "img"){ ?>
	phpjs_viewpic('<?php echo $value[default_val];?>','<?php echo $value[identifier];?>');
	<?php }elseif($value[input] == "download"){ ?>
	phpjs_viewdown('<?php echo $value[default_val];?>','<?php echo $value[identifier];?>');
	<?php }elseif($value[input] == "video"){ ?>
	phpjs_viewvideo('<?php echo $value[default_val];?>','<?php echo $value[identifier];?>');
	<?php }elseif($value[input] == "module"){ ?>
	phpjs_viewmodule('<?php echo $value[default_val];?>','<?php echo $value[identifier];?>');
	<?php } ?>
<?php } ?>
function to_submit()
{
	var subject = getid("subject").value;
	if(!subject)
	{
		alert("主题不允许为空");
		tab_set("main");
		getid("subject").focus();
		return false;
	}
	//[发布人]
	var author = getid("author").value;
	if(!author)
	{
		alert("发布人账号不允许为空");
		tab_set("ext");
		getid("author").focus();
		return false;
	}
	//发布时间
	var post_date = getid("post_date").value;
	if(!post_date)
	{
		alert("发布时间不允许为空");
		tab_set("ext");
		getid("post_date").focus();
		return false;
	}
	//判断核心模块是否必填
	<?php if($ifcate){?>
	var cate_id = getid("cate_id").value;
	if(!cate_id || cate_id == "0")
	{
		alert("请选择分类");
		tab_set("main");
		return false;
	}
	<?php } ?>
	<?php if($m_rs[if_url_m] && $m_rs[if_url_m] == 2){?>
	var link_url = $("#link_url").val();
	if(!link_url)
	{
		alert("目标网址不允许为空");
		tab_set("main");
		getid("link_url").focus();
		return false;
	}
	<?php } ?>
	<?php if($m_rs[if_thumb] && $m_rs[if_thumb_m]){?>
	var thumb_id = getid("thumb_id").value;
	if(!thumb_id)
	{
		alert("请选择缩略图信息");
		tab_set("main");
		return false;
	}
	<?php } ?>
	<?php if($m_rs[if_sign_m]){?>
	var sign_chk = to_check_one(titleid,'identifier',false,true);
	if(!sign_chk)
	{
		tab_set("main");
		return false;
	}
	<?php } ?>
	<?php $_i=0;$extlist=(is_array($extlist))?$extlist:array();foreach($extlist AS  $key=>$value){$_i++; ?>
	<?php if($value[if_must] && $value[input] != "radio" && $value[input] != "checkbox"){?>
		var <?php echo $value[identifier];?> = $("#<?php echo $value[identifier];?>").val();
		if(!<?php echo $value[identifier];?>)
		{
			alert("<?php echo $value['error_note'] ? $value['error_note'] : '所有加红色星号信息均必须填写';?>");
			tab_set("main");
			return false;
		}
	<?php } ?>
	<?php } ?>
	getid("_phpok_submit").disabled = true;
}
</script>
<?php $APP->tpl->p("footer","","0");?>