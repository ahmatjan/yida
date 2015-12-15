<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("head","","0");?>
  <link href="<?php echo $_sys['siteurl'];?>tpl/tc/css/nanoscroller.css" type="text/css" rel="stylesheet" >    
  <style type="text/css">
    .nano { height: 443px; font-size:12px; border-radius:10px; }
    .nano .content { padding: 20px; }
    .nano .pane { background: #999898; width: 10px; right: 5px; margin: 5px; }
    .nano .slider { background: #727272; width:10px; }
  </style>
    <script type="text/javascript">
    $(function(){
      $(".nano").nanoScroller({alwaysVisible: true});
    });
  </script>
</head>
<body>
<link href="<?php echo $_sys['siteurl'];?>tpl/tc/css/nanoscroller.css" type="text/css" rel="stylesheet" >
<style type="text/css">
.nano { height: 443px; font-size:12px; border-radius:10px; }
.nano .content { padding: 20px; }
.nano .pane { background: #999898; width: 10px; right: 5px; margin: 5px; }
.nano .slider { background: #727272; width:10px; }
</style>
<script type="text/javascript">
  $(function(){
    $(".nano").nanoScroller({alwaysVisible: true});
  });
</script>
<div class="InWarpBox">
  <div class="HeaderBox">
    <div class="HeaderLog">
      <a href="index.php">
        <img src="<?php echo $_sys['siteurl'];?>tpl/tc/images/logo.png" width="251" height="70" ></a>
    </div>
    <div class="TopYuLink">
      <script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/tc/js/language_1.js"></script>
      <!--<a href="yindex.php" target="_blank">En</a>
    -->
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
</div>
<div class="MainBox">
  <div class="MainTit">
    <?php echo $rs['title'];?>
  </div>
  <div class="MainMid">
    <div class="LeftZ">
      <img src="<?php echo $_sys['siteurl'];?>tpl/tc/images/leftz.png" width="91" height="82" ></div>
    <div class="RighZ">
      <img src="<?php echo $_sys['siteurl'];?>tpl/tc/images/righz.png" width="86" height="84" ></div>
    <div class="MainMidTop">
      <img src="<?php echo $_sys['siteurl'];?>tpl/tc/images/mainbg_top.png" width="1007" height="55" ></div>
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
      <img src="<?php echo $_sys['siteurl'];?>tpl/tc/images/mainbg_bot.png" width="1007" height="109" ></div>
  </div>
</div>
<div class="CopyIndex">
    <?php  $arr = phpok('copyright');?>
    <?php echo $arr['content'];?>
    <?php  unset($arr);?>
</div>
</div>
</body>
</html>