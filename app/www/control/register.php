<?php
/***********************************************************
	Filename: app/www/control/register.php
	Note	: 用户控制面板
	Version : 3.0
	Author  : qinggan
	Update  : 2010-05-04
***********************************************************/
class register_c extends Control
{
	function __construct()
	{
		parent::Control();
		$this->load_model("user");
	}

	function register_c()
	{
		$this->__construct();
	}

	function index_f()
	{
		load_plugin("register:index:prev");
		if(!$this->sys_config["reg_status"])
		{
			$message = $this->sys_config["close_reg"] ? $this->sys_config["close_reg"] : "No register!";
			error($message,$this->url());
		}

		if($_SESSION["user_id"])
		{
			error($this->lang["is_logined"],$this->url());
		}

		$sitetitle = $this->lang["register"];
		$this->tpl->assign("sitetitle",$sitetitle);
		$array[0]["title"] = $this->lang["register"];
		$this->tpl->assign("leader",$array);
		load_plugin("register:index:next",true);
		$this->tpl->display("register.".$this->tpl->ext);
	}

	//存储个人信息
	function setok_f()
	{
		load_plugin("register:setok:prev");//在执行注册前的操作
		if(!$this->sys_config["reg_status"])
		{
			$message = $this->sys_config["close_reg"] ? $this->sys_config["close_reg"] : "No register!";
			error($message,$this->url());
		}
		if($_SESSION["user_id"])
		{
			error($this->lang["is_logined"],$this->url());
		}
		if(function_exists("imagecreate") && defined("SYS_VCODE_USE") && SYS_VCODE_USE == true)
		{
			$chk = $this->trans_lib->safe("sys_check");
			if(!$chk)
			{
				error($this->lang["login_vcode_empty"],$_SERVER["HTTP_REFERER"]);
			}
			$chk = md5($chk);
			if($chk != $_SESSION[SYS_VCODE_VAR])
			{
				error($this->lang["login_vcode_false"],$_SERVER["HTTP_REFERER"]);
			}
			unset($_SESSION[SYS_VCODE_VAR]);
		}
		$array = array();
		$array["email"] = $this->trans_lib->safe("email");
		$array["name"] = $this->trans_lib->safe("name");
		$newpass = $this->trans_lib->safe("newpass");
		$chkpass = $this->trans_lib->safe("chkpass");
		if(!$newpass || !$chkpass)
		{
			error($this->lang["empty_pass"],$this->url("register"));
		}
		if($newpass != $chkpass)
		{
			error($this->lang["pass_not_right"],$this->url("register"));
		}
		$array["pass"] = sys_md5($newpass);
		if(!$array["email"])
		{
			error($this->lang["empty_email"],$this->url("register"));
		}
		$chkname = $this->chkname($array["name"]);
		if($chkname != "ok")
		{
			error($chkname,$this->url("register"));
		}
		$array["regdate"] = $this->system_time;
		$array["status"] = 1;
		//会员组
		$this->load_model("usergroup");
		$group_rs = $this->usergroup_m->get_default();
		$array["groupid"] = $group_rs["id"];
		$user_id = $this->user_m->save($array);
		//会员注册成功，模拟登录
		$_SESSION["user_id"] = $user_id;
		$_SESSION["user_name"] = $array["name"];
		$_SESSION["group_id"] = $array["groupid"];
		$tmp_array = $array;
		$tmp_array["id"] = $user_id;
		$_SESSION["user_rs"] = $tmp_array;
		//存储邮件到订阅信息
		$this->load_model("subscribers_model",true);
		$chk_email = $this->subscribers_model->chk_email($email);
		if(!$chk_email)
		{
			$array = array();
			$array["email"] = $email;
			$array["status"] = $status;
			$array["postdate"] = $this->system_time;
			$array["md5pass"] = md5($email."_".$this->system_time);
			$this->subscribers_model->save($array,$id);
		}
		//发送欢迎信息
		if($this->sys_config["smtp_reg"])
		{
			$this->load_lib("email");
			$this->email_lib->reg($user_id);
		}
		load_plugin("register:setok:next");//在执行注册后的操作
		error($this->lang["register_ok"],$this->url("usercp"));
	}

	//检测会员是否存在
	function chkname_f()
	{
		load_plugin("register:chkname");
		$name = $this->trans_lib->safe("name");
		exit($this->chkname($name));
	}

	function chkname($name)
	{
		if(!$name)
		{
			return $this->lang["empty_user"];
		}
		$rs = $this->user_m->user_from_name($name);
		if($rs)
		{
			return $this->lang["user_exists"];
		}
		else
		{
			return "ok";
		}
	}
}
?>