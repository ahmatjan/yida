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
                <div class="nano has-scrollbar">
                    <div class="content">
                        <style>
                            .cate-item{
                                overflow: hidden;
                            }
                            .cate-item h3{
                                margin: 16px 0 37px 0;
                                height: 29px;
                                line-height: 29px; 
                                text-indent: 13px;
                                font-size: 25px;
                                font-weight: normal;
                                color: #585350;
                                background: url(tpl/www/images/title-icon.png) no-repeat left top;
                                width: 2000px;
                            }
                            .cate-item h3:after{
                                content: "";
                                display: inline-block;
                                width: 827px;
                                height: 1px;
                                border-bottom: 1px solid #c8c7c7;
                                margin: 8px 20px;
                                background-color: #a2a5a4;
                            }
                            .cate-item .art-item{
                                width: 148px;
                                height: 148px;
                                float: left;
                                margin: 0 57px 42px 0;
                                font-size: 0;
                                overflow: hidden;
                                border-radius: 5px;
                            }
                            .cate-item .art-item a{
                                display: block;
                                background: #8c8c8c;
                            }
                            .cate-item .art-item a:hover{
                                background: #97187b;
                            }
                        </style>
                        <div style="min-height:500px;font-size:14px; line-height:22px;">
                            <?php $arr=phpok_catelist($cid);$clist=$arr['rslist'];;?>
                            <?php $_i=0;$clist=(is_array($clist))?$clist:array();foreach($clist AS  $value){$_i++; ?>
                                <?php $arr1=phpok_c_list($value['identifier']);$plist=$arr1['rslist'];?>
                                <div class="cate-item">
                                    <h3 style="text-transform:uppercase;"><?php echo $value['cate_name'];?> <?php echo $value['identifier'];?></h3>
                                    <?php $_i=0;$plist=(is_array($plist))?$plist:array();foreach($plist AS  $value){$_i++; ?>
                                    <div class="art-item">
                                        <a href ="<?php echo msg_url($value);?>">
                                            <img src="<?php echo $value['picture'];?>" alt="<?php echo $value['title'];?>">
                                            <?php echo $value['title'];?>
                                        </a>
                                    </div>
                                    <?php } ?>
                                    <div class="clear"></div>
                                </div>
                            <?php } ?>
                            <?php unset($arr,$clist,$arr1,$plist);?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="MainMidBot">
                <img src="<?php echo $_sys['siteurl'];?>tpl/www//images/mainbg_bot.png" width="1007" height="109" >
            </div>
        </div>
    </div>
<?php $APP->tpl->p("foot","","0");?>