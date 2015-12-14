<?php if(!defined('PHPOK_SET')){die('<h3>Error...</h3>');}?><?php $APP->tpl->p("header","","0");?>
<div class="notice"><div class="p">
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><span class="lead">&nbsp;&raquo; <a href="<?php echo site_url('cate');?>">分类管理</a> &raquo; 添加/编辑信息</span></td>
	</tr>
	</table>
</div></div>


<div class="tab">
	<table cellpadding="0" cellspacing="0">
	<tr>
		<td width="150px">&nbsp;</td>
		<td class="over" id="_tab_main" title="主要内容信息，其中红色星号信息为必填" onclick="tab_set('main')">主要信息</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_attr" title="属性配置" onclick="tab_set('attr')">属性配置</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_pic" title="分类图片" onclick="tab_set('pic')">分类图片</td>
		<td width="20px">&nbsp;</td>
		<td class="out" id="_tab_ext" title="扩展配置" onclick="tab_set('ext')">扩展配置</td>
		<td width="10px">&nbsp;</td>
		<td>（<span style="color:red;">*</span> 号必填）</td>
	</tr>
	</table>
</div>


<form method="post" action="<?php echo site_url('cate,setok');?>id=<?php echo $id;?>&mid=<?php echo $mid;?>" onsubmit="return to_submit(<?php echo $id;?>);">
<div id="_msg_main">
	<div class="table">
		<div class="left"><span class="red">*</span> 分类名称：</div>
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td><input type="text" name="cate_name" id="cate_name" class="long_input" value="<?php echo $rs[cate_name];?>"></td>
			<td>&nbsp;</td>
			<td>
				<select name="target" id="target">
				<option value="0">当前窗口</option>
				<option value="1"<?php if($rs[target]){?> selected<?php } ?>>新窗口</option>
				</select>
			</td>
			<td>&nbsp;</td>
			<td><input type="checkbox" name="status" id="status"<?php if($rs[status] || !$id){?> checked<?php } ?> /></td>
			<td class="clue_on">&nbsp;未审核请将勾去掉</td>
		</tr>
		</table>
	</div>

	<div class="table">
		<div class="left">副标题：</div>
		<input type="text" name="subcate" id="subcate" value="<?php echo $rs[subcate];?>">
		<span class="clue_on"> 如果需要，请填写分类副标题</span>
	</div>

	<div class="table">
		<div class="left"><span class="red">*</span> 标识串：</div>
		<input type="text" name="identifier" id="identifier" value="<?php echo $rs[identifier];?>">
		<input type="button" value="转拼音" onclick="to_pingyin();" class="btn3" />
		<span class="clue_on">限字母、下划线及数字，且必须是字母开头</span>
	</div>

	<div class="table">
		<div class="left">父级分类：</div>
		<?php echo $cate_html;?>
	</div>

	<div class="table">
		<div class="left">SEO关键字：</div>
		<input type="text" name="keywords" id="keywords" value="<?php echo $rs[keywords];?>" class="long_input">
	</div>
	<div class="table">
		<div class="left">&nbsp;</div>
		<span class="clue_on">不可见信息，针对搜索引挈优化，建议多个关键字请用英文逗号隔开</span>
	</div>

	<div class="table">
		<div class="left">SEO描述：</div>
		<input type="text" name="description" id="description" value="<?php echo $rs[description];?>" class="long_input">
		<span class="clue_on">不可见信息，限SEO使用</span>
	</div>

	<?php $inpic = $rs[inpic] ? $rs[inpic] : $m_rs[inpic];?>
	<?php if($m_rs[if_thumb]){?>
	<div class="table">
		<div class="left">前台默认图片：</div>
		<select name="inpic" id="inpic">
		<option value="">原图</option>
		<?php $_i=0;$gdlist=(is_array($gdlist))?$gdlist:array();foreach($gdlist AS  $key=>$value){$_i++; ?>
		<option value="<?php echo $value[pictype];?>"<?php if($inpic == $value[pictype]){?> selected<?php } ?>>关联：<?php echo $value[picsubject];?></option>
		<?php } ?>
		</select>
		<span class="clue_on">&nbsp;不支持缩略图的模块，此参数无效</span>
	</div>
	<?php } ?>

	<?php $psize = $rs[psize] ? $rs[psize] : $m_rs[psize];?>
	<div class="table">
		<div class="left">分页数量：</div>
		<input type="text" name="psize" id="psize" value="<?php echo $psize ? $psize : '30';?>" class="short_input">
		<span class="clue_on"> 范围1-255，建议设置为30</span>
	</div>
	
	
	<div class="table">
		<div class="left">排序：</div>
		<input type="text" name="taxis" id="taxis" value="<?php echo $rs[taxis] ? $rs[taxis] : '255';?>" class="short_input">
		<span class="clue_on"> 范围0-255，值越小越往前靠</span>
	</div>


</div>

<div id="_msg_pic">
	<div class="table">
		<div class="left">图标：</div>
		<input type="text" name="ico" id="ico" value="<?php echo $rs[ico];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('ico')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('ico')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('ico')">
	</div>

	<div class="table">
		<div class="left">小图：</div>
		<input type="text" name="small_pic" id="small_pic" value="<?php echo $rs[small_pic];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('small_pic')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('small_pic')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('small_pic')">
	</div>

	<div class="table">
		<div class="left">中图：</div>
		<input type="text" name="medium_pic" id="medium_pic" value="<?php echo $rs[medium_pic];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('medium_pic')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('medium_pic')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('medium_pic')">
	</div>

	<div class="table">
		<div class="left">大图：</div>
		<input type="text" name="big_pic" id="big_pic" value="<?php echo $rs[big_pic];?>" class="long_input clue_on" readonly>
		<input type="button" class="btn2" value="选择" onclick="phpjs_onepic('big_pic')">
		<input type="button" class="btn2" value="预览" onclick="phpjs_onepic_view('big_pic')">
		<input type="button" class="btn2" value="清空" onclick="phpjs_onepic_clear('big_pic')">
	</div>
</div>

<div id="_msg_attr">

	<div class="table">
		<div class="left">显示：</div>
		<input type="radio" name="if_hidden" value="0"<?php if(!$rs[if_hidden]){?> checked<?php } ?> /> 显示
		&nbsp; 
		<input type="radio" name="if_hidden" value="1"<?php if($rs[if_hidden]){?> checked<?php } ?> /> 隐藏
		<span class="clue_on"> 隐藏后前台不体现，但用户仍可通过网址直接访问</span>
	</div>
	
	<div class="table">
		<div class="left">是否封面：</div>
		<input type="checkbox" name="if_index" value="1"<?php if($rs[if_index]){?> checked<?php } ?> />
		<span class="clue_on"> 启用封面后，添加的数据不要放在这个分类中，模块启用“<span class="red">分类至主题</span>”时无效！</span>
	</div>
	
	<div class="table">
		<div class="left">链接网址：</div>
		<input type="text" name="linkurl" id="linkurl" class="long_input" value="<?php echo $rs[linkurl];?>">
	</div>

	<div class="table">
		<div class="left">数据排序：</div>
		<select name="ordertype" id="ordertype">
		<?php $_i=0;$order_list=(is_array($order_list))?$order_list:array();foreach($order_list AS  $key=>$value){$_i++; ?>
		<option value="<?php echo $key;?>"<?php if($rs[ordertype] == $key){?> selected<?php } ?>><?php echo $value;?></option>
		<?php } ?>
		</select>
		<span class="clue_on"> 主题置顶及自定义排序优先此排序</span>
	</div>
	
	<div class="table">
		<div class="left">封面模板：</div>
		<input type="text" name="tpl_index" id="tpl_index" value="<?php echo $rs[tpl_index];?>">
		<span class="clue_on"> 不带后缀，不设置将使用系统自带封面模板，格式为：index_模块标识串</span>
	</div>
	
	<div class="table">
		<div class="left">列表模板：</div>
		<input type="text" name="tpl_list" id="tpl_list" value="<?php echo $rs[tpl_list];?>">
		<span class="clue_on"> 不带后缀，不设置将使用系统自带封面模板，格式为：list_模块标识串</span>
	</div>
	
	<div class="table">
		<div class="left">内容模板：</div>
		<input type="text" name="tpl_file" id="tpl_file" value="<?php echo $rs[tpl_file];?>">
		<span class="clue_on"> 不带后缀，不设置将使用系统自带封面模板，格式为：msg_模块标识串</span>
	</div>

</div>

<div id="_msg_ext">
	<div class="table">
		<div class="left">分类为单页：</div>
		<input type="radio" name="ifspec" value="1"<?php if($rs[ifspec]){?> checked<?php } ?> />&nbsp;是 &nbsp;<input type="radio" name="ifspec" value="0"<?php if(!$rs[ifspec]){?> checked<?php } ?> />&nbsp;否
		<span class="clue_on">启用分类为单页功能，单页内容请写在简要描述！</span>
	</div>

	<div class="table">
		<div class="left">&nbsp;</div>
		<span class="clue_on">注意，启用单页后，如未设置内容模板，则自动读取模板：<span class="red">msg_<?php echo $m_rs[identifier];?>_spec</span></span>
	</div>

	<div class="table">
		<div class="left">
			<div style="padding-bottom: 3px;">简要描述：</div>
			<input type="hidden" id="note_tmp_id" name="note_tmp_id">
		</div>
		<?php echo sys_fckeditor('note',$rs[note],'300px','650px');?>
	</div>
</div>

<div class="table">
	<div class="left">&nbsp;</div>
	<input type="submit" class="btn2" id="_phpok_submit" name="article_submit" value="提交">
</div>

</form>

<script type="text/javascript">tab_set("main");</script>
<?php $APP->tpl->p("footer","","0");?>