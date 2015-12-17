<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><!DOCTYPE html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $_lang[cp_name];?></title>
<meta name="keywords" content="">
<meta name="description" content="">
<script type="text/javascript">
var base_file = "<?php echo HOME_PAGE;?>";
var base_url = "<?php echo $sys_app->url;?>";
var base_ctrl = "<?php echo $sys_app->config->c;?>";
var base_func = "<?php echo $sys_app->config->f;?>";
var base_dir = "<?php echo $sys_app->config->d;?>";
var phpok_data = "";
</script>
<link href="./app/admin/view/images/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="./app/admin/view/images/menu.js"></script>
<script type="text/javascript">
//计算常用的DIV宽高限制
function max_div()
{
	var win_width = $(window).width();
	if(win_width < 980) win_width = 980;
	var bar_width = win_width - 130;
	$("#desktop").css("width",win_width.toString()+"px");
	$("#foot").css("width",win_width.toString()+"px");
	$("#content_right").css("width",bar_width.toString()+"px");
	$("#content").css("width",win_width.toString()+"px");
	//计算content的高
	var win_height = $(window).height();
	var content_height = win_height - 78;
	$("#content").css("height",content_height.toString()+"px");
}


function clear_cache()
{
	var turl = base_file + "?"+base_func+"=clear_cache";
	var msg = $.ajax({url:turl,cache:false,async:false}).responseText;
	if(msg == "ok")
	{
		alert("缓存已清空！");
		return true;
	}
	else
	{
		if(!msg) msg = "error";
		alert(msg);
		return false;
	}
}

function logout()
{
	var qc = confirm("确定要退出吗？\n\n退出前请先检查Tab标签里的操作是否完成！");
	if(qc == "0")
	{
		return false;
	}
	window.location.href = "<?php echo site_url('login,logout','','&');?>";
}

//加载左侧面板
function left_panel()
{
	var turl = "<?php echo $sys_app->url('index,reload_hotlink');?>";
	turl = turl.replace(/&amp;/g,"&");
	$("#linkleft").html("Loading...");
	$.ajax({url:turl,cache:false,dataType:'html',success:function(rs){ajax_left_panel(rs);}});
}

function ajax_left_panel(rs)
{
	if(rs)
	{
		$("#linkleft").html(rs);
	}
}

function add_hotpanel(tid,tab_title,linkurl)
{
	var new_tid = "hotlink_"+tid;
	if(!linkurl)
	{
		alert("异常！没有指定目标地址！");
		return false;
	}
	linkurl += "&_hotid="+tid+"&";
	addpanel(new_tid,tab_title,linkurl);
}

ddsmoothmenu.init({
	mainmenuid: "topmenu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});
//计算宽和高，最小宽为：980px，最小高为：600px
$(window).resize(function(){max_div();});
//加载完成后，直接执行
$(document).ready(function(){
	max_div();
	var home_url = "<?php echo site_url('home','','&');?>";
	var home_html = '<iframe src="'+home_url+'" width="100%" height="100%" frameborder="0" id="phpok_home_Frame" name="phpok_home_Frame"></iframe>';
	tabpanel = new TabPanel({  
		renderTo:'content_right',
		width:$(window).width()-130,
		height:$(window).height()-78,
		active : 0,
		autoResizable:true,
		items : [{id:'phpok_home_',title:'后台首页',html:home_html,closable: false}]
    });
	//绑定热键
	hotkeys();
	//加载左侧面板
	left_panel();
});
function addpanel(tid,tab_title,linkurl)
{
	tabpanel.addTab({
		id:"tab_"+tid+"_",
		title:tab_title,
		html:'<iframe src="'+linkurl+'" width="100%" height="100%" frameborder="0" id="tab_'+tid+'_Frame" name="tab_'+tid+'_Frame"></iframe>',
		closable: true,
		disabled:false
	});
}

function tab_refresh()
{
	var obj_tab = tabpanel.getActiveTab();
	if(!obj_tab.id)
	{
		return false;
	}
	var tab_title = tabpanel.getTitle(obj_tab.id);
	//关闭标签
	tabpanel.kill(obj_tab.id);
	var if_close = obj_tab.id != "phpok_home_" ? true : false;
	tabpanel.addTab({
		id:obj_tab.id,
		title:tab_title,
		html:obj_tab.html,
		closable: if_close,
		disabled:false
	});
	//tabpanel.refresh(obj_tab.id);
	return true;
}

function change_langid(val)
{
	window.location.href = "<?php echo site_url('index,chang_langid','','&');?>langid="+val;
}

function hotkeys()
{
	$(document).bind('keydown', 'f5',function (evt){tab_refresh(); return false; });
}
</script>

</head> 
<body>
<div class="desktop top" id="desktop">
	<div class="logo"></div>
	<div class="menu">
		<div id="topmenu" class="ddsmoothmenu">
			<ul class="p_menu">
				<?php $_i=0;$rslist=(is_array($rslist))?$rslist:array();foreach($rslist AS  $key=>$value){$_i++; ?>
				<li class="p_menu"><a href="javascript:;void(0);"><?php echo $value[title];?></a>
					<?php if($value[sonlist] && count($value[sonlist])>0 && is_array($value[sonlist])){?>
					<ul>
						<?php $_i=0;$value[sonlist]=(is_array($value[sonlist]))?$value[sonlist]:array();foreach($value[sonlist] AS  $k=>$v){$_i++; ?>
						<li><a href="javascript:addpanel('<?php echo $v[id];?>','<?php echo $v[title];?>','<?php echo $v[menu_url];?>');void(0);" title="<?php echo $v[note] ? $v[note] : $v[title];?>"><?php echo $v[title];?></a></li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<div class="index_btn"><img src="./app/admin/view/images/top.gif" usemap="#m_top" /></div>
	<div class="clear"></div>
</div>
<map name="m_top" id="m_top">
	<area shape="rect" coords="90,0,110,20" href="javascript:logout();void(0);" title="退出" alt="退出" />
	<area shape="rect" coords="60,0,80,20" href="<?php echo HOME_WWW;?>" title="网站首页" alt="网站首页" target="_blank" />
	<area shape="rect" coords="30,0,50,20" href="javascript:clear_cache();void(0);" title="清空缓存" alt="清空缓存" />
	<area shape="rect" coords="0,0,20,20" href="javascript:tab_refresh();void(0);" title="刷新当前标签" alt="刷新当前标签" />
</map>
<div class="content" id="content">
	<div class="left">
		<div class="lang">
			当前正在操作的语言：<br />
			<select onchange="change_langid(this.value)">
			<?php $_i=0;$langlist=(is_array($langlist))?$langlist:array();foreach($langlist AS  $key=>$value){$_i++; ?>
			<option value="<?php echo $value[langid];?>"<?php if($_SESSION[sys_lang_id] == $value[langid]){?> selected<?php } ?>><?php echo $value[title];?></option>
			<?php } ?>
			</select>
		</div>
		<div id="linkleft"></div>
	</div>
	<div class="msg" id="content_right"></div>
</div>
<div class="foot" id="foot">
	<div id="foot_span" style="line-height:22px;"></div>
	<div>Version:<?php echo VERSION;?>, CopyRight &copy; 2004-2011 All rights reserved.</div>
</div>
</body>
</html>