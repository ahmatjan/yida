<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>
		<?php if($sitetitle){?>
		<?php echo $sitetitle;?> -
		<?php } ?>
		<?php echo $_sys[sitename];?>
		<?php if($_sys[seotitle]){?>
		-- <?php echo $_sys[seotitle];?>
		<?php } ?>
	</title> 
	<meta name="keywords" content="<?php echo $_sys[keywords];?>">
	<meta name="description" content="<?php echo $_sys[description];?>">
	<?php if($_sys[siteurl]){?>
	<base href="<?php echo $_sys[siteurl];?>" />
	<?php } ?>
	<link href="<?php echo $_sys['siteurl'];?>tpl/www/css/chuangyistyle_1.css" type="text/css" rel="stylesheet" >
  	<link href="<?php echo $_sys['siteurl'];?>tpl/www/css/nanoscroller.css" type="text/css" rel="stylesheet" >  
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery-1.9.1.min_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/common_1.js"></script>
	<script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/jquery.nanoscroller_1.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".nano").nanoScroller({alwaysVisible: true});
		});
	</script>
</head>
<body>
<div class="InWarpBox">
	<div class="HeaderBox">
		<div class="HeaderLog">
			<a href="index.php">
			<img src="<?php echo $_sys['siteurl'];?><?php echo $_sys['logo'];?>" width="251" height="70" ></a>
		</div>
		<div class="TopYuLink">
			<!-- <?php $lang_list=phpok_lang();?>
			<?php $_i=0;$lang_list=(is_array($lang_list))?$lang_list:array();foreach($lang_list AS  $key=>$value){$_i++; ?>
				<a href="index.php?langid=<?php echo $key;?>"><?php echo $value;?></a>
			<?php } ?> -->
		</div>
		<?php $menulist = phpok_menu($id,$cid,$mid);?>
		<ul class="NavUl" id="nav">
			<?php $_i=0;$menulist=(is_array($menulist))?$menulist:array();foreach($menulist AS  $key=>$value){$_i++; ?>
			<li>
				<a href="<?php echo $value['link'];?>"><?php echo $value['title'];?></a>
				<dl>
				<?php $_i=0;$value['sonlist']=(is_array($value['sonlist']))?$value['sonlist']:array();foreach($value['sonlist'] AS  $k=>$v){$_i++; ?>
					<dd>
						<a href="<?php echo $v['link'];?>"><?php echo $v['title'];?></a>
					</dd>
				<?php } ?>
				</dl>
			</li>
			<?php } ?>
		</ul>
		<?php unset($menulist);?>
		<script type="text/javascript">
			( function(){
				var $li = $("#nav li"),
					len = $li.length;
				$li.eq(len-3).addClass('fst');
				for ( var i = len - 3; i < len; i ++ ) {
					$li.eq(i).addClass('righ');
				}
			}() );
		</script>
	</div>