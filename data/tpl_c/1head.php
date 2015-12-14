<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><?php if($sitetitle){?>
		<?php echo $sitetitle;?> -
		<?php } ?>
		<?php echo $_sys[sitename];?>
		<?php if($_sys[seotitle]){?>
		-- <?php echo $_sys[seotitle];?>
		<?php } ?></title> 
	<meta name="keywords" content="<?php echo $_sys[keywords];?>,qinggan,phpok">
	<meta name="description" content="<?php echo $_sys[description];?> - PHPOK.COM">
	<?php if($_sys[siteurl]){?>
	<base href="<?php echo $_sys[siteurl];?>" />
	<?php } ?>
	<script type="text/javascript"> 
		var base_file = "<?php echo $_sys[siteurl];?><?php echo HOME_PAGE;?>"; 
		var base_url = "<?php echo $_sys[siteurl];?><?php echo $sys_app->url;?>"; 
		var base_ctrl = "<?php echo $sys_app->config->c;?>"; 
		var base_func = "<?php echo $sys_app->config->f;?>"; 
		var base_dir = "<?php echo $sys_app->config->d;?>"; 
	</script>
	<link href="<?php echo $_sys['siteurl'];?>tpl/www/css/chuangyistyle_1.css" type="text/css" rel="stylesheet" >
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery-1.9.1.min_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/common_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery.nanoscroller_1.js"></script>