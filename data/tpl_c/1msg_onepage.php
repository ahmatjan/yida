<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("head","","0");?>
	<div class="MainBox">
		<div class="MainTit">
			<?php echo $rs['title'];?>
		</div>
		<div class="MainMid">
			<div class="LeftZ">
				<img src="<?php echo $_sys['siteurl'];?>tpl/www/images/leftz.png" width="91" height="82" >
			</div>
			<div class="RighZ">
				<img src="<?php echo $_sys['siteurl'];?>tpl/www/images/righz.png" width="86" height="84" >
			</div>
			<div class="MainMidTop">
				<img src="<?php echo $_sys['siteurl'];?>tpl/www/images/mainbg_top.png" width="1007" height="55" >
			</div>
			<div class="MainMidCen">
				<div class="nano has-scrollbar">
					<div class="content">
						<div style="min-height:500px;font-size:14px; line-height:22px;">
							<?php echo $rs['content'];?>
						</div>
					</div>
				</div>
			</div>
			<div class="MainMidBot">
				<img src="<?php echo $_sys['siteurl'];?>tpl/www/images/mainbg_bot.png" width="1007" height="109" >
			</div>
		</div>
	</div>
<?php $APP->tpl->p("foot","","0");?>