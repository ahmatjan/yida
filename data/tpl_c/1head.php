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
	<meta name="keywords" content="<?php echo $_sys[keywords];?>">
	<meta name="description" content="<?php echo $_sys[description];?>">
	<?php if($_sys[siteurl]){?>
	<base href="<?php echo $_sys[siteurl];?>" />
	<?php } ?>
	<link href="<?php echo $_sys['siteurl'];?>tpl/www/css/chuangyistyle_1.css" type="text/css" rel="stylesheet" >
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery-1.9.1.min_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/common_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery.nanoscroller_1.js"></script>