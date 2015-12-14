<?php
/***********************************************************
	Filename: app/admin/control/index.php
	Note	: 首页
	Version : 3.0
	Author  : qinggan
	Update  : 2009-10-16
***********************************************************/
class index_c extends Control
{
	function __construct()
	{
		parent::Control();
	}

	function index_c()
	{
		$this->__construct();
	}

	function index_f()
	{
		//判断是否启用了静态页
		$create_html = $this->trans_lib->safe("create_html");
		if($this->sys_config["site_type"] == "html" && $this->sys_config["sitehtml"] && !$create_html)
		{
			$html_folder = $this->sys_config["html_folder"] ? $this->sys_config["html_folder"] : "html/".$this->lang_id."/";
			if($html_folder == "/")
			{
				$html_folder = ROOT;
			}
			if(!file_exists($html_folder."index.html"))
			{
				$msg = $this->tpl->fetch("index.".$this->tpl->ext);
				$this->file_lib->vim($msg,$html_folder."index.html");
			}
			header("Location:".$this->sys_config["sitehtml"]);
			exit;
		}
		$this->tpl->display("index.".$this->tpl->ext);
	}

	//网站关闭说明
	function close_f()
	{
		$this->tpl->display("close.".$this->tpl->ext);
	}
}
?>