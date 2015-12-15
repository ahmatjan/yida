<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("head","","0");?>
<body>
<div class="InWarpBox">
    <div class="HeaderBox">
        <div class="HeaderLog">
            <a href="index.php">
                <img src="<?php echo $_sys['siteurl'];?>tpl/tc//images/logo.png" width="251" height="70" ></a>
        </div>
        <div class="TopYuLink">
            <script type="text/javascript" src="<?php echo $_sys['siteurl'];?>tpl/tc/js/language_1.js"></script>
        </div>
        <?php  $menulist = phpok_menu($id,$cid,$mid) ;?>
        <ul class="NavUl" id="nav">
            <?php $_i=0;$menulist=(is_array($menulist))?$menulist:array();foreach($menulist AS  $key => $items ){$_i++; ?>
            <li>
                <a href="<?php echo $items['link'];?>"><?php echo $items['title'];?></a>
                <?php if( isset( $items[sonlist] ) ){?>
                <dl>
                    <?php $_i=0;$items[sonlist]=(is_array($items[sonlist]))?$items[sonlist]:array();foreach($items[sonlist] AS  $keys => $value ){$_i++; ?>
                    <dd>
                        <a href="<?php echo $value['link'];?>"><?php echo $value['title'];?></a>
                    </dd>
                    <?php } ?>
                </dl>
                <?php } ?>
            </li>
            <?php } ?>
        </ul>
        <?php  unset($menulist);?>
        <script type="text/javascript">
          var oNav = document.getElementById('nav'),
              aList = oNav.getElementsByTagName('li');
          aList[4].className = 'righ fst';
          aList[5].className = 'righ';
          aList[6].className = 'righ';
        </script>
    </div>
    <div class="MainBox">
        <div class="MainTit">
            <?php if($rs['parentid']==0){?><?php echo $rs[cate_name];?><?php }else{ ?><?php $name = phpok_catelist($rs['parentid']); echo $name['me']['cate_name'] ;?><?php } ?>
        </div>
        <div class="MainMid">
            <div class="LeftZ">
                <img src="<?php echo $_sys['siteurl'];?>tpl/tc//images/leftz.png" width="91" height="82" ></div>
            <div class="RighZ">
                <img src="<?php echo $_sys['siteurl'];?>tpl/tc//images/righz.png" width="86" height="84" ></div>
            <div class="MainMidTop">
                <img src="<?php echo $_sys['siteurl'];?>tpl/tc//images/mainbg_top.png" width="1007" height="55" ></div>
            <div class="MainMidCen">
                <div class="NewsListBox">
                    <ul>
                        <?php $_i=0;$rslist=(is_array($rslist))?$rslist:array();foreach($rslist AS  $value){$_i++; ?>
                        <li>
                            <a href="<?php echo msg_url($value);?>"><?php echo $value['title'];?></a>
                        </li>
                        <?php } ?>
                    </ul>
                    <?php if(!$rslist){?>
                    暂无该类别的信息
                    <?php } ?>
                    <div class="PageArea">
                        <?php $_i=0;$pagelist=(is_array($pagelist))?$pagelist:array();foreach($pagelist AS  $key => $value){$_i++; ?>
                        <a href="<?php echo $value['url'];?>" <?php echo $value[status] ? 'class="active"' : '';?> title="<?php echo $value['name'];?>"><?php echo $value['name'];?></a>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="MainMidBot">
                <img src="<?php echo $_sys['siteurl'];?>tpl/tc//images/mainbg_bot.png" width="1007" height="109" ></div>
        </div>
    </div>
    <div class="CopyIndex">
        <?php  $arr = phpok('copyright');?>
        <?php echo $arr['content'];?>
        <?php  unset($arr);?>
    </div>
</div>
<?php $APP->tpl->p("foot","","0");?>