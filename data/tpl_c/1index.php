<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php header('Location:index.php?c=msg&ts=gk');exit; ?>
<?php $APP->tpl->p("head","","0");?>
  <style type="text/css">
  html{
    height: 100%;
  }
  </style>
  <script type="text/javascript">
  $(function() { 
  $(".IndexFoot").css("bottom","40px");
  $(window).resize(function() {
    if($(window).height()<630){
      $('body').css("height","630px");
      $('body').css("overflow","auto");
      }else{
      $('body').css("height","100%");
      $('body').css("overflow","hidden");
        }
  });
  });
  </script>
</head>
<body style="height:100%; overflow:hidden; background:none;">
<div class="IndexBox" style="height:100%;">
  <div class="HeaderBox">
    <div class="TopYuLink">
      <script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/www/js/language_1.js"></script>
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
  <?php reset($menulist);?>
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
  <div class="clear"></div>
</div>
<div class="IndexFixMid">
  <div class="LogoArea" style="text-align:center; height:auto; margin-bottom:50px;">
    <a href="index.php">
      <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/logoi_1.png" width="524" ></a>
  </div>
</div>
<div class="CopyIndex IndexFoot">
  <?php  $arr = phpok('copyright');?>
  <?php echo $arr['content'];?>
  <?php  unset($arr);?>
  <div style="text-align:center">
    <a href="">法律声明</a>
    <a href="">网站地图</a>
    <a href="">联系我们</a>
    <a href="">技术支持</a>
  </div>
</div>
</div>
<?php $APP->tpl->p("foot","","0");?>