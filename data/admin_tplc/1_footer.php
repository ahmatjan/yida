<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php echo $plugin_html;?>
<div id="foot" style="display:none;"><?php echo sys_debug();?></div>
<script type="text/javascript">
$("input[type=radio]").css("background","none");
$("input[type=checkbox]").css("background","none");
var t_html = $("#foot").html();
parent.$("#foot_span").html(t_html);
</script>
</body>
</html>