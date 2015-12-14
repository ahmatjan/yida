<?php
/***********************************************************
	Filename: app/admin/html.php
	Note	: 静态页生成类
	Version : 3.0
	Author  : qinggan
	Update  : 2010-12-27
***********************************************************/
class html_c extends Control
{
	var $module_sign = "html";
	var $siteurl;
	var $indexphp;
	var $sitehtml;
	var $html_folder;

	function __construct()
	{
		parent::Control();
		$this->load_model("module");//读取模块列表
		$this->load_model("cate");//读取模块列表
		$this->load_model("list");//读取产品下的列表
		$this->load_lib("html");//加载生成静态页信息（通过HTML获取）
		$this->load_model("lang");
	}

	//兼容PHP4的写法
	function html_c()
	{
		$this->__construct();
	}

	function auto_load()
	{
		//判断当前语言是否是系统默认语言，是系统默认语言，则生成的静态页放在根目录下
		$lang_rs = $this->lang_m->get_one($_SESSION["sys_lang_id"]);
		//访问网站首页
		if(!file_exists(ROOT_DATA."system_".$_SESSION["sys_lang_id"].".php"))
		{
			$r = array();
			$r["status"] = "error";
			$r["subject"] = "当前网站尚未配置相关信息！请检查！";
			exit($this->json_lib->encode($r));
		}
		include(ROOT_DATA."system_".$_SESSION["sys_lang_id"].".php");
		if(!$_sys["siteurl"])
		{
			$r = array();
			$r["status"] = "error";
			$r["subject"] = "网站网址未设置，请先设置！";
			exit($this->json_lib->encode($r));
		}
		if(substr($_sys["siteurl"],-1) != "/")
		{
			$_sys["siteurl"] .= "/";
		}
		$this->siteurl = $_sys["siteurl"];
		$this->indexphp = $_sys["indexphp"] ? $_sys["indexphp"] : "index.php";
		$this->tpl->assign("siteurl",$this->siteurl);
		$this->tpl->assign("indexphp",$this->indexphp);
		if(!$_sys["sitehtml"])
		{
			$_sys["sitehtml"] = $_sys["site_url"]."html/".$_SESSION["sys_lang_id"]."/";
		}
		if(substr($_sys["sitehtml"],-1) != "/")
		{
			$_sys["sitehtml"] .= "/";
		}
		$this->sitehtml = $_sys["sitehtml"];//静态页网址
		if(!file_exists(ROOT.$this->indexphp))
		{
			$r = array();
			$r["status"] = "error";
			$r["subject"] = "没有找到相关网页信息，请检查！";
			exit($this->json_lib->encode($r));
		}
		$this->html_folder = $_sys["html_folder"] ? $_sys["html_folder"] : "html/".$_SESSION["sys_lang_id"]."/";
		//如果是根目录，清除/
		$this->html_folder = $this->html_folder == "/" ? ROOT : ROOT.$this->html_folder;
	}

	function index_f()
	{
		sys_popedom($this->module_sign.":list","tpl");
		if(file_exists(ROOT_DATA."system_".$_SESSION["sys_lang_id"].".php"))
		{
			include(ROOT_DATA."system_".$_SESSION["sys_lang_id"].".php");
			$siteurl = $_sys["siteurl"];
		}
		if(!$siteurl)
		{
			$siteurl = $this->trans_lib->get_url();
		}
		if(substr($siteurl,-1) != "/")
		{
			$siteurl .= "/";
		}
		$this->tpl->assign("siteurl",$siteurl);
		$this->cate_m->langid($_SESSION["sys_lang_id"]);
		$this->cate_m->get_all();
		$this->cate_m->format_list(0,0);
		$catelist = $this->cate_m->flist();
		if(!$catelist) $catelist = array();
		foreach($catelist AS $key=>$value)
		{
			$value["space"] = "";
			for($i=0;$i<$value["level"];$i++)
			{
				$value["space"] .= "　　";
			}
			$catelist[$key] = $value;
		}
		$module_list = $this->module_m->all_module();//取得模块列表
		$cate_html = "<select name='typeid' id='typeid'>";
		$cate_html.= "<option value='0:0'>全部，不限制…</option>";
		$cate_html.= "<optgroup label='选择模块'>";
		$new_mlist = array();
		foreach($module_list AS $key=>$value)
		{
			if($value["ctrl_init"] == "list" && ($value["if_list"] || $value["if_msg"]))
			{
				$new_mlist[] = $value;
				$cate_html.= "<option value='".$value["id"].":0'";
				if($typeid == $value["id"].":0")
				{
					$cate_html.= " selected";
				}
				$cate_html.= ">".$value["title"];
				if(!$value["status"])
				{
					$cate_html .= "（已停用）";
				}
				$cate_html .= "</option>";
			}
		}
		$cate_html.= "</optgroup>";
		$cate_html.= "<optgroup label='选择分类'>";
		foreach($catelist AS $key=>$value)
		{
			$cate_html.= "<option value='".$value["module_id"].":".$value["id"]."'";
			if($typeid == $value["module_id"].":".$value["id"])
			{
				$cate_html.= " selected";
			}
			$cate_html.= ">【".$value["title"]."】".$value["space"].$value["cate_name"];
			if(!$value["status"])
			{
				$cate_html .= "（已停用）";
			}
			$cate_html.= "</option>";
		}
		$cate_html.= "</optgroup>";
		$cate_html.= "</select>";
		$this->tpl->assign("cate_html",$cate_html);
		$this->tpl->display("create_html/list.html");
	}

	function create_index_f()
	{
		$this->auto_load();
		$siteurl = $this->siteurl . $this->indexphp."?langid=".$_SESSION["sys_lang_id"]."&create_html=true";
		$content = $this->html_lib->get_content($siteurl);
		$htmlfile = $this->html_folder."index.html";
		$this->file_lib->vim($content,$htmlfile);
		$r = array();
		$r["status"] = "ok";
		$r["subject"] = "网页首页（语言标识：".$_SESSION["sys_lang_id"]."）静态页创建成功！";
		exit($this->json_lib->encode($r));
	}

	function create_list_set_f()
	{
		$typeid = $this->trans_lib->safe("typeid");
		if(!$typeid)
		{
			$typeid = "0:0";
		}
		$array = explode(":",$typeid);
		$mid = $array[0];
		$cid = $array[1];
		if(!$mid)
		{
			$m_rs = $this->module_m->min_max();//取得
			if(!$m_rs)
			{
				$r = array();
				$r["status"] = "error";
				$r["subject"] = "没有找到可用模块信息！";
				exit($this->json_lib->encode($r));
			}
			$mid = $m_rs["min_id"];
			$endmid = $m_rs["max_id"];
		}
		else
		{
			$endmid = $mid;
		}
		//如果没有分类ID
		if(!$cid)
		{
			$cid = 0;
			$endcid = 0;
			$c_rs = $this->cate_m->min_max($mid,$_SESSION["sys_lang_id"]);
			if($c_rs)
			{
				$cid = $c_rs["min_id"];
				$endcid = $c_rs["max_id"];
			}
		}
		else
		{
			$endcid = $cid;
		}
		$r = array();
		$r["status"] = "next";
		$r["mid"] = $mid;
		$r["endmid"] = $endmid;
		$r["cid"] = $cid;
		$r["endcid"] = $endcid;
		$r["subject"] = "正在生成静态页队列，请稍候……";
		exit($this->json_lib->encode($r));
	}

	function create_list_f()
	{
		$this->auto_load();
		$mid = $this->trans_lib->int("mid");
		$cid = $this->trans_lib->int("cid");//当前分类ID
		$endmid = $this->trans_lib->int("endmid");
		$endcid = $this->trans_lib->int("endcid");
		if(!$mid)
		{
			$r = array();
			$r["status"] = "ok";
			$r["subject"] = "操作完成";
			exit($this->json_lib->encode($r));
		}
		$m_rs = $this->module_m->get_one($mid);
		if(!$cid)
		{
			$c_rs = $this->cate_m->min_max($mid,$_SESSION["sys_lang_id"]);
			if($c_rs && $c_rs["min_id"])
			{
				$cid = $c_rs["cid"];
				$endcid = $c_rs["max_id"];
				unset($c_rs);
			}
		}
		if(!$cid)
		{
			$this->create_html_from_module($m_rs,$mid,$endmid,$cid,$endcid);
			exit;
		}
		$c_rs = $this->cate_m->get_one($cid);
		//存在模块启用了分列至列表这一参数，则生成以下代码
		if(!$m_rs["if_list"] && $m_rs["if_msg"])
		{
			$array = array($cid);
			$this->cate_m->get_sonid_array($array,$cid);
			$idstring = implode(",",$array);
			$rs = $this->cate_m->get_cate2sub($idstring,$c_rs["ordertype"]);
			if($rs["id"])
			{
				$this->load_cate2sub($rs["id"],$m_rs,$c_rs);
			}
			$r = array();
			$r["status"] = "next";
			$r["subject"] = "模块：".$m_rs["title"]." 正在创建列表至主题功能相关HTML代码！";
			if($cid<$endcid)
			{
				$r["mid"] = $mid;
				$r["cid"] = $this->cate_m->next_cid($cid,$mid,$_SESSION["sys_lang_id"]);
				$r["endcid"] = $endcid;
				$r["endmid"] = $endmid;
			}
			else
			{
				if($mid<$endmid)
				{
					$nextid = $this->module_m->next_mid($mid);
					$r["mid"] = $nextid;
					$r["endmid"] = $endmid;
					$c_rs = $this->cate_m->min_max($nextid,$_SESSION["sys_lang_id"]);
					$r["cid"] = $c_rs["min_id"];
					$r["endcid"] = $c_rs["max_id"];
				}
				else
				{
					$r["status"] = "ok";
					$r["subject"] = "列表静态页创建成功！";
				}
			}
			exit($this->json_lib->encode($r));
		}
		//如果启用封面
		$this_url = $this->html_folder.$m_rs["identifier"]."/";
		$this_url.= $c_rs["identifier"] ? $c_rs["identifier"] :"cateid-".$cid;
		if($c_rs["if_index"])
		{
			$r = array();
			$this_url .= "/index.html";
			$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
			$fsurl.= "&".$this->config->c."=list&cid=".$cid;
			$content = $this->html_lib->get_content($fsurl);
			$this->file_lib->vim($content,$this_url);
			//创建下一个分类
			if($cid < $endcid)
			{
				$r["mid"] = $mid;
				$r["cid"] = $this->cate_m->next_cid($cid,$mid,$_SESSION["sys_lang_id"]);
				$r["endcid"] = $endcid;
				$r["endmid"] = $endmid;
				$r["status"] = "next";
				$r["subject"] = "已经创建分类ID：".$cid." 封页静态页！";
			}
			else
			{
				if($mid < $endmid)
				{
					$nextid = $this->module_m->next_mid($mid);
					$r["mid"] = $nextid;
					$r["endmid"] = $endmid;
					$c_rs = $this->cate_m->min_max($nextid,$_SESSION["sys_lang_id"]);
					$r["cid"] = $c_rs["min_id"];
					$r["endcid"] = $c_rs["max_id"];
					$r["status"] = "next";
					$r["subject"] = "已经创建分类ID：".$cid." 封页静态页！";
				}
				else
				{
					$r["status"] = "ok";
					$r["subject"] = "静态列表页创建完成！";
				}
			}
			exit($this->json_lib->encode($r));
		}
		//创建第一页
		$pageid = $this->trans_lib->int("pageid");
		if($pageid<1)
		{
			$pageid = 1;
		}
		//取得这个分类下的主题数量
		$array = array($cid);
		$this->cate_m->get_sonid_array($array,$cid);
		$idstring = implode(",",$array);
		$total = $this->list_m->get_count_from_cate($idstring);
		$maxpage = 3;//每次最多生成三个列表页
		$psize = $c_rs["psize"] > 0 ? $c_rs["psize"] : SYS_PSIZE;
		$page_total = intval($total/$psize);
		if($total%$psize)
		{
			$page_total++;
		}
		$max_next = ($page_total - $pageid)>3 ? ($pageid+3) : $page_total;
		for($i=$pageid;$i<=$max_next;$i++)
		{
			//获取访问地址
			$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
			$fsurl.= "&".$this->config->c."=list&cid=".$cid."&".SYS_PAGEID."=".$i;
			$content = $this->html_lib->get_content($fsurl);
			$tmp_url = $this_url;
			if($i < 2)
			{
				$tmp_url .= "/index.html";
			}
			else
			{
				$tmp_url .= "/".$i.".html";
			}
			$this->file_lib->vim($content,$tmp_url);
			$pageid = $i;
		}
		if($pageid >= $page_total)
		{
			if($cid<$endcid)
			{
				$r["mid"] = $mid;
				$r["cid"] = $this->cate_m->next_cid($cid,$mid,$_SESSION["sys_lang_id"]);
				$r["endcid"] = $endcid;
				$r["endmid"] = $endmid;
				$r["status"] = "next";
				$r["subject"] = "分类ID：".$cid." 静态列表页已经创建成功！";
			}
			else
			{
				if($mid<$endmid)
				{
					$nextid = $this->module_m->next_mid($mid);
					$r["mid"] = $nextid;
					$r["endmid"] = $endmid;
					$c_rs = $this->cate_m->min_max($nextid,$_SESSION["sys_lang_id"]);
					$r["cid"] = $c_rs["min_id"];
					$r["endcid"] = $c_rs["max_id"];
					$r["status"] = "next";
					$r["subject"] = "分类ID：".$cid." 静态列表页已经创建成功！";
				}
				else
				{
					$r["status"] = "ok";
					$r["subject"] = "列表静态页创建成功！";
				}
			}
		}
		else
		{
			$r["mid"] = $mid;
			$r["cid"] = $cid;
			$r["endcid"] = $endcid;
			$r["endmid"] = $endmid;
			$r["status"] = "next";
			$r["pageid"] = $pageid;
			$r["subject"] = "正在创建分类列表至第 ".$pageid." 页！";
		}
		exit($this->json_lib->encode($r));
	}

	function create_html_from_module($m_rs,$mid,$endmid=0,$cid=0,$endcid=0)
	{
		$this_url = $this->html_folder.$m_rs["identifier"];
		$pageid = $this->trans_lib->int(SYS_PAGEID);
		if($pageid<1)
		{
			$pageid = 1;
		}
		$total = $this->list_m->get_count_from_module($mid);
		$psize = $m_rs["psize"] > 0 ? $m_rs["psize"] : SYS_PSIZE;
		$page_total = intval($total/$psize);
		if($total%$psize)
		{
			$page_total++;
		}
		$maxpage = 3;//每次最多生成三个列表页
		$max_next = ($page_total - $pageid)>3 ? ($pageid+3) : $page_total;
		for($i=$pageid;$i<=$max_next;$i++)
		{
			$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
			$fsurl.= "&".$this->config->c."=list&mid=".$mid."&".SYS_PAGEID."=".$i;
			$content = $this->html_lib->get_content($fsurl);
			$tmp_url = $this_url;
			if($i < 2)
			{
				$tmp_url .= "/index.html";
			}
			else
			{
				$tmp_url .= "/".$i.".html";
			}
			$this->file_lib->vim($content,$tmp_url);
			$pageid = $i;
		}
		$r = array();
		if($pageid >= $page_total)
		{
			if($mid<$endmid)
			{
				$nextid = $this->module_m->next_mid($mid);
				$r["status"] = "next";
				$r["subject"] = "当前模块：".$m_rs["title"]." 列表页已创建完毕！";
				$r["mid"] = $nextid;
				$r["endmid"] = $endmid;
				$c_rs = $this->cate_m->min_max($nextid,$_SESSION["sys_lang_id"]);
				if($c_rs)
				{
					$r["cid"] = $c_rs["min_id"];
					$r["endcid"] = $c_rs["max_id"];
					unset($c_rs);
				}
			}
			else
			{
				$r["status"] = "ok";
				$r["subject"] = "列表静态页创建成功！";
			}
		}
		else
		{
			$r["mid"] = $mid;
			$r["cid"] = $cid;
			$r["endcid"] = $endcid;
			$r["endmid"] = $endmid;
			$r["status"] = "next";
			$r["pageid"] = $pageid;
			$r["subject"] = "正在创建 【".$m_rs["title"]."】 列表至第 ".$pageid." 页！";
		}
		exit($this->json_lib->encode($r));
	}

	function create_msg_f()
	{
		$this->auto_load();
		$typeid = $this->trans_lib->safe("typeid");
		if(!$typeid)
		{
			$mid = $this->trans_lib->int("mid");
			$cid = $this->trans_lib->int("cid");
		}
		else
		{
			$array = explode(":",$typeid);
			$mid = $array[0];
			$cid = $array[1];
		}
		$r = array();
		$r["mid"] = $mid;
		$r["cid"] = $cid;
		$tid = $this->trans_lib->int("tid");//取得主题ID
		$sid = $this->trans_lib->int("sid");
		$eid = $this->trans_lib->int("eid");
		$cate_string = "";
		if(!$sid || !$eid)
		{
			if($cid)
			{
				//[读取当前分类下的子分类]
				$array = array($cid);
				$this->cate_m->get_sonid_array($array,$cid);
				$cate_string = sys_id_string($array);
				$max_min_rs = $this->list_m->max_min_id($cate_string,0,$_SESSION["sys_lang_id"],1);
			}
			else
			{
				$max_min_rs = $this->list_m->max_min_id("",$mid,$_SESSION["sys_lang_id"],1);
			}
			if(!$sid)
			{
				$sid = $max_min_rs["min_id"];
			}
			if(!$eid)
			{
				$eid = $max_min_rs["max_id"];
			}
		}
		$r["sid"] = $sid;
		$r["eid"] = $eid;
		if(!$tid)
		{
			$tid = $sid;
		}
		$this->load_write_msg($tid);
		$rs = $this->list_m->get_one($tid);
		//如果当前主题ID已经超过最大ID
		if($tid>=$eid)
		{
			$r["status"] = "ok";
			$r["subject"] = "主题静态页生成成功！";
		}
		else
		{
			//取得当前条件下的下一个主题
			$nextid = $this->list_m->get_next_id($cate_string,$mid,$_SESSION["sys_lang_id"],$tid,1);
			if($nextid)
			{
				$r["tid"] = $nextid;
				$r["status"] = "next";
				$r["subject"] = "主题静态页 <strong style='color:red;'>".$rs["title"]."</strong> 已经创建成功，正在创建下一主题！";
			}
			else
			{
				$r["status"] = "ok";
				$r["subject"] = "主题信息创建完毕！";
			}
		}
		exit($this->json_lib->encode($r));
	}

	//创建主题至内容的
	function load_cate2sub($id,$m_rs,$c_rs)
	{
		$r_url = $this->load_write_msg($id);
		$this_url = $this->html_folder.$m_rs["identifier"]."/";
		$this_url.= $c_rs["identifier"] ? $c_rs["identifier"] :"cateid-".$cid;
		$this_url.= "/index.html";
		$html = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'."\n";
		$html.= '<html xmlns="http://www.w3.org/1999/xhtml">'."\n";
		$html.= '<head>'."\n";
		$html.= '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'."\n";
		$html.= '<meta http-equiv="refresh" content="0;url='.$r_url.'">'."\n";
		$html.= '<title> Waiting....... </title>'."\n";
		$html.= '</head>'."\n";
		$html.= '<body>'."\n";
		$html.= 'waiting... <a href="'.$r_url.'">click here</a>'."\n";
		$html.= '</body>'."\n";
		$html.= '</html>'."\n";
		$this->file_lib->vim($html,$this_url);		//
	}

	//填写内容信息
	function load_write_msg($tid)
	{
		//更新内容
		$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
		$fsurl.= "&".$this->config->c."=msg&id=".$tid;
		$rs = $this->list_m->get_one($tid);
		$content = $this->html_lib->get_content($fsurl);
		$this_url = $this->html_folder;
		$return_url = $this->sitehtml;
		$this_url_end = ($rs["identifier"] && $rs["identifier"] != "index") ? $rs["identifier"].".html" : "c".$tid.".html";
		if($rs["htmltype"] == "root")
		{
			$this_url .= $this_url_end;
			$return_url .= $this_url_end;
		}
		elseif($rs["htmltype"] == "mid" || $rs["htmltype"] == "cateid")
		{
			$m_rs = $this->module_m->get_one($rs["module_id"]);
			$this_url .= $m_rs["identifier"] . "/";
			$return_url .= $m_rs["identifier"] . "/";
			if($rs["htmltype"] == "cateid" && $rs["cate_id"])
			{
				$c_rs = $this->cate_m->get_one($rs["cate_id"]);
				$this_url .= $c_rs["identifier"] ? $c_rs["identifier"] : $rs["cate_id"];
				$return_url .= $c_rs["identifier"] ? $c_rs["identifier"] : $rs["cate_id"];
				$this_url .= "/";
				$return_url .= "/";
			}
			$this_url .= $this_url_end;
			$return_url .= $this_url_end;
		}
		else
		{
			$this_url .= date("Ym/d/",$rs["post_date"]);
			$this_url .= $this_url_end;
			$return_url .= date("Ym/d/",$rs["post_date"]);
			$return_url .= $this_url_end;
		}
		//格式化HTML信息，清除空信息
		$this->file_lib->vim($content,$this_url);
		return $return_url;
	}


	//生成sitemap地址
	function sitemap_f()
	{
		$this->auto_load();
		$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
		$fsurl.= "&".$this->config->c."=sitemap&".$this->config->f."=sitemap";
		$content = $this->html_lib->get_content($fsurl);
		$this->file_lib->vim($content,ROOT."sitemap.xml");
		error("网站地图 Google Sitemap 创建成功",site_url("html"));
	}

	function baidu_sitemap_f()
	{
		$this->auto_load();
		$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
		$fsurl.= "&".$this->config->c."=sitemap&".$this->config->f."=baidu";
		$content = $this->html_lib->get_content($fsurl);
		$this->file_lib->vim($content,ROOT."sitemap_baidu.xml");
		error("网站地图 Baidu Sitemap 创建成功",site_url("html"));
	}

	function ror_f()
	{
		$this->auto_load();
		$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
		$fsurl.= "&".$this->config->c."=sitemap&".$this->config->f."=ror";
		$content = $this->html_lib->get_content($fsurl);
		$this->file_lib->vim($content,ROOT."ror.xml");
		error("ROR 创建成功",site_url("html"));
	}

	function urllist_f()
	{
		$this->auto_load();
		$fsurl = $this->siteurl.$this->indexphp."?langid=".$_SESSION["sys_lang_id"];
		$fsurl.= "&".$this->config->c."=sitemap&".$this->config->f."=urllist";
		$content = $this->html_lib->get_content($fsurl);
		$this->file_lib->vim($content,ROOT."urllist.txt");
		error("urllist 创建成功",site_url("html"));
	}

}
?>