<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("head","","0");?>
<div class="div_w m_top">
	<div class="left">
		<div class="model"><div class="bg">
			<h5>安装步骤</h5>
			<ol class="ol">
				<li class="red">安装说明</li>
				<li><a href="index.php?act=setconfig">配置安装参数</a></li>
				<li><a href="#">完成</a></li>
			</ol>
		</div></div>
		<div class="space"></div>
	</div>
	<div class="right">
		<div class="model"><div class="bg">
			<h5>协议说明</h5>
			<div class="msg" style="padding:5px 15px;">
				<div class="red">PHPOK企业站系统基于LGPL协议发布，您可以自由下载源代码并根据您的需要来使用。这是一套开源免费的企业网站系统！您的支持和认可是对开发人员的最大鼓励！</div>
				<div>请查看LGPL协议相关信息：</div>
				<blockquote>
					1、查看英文版LGPL协议：<a href="http://www.gnu.org/copyleft/lesser.html" target="_blank">http://www.gnu.org/copyleft/lesser.html</a><br /><br />
					2、查看简体中文（翻译）版：<a href="http://www.phpok.com/lgpl.html" target="_blank">http://www.phpok.com/lgpl.html</a>
				</blockquote>
				<div>同时，PHPOK还提供了两种简便的授权方式，您可以考虑购买！查看网址：<a href="http://www.phpok.com/cert.html"  target="_blank">http://www.phpok.com/cert.html</a></div>
			</div>
		</div></div>
		<div class="space"></div>
		<div class="model"><div class="bg">
			<h5>环境检测</h5>
			<div class="msg" style="padding:5px 15px;">
				<blockquote>
					1、操作系统：<span class="red"><?php echo php_uname();?></span><br />
					2、PHP版本：<span class="red"><?php echo PHP_VERSION;?></span><br />
					3、附件上传：<?php echo $ifupload;?><br />
					4、GD 库：<?php echo $gdinfo;?>
				</blockquote>
			</div>
		</div></div>
		<div class="space"></div>
		<div class="model"><div class="bg">
			<h5>目录/文件可写判断</h5>
			<div class="msg" style="padding:5px 15px;">
				<blockquote>
					<?php echo check_write("../data");?> data 网站配置信息及缓存目录<br />
					<?php echo check_write("../data/admin_tplc");?> data/admin_tplc 后台管理模板缓存目录 <br />
					<?php echo check_write("../data/tpl_c");?> data/tpl_c 前台模板缓存目录<br />
					<?php echo check_write("../upfiles");?> upfiles 附件上传目录<br />
					<?php echo check_write("../app/database.config.php");?> app/database.config.php 数据库环境配置目录
				</blockquote>
			</div>
		</div></div>
		<div class="space"></div>
		<div align="right"><button onclick="window.location.href='index.php?act=setconfig'" type="button" class="btn"><span><span>下一步，配置数据库环境</span></span></button></div>
	</div>
	<div class="clear"></div>
</div>
<?php $APP->tpl->p("foot","","0");?>