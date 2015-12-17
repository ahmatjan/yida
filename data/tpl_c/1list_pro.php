<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("head","","0");?>
    <div class="MainBox">
        <div class="MainTit">
            <?php if($rs['parentid']==0){?><?php echo $rs[cate_name];?><?php }else{ ?><?php $name = phpok_catelist($rs['parentid']); echo $name['me']['cate_name'] ;?><?php } ?>
        </div>
        <div class="MainMid">
            <div class="LeftZ">
                <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/leftz.png" width="91" height="82" >
            </div>
            <div class="RighZ">
                <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/righz.png" width="86" height="84" >
            </div>
            <div class="MainMidTop">
                <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/mainbg_top.png" width="1007" height="55" >
            </div>
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
                            <?php if($value[status]){?>
                                <span><?php echo $value['name'];?></span>
                            <?php }else{ ?>
                                <a href="<?php echo $value['url'];?>" title="<?php echo $value['name'];?>"><?php echo $value['name'];?></a>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="MainMidBot">
                <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/mainbg_bot.png" width="1007" height="109" >
            </div>
        </div>
    </div>
<?php $APP->tpl->p("foot","","0");?>