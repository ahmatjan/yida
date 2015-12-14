<?php
/***********************************************************
	Filename: app/www/control/ajax.php
	Note	: 常用Ajax模块，可以在plugin里增加相关插件动作
	Version : 3.0
	Author  : qinggan
	Update  : 2010-08-13
***********************************************************/
class ajax_c extends Control
{
	function __construct()
	{
		parent::Control();
		$this->load_model("cate");
		$this->load_model("list");
		$this->load_model("msg");
		$this->load_model("module");
	}

	function ajax_c()
	{
		$this->__construct();
	}

	function index_f()
	{
		//插件标识
		$plugin = $this->trans_lib->safe("plugin");
		if($plugin && file_exists(ROOT_PLUGIN.$plugin."/www.php"))
		{
			include_once(ROOT_PLUGIN.$plugin."/www.php");
		}
		else
		{
			return false;
		}
	}

}