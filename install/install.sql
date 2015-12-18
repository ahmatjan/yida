-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 12 月 18 日 14:06
-- 服务器版本: 5.5.20-log
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jituan`
--

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_admin`
--

CREATE TABLE IF NOT EXISTS `qinggan_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `name` varchar(50) NOT NULL COMMENT '账号',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `pass` varchar(50) NOT NULL COMMENT '密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1正常0锁定',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统管理员0普通管理员',
  `popedom` text NOT NULL COMMENT '权限',
  `langid` varchar(255) NOT NULL COMMENT '可操作的语言权限，系统管理员不限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `qinggan_admin`
--

INSERT INTO `qinggan_admin` (`id`, `name`, `email`, `pass`, `status`, `if_system`, `popedom`, `langid`) VALUES
(1, 'admin', 'admin@admin.com', '14e1b600b1fd579f47433b88e8d85291', 1, 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_cache`
--

CREATE TABLE IF NOT EXISTS `qinggan_cache` (
  `id` varchar(50) NOT NULL COMMENT 'ID号',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `content` longtext NOT NULL COMMENT '缓存内容',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存时间',
  PRIMARY KEY (`id`,`langid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_cart`
--

CREATE TABLE IF NOT EXISTS `qinggan_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `sessid` varchar(50) NOT NULL COMMENT '会员session id号',
  `proid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID号，为0表示用户自行填写',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `amount` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '产品数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '产品单价',
  `price_currency` varchar(3) NOT NULL COMMENT '货币类型',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前产品操作最后时间',
  `thumb_id` int(11) NOT NULL COMMENT '图片ID，0或空不使用图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_cate`
--

CREATE TABLE IF NOT EXISTS `qinggan_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `identifier` varchar(30) NOT NULL COMMENT '标识串，必须是唯一的',
  `langid` varchar(5) NOT NULL COMMENT '语言标识',
  `cate_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，如果为根分类，则使用0',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `tpl_index` varchar(100) NOT NULL COMMENT '封面模板',
  `tpl_list` varchar(100) NOT NULL COMMENT '列表模板',
  `tpl_file` varchar(100) NOT NULL COMMENT '内容模板',
  `if_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是封面，0否1是',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1使用中0禁用',
  `if_hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1隐藏0显示',
  `keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `description` varchar(255) NOT NULL COMMENT 'SEO描述',
  `ifspec` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0非单页1单页',
  `note` text NOT NULL COMMENT '简要描述',
  `psize` tinyint(3) unsigned NOT NULL DEFAULT '30' COMMENT '每页显示数量，默认30',
  `inpic` varchar(100) NOT NULL COMMENT '前台默认图片关联',
  `linkurl` varchar(255) NOT NULL COMMENT '自定义链接',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开1是0否',
  `ordertype` varchar(100) NOT NULL DEFAULT 'post_date:desc' COMMENT '排序类型，默认是发布时间',
  `subcate` varchar(100) NOT NULL COMMENT '分类副标题',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `small_pic` varchar(255) NOT NULL COMMENT '小图',
  `medium_pic` varchar(255) NOT NULL COMMENT '中图',
  `big_pic` varchar(255) NOT NULL COMMENT '大图',
  `fields` varchar(255) NOT NULL COMMENT '有效字段',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- 转存表中的数据 `qinggan_cate`
--

INSERT INTO `qinggan_cate` (`id`, `identifier`, `langid`, `cate_name`, `parentid`, `module_id`, `tpl_index`, `tpl_list`, `tpl_file`, `if_index`, `taxis`, `status`, `if_hidden`, `keywords`, `description`, `ifspec`, `note`, `psize`, `inpic`, `linkurl`, `target`, `ordertype`, `subcate`, `ico`, `small_pic`, `medium_pic`, `big_pic`, `fields`) VALUES
(1, 'news', 'zh', '企业新闻', 0, 7, '', '', '', 0, 10, 1, 0, '企业新闻111', '企业新闻111', 0, '', 10, '', '', 0, 'post_date:desc', '', 'upfiles/201009/01/f2338b8c2f4bc013.jpg', '', '', '', ''),
(44, 'guanzhu', 'zh', '媒体关注', 0, 7, '', '', '', 0, 10, 1, 0, '媒体关注', '媒体关注', 0, '', 10, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(74, 'news', 'tc', '企業新聞', 0, 7, '', '', '', 0, 10, 1, 0, '', '', 0, '', 10, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(53, 'about_us', 'zh', '关于益达', 0, 20, '', '', '', 0, 10, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(75, 'guanzhu', 'tc', '媒體關注', 0, 7, '', '', '', 0, 20, 1, 0, '', '', 0, '', 10, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(57, 'software', 'zh', '教育软件', 0, 52, '', '', '', 0, 10, 1, 0, '', '', 0, '', 255, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(82, 'learn', 'zh', '学', 57, 52, '', '', '', 0, 10, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(83, 'practice', 'zh', '练', 57, 52, '', '', '', 0, 20, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(84, 'test', 'zh', '考', 57, 52, '', '', '', 0, 30, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(85, 'contest', 'zh', '赛', 57, 52, '', '', '', 0, 40, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(86, 'cretificate', 'zh', '证', 57, 52, '', '', '', 0, 50, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(76, 'software', 'tc', '教育軟件', 0, 52, '', '', '', 0, 30, 1, 0, '', '', 0, '', 10, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(77, 'about_us', 'tc', '文章單頁', 0, 20, '', '', '', 0, 40, 1, 0, '', '', 0, '', 10, '', '', 0, 'post_date:desc', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_collection`
--

CREATE TABLE IF NOT EXISTS `qinggan_collection` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题',
  `title` varchar(200) NOT NULL COMMENT '要采集的标题',
  `linkurl` varchar(255) NOT NULL COMMENT '来源网站，可用于伪造refer url',
  `url_charset` varchar(20) NOT NULL DEFAULT 'utf-8' COMMENT '网站编码',
  `totalcount` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章数',
  `cateid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `listurl` text NOT NULL COMMENT '列表页网址，一行一个列表',
  `list_tags_start` varchar(255) NOT NULL COMMENT '网址采集范围开始',
  `list_tags_end` varchar(255) NOT NULL COMMENT '网址采集范围结束',
  `url_tags` varchar(255) NOT NULL COMMENT '目标网址必须包含哪些字段',
  `is_gzip` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用GZIP，1使用',
  `is_proxy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用代理，1使用',
  `proxy_service` varchar(255) NOT NULL COMMENT '代理服务器',
  `proxy_user` varchar(100) NOT NULL COMMENT '代理账号',
  `proxy_pass` varchar(100) NOT NULL COMMENT '代理密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `qinggan_collection`
--

INSERT INTO `qinggan_collection` (`id`, `title`, `linkurl`, `url_charset`, `totalcount`, `cateid`, `listurl`, `list_tags_start`, `list_tags_end`, `url_tags`, `is_gzip`, `is_proxy`, `proxy_service`, `proxy_user`, `proxy_pass`) VALUES
(1, '互联网滚动新闻（网易）', 'http://tech.163.com/', 'gbk', 0, 3, 'http://tech.163.com/special/0009rt/internet_roll.html', '<div class="tList14px">', '<div class="bot01">', '.html', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_collection_files`
--

CREATE TABLE IF NOT EXISTS `qinggan_collection_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '采集项目ID',
  `lid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `tag` varchar(100) NOT NULL COMMENT '标签',
  `ext` varchar(10) NOT NULL COMMENT '扩展',
  `srcurl` varchar(255) NOT NULL COMMENT '原src文件地址',
  `newurl` varchar(255) NOT NULL COMMENT '新图片地址',
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_collection_format`
--

CREATE TABLE IF NOT EXISTS `qinggan_collection_format` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `lid` mediumint(9) NOT NULL COMMENT '采集的ID',
  `tag` varchar(100) NOT NULL COMMENT '标签',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `qinggan_collection_format`
--

INSERT INTO `qinggan_collection_format` (`id`, `lid`, `tag`, `content`) VALUES
(46, 1, 'title', '华谊兄弟30亿主题公园梦受挫苏州工业园区'),
(47, 1, 'keywords', '华谊兄弟'),
(48, 1, 'description', '华谊兄弟30亿主题公园梦受挫苏州工业园区,华谊兄弟'),
(49, 1, 'note', '华谊兄弟传媒股份有限公司（300027，下称华谊兄弟）未来的赢利梦想或许不仅寄托于电影，它的触角正逐渐伸向与土地相关的产业。本报从华谊兄弟方面获悉，该公司正在积极布局实景项目——主要分为文化城与主题乐园两大类：前者主打影视拍摄制作，后者主打旅游景点。据华谊兄弟方面透露，这两大业务都在长三角地区率先突破。位于苏州工业园区阳澄湖畔的华谊兄弟电影主题公园，面积约1000亩，计划投资30亿；位于上海嘉定的华谊兄弟文化城，占地亦1000亩，总投资额也高达数十亿——这些项目的资金运作规模，已远超其在影视业的投资。作为创业板上市公司，华谊兄弟2011年上半年营收不过3.31亿元。上述两个项目原计划在2011年内开工，但事与愿违的是，国家三部委的一道措辞严厉的律令打乱了华谊的扩张步伐。8月5日，国家发改委、国土资源部、住房城乡建设部发出《关于暂停新开工建设主题公园项目的通知》，该通知明确表示：至国家规范发展主题公园的具体政策出台前，各地一律不得批准建设新的主题公园项目；已经办理审批手续但尚未动工建设的项目，也不得开工建设。华谊兄弟传媒股份有限公司实景娱乐事业部业务发展总监杨昌兴告诉本报记者，华谊在主题公园业务这块属于三部委政策的指向范围，但“文化城”项目主要经营影视剧拍摄制作及周边产业，所以并不属于主题公园。据华谊兄弟方面透露，在电影主题乐园投资方面，除了苏州工业园区项目启动较快，还在接触的城市包括成都及青岛等；而文化城方面的投资，除了上海嘉定的项目之外，北京、深圳等地也开始酝酿合作，以方便未来的电影战略规划。8月26日，华谊兄弟发布公告称，股东大会同意公司以1.1亿超募资金，通过增资方式向全资子公司华谊兄弟（天津）实景娱乐有限公司追加投资，用于投资和经营文化旅游行业。但在三部委主题公园的具体政策出台之前，华谊兄弟的实景项目仍存较大变数。四方合资三面环湖的阳澄湖半岛景色秀丽，苏州工业园区欲将其打造为集旅游、度假、娱乐为一体的国家级度假区,这也是这个过去以工业招商为主的开发区的一种转型努力。阳澄湖半岛有限公司一位人士告诉本报，2007年首批项目已经在半岛上落成，包括古刹重元寺、70公顷的莲池湖公园及一些五星级酒店，“目前半岛上暂无其他项目运作，主要都在忙华谊兄弟电影主题公园项目。”华谊兄弟进军主题公园的计划，最早在该公司5月26日的公告中显现：“华谊兄弟电影主题公园”由华谊兄弟与苏州工业园区管理委员会下属的国资公司——苏州工业园区阳澄湖半岛开发建设有限公司，及其他投资方成立项目公司负责开发经营。项目预计总投资30亿元人民币，华谊兄弟在项目公司的持股比例拟定为35%，预计公园将于2014-2015年建成。主题公园将建成一个集文化旅游为一体、融入中国文化元素、以华谊兄弟公司经典电影为主题的游乐区域，设置角色体验和互动游戏项目，公园内还包含其他配套设施。9月7日，记者在阳澄湖半岛看到，除了一些园林景点酒店及部分已经建成的商品房之外，半岛上并没有任何主题公园动工的迹象。但本报获得的工商资料显示，华谊兄弟及相关公司已经成立了注册资本2亿元的项目公司——华谊兄弟（苏州）电影主题公园有限公司（下称华谊苏州公司），这个项目公司共有四个股东：除华谊兄弟出资7000万元之外，阳澄湖半岛开发建设有限公司出资5000万、万通投资控股股份有限公司出资4000万、苏州广大投资集团有限公司出资4000万。华谊苏州公司选举华谊兄弟董事长王忠军为董事长，蒋浩忠为副董事长。2007年，苏州市政府任命蒋浩忠为工业园区管委会主任助理，其工作属于公务员性质，蒋在2010年成立的苏州工业园区阳澄湖半岛开发建设有限公司中担任总经理。而《中华人民共和国公务员法》第53条规定，公务员不得从事或者参与营利性活动，在企业或者其他营利性组织中兼任职务。2004年，中央曾发出《关于对党政领导干部在企业兼职进行清理的通知》（中组发[2004]2号）。蒋浩忠的多重身份似乎与上述规定相悖。华谊苏州公司的另一股东——苏州广大投资集团，是成立于1995年的民营企业，主业为房地产、餐饮、担保等，该公司董事长朱昌宁为华谊苏州公司的董事兼总经理，而著名地产商万通的董事长冯仑为华谊苏州公司监事会主席。本报从苏州工业园区管委会获悉，早在5月7日，王忠军就与冯仑等一行，到苏州工业园区拜会园区主要领导，并考察阳澄湖半岛。“目前细致的进展属于商业机密，不方便对外透露。”阳澄湖半岛开发建设有限公司人士对本报承认，三部委暂停主题公园建设的通知，会影响到整个项目的进展。土地运作之困华谊苏州公司的工商资料显示，其经营范围包括：提供公园景点游览、娱乐行业管理服务；游乐项目开发、建设；游乐设施经营；商业配套设施的开发、销售及管理服务。但在土地运作上，该项目尚未进入法定程序。苏州市国土管理局2011年土地出让记录显示，截至9月，苏州工业园区只有零星几幅住宿商服餐饮地块出让，并未有旅游乐园性质的土地出让记录。华谊兄弟实景娱乐事业部业务发展总监杨昌兴对本报透露，苏州主题公园目前暂时还处在创意规划设计阶段，所以尚未进入土地出让程序。“我们和园区政府把涉及到主题公园的近1000亩土地红线给划出来，地点在阳澄湖半岛偏南一块。”记者在现场看到，阳澄湖半岛偏南湖畔，有阳澄湖大道贯穿，且京沪高铁阳澄湖站亦在附近，不仅交通便利，周边零星的商品房已经成型。“目前的项目还在创意规划阶段，因此还未上报审批。三部委目前主要让各地在9月前汇集主题公园的材料数据，并正研究未来的具体政策，所以我们的规划也会依照国家政策作调整。”杨昌兴表示。杨昌兴透露，工业园区方面负责具体的土地运作，华谊方面则负责地面上的创意规划。阳澄湖半岛原先的规划就有一块文化旅游性质的用地，政府也在等土地指标的分配。“如果快的话，我们希望最好年内能启动项目。”一位苏南地方国土局工作人员就此表示，如果在苏州市编制的土地控制性总规中，该项目土地已经是旅游用地性质，那就没问题。倘若其中有一部分土地不是旅游用地，就涉及到土地转性，要相关部门申请控规修改，报当地人大审批才算合法。而国土资源部一位人士则告诉本报，土地指标主要涉及两块：一个是新增建设用地指标，该指标是国土部控制地方土地使用量和速度，每年下达到省级并分配到市一级。从这点来说，1000亩的主题公园不是小数目。而另一个是农用地转用指标，主题乐园如果涉及到占用农地，占用了多少，就要在另一个地方补建多少，实现农地的占补平衡。也就是说，华谊兄弟在这些用地程序上如果出现瑕疵，未来的项目审批将面临极大的风险。本报获得一份2011年2月呈报相关部门的《苏州工业园区阳澄湖半岛旅游功能定位及项目汇报》，其中一张土地利用图显示，华谊主题公园所在的阳澄湖半岛偏南区块，大致有1600亩可用地——但这些土地的性质主要为商业服务业用地，极小一部分为文化娱乐用地，未见有旅游性质土地。与此同时，著名地产商万通出现在项目公司股东名单中，且占股不少，说明住宅或商业地产必是其重点之一。事实上，苏州工业园区规划的主题公园还不止华谊这一个，就在阳澄湖的著名人造景观重元寺之旁，近年一直在筹建一个佛教主题公园。国内影视城大多经营不善，往往通过商业地产的增值方式进行弥补。对于这个问题，华谊兄弟回应本报称：根据目前的规划，商业配套只是其中一小块，并不会占大部分的份额，我们会吸收华侨城等项目的运作模式，根据华谊现有的电影品牌扩散，相信会经营得很好。主题公园盈利困局虽然三部委已下发暂停主题公园审批的通知，但华谊兄弟对此却未显悲观，各地政府对其趋之若鹜当是重要原因。苏州工业园区主要领导多次公开表示，华谊兄弟有足够强悍的业界品牌、足够闪亮的明星资源，希望能共同将这个电影主题公园打造成国内首个高水准的电影梦之国。但一位国土资源部纪委人士对记者表示，“根据国家目前对于主题公园的最新政策，恐怕各地系列影视城的运作不如此前顺利了，尤其在土地指标上。”自2005年迪士尼乐园将落户上海的消息传出后，全国各地的主题公园遍地开花。尤其在长三角地区，如苏锡常一带，旧的主题公园有三国城、水浒城，新的有嬉戏谷，在建的还有东方盐湖城等等。华美顾问公司首席知识管理专家赵焕焱曾透露，目前中国有1500亿元巨资被套牢在2500多个主题公园上，其中70%处于亏损状态、20%持平，仅有10%左右盈利，三分之二以上无法收回投资。而这些项目的模式，很多是主题乐园为虚，圈地配套建设地产为实。除了苏州阳澄湖半岛主题公园外，“成都、青岛等地的主题公园也还在谈。”华谊兄弟方面人士透露说。而未来在文化城项目上，华谊兄弟在全国投资不会超过四个，主要落在北上广深一线城市。'),
(50, 1, 'content', '<p>华谊兄弟传媒股份有限公司（300027，下称华谊兄弟）未来的赢利梦想或许不仅寄托于电影，它的触角正逐渐伸向与土地相关的产业。</p><p>本报从华谊兄弟方面获悉，该公司正在积极布局实景项目——主要分为文化城与主题乐园两大类：前者主打影视拍摄制作，后者主打旅游景点。</p><p>据华谊兄弟方面透露，这两大业务都在长三角地区率先突破。位于苏州工业园区阳澄湖畔的华谊兄弟电影主题公园，面积约1000亩，计划投资30亿；位于上海嘉定的华谊兄弟文化城，占地亦1000亩，总投资额也高达数十亿——这些项目的资金运作规模，已远超其在影视业的投资。作为创业板上市公司，华谊兄弟2011年上半年营收不过3.31亿元。</p><p>上述两个项目原计划在2011年内开工，但事与愿违的是，国家三部委的一道措辞严厉的律令打乱了华谊的扩张步伐。</p><p>8月5日，国家发改委、国土资源部、住房城乡建设部发出《关于暂停新开工建设主题公园项目的通知》，该通知明确表示：至国家规范发展主题公园的具体政策出台前，各地一律不得批准建设新的主题公园项目；已经办理审批手续但尚未动工建设的项目，也不得开工建设。</p><p>华谊兄弟传媒股份有限公司实景娱乐事业部业务发展总监杨昌兴告诉本报记者，华谊在主题公园业务这块属于三部委政策的指向范围，但“文化城”项目主要经营影视剧拍摄制作及周边产业，所以并不属于主题公园。</p><p>据华谊兄弟方面透露，在电影主题乐园投资方面，除了苏州工业园区项目启动较快，还在接触的城市包括成都及青岛等；而文化城方面的投资，除了上海嘉定的项目之外，北京、深圳等地也开始酝酿合作，以方便未来的电影战略规划。</p><p>8月26日，华谊兄弟发布公告称，股东大会同意公司以1.1亿超募资金，通过增资方式向全资子公司华谊兄弟（天津）实景娱乐有限公司追加投资，用于投资和经营文化旅游行业。</p><p>但在三部委主题公园的具体政策出台之前，华谊兄弟的实景项目仍存较大变数。</p><p><b>四方合资</b></p><p>三面环湖的阳澄湖半岛景色秀丽，苏州工业园区欲将其打造为集旅游、度假、娱乐为一体的国家级度假区,这也是这个过去以工业招商为主的开发区的一种转型努力。</p><p>阳澄湖半岛有限公司一位人士告诉本报，2007年首批项目已经在半岛上落成，包括古刹重元寺、70公顷的莲池湖公园及一些五星级酒店，“目前半岛上暂无其他项目运作，主要都在忙华谊兄弟电影主题公园项目。”</p><p>华谊兄弟进军主题公园的计划，最早在该公司5月26日的公告中显现：“华谊兄弟电影主题公园”由华谊兄弟与苏州工业园区管理委员会下属的国资公司——苏州工业园区阳澄湖半岛开发建设有限公司，及其他投资方成立项目公司负责开发经营。</p><p>项目预计总投资30亿元人民币，华谊兄弟在项目公司的持股比例拟定为35%，预计公园将于2014-2015年建成。</p><p>主题公园将建成一个集文化旅游为一体、融入中国文化元素、以华谊兄弟公司经典电影为主题的游乐区域，设置角色体验和互动游戏项目，公园内还包含其他配套设施。</p><p>9月7日，记者在阳澄湖半岛看到，除了一些园林景点酒店及部分已经建成的商品房之外，半岛上并没有任何主题公园动工的迹象。</p><p>但本报获得的工商资料显示，华谊兄弟及相关公司已经成立了注册资本2亿元的项目公司——华谊兄弟（苏州）电影主题公园有限公司（下称华谊苏州公司），这个项目公司共有四个股东：</p><p>除华谊兄弟出资7000万元之外，阳澄湖半岛开发建设有限公司出资5000万、万通投资控股股份有限公司出资4000万、苏州广大投资集团有限公司出资4000万。</p><p>华谊苏州公司选举华谊兄弟董事长王忠军为董事长，蒋浩忠为副董事长。</p><p>2007年，苏州市政府任命蒋浩忠为工业园区管委会主任助理，其工作属于公务员性质，蒋在2010年成立的苏州工业园区阳澄湖半岛开发建设有限公司中担任总经理。</p><p>而《中华人民共和国公务员法》第53条规定，公务员不得从事或者参与营利性活动，在企业或者其他营利性组织中兼任职务。2004年，中央曾发出《关于对党政领导干部在企业兼职进行清理的通知》（中组发[2004]2号）。蒋浩忠的多重身份似乎与上述规定相悖。</p><p>华谊苏州公司的另一股东——苏州广大投资集团，是成立于1995年的民营企业，主业为房地产、餐饮、担保等，该公司董事长朱昌宁为华谊苏州公司的董事兼总经理，而著名地产商万通的董事长冯仑为华谊苏州公司监事会主席。</p><p>本报从苏州工业园区管委会获悉，早在5月7日，王忠军就与冯仑等一行，到苏州工业园区拜会园区主要领导，并考察阳澄湖半岛。</p><p>“目前细致的进展属于商业机密，不方便对外透露。”阳澄湖半岛开发建设有限公司人士对本报承认，三部委暂停主题公园建设的通知，会影响到整个项目的进展。</p><p><b>土地运作之困</b></p><p>华谊苏州公司的工商资料显示，其经营范围包括：提供公园景点游览、娱乐行业管理服务；游乐项目开发、建设；游乐设施经营；商业配套设施的开发、销售及管理服务。</p><p>但在土地运作上，该项目尚未进入法定程序。苏州市国土管理局2011年土地出让记录显示，截至9月，苏州工业园区只有零星几幅住宿商服餐饮地块出让，并未有旅游乐园性质的土地出让记录。</p><p>华谊兄弟实景娱乐事业部业务发展总监杨昌兴对本报透露，苏州主题公园目前暂时还处在创意规划设计阶段，所以尚未进入土地出让程序。“我们和园区政府把涉及到主题公园的近1000亩土地红线给划出来，地点在阳澄湖半岛偏南一块。”</p><p>记者在现场看到，阳澄湖半岛偏南湖畔，有阳澄湖大道贯穿，且京沪高铁阳澄湖站亦在附近，不仅交通便利，周边零星的商品房已经成型。</p><p>“目前的项目还在创意规划阶段，因此还未上报审批。三部委目前主要让各地在9月前汇集主题公园的材料数据，并正研究未来的具体政策，所以我们的规划也会依照国家政策作调整。”杨昌兴表示。</p><p>杨昌兴透露，工业园区方面负责具体的土地运作，华谊方面则负责地面上的创意规划。阳澄湖半岛原先的规划就有一块文化旅游性质的用地，政府也在等土地指标的分配。“如果快的话，我们希望最好年内能启动项目。”</p><p>一位苏南地方国土局工作人员就此表示，如果在苏州市编制的土地控制性总规中，该项目土地已经是旅游用地性质，那就没问题。倘若其中有一部分土地不是旅游用地，就涉及到土地转性，要相关部门申请控规修改，报当地人大审批才算合法。</p><p>而国土资源部一位人士则告诉本报，土地指标主要涉及两块：一个是新增建设用地指标，该指标是国土部控制地方土地使用量和速度，每年下达到省级并分配到市一级。从这点来说，1000亩的主题公园不是小数目。而另一个是农用地转用指标，主题乐园如果涉及到占用农地，占用了多少，就要在另一个地方补建多少，实现农地的占补平衡。</p><p>也就是说，华谊兄弟在这些用地程序上如果出现瑕疵，未来的项目审批将面临极大的风险。</p><p>本报获得一份2011年2月呈报相关部门的《苏州工业园区阳澄湖半岛旅游功能定位及项目汇报》，其中一张土地利用图显示，华谊主题公园所在的阳澄湖半岛偏南区块，大致有1600亩可用地——但这些土地的性质主要为商业服务业用地，极小一部分为文化娱乐用地，未见有旅游性质土地。与此同时，著名地产商万通出现在项目公司股东名单中，且占股不少，说明住宅或商业地产必是其重点之一。</p><p>事实上，苏州工业园区规划的主题公园还不止华谊这一个，就在阳澄湖的著名人造景观重元寺之旁，近年一直在筹建一个佛教主题公园。</p><p>国内影视城大多经营不善，往往通过商业地产的增值方式进行弥补。对于这个问题，华谊兄弟回应本报称：根据目前的规划，商业配套只是其中一小块，并不会占大部分的份额，我们会吸收华侨城等项目的运作模式，根据华谊现有的电影品牌扩散，相信会经营得很好。</p><p><b>主题公园盈利困局</b></p><p>虽然三部委已下发暂停主题公园审批的通知，但华谊兄弟对此却未显悲观，各地政府对其趋之若鹜当是重要原因。</p><p>苏州工业园区主要领导多次公开表示，华谊兄弟有足够强悍的业界品牌、足够闪亮的明星资源，希望能共同将这个电影主题公园打造成国内首个高水准的电影梦之国。</p><p>但一位国土资源部纪委人士对记者表示，“根据国家目前对于主题公园的最新政策，恐怕各地系列影视城的运作不如此前顺利了，尤其在土地指标上。”</p><p>自2005年迪士尼乐园将落户上海的消息传出后，全国各地的主题公园遍地开花。尤其在长三角地区，如苏锡常一带，旧的主题公园有三国城、水浒城，新的有嬉戏谷，在建的还有东方盐湖城等等。</p><p>华美顾问公司首席知识管理专家赵焕焱曾透露，目前中国有1500亿元巨资被套牢在2500多个主题公园上，其中70%处于亏损状态、20%持平，仅有10%左右盈利，三分之二以上无法收回投资。而这些项目的模式，很多是主题乐园为虚，圈地配套建设地产为实。</p><p>除了苏州阳澄湖半岛主题公园外，“成都、青岛等地的主题公园也还在谈。”华谊兄弟方面人士透露说。而未来在文化城项目上，华谊兄弟在全国投资不会超过四个，主要落在北上广深一线城市。</p><p><div class="gg200x300"></div><p>“这样的公司背景，相信钱并不是最主要的问题，最主要还是未来的土地审批。”上述国土部人士表示，“影视城被国土部督查掉的项目也不是没有，此前横店项目就是因为在土地审批上违规，最后被叫停，并限令当地政府整改。”</p><p>对于华谊兄弟而言，接下来不仅是等待国家对主题公园的具体政策出台。</p><p>上述苏南地方国土局工作人员告诉记者，在土地出让程序上，民营企业获得旅游用地，一定要通过招拍挂的程序。</p><p>华谊方面对本报表示，虽然在土地审批上难免会碰上一些不确定的因素，但是华谊会极力争取，希望未来能够达到国家的要求。</p>(本文来源：21世纪经济报道作者：赵飞飞 闫艺铭)'),
(41, 2, 'title', '谷歌推出航班搜索服务 速度快于竞争对手'),
(42, 2, 'keywords', '谷歌'),
(43, 2, 'description', '谷歌推出航班搜索服务 速度快于竞争对手,谷歌'),
(44, 2, 'note', '网易科技讯 9月14日消息，据《纽约时报》报道，谷歌周二推出航班搜索，与Kayak、Orbitz和微软的必应等旅游搜索引擎直接竞争。自谷歌去年宣布收购ITA软件后，外界就普遍预计谷歌将发布这种服务。这次收购虽然经历了严格的反垄断审查，但最终在今年4月获得司法部批准。'),
(45, 2, 'content', '<p>网易科技讯 9月14日消息，据《纽约时报》报道，谷歌周二推出航班搜索，与Kayak、Orbitz和微软的必应等旅游搜索引擎直接竞争。自谷歌去年宣布收购ITA软件后，外界就普遍预计谷歌将发布这种服务。这次收购虽然经历了严格的反垄断审查，但最终在今年4月获得司法部批准。</p><p><div class="gg200x300"></div><p>谷歌表示，其航班搜索结果不会受任何付费因素影响，搜索引擎直接将旅客引导到航空公司自己的网站预订航班。谷歌曾表示，希望收购ITA发布新的、开放的旅游搜索。周二推出的服务是不是谷歌要发布的完整产品，而是朝该方向迈出的第一步。目前只提供美国特定城市和经济舱、往返航班的结果。</p><p>旅客可在谷歌上搜索航班或访问google.com/flights，他们将看到各家航空公司的航班，这些航班按照起飞或抵达时间、飞行时间、路线、航空公司或价格进行分类。谷歌表示，其显示结果的速度很快，在初步测试中，可在瞬间显示结果，而其他网站的用户要等网站收集信息才能看到结果。（木秀林）</p>(本文来源：网易科技报道)'),
(36, 3, 'title', '浙报挂牌出让财新传媒19.77%股权 报价5647.6万'),
(37, 3, 'keywords', '财新传媒'),
(38, 3, 'description', '浙报挂牌出让财新传媒19.77%股权 报价5647.6万,财新传媒'),
(39, 3, 'note', '成立不足两年的财新传媒有限公司（下称“财新传媒”）再次受到业内关注。据浙江产权交易信息网公开披露信息，财新传媒挂牌转让19.77%的国有股权，挂牌价格为5647.60万元。此次挂牌转让的股权为浙报集团所有。据浙报集团相关负责人透露，此举在于浙报集团正在谋划上市，“避免同业竞争”。出让股权为避同业竞争浙江产权交易信息网公告所披露的股权信息为：浙报传媒控股集团有限公司（下称“浙报集团”）持股40％，天津知衡企业管理咨询合伙企业、天津域富企业管理咨询合伙企业以及天津汇思企业管理咨询合伙企业分别持股20％、20％和19％，剩余1％为自然人葛倩所有。7月28日，濒临退市的*ST白猫（600633.SH）发布公告称，收到中国证监会的重组核准批复文件，同意公司重大资产重组并向浙报传媒控股集团有限公司发行股份购买资产，浙报传媒借壳上市成定局。据浙报集团相关负责人表示，按照上市要求需要避免同业竞争。“我们需要对股权进行调整。”该负责人告诉《第一财经日报》。而对于未来是否会退出财新传媒，该负责人表示，减持只是第一步，至于未来的进展目前尚未明确。财新传媒方面发言人张立晖也向本报证实了浙报减持与上市有关一说。财新欲谋变未来浙江产权交易信息网公告披露，财新传媒截至2011年7月最近一个年度审计报告，公司主营业务收入为3147.36万元，营业利润为 -3315.09万元，净利润为-1426.79万元。按照5647.60万元的挂牌价格，财新传媒的估值约为2.8亿元。这意味着在不到两年的时间内，财新传媒已有赶超老《财经》之势。目前老《财经》母公司财讯传媒（00205.HK）港股市值约为6.96亿港元（约合5.7亿元人民币）。此外，公告披露对受让方的要求为合同订立之日起五个工作日内一次性付款。除了上述常规内容外，公告中还指出受让方需要承诺受让股权后，须向财新传媒提供不少于1亿元的借款，借款期限5年，在股权交割完成1个月内提供借款，按银行同期活期存款利率计息，且不得要求提前还款。对于财新传媒是否缺钱以及为什么需要1亿元，财新传媒方面未做出进一步解释。'),
(40, 3, 'content', '<p>成立不足两年的财新传媒有限公司（下称“财新传媒”）再次受到业内关注。据浙江产权交易信息网公开披露信息，财新传媒挂牌转让19.77%的国有股权，挂牌价格为5647.60万元。</p><p>此次挂牌转让的股权为浙报集团所有。据浙报集团相关负责人透露，此举在于浙报集团正在谋划上市，“避免同业竞争”。</p><p><b>出让股权为避同业竞争</b></p><p>浙江产权交易信息网公告所披露的股权信息为：浙报传媒控股集团有限公司（下称“浙报集团”）持股40％，天津知衡企业管理咨询合伙企业、天津域富企业管理咨询合伙企业以及天津汇思企业管理咨询合伙企业分别持股20％、20％和19％，剩余1％为自然人葛倩所有。</p><p>7月28日，濒临退市的*ST白猫（600633.SH）发布公告称，收到中国证监会的重组核准批复文件，同意公司重大资产重组并向浙报传媒控股集团有限公司发行股份购买资产，浙报传媒借壳上市成定局。据浙报集团相关负责人表示，按照上市要求需要避免同业竞争。“我们需要对股权进行调整。”该负责人告诉《第一财经日报》。</p><p>而对于未来是否会退出财新传媒，该负责人表示，减持只是第一步，至于未来的进展目前尚未明确。财新传媒方面发言人张立晖也向本报证实了浙报减持与上市有关一说。</p><p><b>财新欲谋变未来</b></p><p>浙江产权交易信息网公告披露，财新传媒截至2011年7月最近一个年度审计报告，公司主营业务收入为3147.36万元，营业利润为 -3315.09万元，净利润为-1426.79万元。按照5647.60万元的挂牌价格，财新传媒的估值约为2.8亿元。这意味着在不到两年的时间内，财新传媒已有赶超老《财经》之势。目前老《财经》母公司财讯传媒（00205.HK）港股市值约为6.96亿港元（约合5.7亿元人民币）。</p><p>此外，公告披露对受让方的要求为合同订立之日起五个工作日内一次性付款。</p><p>除了上述常规内容外，公告中还指出受让方需要承诺受让股权后，须向财新传媒提供不少于1亿元的借款，借款期限5年，在股权交割完成1个月内提供借款，按银行同期活期存款利率计息，且不得要求提前还款。对于财新传媒是否缺钱以及为什么需要1亿元，财新传媒方面未做出进一步解释。</p><p><div class="gg200x300"></div><p>2009年，胡舒立带领《财经》杂志核心团队出走，随后创立财新传媒。目前，财新传媒的主营业务为通过“一网三刊”，即财新网、《新世纪》周刊、《中国改革》月刊和《比较》杂志，以及移动互联网、视频、图书、会议等全媒体平台，提供财经新闻资讯服务等。知情人士介绍，《新世纪》周刊广告情况向好，根据杂志运作规律，作为一份新生杂志，目前财新传媒的亏损也在合理范围之内。这意味着财新传媒很可能并不缺钱。业内猜测1亿元人民币的借款需求可能意味着胡舒立正在谋划更大的动作。</p><p>今年7月份，胡舒立接受媒体采访时曾表示，公司将开始通过订阅和报刊亭销售在香港发行《财新英文周刊》(Caixin Weekly)，并将推出针对美洲和欧洲地区读者的英文iPad应用程序。胡舒立当时称“我们还没有很多的广告客户”。不过在采访中她对进军海外、推中国声音表示出了信心。</p>(本文来源：第一财经日报作者：惠正一)'),
(31, 4, 'title', 'Groupon在英国测试全新电子商务模式'),
(32, 4, 'keywords', 'Groupon'),
(33, 4, 'description', 'Groupon在英国测试全新电子商务模式,Groupon'),
(34, 4, 'note', '网易科技讯 9月13日消息，据国外媒体报道，团购网站Groupon Inc开始对英国互联网上销售的产品提供折扣优惠，推进该公司进入与马逊公司(Amazon.com Inc.)及eBay Inc之间的直接竞争。总部位于芝加哥的Groupon，正在为其英国客户推广折扣超过80%的商品，当用户购买产品时，他们会收到一个代码，通过使用该代码将能进入提供商的网站并能享受到网上订购折扣。Groupon大部分营收来自于其每天与当地餐馆、酒店及其他商家之间的团购交易，其可能通过为电子商务网站增加优惠券的方式来加强收入增长。美国网络零售解决方案提供商Channel Advisor CEO斯科特-温格(Scot Wingo)表示,：“凭借其向1.15亿电子邮件订阅用户发送折扣的能力，Groupon能够吸引住通常钟情于亚马逊和eBay的用户。”他还称：“Groupon的优势是每天能够接触1亿多用户，而亚马逊和eBay取无法做到，仅仅只是借助订阅用户群规模，他们就可以推动5亿至10亿美元的销售额。”Groupon的名为National Deals的功能已经为用户提供了来自UK-Bedding的床垫、Whitening Professionals的牙齿美白以及Albelli的定制相册，在每一种情况下，Groupon都能完成1万多笔交易。温格说：“似乎真得很好，我猜想一旦时机成熟，Groupon就会将这一服务引进美国。”Groupon发言人朱莉-莫斯勒(Julie Mossler)拒绝对此事置评。Groupon首席执行官安德鲁-梅森(Andrew Mason) 曾在8月25日的一份内部备忘录中提高主动推销产品，并称英国电子商务业务很成功。他在备忘录中写道：“我们仅用一天时间便在英国卖出了价值200万美元的床垫。”'),
(35, 4, 'content', '<p>网易科技讯 9月13日消息，据国外媒体报道，团购网站Groupon Inc开始对英国互联网上销售的产品提供折扣优惠，推进该公司进入与马逊公司(Amazon.com Inc.)及eBay Inc之间的直接竞争。</p><p>总部位于芝加哥的Groupon，正在为其英国客户推广折扣超过80%的商品，当用户购买产品时，他们会收到一个代码，通过使用该代码将能进入提供商的网站并能享受到网上订购折扣。</p><p>Groupon大部分营收来自于其每天与当地餐馆、酒店及其他商家之间的团购交易，其可能通过为电子商务网站增加优惠券的方式来加强收入增长。</p><p>美国网络零售解决方案提供商Channel Advisor CEO斯科特-温格(Scot Wingo)表示,：“凭借其向1.15亿电子邮件订阅用户发送折扣的能力，Groupon能够吸引住通常钟情于亚马逊和eBay的用户。”他还称：“Groupon的优势是每天能够接触1亿多用户，而亚马逊和eBay取无法做到，仅仅只是借助订阅用户群规模，他们就可以推动5亿至10亿美元的销售额。”</p><p>Groupon的名为National Deals的功能已经为用户提供了来自UK-Bedding的床垫、Whitening Professionals的牙齿美白以及Albelli的定制相册，在每一种情况下，Groupon都能完成1万多笔交易。</p><p>温格说：“似乎真得很好，我猜想一旦时机成熟，Groupon就会将这一服务引进美国。”</p><p>Groupon发言人朱莉-莫斯勒(Julie Mossler)拒绝对此事置评。</p><p>Groupon首席执行官安德鲁-梅森(Andrew Mason) 曾在8月25日的一份内部备忘录中提高主动推销产品，并称英国电子商务业务很成功。他在备忘录中写道：“我们仅用一天时间便在英国卖出了价值200万美元的床垫。”</p><p><div class="gg200x300"></div><p>Groupon在美国的主要竞争对手是总部位于华盛顿的LivingSocial，LivingSocial也在尝试新的团购模式。LivingSocial计划与全食超市(Whole Foods Market)共同推广一项团购，用户只需花10美元即可购买价值20美元的杂货。LivingSocial发言人安德鲁-韦恩斯坦(Andrew Weinstein)表示，这是第一家团购企业推出全国性的杂货团购。</p><p>Groupon还在以其他方式扩大服务。该公司通过与美国票务公司Live Nation Entertainment建立合作伙伴关系而出售折扣演唱会门票，并与在线旅行网站Expedia合作推广廉价酒店。</p><p>Groupon在今年早些时候提交了IPO(首次公开募股)申请，计划通过IPO募集资金7.5亿美元。但消息人士在本月早些时候透露，由于股市动荡，Groupon已经推迟了IPO计划。(编译/霍珊)</p>(本文来源：网易科技报道)');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_collection_list`
--

CREATE TABLE IF NOT EXISTS `qinggan_collection_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '采集器ID',
  `url` varchar(255) NOT NULL COMMENT '网址',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未采集1已采集2已发布',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `qinggan_collection_list`
--

INSERT INTO `qinggan_collection_list` (`id`, `cid`, `url`, `title`, `status`, `postdate`) VALUES
(1, 1, 'http://tech.163.com/11/0914/06/7DT1M5QA000915BF.html', '华谊兄弟30亿主题公园梦受挫苏州工业园区', 2, 1315981926),
(2, 1, 'http://tech.163.com/11/0914/05/7DSVTA4F000915BF.html', '谷歌收购ITA后推出小范围航班搜索服务', 2, 1315981926),
(3, 1, 'http://tech.163.com/11/0914/01/7DSGBHK6000915BF.html', '浙报挂牌出让财新传媒19.77%股权 报价5647.6万', 2, 1315981926),
(4, 1, 'http://tech.163.com/11/0913/23/7DS9U7G2000915BF.html', 'Groupon在英国测试全新电子商务模式', 2, 1315981926),
(5, 1, 'http://tech.163.com/11/0914/10/7DTHJ6CP000915BF.html', '美国青年自建网站请求谷歌雇用', 0, 1315981926),
(6, 1, 'http://tech.163.com/11/0914/09/7DTE3LG3000915BF.html', '拉拉网月饼团购涉嫌欺诈数十万元', 0, 1315981926),
(7, 1, 'http://tech.163.com/11/0914/09/7DTDPE0L000915BF.html', '创新工场开伙两年投资超过2.5亿元', 0, 1315981926),
(8, 1, 'http://tech.163.com/11/0914/09/7DTDM42T000915BF.html', '创业板两周岁数据：市盈率回归理性', 0, 1315981926),
(9, 1, 'http://tech.163.com/11/0914/09/7DTDGORT000915BF.html', '豆瓣巨鲸频融资 巨鲸或成首家上市音乐网公司', 0, 1315981926),
(10, 1, 'http://tech.163.com/11/0914/09/7DTDDTPM000915BF.html', '沃尔玛收购移动及社交广告初创企业OneRiot', 0, 1315981926),
(11, 1, 'http://tech.163.com/11/0914/08/7DTB4UVN000915BF.html', '摩托罗拉移动投资视频发布平台Ooyala', 0, 1315981926),
(12, 1, 'http://tech.163.com/11/0914/08/7DTAU6SR000915BF.html', '中秋月饼再为团购网站添诚信坏账', 0, 1315981926),
(13, 1, 'http://tech.163.com/11/0914/08/7DTAOEKQ000915BF.html', '机构预计2016年全球游戏广告市场将达72亿美元', 0, 1315981926),
(14, 1, 'http://tech.163.com/11/0914/08/7DT8PGIF000915BF.html', '淘宝停用旧版退货运费险 保费收取方式将改变', 0, 1315981926),
(15, 1, 'http://tech.163.com/11/0914/07/7DT7FPNS000915BF.html', '雅虎改朝换代苦觅突围之道', 0, 1315981926),
(16, 1, 'http://tech.163.com/11/0914/07/7DT4P79K000915BF.html', '国家工商行政管理总局等部门公布十大传销网', 0, 1315981926),
(17, 1, 'http://tech.163.com/11/0914/06/7DT40E82000915BF.html', '史玉柱近6亿港元增持民生 共买入逾9000万股', 0, 1315981926),
(18, 1, 'http://tech.163.com/11/0914/06/7DT3R89U000915BF.html', '中秋旺季快递未出现“爆仓”', 0, 1315981926),
(19, 1, 'http://tech.163.com/11/0914/06/7DT2VA76000915BF.html', '评论：开放创新 活力发展', 0, 1315981926),
(20, 1, 'http://tech.163.com/11/0914/06/7DT2QM1O000915BF.html', '开放创新学鼻祖：需要社会对失败足够宽容', 0, 1315981926),
(21, 1, 'http://tech.163.com/11/0914/06/7DT2HNUA000915BF.html', '巴西ABC通讯集团总裁：所有伟大想法都关于软件', 0, 1315981926),
(22, 1, 'http://tech.163.com/11/0914/06/7DT2DEVS000915BF.html', '李开复：微创新改变中国互联网', 0, 1315981926),
(23, 1, 'http://tech.163.com/11/0914/06/7DT1DLR6000915BF.html', '9月13日中国概念股评级：重申奇虎跑赢大盘评级', 0, 1315981926),
(24, 1, 'http://tech.163.com/11/0914/05/7DT114NB000915BF.html', '凤凰新媒体周二涨5.45%报5.80美元 结束三连阴', 0, 1315981926),
(25, 1, 'http://tech.163.com/11/0914/05/7DT0D4BO000915BF.html', '新浪周二上涨6.79% 股价再次突破110美元', 0, 1315981926),
(26, 1, 'http://tech.163.com/11/0914/04/7DSSPLFG000915BF.html', '倒闭潮加速团购业洗牌', 0, 1315981926),
(27, 1, 'http://tech.163.com/11/0914/04/7DSS2OIG000915BF.html', '中品质协诉谷歌公司索赔10万', 0, 1315981926),
(28, 1, 'http://tech.163.com/11/0914/04/7DSRQM3K000915BF.html', '大众点评网对商户炒作“零容忍”', 0, 1315981926),
(29, 1, 'http://tech.163.com/11/0914/03/7DSPRA4B000915BF.html', '电子商务促内需效果凸显 机构投资持续火热', 0, 1315981926),
(30, 1, 'http://tech.163.com/11/0914/03/7DSOS2VM000915BF.html', '搜狐砸亿元自制栏目 到电视圈里大肆挖人', 0, 1315981926);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_collection_tags`
--

CREATE TABLE IF NOT EXISTS `qinggan_collection_tags` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '采集器ID',
  `title` varchar(200) NOT NULL COMMENT '字段主题',
  `identifier` varchar(100) NOT NULL COMMENT '字段名',
  `tags_type` enum('var','string') NOT NULL DEFAULT 'var' COMMENT '字段类型',
  `rules` varchar(255) NOT NULL COMMENT '固定字符',
  `rules_start` varchar(255) NOT NULL COMMENT '采集内容开始标范围',
  `rules_end` varchar(255) NOT NULL COMMENT '采集内容结束',
  `del` text NOT NULL COMMENT '删除文字，任意值用(*)表示，一行一条规则',
  `del_url` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '删除网址',
  `del_html` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除HTML，级别最高，如果设为1，所有HTML代码将被去除',
  `del_font` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '清除font信息',
  `del_table` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '清除table信息',
  `del_span` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '清除span信息',
  `del_bold` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '清除加粗信息',
  `suburl_start` varchar(255) NOT NULL COMMENT '内容分页开始',
  `suburl_end` varchar(255) NOT NULL COMMENT '内容分页结束',
  `ifsystem` enum('list','biz','ext','c') NOT NULL DEFAULT 'list' COMMENT '字段默认存储的表',
  `post_save` enum('safe','html','int','float','datetime','img') NOT NULL DEFAULT 'safe' COMMENT '发布格式化',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `qinggan_collection_tags`
--

INSERT INTO `qinggan_collection_tags` (`id`, `cid`, `title`, `identifier`, `tags_type`, `rules`, `rules_start`, `rules_end`, `del`, `del_url`, `del_html`, `del_font`, `del_table`, `del_span`, `del_bold`, `suburl_start`, `suburl_end`, `ifsystem`, `post_save`) VALUES
(1, 1, '主题', 'title', 'var', '', '<h1(*)>', '</h1>', '', 1, 1, 1, 1, 0, 0, '', '', 'list', 'safe'),
(2, 1, '状态', 'status', 'string', '1', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(3, 1, '发布人员', 'author', 'string', '{session.admin_name}', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(4, 1, '发布人性质', 'author_type', 'string', 'admin', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(5, 1, '关键字', 'keywords', 'var', '', '<meta name="keywords" content="', '" />', '', 1, 1, 1, 1, 0, 0, '', '', 'list', 'safe'),
(6, 1, 'SEO描述', 'description', 'var', '', '<meta name="description" content="', '" />', '', 1, 1, 1, 1, 0, 0, '', '', 'list', 'safe'),
(7, 1, '简要描述', 'note', 'var', '', '<div id="endText">', '</div>', '<span class="Apple-style-span"(*)>(*)</span>', 1, 1, 1, 1, 0, 0, '', '', 'list', 'safe'),
(8, 1, '查看次数', 'hits', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(9, 1, '发布时间', 'post_date', 'string', '{post_date}', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(10, 1, '语言ID', 'langid', 'string', 'zh', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(11, 1, '访问者IP', 'ip', 'string', '{ip}', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(12, 1, 'star', 'star', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(13, 1, 'price', 'price', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(14, 1, 'price_currency', 'price_currency', 'string', 'CNY', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(15, 1, 'weight', 'weight', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(16, 1, 'qty', 'qty', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(17, 1, 'is_qty', 'is_qty', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(18, 1, 'qty_unit', 'qty_unit', 'string', '', '', '', '', 1, 0, 1, 1, 0, 0, '', '', 'list', 'safe'),
(19, 1, '内容', 'content', 'var', '', '<div id="endText">', '<img src="(*)"(*) border="0" class="icon" />', '<a(*)>\r\n<span class="Apple-style-span"(*)>(*)</span>', 1, 0, 1, 1, 0, 0, '', '', 'c', 'html');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_currency`
--

CREATE TABLE IF NOT EXISTS `qinggan_currency` (
  `code` varchar(3) NOT NULL COMMENT '货币标识，仅限三位数的大写字母',
  `val` float(13,8) unsigned NOT NULL COMMENT '货币转化',
  `ifdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `symbol_left` varchar(24) NOT NULL COMMENT '价格左侧',
  `symbol_right` varchar(24) NOT NULL COMMENT '价格右侧',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_currency`
--

INSERT INTO `qinggan_currency` (`code`, `val`, `ifdefault`, `taxis`, `title`, `symbol_left`, `symbol_right`, `status`) VALUES
('CNY', 1.00000000, 1, 10, '人民币', 'RMB￥', '', 1),
('USD', 0.15470000, 0, 20, '美金', 'US$', '', 1),
('HKD', 1.20599997, 0, 30, '港元', 'HK$', '', 1),
('EUR', 0.10920000, 0, 40, '欧元', 'EUR', '', 1),
('GBP', 0.09600000, 0, 50, '英镑', '￡', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_gd`
--

CREATE TABLE IF NOT EXISTS `qinggan_gd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `pictype` varchar(50) NOT NULL DEFAULT '' COMMENT '图片类型标识',
  `picsubject` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `water` varchar(255) NOT NULL DEFAULT '' COMMENT '水印图片位置',
  `picposition` varchar(100) NOT NULL DEFAULT '' COMMENT '水印位置',
  `trans` tinyint(3) unsigned NOT NULL DEFAULT '65' COMMENT '透明度，默认是60',
  `cuttype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片生成方式，支持缩放法和裁剪法两种，默认使用缩放法',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '80' COMMENT '图片生成质量，默认是80',
  `border` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持边框，1是0否',
  `bordercolor` varchar(10) NOT NULL DEFAULT 'FFFFFF' COMMENT '边框颜色',
  `padding` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '间距，默认是0,最大不超过255',
  `bgcolor` varchar(10) NOT NULL DEFAULT 'FFFFFF' COMMENT '补白背景色，默认是白色',
  `bgimg` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片，默认为空',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否使用，默认是使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠，最大不超过255，最小为0',
  `edit_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `qinggan_gd`
--

INSERT INTO `qinggan_gd` (`id`, `pictype`, `picsubject`, `width`, `height`, `water`, `picposition`, `trans`, `cuttype`, `quality`, `border`, `bordercolor`, `padding`, `bgcolor`, `bgimg`, `status`, `taxis`, `edit_default`) VALUES
(3, 'big', '大图', 600, 600, 'upfiles/201105/17/7bc0fa8dffd29c8a.jpg', 'bottom-right', 70, 2, 80, 0, '', 0, 'FFFFFF', '', 1, 30, 1),
(1, 'thumb', '缩略图', 130, 130, '', 'middle-middle', 50, 1, 80, 0, 'FFFFFF', 0, 'FFFFFF', '', 1, 10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_identifier`
--

CREATE TABLE IF NOT EXISTS `qinggan_identifier` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sign` varchar(32) NOT NULL COMMENT '标识符，用于本系统内所有需要此功能，仅限字母数字及下划线且第一个必须是字母',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `langid` varchar(5) NOT NULL COMMENT '语言编号，如zh,en等',
  `module_id` mediumint(8) unsigned NOT NULL COMMENT '一个标识符只能用于一个模块，一个模块有多个标识符',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统0自定义',
  `g_sign` varchar(100) NOT NULL COMMENT '组标识，仅在核心技术中使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `qinggan_identifier`
--

INSERT INTO `qinggan_identifier` (`id`, `sign`, `title`, `langid`, `module_id`, `if_system`, `g_sign`, `taxis`) VALUES
(1, 'popedom', '权限管理', 'zh', 1, 1, '', 255),
(2, 'module', '模块管理', 'zh', 2, 1, '', 255),
(3, 'add', '添加', 'zh', 0, 1, 'popedom', 201),
(4, 'modify', '修改', 'zh', 0, 1, 'popedom', 202),
(5, 'check', '审核', 'zh', 0, 1, 'popedom', 203),
(6, 'delete', '删除', 'zh', 0, 1, 'popedom', 204),
(7, 'list', '查看', 'zh', 0, 1, 'popedom', 200),
(8, 'setting', '设置', 'zh', 0, 1, 'popedom', 205),
(9, 'save', '存储', 'zh', 0, 1, 'popedom', 206),
(10, 'group', '组管理', 'zh', 0, 1, 'popedom', 255);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_input`
--

CREATE TABLE IF NOT EXISTS `qinggan_input` (
  `input` varchar(50) NOT NULL COMMENT '扩展框类型',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `name` varchar(100) NOT NULL COMMENT '名字',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ifuser` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许会员表使用0否1是',
  PRIMARY KEY (`input`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_input`
--

INSERT INTO `qinggan_input` (`input`, `langid`, `name`, `taxis`, `ifuser`) VALUES
('text', 'zh', '文本框', 10, 1),
('radio', 'zh', '单选框', 20, 1),
('checkbox', 'zh', '复选框', 30, 1),
('textarea', 'zh', '文本区域', 40, 1),
('edit', 'zh', '可视化编辑器', 50, 0),
('select', 'zh', '下拉菜单', 60, 1),
('img', 'zh', '图片选择器', 70, 1),
('video', 'zh', '影音选择器', 80, 1),
('download', 'zh', '下载框选择器', 90, 1),
('opt', 'zh', '联动选择', 100, 1),
('simg', 'zh', '图片选择器（单张）', 75, 1),
('module', 'zh', '内联模块', 110, 0),
('time', 'zh', '时间戳', 120, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_lang`
--

CREATE TABLE IF NOT EXISTS `qinggan_lang` (
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `title` varchar(100) NOT NULL COMMENT '显示名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态1不使用2使用',
  `note` varchar(255) NOT NULL COMMENT '描述',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，小值排前',
  `ifdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是系统默认',
  `ifsystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统语言0应用语言',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `small_pic` varchar(255) NOT NULL COMMENT '小图',
  `medium_pic` varchar(255) NOT NULL COMMENT '中图',
  `big_pic` varchar(255) NOT NULL COMMENT '大图',
  PRIMARY KEY (`langid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_lang`
--

INSERT INTO `qinggan_lang` (`langid`, `title`, `status`, `note`, `taxis`, `ifdefault`, `ifsystem`, `ico`, `small_pic`, `medium_pic`, `big_pic`) VALUES
('zh', '简', 1, '中文语言包', 10, 1, 1, '', '', '', ''),
('en', '英', 0, '', 255, 0, 0, '', '', '', ''),
('tc', '繁', 0, '', 255, 0, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_langs`
--

CREATE TABLE IF NOT EXISTS `qinggan_langs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `langid` varchar(32) NOT NULL COMMENT '语言编号，如zh,en等',
  `tbl` varchar(100) NOT NULL COMMENT '表名',
  `tbl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指定表名里的自增ID号',
  `keys` varchar(100) NOT NULL COMMENT '字段',
  `val` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`),
  KEY `tbl_id` (`tbl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_lang_msg`
--

CREATE TABLE IF NOT EXISTS `qinggan_lang_msg` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `ltype` enum('www','admin','all') NOT NULL DEFAULT 'all' COMMENT '语言包应用范围',
  `var` varchar(100) NOT NULL COMMENT '语言变量名，仅英文数字及下划线',
  `val` varchar(255) NOT NULL COMMENT '语言值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=369 ;

--
-- 转存表中的数据 `qinggan_lang_msg`
--

INSERT INTO `qinggan_lang_msg` (`id`, `langid`, `ltype`, `var`, `val`) VALUES
(1, 'zh', 'admin', 'cp_name', 'PHPOK企业站后台管理'),
(2, 'zh', 'all', 'error_note', '如果系统不能在 <span style="color:red;">{time}</span> 秒后自动返回，请点这里'),
(11, 'zh', 'admin', 'select_cate', '请选择分类'),
(4, 'zh', 'admin', 'no_popedom', 'Error: 对不起，您没有操作此功能权限'),
(5, 'zh', 'admin', 'login_false', '管理员登录失败，请检查…'),
(6, 'zh', 'admin', 'login_not_user_pass', '账号或密码不能为空'),
(7, 'zh', 'admin', 'login_success', '欢迎您 <span style=''color:red;''>{admin_realname}</span> 登录PHPOK企业网站系统后台，请稍候…'),
(8, 'zh', 'all', 'login_vcode_empty', '验证码不能为空'),
(9, 'zh', 'all', 'login_vcode_false', '验证码填写错误'),
(10, 'zh', 'admin', 'logout_success', '管理员 <span style=''color:red;''>{admin_realname}</span> 成功退出！'),
(23, 'zh', 'www', 'login_false_empty', '登录失败，账号或密码为空！'),
(24, 'zh', 'www', 'login_false_rs', '登录失败，会员信息不存在，请检查。'),
(25, 'zh', 'www', 'login_false_password', '登录失败，会员密码不正确。'),
(26, 'zh', 'www', 'login_false_lock', '登录失败，会员账号已被管理员锁定，请联系管理员。'),
(27, 'zh', 'www', 'login_false_check', '登录失败，您的会员账号尚未激活！'),
(28, 'zh', 'www', 'login_usccess', '您的账号已经正常登录，请稍候……'),
(29, 'zh', 'www', 'login_exists', '您已经登录，请返回…'),
(30, 'zh', 'www', 'module_is_close', '模块未启用'),
(31, 'zh', 'www', 'not_any_title_in_module', '没有任何相关主题'),
(32, 'zh', 'www', 'not_found_any_module', '没有找到模块信息！'),
(33, 'zh', 'www', 'vouch_title', '推荐主题'),
(34, 'zh', 'www', 'not_any_cate_in_module', '当前模块中没有任何分类信息'),
(35, 'zh', 'www', 'alipay_not_rs', '无法取得相关付款方案信息，请联系管理员'),
(36, 'zh', 'www', 'alipay_not_popedom', '您没有查看此订单的权限！'),
(37, 'zh', 'www', 'alipay_paystatus_ok', '您已经付款了，请不需要再执行此操作！'),
(38, 'zh', 'www', 'alipay_free', '当前产品为免费产品，您不需要执行付款操作'),
(39, 'zh', 'www', 'alipay_payment_false', '付款失败，请检查！'),
(40, 'zh', 'www', 'alipay_payment_success', '付款成功，感谢您支持我们的服务！'),
(41, 'zh', 'www', 'alipay_order_title', '订单：{sn}'),
(42, 'zh', 'www', 'alipay_order_body', '订单编号：{sn}，订单创建时间：{pdate}'),
(43, 'zh', 'www', 'cart', '购物车'),
(44, 'zh', 'www', 'cart_error_not_id', 'error: 对不起，没有指定产品ID'),
(45, 'zh', 'www', 'cart_error_not_rs', 'error: 没有找到相关产品信息'),
(46, 'zh', 'www', 'checkout_not_empty', 'error: 产品名称不允许为空'),
(47, 'zh', 'www', 'checkout_limit_1', '产品数量不能小于1'),
(48, 'zh', 'www', 'checkout_not_rslist', '产品信息不允许为空！'),
(51, 'zh', 'www', 'checkout_save_error', '订单存储失败，请检查！'),
(50, 'zh', 'all', 'checkout_save_success', '您的订单已经创建成功，订单编号是：{sn}'),
(52, 'zh', 'www', 'checkout_not_rs', '没有找到符合您要求的订单信息！'),
(53, 'zh', 'www', 'checkout_not_popedom', '您没有查看此订单的权限！'),
(54, 'zh', 'www', 'checkout_info_title', '订单编号：{sn} - 查看订单 - 订单中心'),
(55, 'zh', 'www', 'checkout', '订单中心'),
(56, 'zh', 'www', 'checkout_title_2', '查看订单（{sn}）'),
(57, 'zh', 'all', 'datalink_error', '获取联动数据失败'),
(58, 'zh', 'all', 'datalink_select', '请选择…'),
(59, 'zh', 'www', 'download_error', '没有指定附件信息！'),
(60, 'zh', 'www', 'download_empty', '附件已经不存在！'),
(61, 'zh', 'www', 'login', '会员登录'),
(62, 'zh', 'www', 'login_getpass', '取回密码'),
(63, 'zh', 'www', 'login_user_email_chk', '账号或邮箱不允许为空！'),
(64, 'zh', 'www', 'login_not_user_email', '账号不存在或是邮箱填写不正确！'),
(65, 'zh', 'www', 'login_getpass_title', '您好，请到您的邮箱中收取密码修改认证页。'),
(66, 'zh', 'www', 'login_reset_pass', '重设密码'),
(67, 'zh', 'www', 'login_not_code_user', '会员账号或验证串不允许为空'),
(68, 'zh', 'www', 'login_not_user', '账号不存在！'),
(69, 'zh', 'www', 'login_error_code', '验证串不一致，请检查！'),
(70, 'zh', 'www', 'login_code_exp', '验证串已经过期'),
(71, 'zh', 'www', 'login_not_pass', '密码不允许为空！'),
(72, 'zh', 'www', 'login_error_pass', '两次输入的密码不一致！'),
(73, 'zh', 'www', 'login_update', '会员密码更新成功！'),
(74, 'zh', 'www', 'msg_not_id', '获取数据失败，没有指定主题标识串或ID'),
(75, 'zh', 'www', 'msg_not_rs', '无法获取内容信息，请检查'),
(76, 'zh', 'www', 'open_user', '非会员不支持此功能！'),
(77, 'zh', 'all', 'open_not_picture', '批量生成图片错误，没有取得一张有效图片'),
(78, 'zh', 'all', 'open_not_id', '没有指定要生成的图片ID'),
(79, 'zh', 'all', 'open_pl_ok', '图片批量生成完毕'),
(80, 'zh', 'all', 'open_pl_wait', '请稍候，系统正在批量生成新的图片方案'),
(81, 'zh', 'all', 'open_not_pre_id', '没有选择要预览的ID'),
(82, 'zh', 'www', 'please_login', '请先登录！'),
(83, 'zh', 'www', 'usercp', '会员中心'),
(84, 'zh', 'www', 'order', '订单中心'),
(85, 'zh', 'www', 'keywords', '关键字：{kw}'),
(86, 'zh', 'all', 'error', '操作有错误，请检查！'),
(87, 'zh', 'www', 'order_not_payrs', '无法取得相关付款方案信息，请联系管理员。'),
(88, 'zh', 'www', 'order_not_popedom', '您没有查看此订单的权限。'),
(89, 'zh', 'www', 'order_status_pay_ok', '您已经付款了，请不需要再执行此操作！'),
(90, 'zh', 'www', 'post_not_module', '没有找到有效模块信息！'),
(91, 'zh', 'www', 'post_not_popedom', '您没有权限操作此功能！'),
(92, 'zh', 'www', 'post_not_mid', '操作错误，没有指定模块ID。'),
(93, 'zh', 'all', 'all_category', '全部分类'),
(94, 'zh', 'all', 'category_select', '请选择分类'),
(95, 'zh', 'all', 'guest', '游客'),
(96, 'zh', 'www', 'post_cate_error', '分类不正确！'),
(97, 'zh', 'all', 'error_save', '数据存储失败，请检查！'),
(98, 'zh', 'all', 'save_success', '数据存储成功，请稍候…'),
(99, 'zh', 'all', 'del_not_id', 'error：删除失败，没有指定ID'),
(100, 'zh', 'www', 'post_del_not_me', '对不起，您不能删除非自己的主题'),
(101, 'zh', 'www', 'is_logined', '您已经登录了，不能使用注册功能'),
(102, 'zh', 'all', 'register', '会员注册'),
(103, 'zh', 'www', 'empty_pass', '密码不允许为空！'),
(104, 'zh', 'www', 'pass_not_right', '两次输入的密码不一致'),
(105, 'zh', 'www', 'empty_email', '邮箱不允许为空。'),
(106, 'zh', 'www', 'register_ok', '恭喜您注册成为我们的会员'),
(107, 'zh', 'www', 'user_exists', '账号已经存在'),
(108, 'zh', 'www', 'empty_user', '账号不允许为空'),
(109, 'zh', 'all', 'error_not_id', 'error：操作错误，没有取得ID信息'),
(110, 'zh', 'all', 'error_not_rs', 'error：操作错误，没有取得数据信息'),
(111, 'zh', 'all', 'reply', '评论'),
(112, 'zh', 'www', 'reply_lock', '主题未审核或已被锁定，不支持评论功能。'),
(113, 'zh', 'www', 'reply_not', '当前主题不支持评论功能，请检查！'),
(114, 'zh', 'all', 'search', '站内搜索'),
(115, 'zh', 'www', 'search_not_rs', '没有检索您要的信息，请检查…'),
(116, 'zh', 'www', 'user_not_login', '非会员不允许执行此操作，请先登录！'),
(117, 'zh', 'www', 'usercp_info', '修改资料'),
(118, 'zh', 'www', 'usercp_save_success', '会员信息更新成功！'),
(119, 'zh', 'www', 'usercp_changepass', '修改个人密码'),
(120, 'zh', 'www', 'usercp_not_oldpass', '旧密码为空或是旧密码填写不正确！'),
(121, 'zh', 'www', 'usercp_not_newpass', '新密码不允许为空或是两次输入的新密码不一致！'),
(122, 'zh', 'www', 'usercp_old_new', '新旧密码一致，不需要修改！'),
(123, 'zh', 'www', 'pass_save_success', '密码已经更新成功，下次请用新密码登录。'),
(344, 'zh', 'all', 'page_home', '首页'),
(345, 'zh', 'all', 'page_prev', '上一页'),
(346, 'zh', 'all', 'page_next', '下一页'),
(347, 'zh', 'all', 'page_last', '尾页'),
(348, 'zh', 'all', 'not_popedom', '您没有此权限！'),
(349, 'zh', 'www', 'logout_user_success', '会员成功退出'),
(350, 'en', 'www', 'alipay_free', '当前产品为免费产品，您不需要执行付款操作'),
(351, 'en', 'www', 'alipay_not_popedom', '您没有查看此订单的权限！'),
(352, 'en', 'all', 'page_next', '下一页'),
(353, 'en', 'all', 'page_prev', '上一页'),
(354, 'tc', 'www', 'alipay_free', '当前产品为免费产品，您不需要执行付款操作'),
(355, 'tc', 'www', 'alipay_not_popedom', '您没有查看此订单的权限！'),
(356, 'tc', 'www', 'alipay_order_title', '订单：{sn}'),
(357, 'tc', 'www', 'alipay_not_rs', '无法取得相关付款方案信息，请联系管理员'),
(358, 'tc', 'all', 'page_home', '首頁'),
(359, 'tc', 'all', 'page_last', '尾頁'),
(360, 'tc', 'all', 'page_next', '下一頁'),
(361, 'tc', 'all', 'page_prev', '上一頁'),
(362, 'tc', 'www', 'pass_not_right', '两次输入的密码不一致'),
(363, 'tc', 'www', 'order_status_pay_ok', '您已经付款了，请不需要再执行此操作！'),
(364, 'tc', 'all', 'reply', '评论'),
(365, 'tc', 'www', 'open_user', '非会员不支持此功能！'),
(366, 'tc', 'www', 'alipay_payment_success', '付款成功，感谢您支持我们的服务！');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_list`
--

CREATE TABLE IF NOT EXISTS `qinggan_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `module_id` mediumint(8) unsigned NOT NULL COMMENT '模块ID',
  `cate_id` mediumint(8) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `subtitle` varchar(255) NOT NULL COMMENT '副标题',
  `style` varchar(255) NOT NULL COMMENT '主题样式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1正常0锁定',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1隐藏0显示',
  `link_url` varchar(255) NOT NULL COMMENT '访问网址',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否在新窗口打开1是0否',
  `author` varchar(100) NOT NULL COMMENT '发布人',
  `author_type` enum('admin','user','guest') NOT NULL DEFAULT 'user' COMMENT '发布人类型',
  `keywords` varchar(255) NOT NULL COMMENT '关键字，标签',
  `description` varchar(255) NOT NULL COMMENT '简要描述用于SEO优化',
  `note` varchar(255) NOT NULL COMMENT '简要描述，用于列表简要说明',
  `identifier` varchar(100) NOT NULL COMMENT '访问标识串，为空时使用系统ID',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击率',
  `good_hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支持次数',
  `bad_hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拍砖次数',
  `post_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `modify_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `thumb_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图ID',
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1置顶0非置顶',
  `isvouch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1推荐0非推荐',
  `isbest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1精华0非精华',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID，默认是中文',
  `points` int(10) NOT NULL DEFAULT '0' COMMENT '积分，点数',
  `ip` varchar(100) NOT NULL COMMENT '发布人IP号',
  `replydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复时间',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '自定义排序，值越大越往前靠',
  `htmltype` enum('mid','cateid','date','root') NOT NULL DEFAULT 'date' COMMENT 'HTML存储方式，默认是以时间来存储',
  `tplfile` varchar(100) NOT NULL COMMENT '模板文件',
  `star` float unsigned NOT NULL DEFAULT '0' COMMENT '星级评论，默认为0，根据评论表中的星数来决定',
  `price` float NOT NULL DEFAULT '0' COMMENT '主题价格',
  `price_currency` varchar(3) NOT NULL DEFAULT 'RMB' COMMENT '价格对应的货币符号',
  `weight` float unsigned NOT NULL DEFAULT '0' COMMENT '重量，单位千克（Kg）',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `is_qty` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用产品数量，1启用产品数量',
  `qty_unit` varchar(20) NOT NULL COMMENT '数量单位',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`,`cate_id`,`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=560 ;

--
-- 转存表中的数据 `qinggan_list`
--

INSERT INTO `qinggan_list` (`id`, `module_id`, `cate_id`, `title`, `subtitle`, `style`, `status`, `hidden`, `link_url`, `target`, `author`, `author_type`, `keywords`, `description`, `note`, `identifier`, `hits`, `good_hits`, `bad_hits`, `post_date`, `modify_date`, `thumb_id`, `istop`, `isvouch`, `isbest`, `langid`, `points`, `ip`, `replydate`, `taxis`, `htmltype`, `tplfile`, `star`, `price`, `price_currency`, `weight`, `qty`, `is_qty`, `qty_unit`) VALUES
(79, 34, 0, '测试招聘信息', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '简单说明一下！', '', 6, 0, 0, 1280489133, 0, 0, 0, 0, 0, 'zh', 0, '127.0.0.1', 0, 0, 'cateid', '', 0, 0, 'CNY', 0, 0, 0, ''),
(413, 7, 1, '怡亚通益达创新创业学院：推进产教融合，深化校企协同育人', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 6, 0, 0, 1450054788, 1450411133, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 413, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(414, 7, 1, '怡亚通益达首届“全球供应链商业生态圈”师资培训班顺利开班', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 9, 0, 0, 1450054788, 1450411059, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 414, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(415, 7, 1, '重磅消息！江苏农牧科技职院与怡亚通益达签订了人才孵化基地共建协议', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 7, 0, 0, 1450054788, 1450411003, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 415, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(416, 7, 1, '益达教育助力吉林大学珠海学院入围首届全国“互联网+”大学生创新创业大赛总决赛', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 5, 0, 0, 1450054788, 1450410802, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 416, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(417, 7, 1, '湖北地区校行企共建创新创业实践研讨会成功召开', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 8, 0, 0, 1450054788, 1450410752, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 417, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(418, 7, 1, '怡亚通益达校行企共建创新创业实践研讨会在滁州职院召开', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 4, 0, 0, 1450054788, 1450410467, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 418, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(419, 7, 1, '“益达杯”第三届全国国际贸易会计职业能力竞赛在天津商务职业学院成功举办', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 3, 0, 0, 1450054788, 1450410348, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 419, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(420, 7, 1, '重庆传媒职业学院创新创业班开课啦！', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 9, 0, 0, 1450054788, 1450410335, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 420, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(421, 7, 1, '首届“直通国际•益达杯”全国保税物流竞赛成功举办', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 19, 0, 0, 1450054788, 1450409955, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 421, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(445, 7, 44, '【高职网】中国高职创业教育在南美高校受关注', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 5, 0, 0, 1450054763, 1450417259, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 445, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(446, 7, 44, '【教育网】行业资讯：回到原点再认识职业教育', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 3, 0, 0, 1450054763, 1450411365, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 446, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(447, 7, 44, '【新浪股吧】陕西职院校行企合作助推学生创新创业', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 5, 0, 0, 1450054763, 1450417160, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 447, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(448, 7, 44, '【新浪】带你解读怡亚通益达全球供应链与跨境电商人才培育体系', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 4, 0, 0, 1450054763, 1450417005, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 448, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(449, 7, 44, '【搜狐】陕西职院与怡亚通益达教育校企合作成功签约', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 8, 0, 0, 1450054763, 1450416796, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 449, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(450, 7, 44, '【搜狐平台】怡亚通益达教育：开创全新的职业教育模式', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育,致力于构建职业教育生态系统', '', '', 5, 0, 0, 1450054763, 1450416697, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 450, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(451, 7, 1, '益达教育全程支持第三届中国职业教育与商务行业对话活动', '', '', 1, 0, '', 0, 'admin', 'admin', '益达教育集团', '益达教育，致力于构建职业教育生态系统', '', '', 27, 0, 0, 1450054763, 1450410091, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 451, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(452, 20, 53, '教育服务', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 38, 0, 0, 1450146530, 1450234810, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(545, 52, 82, '课程资源库', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 21, 0, 0, 1450167209, 1450424518, 293, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 255, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(457, 20, 77, '企業介紹', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 42, 0, 0, 1450161181, 1450234881, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 40, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(458, 20, 77, '企業戰略', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 2, 0, 0, 1450161205, 1450161236, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 29, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(459, 20, 77, '核心優勢', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450161243, 1450161265, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 28, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(460, 20, 77, '發展歷程', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450161268, 1450161290, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 27, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(461, 20, 77, '公司團隊', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450161292, 1450161311, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 26, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(462, 20, 77, '企業品牌', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450161313, 1450161328, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 25, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(463, 20, 77, '教育服務', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 11, 0, 0, 1450161340, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(464, 20, 77, '企業文化', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 5, 0, 0, 1450161358, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(465, 20, 77, '社會責任', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 6, 0, 0, 1450161371, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(466, 20, 77, '企業聯繫方式', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 6, 0, 0, 1450161389, 1450234933, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(467, 20, 77, '企業下屬企業', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 4, 0, 0, 1450161405, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(468, 52, 76, '課程資源', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 10, 0, 0, 1450162732, 1450162890, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 50, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(469, 52, 76, '系列教材', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450162892, 1450162916, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 49, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(470, 52, 76, '企業模擬軟件', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450162918, 1450162938, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 48, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(471, 52, 76, '3D真實訓軟件', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450162940, 1450162964, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 47, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(474, 52, 76, '企業數字化課堂', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163114, 1450163136, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 44, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(473, 52, 76, '特色實訓基地(平臺)', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163071, 1450163110, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 45, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(472, 52, 76, '情境實操實訓室', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163032, 1450163062, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 46, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(355, 20, 53, '企业介绍', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'gk', 568, 0, 0, 1449821310, 1450345660, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 40, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(356, 20, 53, '企业战略', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'zl', 94, 0, 0, 1449821373, 1450340112, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 39, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(357, 20, 53, '核心优势', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'hx', 69, 0, 0, 1449821808, 1450320216, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 38, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(358, 20, 53, '发展历程', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'lc', 73, 0, 0, 1449821861, 1450321416, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 37, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(359, 20, 53, '公司团队', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', 'td', 0, 0, 0, 1449821907, 1450057209, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 36, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(360, 20, 53, '企业品牌', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', 'pp', 0, 0, 0, 1449821945, 1450057214, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 35, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(388, 20, 53, '企业文化', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'wenhua', 154, 0, 0, 1450143431, 1450337944, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(390, 20, 53, '企业联系方式', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 55, 0, 0, 1450143776, 1450339716, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(391, 20, 53, '企业下属企业', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 35, 0, 0, 1450143857, 1450339235, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(475, 52, 76, '企業經營推演沙盤', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163138, 1450163159, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 43, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(476, 52, 76, '跨專業綜合實訓平臺', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163161, 1450163186, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 42, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(477, 52, 76, '在線考試平臺', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163189, 1450163207, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 41, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(478, 52, 76, '職業技能鑑定平臺', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163208, 1450163230, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 40, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(479, 52, 76, '職業技能競賽', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163232, 1450163253, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 39, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(480, 52, 76, '行業從業能力競賽', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163273, 1450163296, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 38, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(481, 52, 76, '職業資格認證', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163299, 1450163319, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 37, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(482, 52, 76, '專業技能認證', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450163322, 1450163343, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 36, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(483, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(484, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(485, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 485, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(486, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 486, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(487, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 487, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(488, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 488, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(489, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 489, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(490, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 490, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(491, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 491, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(492, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 492, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(493, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 493, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(494, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 494, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(495, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 495, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(496, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 496, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(497, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 497, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(498, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 498, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(499, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 499, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(500, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 500, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(501, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 501, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(502, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 502, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(503, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 503, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(504, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 504, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(505, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 505, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(506, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 506, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(507, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 507, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(508, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 508, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(509, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 509, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(510, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 510, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(511, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 511, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(512, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 512, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(513, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 513, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(514, 7, 75, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164686, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 514, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(515, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 515, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(516, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 516, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(517, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 517, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(518, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 518, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(519, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 519, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(520, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 520, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(521, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 521, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(522, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 522, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(523, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 523, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(524, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 524, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(525, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 525, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(526, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 526, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(527, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 527, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(528, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 528, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(529, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 529, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(530, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 530, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(531, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 531, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(532, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 532, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(533, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 533, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(534, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 534, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(535, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 535, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(536, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 536, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(537, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 537, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(538, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 538, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(539, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 539, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(540, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 540, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(541, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 541, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(542, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 542, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(543, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 543, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(544, 7, 74, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450164666, 0, 0, 0, 0, 0, 'tc', 0, '0.0.0.0', 0, 544, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(546, 52, 82, '系列教材', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 5, 0, 0, 1450167232, 1450424564, 294, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 254, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(547, 52, 83, '企业模拟软件', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167246, 1450424595, 295, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 253, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(548, 52, 83, '3D仿真实训软件', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167259, 1450424632, 296, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 252, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(549, 52, 83, '情境实操实训室', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 2, 0, 0, 1450167272, 1450424665, 297, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 251, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(550, 52, 83, '特色实训基地（平台）', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450167283, 1450424687, 298, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 250, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(551, 52, 83, '企业数字化课堂', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450167295, 1450424721, 299, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 249, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(552, 52, 83, '企业经营推演沙盘', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167308, 1450424751, 300, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 248, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(553, 52, 83, '跨专业综合实训平台', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450167321, 1450424785, 301, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 247, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(554, 52, 84, '在线考试平台', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450167332, 1450424832, 302, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 246, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(555, 52, 84, '职业技能鉴定平台', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167345, 1450424860, 303, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 245, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(556, 52, 85, '职业技能竞赛', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167356, 1450424895, 304, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 24, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(558, 52, 86, '职业资格认证', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450167382, 1450424950, 305, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 22, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(559, 52, 86, '专业技能认证', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450167394, 1450424968, 306, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_list_c`
--

CREATE TABLE IF NOT EXISTS `qinggan_list_c` (
  `id` int(10) unsigned NOT NULL COMMENT '主题ID',
  `field` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `val` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`,`field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_list_c`
--

INSERT INTO `qinggan_list_c` (`id`, `field`, `val`) VALUES
(355, 'content', '<p align="center"><img src="upfiles/201512/17/7d9c559105fbfc8e.jpg" border="0" alt="" /><br /><br /></p><p align="center"><img border="0" alt="" src="upfiles/201512/17/dcfbf005d1a3f957.jpg" /><br />&nbsp;</p>'),
(356, 'content', '<p align="center"><img border="0" alt="" src="upfiles/201512/17/f5a117f51f09b294.png" /><br /><br />&nbsp;</p><p><br />&nbsp;</p>'),
(357, 'content', '<p align="center"><img border="0" alt="" src="upfiles/201512/17/98acb95ea14f9a87.png" /></p><p align="center"><br /></p><p><br /></p>'),
(358, 'content', '<p align="center"><img border="0" src="upfiles/201512/17/376896db840f8414.png" alt="" /></p>'),
(359, 'content', '载入……'),
(360, 'content', '载入……'),
(388, 'content', '<p align="center"><img border="0" alt="" src="upfiles/201512/17/9639a455fcf4756b.png" /></p><p align="center"><br /></p><p><br /></p>'),
(390, 'content', '<p align="center"><img border="0" src="upfiles/201512/17/c1208358f152e125.png" alt="" /></p>'),
(391, 'content', '<p align="center"><img border="0" src="upfiles/201512/17/56482175758d6061.png" alt="" /></p>'),
(27, 'content', '<div>联系我们</div><div>&nbsp;</div>'),
(16, 'content', '<p>简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实</p><p>[:page:]</p><p>再来测试一下分页！囧啊~</p>'),
(413, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>全国高校创新创业开展得如火如荼，近日，湖州职业技术学院、金华职业技术学院、江西应用技术职业学院、重庆工商职业学院等多所院校领导就推进产教融合，深化校行企协同育人的思想，在深圳怡亚通参加了深度校行企合作洽谈会，并参观了怡亚通全球供应链体验馆， 对怡亚通益达全球供应链与创新创业人才培养体系表示高度的认可。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_267.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" alt="" /></div><span style="font-family:Microsoft YaHei;color:#666666;"></span><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">会议洽谈</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_268.jpg" border="0" alt="" /><br /><span style="font-family:Microsoft YaHei;color:#666666;">参观怡亚通供应链生态圈</span></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>在现阶段，高校生就业难已经引起学校、家庭、政府等多方面的重视。开展大学生创新创业研究和教育可以以创业促就业，减轻大学生就业问题对社会的压力。并不是每个大学生毕业后都要去创办自己的企业，但大学生创新创业能力的培养可以帮助他们更好地就业，可以使他们在今后的职业生涯中取得更大的成功。如何实现这个教育目标，靠学校单方面的力量是远远不够的，学校的教学只有和产品结合起来，只有和企业结合起来，实行产教结合，校企合作才能使学生学到真正的本领。</span></p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达创新创业学院有效地整合学校和企业的教育资源，进一步拓展校企合作的内涵，使职业教育和企业行业在人才培养上“捆绑发展”，形成多层次的创新创业人才培养模式，切实推动专业与产业对接、教学过程与生产过程对接、人才培养标准与企业用人标准对接、专业课程内容与职业要求对接。融入企业文化，加强素质教育，使学生素质与企业员工素质要求相一致，为创新型人才的培养创造有效途径，从而不断释放全社会创新创业的活力，进一步提升职业教育对经济发展建设的贡献度。</span>'),
(414, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>2015年11月27日，怡亚通益达首届“全球供应链商业生态圈”师资培训班在深圳市怡亚通供应链股份有限公司总部顺利开班！20余名教师参加了此次培训。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_261.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" width="500" height="333" alt="" /></div><span style="font-family:Microsoft YaHei;color:#666666;"></span><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">开班仪式</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_262.jpg" border="0" alt="" /><br /><span style="font-family:Microsoft YaHei;color:#666666;">平台介绍</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_263.jpg" border="0" alt="" /><br /><span style="font-family:Microsoft YaHei;color:#666666;">集团介绍</span></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>培训班旨在通过讲解分析怡亚通（EA）全球供应链商业生态圈策略及怡亚通益达全球供应链与跨境电商人才培育体系，推动专业与产业对接、教学过程与生产过程对接、人才培养标准与企业用人标准对接、专业课程内容与职业要求对接。融入企业文化，加强素质教育，使学生素质与企业员工素质要求相一致，为创新型人才的培养创造有效途径，从而不断释放全社会创新创业的活力。</span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>以怡亚通全球供应链商业生态圈为基础，构建基于企业真实运营的跨专业实训教学环境，涵盖供应链管理、跨境电商、互联网金融、Ｏ２Ｏ终端、物流、采购等领域，既用于专业教学，又满足其他专业学生电商创业实训教学的需要，全面互联互通教育系统和社会系统，是一种协同发展的创新创业教育模式，进一步提升职业教育对经济发展建设的贡献度。</span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p>'),
(415, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>为进一步推进校企协同创业创新发展，发挥学院学科、师资和人才培养优势，加强企业在职业院校建设中的重要作用，以校行企合作为核心理念，引入全国产业链500强龙头企业资源，建设服务江苏职业教学改革、与区域经济高度融合的电商与供应链人才、企业培育基地。</span></p><p></p><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;"><img src="upfiles/201512/17/big_260.jpg" border="0" style="line-height: 19.2px;" width="500" height="350" alt="" /></span></div><span style="font-family:Microsoft YaHei;color:#666666;"></span><div style="text-align: center;"><span style="color:#666666;">签约仪式</span></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>9月29日下午，在凤凰路校区行政楼三楼会议室举行了“江苏农牧科技职业学院与中国对外贸易经济合作企业协会和深圳怡亚通益达教育服务有限公司合作办学意向签约仪式”。学院副院长臧大存、教务处李志方副处长、农商管理系唐春根主任和农业物联网系徐冬寅副主任，中国商业企业管理协会副会长郑天舒，中国对外贸易经济合作企业协会副主任徐龙，深圳怡亚通益达教育服务有限公司总经理戴敏华和江苏跨境电子商务师培训考试办公室副主任夏玲等出席了签订仪式。</span></p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>由校行企共建的怡亚通益达学院，依托怡亚通核心资源，围绕当下的战略目标，在布局、结构、供给体制与企业产业结构、区域发展、城镇化战略和对外开放战略紧密结合，在研发中心共建、人才引进培养等方面，建立互信互助、长期全面的合作关系，体现了优势互补和共同发展，致力于全球供应链人才的培养。</span>'),
(416, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>首届中国“互联网+”大学生创新创业大赛全国总决赛将于10月19日至21日在吉林大学举行，100个团队项目将参加现场比赛，覆盖“互联网+”传统产业、新业态、公共服务、技术支撑平台等领域，分为创意组和实践组两类进行比赛。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_258.jpg" border="0" style="font-family: ''Microsoft YaHei'';" width="500" height="337" alt="" /></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>大赛自今年5月启动，至9月15日已吸引31个省（区、市）1878所高校的57253支团队报名参加，提交项目作品36508个，参与学生超过20万人，带动上百万大学生投入创新创业活动。</span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>吉林大学珠海学院凭借互联网+创业大赛项目：“互联网下的云立方校园供应链服务平台”进入决赛。该项目是依托领先的怡亚通互联网供应链生态圈，由益达教育为其量身倾力打造。“互联网下的云立方校园供应链服务平台”是以互联网供应链生态圈的真实企业业务为载体，怡亚通益达搭建学生的创新、创业平台，探索全新的&quot;职业体验式&quot;的实践教学模式，提升学生的职业能力；通过网络创业平台、真实项目实训教学的&quot;职业体验&quot;，积极探索学生就业、创业的实践教学体系，着重培养学生的职业能力、职业素质。</span></p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>由校行企共建的怡亚通益达学院，依托怡亚通核心资源，围绕当下的战略目标，在布局、结构、供给体制与企业产业结构、区域发展、城镇化战略和对外开放战略紧密结合，在研发中心共建、人才引进培养等方面，建立互信互助、长期全面的合作关系，体现了优势互补和共同发展，致力于全球供应链人才的培养。</span>'),
(417, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>10月17日，由中国职业技术教育学会国际商务教育研究会、中国商业企业</span><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;">管理协会主办，益达（广州）教育科技有限公司承办的湖北地区校行企共建创新创业实践研讨会在湖北武汉成功召开。有来自湖北区域30多所高校的领导与专业老师参加了此次研讨会。</span><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_254.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" width="500" height="336" alt="" /></div><div style="text-align: center;"><span style="color:#666666;">研讨会上领导、专家合影</span><br /></div><p></p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>研讨会上，大家共同探讨在互联网+战略下如何进一步推进现代商贸流通行业专业人才的培养；在新时期环境下如何以校行企合作为理念，把全国产业链500强龙头企业资源引入学校，全面推进大众创业、万众创新的相关工作。<br /></span><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>国资委中国商业企业管理协会副会长郑天舒与大家探讨了互联网+产业政策下现代流通行业人才需求特点及校行企合作的内涵与途径，深圳怡亚通益达教育服务有限公司总经理戴敏华跟大家分享了怡亚通益达创新创业学院合作模式介绍，中国对外经济贸易企业协会教育工作委员会助理秘书长张明泽与大家分享了校行企共建陕西职院——怡亚通益达创新创业学院成功案例。会议最后，大家就湖北省高校校行企共建模式进行了沟通交流，现场讨论氛围十分热烈。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_255.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" width="500" height="336" alt="" /></div><span style="font-family:Microsoft YaHei;color:#666666;"></span><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">研讨会现场</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_256.png" border="0" width="500" height="336" alt="" /><br /><p style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">国资委中国商业企业管理协会副会长发表讲话</span></p><div style="text-align: center;"><img src="upfiles/201512/17/big_257.jpg" border="0" width="500" height="336" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">怡亚通益达总经理戴敏华发表讲话</span></div></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>校行企共建的怡亚通益达学院，依托领先的怡亚通互联网供应链生态圈，让院校成为供应链生态圈成员，融入到全球供应链体系，院校师生通过平台进行教学、创业并承接该生态圈相关企业的真实业务，致力于全球供应链人才的培养。</span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p>'),
(418, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>11月30日，中国商业企业管理协会、中国对外贸易经济合作企业协会校企合作共建联席会议办公室副主任张明泽、协会安徽联络处主任曹亮、协会上海办公室王丽兰、深圳怡亚通益达教育服务有限公司技术工程师郑天飞一行就“校、行、企”合作及经济类专业的实践教学模式改革等工作到滁州职业技术学院考察交流，受到院长李柱梁、副院长汪上以及教务处、实训中心负责同志热情的接待。</span><br /><div style="text-align: center;"><img src="upfiles/201512/17/big_249.jpg" border="0" width="500" height="349" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">会议交流</span></div><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>院长李柱梁代表学院对考察组一行的到来表示热烈欢迎，主要介绍了滁州职院的发展情况，重点介绍了滁州职院在校企合作、实践教学模式改革中的主要做法、取得的成绩等情况。</span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>张明泽就中国商业企业管理协会、中国对外贸易经济合作企业协会依托深圳怡亚通益达教育服务有限公司实训平台与全国多所高校在“校、行、企”合作中的成功经验、互联网环境下的大学生创新、创业教育等问题与学院领导进行了深入的交流。怡亚通益达技术工程师郑天飞阐述了创新创业学院实训平台的创新应用、与会探讨了专业教学资源库提供跨越时空的数字化管理与应用。</span></p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>会后，在院长李柱梁的陪同下，考察组一行参观了经济贸易系实训中心和大学生创业孵化基地。<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达学院的实训教学依据行业标准，依托上市企业全真数据，衔接职业院校的人才培育。在此强有力的基础上，由校行企合作共建“创新创业（孵化）中心”和“跨专业实训实习基地”，是培养互联网+现代商贸流通行业人才，深化校企合作、产教融合、保障就业、促进创业的重要举措。</span>'),
(419, 'content', '<p><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　&nbsp;</span>“益达杯”第三届全国国际贸易会计职业能力竞赛于11月13-15日在天津商务职业学院成功举办，由中国对外经济贸易会计学会、中国对外贸易经济合作企业协会、中国职业技术教育学会国际商务教育研究会主办，天津商务职业学院承办，益达（广州）教育科技有限公司全程技术支持。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_242.jpg" border="0" style="line-height: 19.2px;" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">竞赛大会致辞</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_243.jpg" border="0" style="line-height: 19.2px;" alt="" width="500" height="375" /></div><div style="text-align: center;"><span style="font-family: ''Microsoft YaHei''; background-color: rgb(255, 255, 255);"><span style="color:#666666;">大会现场</span></span></div><p></p><span style="font-family: ''Microsoft YaHei'';"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>本次竞赛主要是为了推进会计专业教学与工作实际相结合，促进我国外经贸财会人才队伍建设，展示国际贸易会计专业教学水平和学生的职业风采，探索国际贸易行业参与院校教学改革的途径和方法，提升我国国际贸易财会从业人员的职业素质，促进国际贸易行业健康发展。<br /></span><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>大赛将进出口会计业务整体过程作为竞赛内容，对应国贸会计类专业相关职业岗位或岗位群、体现国贸会计专业核心能力与核心知识、涵盖丰富的专业知识与专业技能点，也突出职业素养考核。此举全面考量选手的国贸会计操作技能，对提升院校国贸会计类专业教学质量具有较高的指引作用。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_245.jpg" border="0" style="line-height: 19.2px;" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">竞赛现场</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_246.jpg" border="0" alt="" /><br /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">颁奖仪式</span></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>在比赛期间，指导教师开展了“全国外贸会计职业能力发展论坛”交流会，各参赛院校进行了教学及实践的经验交流。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_247.jpg" border="0" style="line-height: 19.2px;" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">PPT展示</span></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>此次大赛推动了国贸会计实践教学改革与创新，同时也展示各院校的办学成果和学生专业技能，提高了学生综合素质和就业竞争力，实现以赛促学、以赛促教、以赛促改，落实和推进职业教育教学改革。</span></p><p><br /></p>'),
(420, 'content', '<p><br /></p><p><span style="font-family:Microsoft YaHei;">　　近日，由怡亚通益达教育与重庆传媒职业学院以校企合作为核心理念的创新创业班成功开课。创新创业班旨在通过对学生的创业教育，点燃学生心中的创业热情，最终达到倡导并弘扬创新精神，提高和加强创业能力，培养复合型高技能人才、创新创业型人才。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_228.jpg" border="0" style="line-height: 19.2px;" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">重庆传媒学院怡亚通益达创新创业学院</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_236.jpg" border="0" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">创新创业能力培养1</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_237.jpg" border="0" alt="" /><br /><span style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">创新创业能力培养2</span></span><br /></div><div style="text-align: center;"><span style="text-align: center;"><img src="upfiles/201512/17/big_238.jpg" border="0" alt="" /><br /><span style="font-family:Microsoft YaHei;color:#666666;">参观学习</span></span></div><div style="text-align: left;"><span style="font-family:Microsoft YaHei;">　　本次创新创业班共有109名学员，分为两个班，进行为期10天，共80课时的培训。创新创业培训班通过制定专业的培训方案、设置创新课程、强化创新实践等途径，使学生能够接受企业系统性的创新能力培养和训练，并在专业教学中融入行业创新思维，为学员提供全球最前沿的供应链知识培训与实践。让学生在校完成学习、实训、实习、创业的全过程。</span></div><div style="text-align: left;"><span style="font-family:Microsoft YaHei;">&nbsp;　　由校行企共建的怡亚通益达学院，依托怡亚通核心资源，围绕当下的战略目标，在布局、结构、供给体制与企业产业结构、区域发展、城镇化战略和对外开放战略紧密结合，在研发中心共建、人才引进培养等方面，建立互信互助、长期全面的合作关系，体现了优势互补和共同发展，致力于全球供应链人才的培养。</span><br /></div><div style="text-align: center;"><span style="text-align: left;"><span style="color:#333333;"><br /><br /></span></span></div>'),
(421, 'content', '<p><br /></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>11月13-15日，由中国商业企业管理协会主办、重庆城市管理职业学院承办，益达（广州）教育科技有限公司全程技术支持的首届“直通国际•益达杯”全国保税物流竞赛在重庆城职院与重庆直通物流保税仓库举行，共有来自重庆、四川、江苏等地的18所本专科院校参赛。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_221.png" border="0" width="500" height="300" alt="" /><br /></div><div style="text-align: left;"><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>本次竞赛分为保税物流作业方案设计与实施两个赛段。13日下午，在重庆城市管理职院进行保税物流作业方案设计，参赛队在规定时间内，分析竞赛背景资料，根据竞赛实施场地的布置情况以及客户需求，形成作业方案。</span><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;">14日在重庆直通物流保税仓库进行保税物流作业方案实施，参赛队根据赛务组提供的设计方案，在竞赛场地实施方案。</span></div><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_219.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" alt="" width="500" height="300" /></div><div style="text-align: center;"><img src="upfiles/201512/17/big_220.png" border="0" style="line-height: 19.2px;" alt="" width="500" height="300" /></div><p><span style="font-family: ''Microsoft YaHei'';"><br /></span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>15日上午举行竞赛闭幕暨颁奖仪式。本次竞赛设立团队风尚奖、最佳操作奖、最佳方案设计奖、最佳指导教师奖、团队综合奖共五类奖项。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_218.png" border="0" alt="" width="500" height="300" /><br /></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>通过此次竞赛，全体参赛师生进入现代物流企业内部，更好地熟悉企业现场作业流程与保税物流管理方法，有助于促进高等院校人才培养与企业需求紧密对接，进一步深化高等院校物流专业教学改革，满足快速增长的高水平保税物流人才需求。</span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p>'),
(445, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>随着中国经济发展模式转型和大国崛起，中国的创业文化和创业教育也日益受到国外高校的关注。2014年年底，应巴西联合大学总部桑特安娜大学和阿根廷莫雷诺国立大学的邀请，浙江工贸职业技术学院教授何向荣就创业文化及创业教育实践的主题在两所学校进行了学术交流和讲学，反响热烈。</span></p><p></p><div style="text-align: center;"><img src="upfiles/201512/17/big_283.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" width="500" height="337" alt="" /></div><p></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>巴西和阿根廷两国的创业教育起步相对较晚，由于近年来经济发展缓慢、失业率居高不下，两国政府在以经济增长型为导向的创新型国家发展战略中，开始重视通过创业解决失业问题和促进经济增长，创业教育也开始成为高校热议的话题。在交流中，何向荣教授多以生动的中国创业案例阐释中国特色的创业文化，如马云与阿里巴巴、中国合伙人、温州模式等，得到两国学者的频频赞许。</span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>学术交流搭台，校际合作的“大戏”也十分精彩。在桑特安娜大学，双方就教师交流培训、技术合作、创业创新人才培养、体育交流等项目达成合作共识，确定桑特安娜大学校长玛利亚2015年3月回访时正式签订、启动两校合作办学协议。莫雷诺国立大学十分重视这次学术交流活动，校长雨果·安特·拉德等学校领导出席洽谈会，并就教师互派、语言培训、学生交流、学生创业竞赛等方面内容达成战略合作框架，近期将正式签订合作协议。</span></p><p style="text-align: right;"><span style="font-family:Microsoft YaHei;">【中国高职高专教育网】</span></p>'),
(446, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>不同类型的教育都有其自身的规律和特征，对这些规律和特征的把握离不开哲学思维与哲学理论的指导。要正确理解和认识职业教育，必须站在哲学的高度，从教育哲学基础出发，对职业教育的本质及其实践的内在基础进行“元研究”，方能把握职业教育的本质属性，从而施行“本真”的职业教育实践。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>职业教育首先是一种“教育”，其要义是关注人的个性完善，并立足于人的生涯可持续发展；它是一种以专业基础知识和专业技能为主的教育，训练（实践）是职业教育的内涵之一，是实现职业教育人才培养目标的一种方法和途径；它是为“职业”做准备的教育，更直接地与产业行业相联系（以就业为导向），其价值取向是“社会本位”的，要与技术进步保持协调一致，不断反映经济社会发展的新要求。职业教育的发展是经济社会发展的结果，也是经济社会发展的前提，两者相互影响相互促进。这是我们思考和讨论职业教育各类问题的基本理论依据。<br />&nbsp;<br /><strong>&nbsp; 技以载道的价值观</strong><br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>长期以来，缺少教育哲学指导的职业教育实践左右摇摆，经常陷入“二元论”：要么强调教育性（育人），用普通教育的思维指导职业教育实践，湮没了职业教育的特色；要么强调职业性（训练），以简单的技能培训代替系统的职业教育，将“育人”变成了“制器”。这两种极端都曲解了职业教育的本义，“只见树木，不见森林”。其实，从“职业”与“教育”的本质视角看，职业是变化的，教育是永恒的，职业教育是变化与永恒的统一；职业具有工具性，教育具有文化性，职业教育是工具与文化的统一；职业是现实的，教育是理想的，职业教育是现实与理想的统一。“三个统一”才是职业教育“跨界性”的本质特征。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>没有人能够否认，职业教育的培养目标必须是德才兼备的，不同的只是“技术技能型”。这类人才往往技艺出神入化、炉火纯青，如庖丁解牛般达到一个高超的境界。在这种有境界追求的学习中，技术并没有片面化为达成某一单个目的的工具，而是一种全身心的修炼过程。如庄子所云“技兼于事，事兼于义，义兼于德，德兼于道，道兼于天”，要培养达到这种高超境界的人才，就必须施行发展个性、触及灵魂的职业教育。时刻牢记，“技以载道”是职业教育最核心的价值观。<br />&nbsp;<br /><strong>&nbsp; 实践第一的课程观</strong><br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>从哲学意义上讲，什么样的课程观决定了什么样的课程行为。马克思主义哲学首要的基本观点是实践，“实践是认识的来源，实践是认识发展的动力”。“社会本位”的职业教育，一定要从社会存在的实际需要出发，强调实践的重要性，这是设计、实施和评价课程时最为核心的哲学思考。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>教育对学生的影响是整体的、潜移默化的，因此办教育实质上是提供一种成长的环境，其途径是显性和隐性的课程。所谓现代学徒制，就是传统学徒制加上差异化的课程，课程是根本、是核心。人才培养的首要任务是知社情、知学情：首先要根据社情（社会的需要）来设计课程，寻找应然的职业态度需要的知识点和技能点；其次是根据学情（学生的世界观、人生观、价值观）来实施课程，寻找学生学习的愤悱点、兴趣的起始点、知识与技能的起始点。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>应该说，职业教育“不是寻找适合教育的学生，而是寻找适合学生的教育”。以全国各类高校在黑龙江省的招生最低录取分数线来分析，可以大致了解职业院校生源的实际情况。2013年高考全国共有699万考生，其中“985”高校最低分是562分，“211”高校最低分是492分，老本科院校最低分是400分，新建本科院校最低分是342分，而高职高专院校低至170分。如果把考生比作木材的话，可以说最好的金丝楠木被“985”高校拿走了，“211”高校拿走了红木，老本科院校得到了硬木，而新建本科院校和高职高专院校得到的只是硬杂木和速生杨。生源的情况如此迥异，如何能够用同样的方法来培养呢。<br />&nbsp;<br />&nbsp; 经济社会是由法人组织构成的，每一个法人组织由不同的团队构成，每一个不同的团队由不同的个体构成。“可雇佣性，是雇佣者对受雇对象提出的，品质和能力的诉求或期求”。英国高教基金会的调查表明，雇主期求前十位的都是“与人合作”等通用性能力，特定领域的专门知识没能进入前十位。而在我国，无论是各类院校的学历教育还是职业技能培训，基本上都是个体性的教育，这种忽视合作的个体性教育已然不适合于社会的需要。另外，职业教育的生源基本属于同层次教育中个体显性知识学习的后进者，学校应依据可雇佣性开展课程建设，突出团队学习（寓个体教育于团队培育之中）、突出隐性知识学习（实践教学）。<br /></span><p><span style="font-family:Microsoft YaHei;">&nbsp;<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span></span><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;">“教学做”是陶行知教育思想的核心理念，“先生拿做来教，乃是真教；学生拿做来学，方是实学”，这一教学法的哲学基础是理论与实践的结合，突出了实践对于认识的意义。人才培养的核心是具有可雇佣性，教学改革的核心是课程建设，所以越是根植于学生内在需求的课程越是有效的，越是扎根于学生鲜活经验的课程越是有效的，越是来源于学生实践反思的课程越是有效的。</span></p><span style="font-family: ''Microsoft YaHei'';"><strong>&nbsp;<br />&nbsp; 作用有限的发展观</strong><br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>以知识创新为特征的全球经济，基于互联网等新技术带来工作岗位和工作组织的变化。可以预测，未来现代企业中将诞生更多的生产、经营、管理一体化的工作岗位，管理方式将由“指令性”领导变为“理念性”领导，员工从被动地待命到主动地出击，组织形式也从“科层制”走向“扁平化”。由各种“专家”组成的互补型跨功能团队，既可以各自为战，更能够同心协力。因此，常规动手能力、常规认知能力及非常规动手能力这三种技能已然成为工作基础，更多地需要员工具有非常规分析能力和非常规交流能力，这是未来对职业教育提出的更高要求。职业教育不仅要积极回应这种新需求，更要主动迎接新挑战，这是由教育的性质（即基础性、教育性、全局性）和使命所决定的。如果说教育是明天的希望和财富，那么职业教育同时也是今天的现实和生产力。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>任何教育的作用都是有限的，任何一个人都不可能通过一次学习（学校教育），就能够获得未来职业生涯中的全部知识。因此，职业教育应该成为学生职业生涯的“加油站”，要在学生成长的各个结点，随时为其成长提供多层次、多类别、多形式的教育选择。也就是说，完善的职业教育体系既要支撑受教育者能找到第一份工作，还要为他一生的可持续发展（如转岗、学历晋升）提供教育支持。现阶段，有中国特色的职业教育体系就是职业教育与普通教育并行推进、协调发展，面向全民、高度开放，纵向有序衔接（学位制度健全）、横向与普通教育和继续教育相互贯通。<br />&nbsp;<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>面对差异巨大的中国职业教育现实，既需要在理论上回到原点重新认识职业教育，更要在实践中有勇气和决心，在总结提炼过往经验的基础上，开创“百家争鸣、各有千秋”的职业教育新局面。<br />&nbsp;<br />&nbsp; （作者：曹勇安系黑龙江省齐）</span>');
INSERT INTO `qinggan_list_c` (`id`, `field`, `val`) VALUES
(447, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>益达教育，成立于2001年，一直以来专注于教育教学软件领域的研究，致力于构建职业教育生态系统；拥有业界最完整的综合实验实训解决方案体系，成功服务了上千家本科、高职、中职院校用户，建成多个全国一流的线下基地。<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>由校行企共建的怡亚通益达创新创业学院，依托领先的怡亚通互联网供应链生态圈，让院校成为供应链生态圈成员，融入到全球供应链体系。院校师生通过平台进行教学、创业并承接该生态圈内相关企业的真实业务，进一步深化产教融合、校企合作，共同致力于全球供应链人才的培养。<br /></span><div style="text-align: center;">陕西职院创新创业中心建设</div><div style="text-align: center;"><img src="upfiles/201512/17/big_281.jpg" border="0" width="500" height="392" alt="" /></div><p><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>创新创业中心是以实训教学云平台系统集成技术为核心，采用任务驱动型教学方法，完成理实一体化的综合实训教学目的。数字化教学云平台是基于Linux云计算理念，采用国际领先的MOOC模式，为专业教学资源库提供跨越时空的数字化管理与应用平台。</p><p><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>通过“一站式应用”和“云”的理念，打破了教育的信息化边界，让学校、教师和学生拥有可用的、平等的平台，只要有网络，手上有电脑、手机、PAD等移动设备，可以随时随地访问云平台。</p><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>创新创业中心包括：创新创业孵化工作室、跨境电商运营工作室、宇商网运营工作室、云微店移动电商体验馆、仓储物流实训室等。<br /><div style="text-align: center;">&nbsp;<img src="upfiles/201512/17/big_282.jpg" border="0" width="500" height="326" alt="" />&nbsp;</div><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达学院的实训教学依据行业标准，依托上市企业全真数据，衔接职业院校的人才培育。在此强有力的基础上，由校行企合作共建“创新创业（孵化）中心”和“跨专业实训实习基地”，是培养互联网+现代商贸流通行业人才，深化校企合作、产教融合、保障就业、促进创业的重要举措。</span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p><p><span style="font-family:Microsoft YaHei;"><br /></span></p>'),
(448, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>2015年7月16日，深圳市怡亚通供应链股份有限公司发布“全球供应链商业生态圈战略”，该O2O战略的核心是在未来十年建立一个覆盖10亿消费者、容纳500万家销售终端、生产商和供货商的价值万亿元的商贸流通链条，该链圈对跨专业、复合型人才需求将达千万。<br /></span><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>为配合此战略，深圳市怡亚通供应链股份有限公司和益达（广州）教育科技有限公司，合资成立深圳市怡亚通益达教育服务有限公司，以“政校行企”合作为核心理念，引入产业链龙头企业的核心资源，建设服务于应用型、技术技能型人才培养、并与区域经济高度融合的全球供应链与电商人才创新创业基地。实施全球供应链人才培育工程，拟在国内各职业院校进行深度产教融合、校企合作、共同致力于全球供应链商业生态圈人才培育。</span></p><p><span style="font-family:Microsoft YaHei;"></span></p><p><strong><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>一、产&amp;教深度融合培养</strong></p><p></p><div style="text-align: center;"><span style="line-height: 19.2px;"><img src="upfiles/201512/17/big_277.jpg" border="0" width="500" height="462" alt="" /></span></div><strong><br /></strong><p></p><p><strong><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>二、“仿真+全真+创新创业”实战</strong></p><div style="text-align: center;"><img src="upfiles/201512/17/big_278.jpg" border="0" style="line-height: 19.2px;" alt="" /></div><br /><p><span style="font-family:Microsoft YaHei;"><strong><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>五个观点解读“生态圈”的潮流趋势以及平台企业和生态企业的区别：&nbsp;</strong></span></p><p><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>1、O2O生态是商业的未来；</span></p><p><span style="font-family: ''Microsoft YaHei'';"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>2、企业与企业的竞争已转向生态圈的竞争；</span></p><p><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>3、商业平台只能构建行业的繁荣，商业生态才能体现“整合、共享、创新”的精彩，以及成就跨界共融共生的辉煌；</span></p><p><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>4、平台企业规模创造竞争力，生态企业“+”创造竞争力；</span></p><p><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px; text-indent: 28px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>5、平台企业强调平台是自家的，生态企业的本质：构建的生态是参与者共同拥有的。&nbsp;</span></p><p><span style="font-family: ''Microsoft YaHei'';"><br /></span></p>'),
(449, 'content', '<span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>为进一步推进校企协同创业创新发展，发挥学校学科、师资和人才培养优势，发挥企业在职业院校建设中的重要作用，共同助力区域经济发展，8月3日下午，于陕西职业技术学院新校区行政楼一楼会议室隆重举行了“陕西职业技术学院与商务部中国对外贸易经济合作企业协会和深圳市怡亚通供应链股份有限公司合作办学签约仪式”。深圳市怡亚通益达教育服务有限公司总经理戴敏华，商务部中国对外贸易经济合作企业协会副会长郑樑，国资委中国商业企业管理协会副会长郑天舒，陕西职院党委书记何树茂、院长刘胜辉、副院长朱忠军携相关部门负责人等出席了仪式。仪式由朱副院长主持。</span><br /><div style="text-align: center;"><img src="upfiles/201512/17/big_269.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">签约仪式会议现场</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_270.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-size: 14px; line-height: 26px; text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">院党委书记何树茂讲话</span></span><br /></div><div style="text-align: left;"><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>刘院长代表学院致辞，对各位来宾的到来表示热烈的欢迎。他首先向各位来宾介绍了学院的基本办学情况。他表示，通过陕西职院的全体教职工努力拼搏，力将学院打造成“全省第一、全国领跑”的优秀高职院校。他指出，陕西职院非常注重校企合作，本次与深圳市怡亚通供应链股份有限公司的合作，是双方达成共识、优势互补、实现强强联手、互利共赢的良好开端，双方通过创业创新共同促进学生、学校、企业乃至区域经济的共同发展。</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_271.jpg" border="0" width="500" height="352" alt="" /><br /></div><div style="text-align: center;"><span style="color:#666666;">院长刘胜辉致辞</span></div><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>郑<span style="font-family:Microsoft YaHei;">樑和郑天舒分别介绍了各自协会的相关情况，表示共同致力于“校、行、企”三方共同发展，本次的合作具有示范意义，定能取得良好成果。</span><br /><div style="text-align: center;"><img src="upfiles/201512/17/big_272.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">商务部中国对外贸易经济合作企业协会副会长郑樑讲话</span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_273.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">国资委中国商业企业管理协会副会长郑天舒讲话</span></div><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>戴敏华介绍了深圳市怡亚通供应链股份有限公司的基本情况，对与陕西职院共同建立“怡亚通益达创新创业中心暨全球供应链人才孵化基地”的基本框架进行了详细的介绍。通过本次合作，希望与陕西职院携手共同推动学生、学校、企业和区域经济的发展。</span><br /><div style="text-align: center;"><img src="upfiles/201512/17/big_274.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">深圳市怡亚通益达教育服务有限公司总经理戴敏华讲话</span></div><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>随后，深圳市怡亚通益达教育服务有限公司总经理戴敏华、院长刘胜辉和中国对外贸易经济合作企业协会副会长郑樑分别代表三方签署了共建协议。</span><br /><div style="text-align: center;"><img src="upfiles/201512/17/big_275.jpg" border="0" width="500" height="352" alt="" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">三方正式签署合作办学协议</span></div><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>最后，陕西职院何书记作了热情洋溢的讲话。他首先对共建协议的正式签署表示衷心的祝贺！何书记指出，我们现在从事的是最崇高、责任最重大的育人事业，这是总书记实现中国梦的最坚实的基础。培养高技能的职业人才，是我们校、行、企走到一起的共同目标。我们的合作一定要互相尊重、平等协作，实现共赢。在合作起步时，我们一定要脚踏实地，从点上做起，只要我们用心、诚心、努力做事，一定会做出成绩，创造经验，实现陕西职院“全省第一、全国领跑”的总体目标。</span></p><p><br /></p>'),
(450, 'content', '<p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>“成就一个学生、幸福一个家庭、奉献整个社会”，职业教育是架设大众创新、万众创业的桥梁。致力于构建职业教育生态系统的益达教育与中国第一家上市供应链企业，深圳市怡亚通供应链股份有限公司合作，成立怡亚通益达教育服务有限公司（以下简称怡亚通益达教育），开创全新的职业教育模式，推出一流的现代企业在线教育暨创业云平台，并已建成多个全国一流的线下基地，是产教融合、创新创业实践典范。</span></p><p><div style="text-align: center;"><img src="upfiles/201512/18/big_292.jpg" border="0" style="font-family: ''Microsoft YaHei''; line-height: 19.2px;" width="500" height="301" alt="" /></div><span style="font-family: ''Microsoft YaHei'';"><br /></span></p><span style="font-family:Microsoft YaHei;">　　<strong>多层次、跨专业、大综合</strong><br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达教育有效地整合学校和企业的教育资源，进一步拓展校企合作的力量，使职业教育和企业行业在人才培养上“捆绑发展”，形成多层次、跨专业、大综合的创新创业人才培养模式，切实推动专业与产业对接、教学过程与生产过程对接、人才培养标准与企业用人标准对接、专业课程内容与职业要求对接。益达教育生态系统虚拟环境支撑电子商务、国际贸易、国际物流、银行管理、报关报检、工商行政等多专业综合实训，同时提供在线自学、实训、竞赛报名、就业和再就业等一站式服务。它们之间相互衔接，成为一个完整的职业教育网络。<br /></span><p><span style="font-family:Microsoft YaHei;">　　<strong>创新创业实践基地</strong></span></p><p><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达教育成立的创新创业实践基地，借助现代的服务设施及国际先进的管理水平，将一站式供应链服务优势发挥，开创了职业教育的全新模式。500强企业导师进入学校、企业导师讲座、学生名企顶岗实习，通过产教融合，能大大提高职业院校学生的岗位适应能力，缩短技术技能人才成长周期，使学校培养目标和企业需求对接，增强技术技能人才培养的针对性和适应性。</span></p><span style="font-family:Microsoft YaHei;">　<strong>　全真创业实践</strong><br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>职业教育肩负着培养面向生产、建设、管理、服务第一线需要的高技能人才使命。职业教育人才培养目标决定了高等职业教育学生的职业能力与素质必须在全真的职业环境中培养。<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>由来自名企的创新创业导师，通过数字化双向传输课堂，企业导师示范课堂、以及创业实践、创业竞赛、创业融资、第三方人才水平评估等培养方式，让学生真正零距离创业。通过互联网技术手段，通过怡亚通益达提供的创业平台，让创业者在此平台上大施拳脚、全真创业，学习创业技能，把控创业风险。<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>怡亚通益达教育坚持不断尝试和实践，开创全新的职业教育模式，把握职业教育的内涵，推动产教融合，培养创新创业型人才。</span>'),
(451, 'content', '<div><span style="line-height: 19.2px;"><br /></span></div><div><span style="line-height: 19.2px;"><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>11月27日-11月29日，由中国对外贸易经济合作企业协会、中国商业企业管理协会、中国职业技术教育学会主办，<a href="http://www.e-techdu.com">益达（广州）教育科技有限公司</a>全程支持的第三届中国职业教育与商务行业对话活动在江苏南京国际会议大酒店举行。来自全国18个省市的60余家职业院校、行业企业、科研机构共计150多名代表参加了本次对话活动。<br /><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>本次活动主题为跨界合作、产教融合，旨在贯彻落实教育部职成司职业教育与产业对话活动，并促进商务行业与职业教育有效对接，建立并完善职业院校与商务行业企业的教产合作机制，进一步提高商务行业人才培养质量，探索国际商务专业的发展新方向，满足经济社会发展对新型高技能商务人才的需求。</span><br /></span><div style="text-align: center;"><img src="upfiles/201512/17/big_208.jpg" border="0" style="line-height: 19.2px;" alt="" width="500" height="337" /></div><div style="text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">集体合影</span></div><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>江苏省教育厅副巡视员孙曙平、中国对外贸易经济合作企业协会副会长郑樑、中国商业企业管理协会副会长兼教育工作委员会主任郑天舒、江苏城市职业学院副校长兰亚明、副校长王玮以及上海对外教育交流中心主任张敏华、江苏省国际贸易协会会长于震、中国财经出版社电子社社长刘航、深圳市怡亚通益达教育服务有限公司总经理戴敏华、加拿大尼普森大学副校长Harley L.d''Entremont、澳大利亚TAFE联合会前主席Martin Riorda、德国工商业大会驻中国上海办事处职业教育总监、Britta Buschfeld等中外嘉宾出席了11月28日上午的开幕式。</span></div><div><div style="line-height: 19.2px; text-align: center;"><img src="upfiles/201512/17/big_209.jpg" border="0" style="line-height: 19.2px;" alt="" width="500" height="300" /></div><div style="line-height: 19.2px; text-align: center;"><span style="font-family:Microsoft YaHei;color:#666666;">活动现场</span></div><span style="font-family:Microsoft YaHei;line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>在主旨报告阶段，五位来自不同领域的代表进行主题发言。围绕当前经贸形势与发展方向、校行企合作共建现代流通行业人才培养模式、德国双元制在中国的本土化实践、澳大利亚TAFE职业院校的发展、关于共建21世纪的全球性职业教育体系等方面进行了阐述，提炼了经贸发展和人才培养的紧密关系，并对全球性的职业教育和中国本土化的应用进行了分析。</span><br /><div style="line-height: 19.2px; text-align: center;"><img src="upfiles/201512/17/big_210.jpg" border="0" style="line-height: 19.2px;" alt="" width="500" height="299" /></div><div style="line-height: 19.2px; text-align: center;"><span style="font-family: ''Microsoft YaHei''; line-height: 19.2px;"><span style="color:#666666;">图：德国工商业大会驻中国上海办事处职业教育总监Britta Buschfeld</span></span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_211.jpg" border="0" style="line-height: 19.2px;" alt="" width="500" height="299" /></div><span style="font-family:Microsoft YaHei;"></span><div style="line-height: 19.2px; text-align: center;"><span style="line-height: 19.2px;"><span style="color:#666666;">图：澳大利亚TAFE联合会前主席Martin Riordan博士介绍TAFE职业院校的发展</span></span></div><div style="text-align: center;"><img src="upfiles/201512/17/big_213.jpg" border="0" alt="" width="500" height="281" /><br /></div><span style="line-height: 19.2px;"></span><div style="text-align: center;"><span style="line-height: 19.2px;"><span style="color:#666666;">图：加拿大尼普森大学副校长Harley L.d''Entremont博士</span></span></div><span style="line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>会议召开期间，江苏城市职业技术学院与深圳市怡亚通益达教育服务有限公司举行了校企合作签字仪式。</span><div style="text-align: center;"><img src="upfiles/201512/17/big_214.jpg" border="0" alt="" width="500" height="299" /><br /></div><div style="text-align: center;"><span style="line-height: 19.2px;"><span style="color:#666666;">图：江苏城市职院与怡亚通益达签署合作协议</span></span></div><span style="font-family:Microsoft YaHei;"><span style="line-height: 19.2px;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>11月28日下午，与会代表分别参加了中外国际商务专业职业教育交流会和校、行、企合作交流会。11月29日，代表们参观了中国最大的商业企业苏宁云商总部，对苏宁的O2O运营模式、大数据分析、新技术应用等方面进行了认真学习。怡亚通益达总经理戴敏华在会上探讨了现代流通行业人才需求特点及校行企合作的内涵与途径，与会介绍了怡亚通益达创新创业学院合作模式。</span></span></div><div><div style="text-align: center;"><img src="upfiles/201512/17/big_215.jpg" border="0" alt="" width="500" height="252" /></div><div style="text-align: center;"><span style="line-height: 19.2px;"><span style="font-family:Microsoft YaHei;color:#666666;">怡亚通益达总经理戴敏华发表讲话</span></span><br /></div><span style="line-height: 19.2px;"><span style="font-family:Microsoft YaHei;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px;">　</span>深圳市怡亚通供应链股份有限公司和益达（广州）教育科技有限公司，合资成立深圳市怡亚通益达教育服务有限公司。怡亚通益达创新创业学院有效地整合学校和企业的教育资源，进一步拓展校企合作的内涵，使职业教育和企业行业在人才培养上“捆绑发展”，形成多层次的创新创业人才培养模式，同时融入企业文化，加强素质教育，使学生素质与企业员工素质要求相一致，为创新型人才的培养创造有效途径，从而不断释放全社会创新创业的活力，进一步提升职业教育对经济发展建设的贡献度。 </span></span><br /><br /></div><div><br /></div>'),
(452, 'content', '<div style="text-align: center; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp;<img src="upfiles/201512/15/big_196.jpg" border="0" alt="" /><br /></span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei''; background-color: transparent;"><a href="http://www.e-techedu.com/" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; background-color: transparent;"><span style="white-space: pre;">	</span>益达（广州）教育科技有限公司</a></span><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">，一直以来专注于教育教学软件领域的研究，致力于构建职业教育生态系统。公司总部设在广州天河区，在香港设有教育研究机构。</span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp;&nbsp;益达教育主要面向全国中、高职、普通高等院校、在校学生以及社会职业学者，提供从在校的理论课程学习、岗位技能学习、实验实训、企业顶岗实习、创新创业实践、创业平台一直到进入社会后的职业继续教育一系列服务的职业教育生态系统。</span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp; 作为国家高新技术企业与双软企业，益达教育拥有一批优秀、高效的科研、营销及服务管理队伍，自主研发的多款产品获得国家专利，并被列入国家科技部科技创新基金项目重点建设单位。营销及服务网络遍布全国，在北京、上海、南京、成都、湖南、武汉、江西、西安等地均设有分公司。经过十四年的发展与积累，益达教育具备丰富的优质教学内容资源：配套完整的教学体系—从培养标准到水平评估；参与国家及行业标准制定；承办全国性技能竞赛及平台建设；配套提供第三方行业人才水平评估认证；与知名上市公司—怡亚通合资成立一流的企业教学基地；配套一流的行业平台及知名企业作为实践基地。以专业跟专注的态度，建设未来的云端职业教育平台。</span></div><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp; 益达教育拥有业界最完整的综合实验实训解决方案体系，成功服务了上千家本科、高职、中职院校用户，建成多个全国一流的线下基地：</span><a href="http://www.e-techedu.com/index.php?g=home&amp;m=gucase&amp;a=show&amp;id=2" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; font-family: 微软雅黑, Arial; line-height: 14.4px; background-color: transparent;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">北京财贸职院</span></a><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">人才培养基地、</span><a href="http://www.e-techedu.com/index.php?g=home&amp;m=gucase&amp;a=show&amp;id=14" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; font-family: 微软雅黑, Arial; line-height: 14.4px; background-color: transparent;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">漳州职院</span></a><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">现代服务业人才培养基地、江苏开大开放教育人才培养及师资基地、成都技师电商物流人才培养基地、四川商务学院外贸人才培养基地、天津职大国家师资培训基地。成千上万的学子享受着益达教育带来的便捷高效服务。</span>'),
(545, 'content', '课程资源课程资源'),
(457, 'content', '<p>企業介紹企業介紹企業介紹企業介紹</p><p><div style="text-align: center; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp;<img src="upfiles/201512/15/big_196.jpg" border="0" alt="" /><br /></span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei''; background-color: transparent;"><a href="http://www.e-techedu.com/" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; background-color: transparent;"><span style="white-space: pre;">	</span>益达（广州）教育科技有限公司</a></span><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">，一直以来专注于教育教学软件领域的研究，致力于构建职业教育生态系统。公司总部设在广州天河区，在香港设有教育研究机构。</span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp;&nbsp;益达教育主要面向全国中、高职、普通高等院校、在校学生以及社会职业学者，提供从在校的理论课程学习、岗位技能学习、实验实训、企业顶岗实习、创新创业实践、创业平台一直到进入社会后的职业继续教育一系列服务的职业教育生态系统。</span></div><div style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; font-family: 微软雅黑, Arial; line-height: 14.4px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp; 作为国家高新技术企业与双软企业，益达教育拥有一批优秀、高效的科研、营销及服务管理队伍，自主研发的多款产品获得国家专利，并被列入国家科技部科技创新基金项目重点建设单位。营销及服务网络遍布全国，在北京、上海、南京、成都、湖南、武汉、江西、西安等地均设有分公司。经过十四年的发展与积累，益达教育具备丰富的优质教学内容资源：配套完整的教学体系—从培养标准到水平评估；参与国家及行业标准制定；承办全国性技能竞赛及平台建设；配套提供第三方行业人才水平评估认证；与知名上市公司—怡亚通合资成立一流的企业教学基地；配套一流的行业平台及知名企业作为实践基地。以专业跟专注的态度，建设未来的云端职业教育平台。</span></div><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">&nbsp; &nbsp; &nbsp; 益达教育拥有业界最完整的综合实验实训解决方案体系，成功服务了上千家本科、高职、中职院校用户，建成多个全国一流的线下基地：</span><a href="http://www.e-techedu.com/index.php?g=home&amp;m=gucase&amp;a=show&amp;id=2" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; font-family: 微软雅黑, Arial; line-height: 14.4px; background-color: transparent;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">北京财贸职院</span></a><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">人才培养基地、</span><a href="http://www.e-techedu.com/index.php?g=home&amp;m=gucase&amp;a=show&amp;id=14" target="_blank" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; cursor: pointer; color: rgb(67, 67, 67); text-decoration: none; font-family: 微软雅黑, Arial; line-height: 14.4px; background-color: transparent;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">漳州职院</span></a><span style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; line-height: 2.5; font-size: 14px; font-family: ''Microsoft YaHei'';">现代服务业人才培养基地、江苏开大开放教育人才培养及师资基地、成都技师电商物流人才培养基地、四川商务学院外贸人才培养基地、天津职大国家师资培训基地。成千上万的学子享受着益达教育带来的便捷高效服务。</span><br /></p>'),
(458, 'content', '企業戰略企業戰略企業戰略企業戰略'),
(459, 'content', '核心優勢核心優勢核心優勢'),
(460, 'content', '發展歷程發展歷程發展歷程'),
(461, 'content', '公司團隊公司團隊公司團隊'),
(462, 'content', '企業品牌企業品牌企業品牌'),
(463, 'content', '教育服務教育服務教育服務'),
(464, 'content', '企業文化企業文化企業文化'),
(465, 'content', '社會責任社會責任社會責任'),
(466, 'content', '企業聯繫方式企業聯繫'),
(467, 'content', '企業下屬企業企業下屬企業企業下屬企業'),
(468, 'content', '課程資源課程資源課程資源'),
(469, 'content', '系列教材系列教材系列教材'),
(470, 'content', '企業模擬軟件企業模擬軟件企業模擬軟件'),
(471, 'content', '3D真實訓軟件3D真實訓軟件3D真實訓軟件'),
(472, 'content', '情境實操實訓室情境實操實訓室情境實操實訓室情境實操實訓室'),
(473, 'content', '特色實訓基地(平臺)特色實訓基地(平臺)特色實訓基地(平臺)'),
(474, 'content', '企業數字化課堂企業數字化課堂企業數字化課堂'),
(475, 'content', '企業數字化課堂企業數字化課堂企業數字化課堂企業數字化課堂'),
(476, 'content', '跨專業綜合實訓平臺跨專業綜合實訓平臺跨專業綜合實訓平臺'),
(477, 'content', '在線考試平臺在線考試平臺在線考試平臺'),
(478, 'content', '職業技能鑑定平臺職業技能鑑定平臺職業技能鑑定平臺'),
(479, 'content', '職業技能競賽職業技能競賽職業技能競賽'),
(480, 'content', '行業從業能力競賽行業從業能力競賽行業從業能力競賽'),
(481, 'content', '職業資格認證職業資格認證職業資格認證'),
(482, 'content', '專業技能認證專業技能認證專業技能認證'),
(483, 'content', '123123123123'),
(484, 'content', '321321321321'),
(485, 'content', '321321321321'),
(486, 'content', '321321321321'),
(487, 'content', '321321321321'),
(488, 'content', '321321321321'),
(489, 'content', '321321321321'),
(490, 'content', '321321321321'),
(491, 'content', '321321321321'),
(492, 'content', '321321321321'),
(493, 'content', '321321321321'),
(494, 'content', '321321321321'),
(495, 'content', '321321321321'),
(496, 'content', '321321321321'),
(497, 'content', '321321321321'),
(498, 'content', '321321321321'),
(499, 'content', '321321321321'),
(500, 'content', '321321321321'),
(501, 'content', '321321321321'),
(502, 'content', '321321321321'),
(503, 'content', '321321321321'),
(504, 'content', '321321321321'),
(505, 'content', '321321321321'),
(506, 'content', '321321321321'),
(507, 'content', '321321321321'),
(508, 'content', '321321321321'),
(509, 'content', '321321321321'),
(510, 'content', '321321321321'),
(511, 'content', '321321321321'),
(512, 'content', '321321321321'),
(513, 'content', '321321321321'),
(514, 'content', '321321321321'),
(515, 'content', '123123123123'),
(516, 'content', '123123123123'),
(517, 'content', '123123123123'),
(518, 'content', '123123123123'),
(519, 'content', '123123123123'),
(520, 'content', '123123123123'),
(521, 'content', '123123123123'),
(522, 'content', '123123123123'),
(523, 'content', '123123123123'),
(524, 'content', '123123123123'),
(525, 'content', '123123123123'),
(526, 'content', '123123123123'),
(527, 'content', '123123123123'),
(528, 'content', '123123123123'),
(529, 'content', '123123123123'),
(530, 'content', '123123123123'),
(531, 'content', '123123123123'),
(532, 'content', '123123123123'),
(533, 'content', '123123123123'),
(534, 'content', '123123123123'),
(535, 'content', '123123123123'),
(536, 'content', '123123123123'),
(537, 'content', '123123123123'),
(538, 'content', '123123123123'),
(539, 'content', '123123123123'),
(540, 'content', '123123123123'),
(541, 'content', '123123123123'),
(542, 'content', '123123123123'),
(543, 'content', '123123123123'),
(544, 'content', '123123123123'),
(546, 'content', '系列教材系列教材'),
(547, 'content', '企业模拟软件企业模拟软件'),
(548, 'content', '3D仿真实训软件3D仿真实训软件'),
(549, 'content', '情境实操实训室情境实操实训室'),
(550, 'content', '特色实训基地（平台）特色实训基地（平台）'),
(551, 'content', '企业数字化课堂&nbsp;企业数字化课堂&nbsp;'),
(552, 'content', '企业经营推演沙盘企业经营推演沙盘'),
(553, 'content', '跨专业综合实训平台跨专业综合实训平台'),
(554, 'content', '在线考试平台在线考试平台'),
(555, 'content', '职业技能鉴定平台职业技能鉴定平台'),
(556, 'content', '职业技能竞赛职业技能竞赛'),
(558, 'content', '职业资格认证职业资格认证'),
(559, 'content', '专业技能认证专业技能认证');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_list_cate`
--

CREATE TABLE IF NOT EXISTS `qinggan_list_cate` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `cateid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`id`,`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_list_cate`
--

INSERT INTO `qinggan_list_cate` (`id`, `cateid`) VALUES
(16, 10),
(27, 10),
(29, 0),
(30, 0),
(31, 0),
(52, 31),
(58, 0),
(64, 43),
(66, 43),
(68, 32),
(69, 31),
(69, 32),
(70, 29),
(70, 31),
(70, 32),
(73, 0),
(79, 0),
(93, 41),
(98, 0),
(100, 0),
(102, 0),
(103, 0),
(106, 32),
(107, 29),
(107, 31),
(110, 41),
(111, 43),
(112, 43),
(113, 43),
(114, 43),
(158, 41),
(182, 1),
(184, 1),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(199, 3),
(203, 3),
(204, 2),
(205, 2),
(206, 3),
(207, 2),
(208, 2),
(209, 3),
(210, 3),
(211, 10),
(212, 10),
(213, 10),
(214, 10),
(215, 10),
(216, 10),
(217, 10),
(218, 10),
(219, 10),
(220, 51),
(221, 51),
(222, 51),
(223, 51),
(224, 51),
(225, 51),
(226, 51),
(227, 45),
(228, 51),
(229, 51),
(230, 49),
(231, 51),
(232, 51),
(233, 51),
(234, 51),
(235, 51),
(236, 51),
(237, 51),
(238, 51),
(239, 51),
(240, 51),
(241, 51),
(242, 51),
(243, 51),
(244, 51),
(245, 51),
(246, 51),
(247, 51),
(248, 51),
(249, 51),
(250, 51),
(251, 46),
(252, 46),
(253, 46),
(254, 46),
(255, 46),
(256, 46),
(257, 46),
(258, 46),
(259, 46),
(260, 46),
(261, 46),
(262, 46),
(263, 46),
(264, 46),
(265, 46),
(266, 46),
(267, 46),
(268, 46),
(269, 46),
(270, 46),
(271, 46),
(272, 46),
(273, 46),
(274, 46),
(275, 46),
(276, 46),
(277, 46),
(278, 46),
(279, 46),
(280, 46),
(281, 46),
(282, 47),
(283, 47),
(284, 47),
(285, 47),
(286, 47),
(287, 47),
(288, 47),
(289, 47),
(290, 47),
(291, 47),
(292, 47),
(293, 47),
(294, 47),
(295, 47),
(296, 47),
(297, 47),
(298, 47),
(299, 47),
(300, 47),
(301, 47),
(302, 47),
(303, 47),
(304, 47),
(305, 47),
(306, 47),
(307, 47),
(308, 47),
(309, 47),
(310, 47),
(311, 47),
(312, 47),
(313, 10),
(314, 10),
(315, 10),
(318, 0),
(319, 0),
(320, 0),
(321, 0),
(322, 0),
(323, 0),
(324, 0),
(325, 0),
(326, 0),
(327, 0),
(328, 0),
(329, 0),
(330, 0),
(331, 0),
(332, 0),
(333, 0),
(334, 0),
(335, 0),
(336, 0),
(337, 0),
(338, 0),
(339, 0),
(340, 0),
(341, 0),
(342, 0),
(343, 0),
(344, 0),
(345, 0),
(346, 0),
(347, 0),
(355, 53),
(356, 53),
(357, 53),
(358, 53),
(359, 53),
(360, 53),
(361, 44),
(362, 44),
(363, 1),
(367, 54),
(368, 54),
(369, 54),
(370, 54),
(371, 55),
(372, 55),
(373, 56),
(374, 56),
(375, 56),
(376, 54),
(377, 54),
(378, 54),
(379, 54),
(380, 55),
(381, 55),
(382, 56),
(383, 56),
(384, 56),
(385, 57),
(386, 58),
(387, 58),
(388, 53),
(389, 53),
(390, 53),
(391, 53),
(392, 1),
(393, 1),
(394, 1),
(395, 1),
(396, 1),
(397, 1),
(398, 1),
(399, 1),
(400, 1),
(401, 1),
(402, 1),
(403, 1),
(404, 1),
(405, 1),
(406, 1),
(407, 1),
(408, 1),
(409, 1),
(410, 1),
(411, 1),
(412, 1),
(413, 1),
(414, 1),
(415, 1),
(416, 1),
(417, 1),
(418, 1),
(419, 1),
(420, 1),
(421, 1),
(422, 44),
(423, 44),
(424, 44),
(425, 44),
(426, 44),
(427, 44),
(428, 44),
(429, 44),
(430, 44),
(431, 44),
(432, 44),
(433, 44),
(434, 44),
(435, 44),
(436, 44),
(437, 44),
(438, 44),
(439, 44),
(440, 44),
(441, 44),
(442, 44),
(443, 44),
(444, 44),
(445, 44),
(446, 44),
(447, 44),
(448, 44),
(449, 44),
(450, 44),
(451, 1),
(452, 53),
(453, 59),
(454, 77),
(455, 53),
(456, 53),
(457, 77),
(458, 77),
(459, 77),
(460, 77),
(461, 77),
(462, 77),
(463, 77),
(464, 77),
(465, 77),
(466, 77),
(467, 77),
(468, 76),
(469, 76),
(470, 76),
(471, 76),
(472, 76),
(473, 76),
(474, 76),
(475, 76),
(476, 76),
(477, 76),
(478, 76),
(479, 76),
(480, 76),
(481, 76),
(482, 76),
(483, 74),
(484, 75),
(485, 75),
(486, 75),
(487, 75),
(488, 75),
(489, 75),
(490, 75),
(491, 75),
(492, 75),
(493, 75),
(494, 75),
(495, 75),
(496, 75),
(497, 75),
(498, 75),
(499, 75),
(500, 75),
(501, 75),
(502, 75),
(503, 75),
(504, 75),
(505, 75),
(506, 75),
(507, 75),
(508, 75),
(509, 75),
(510, 75),
(511, 75),
(512, 75),
(513, 75),
(514, 75),
(515, 74),
(516, 74),
(517, 74),
(518, 74),
(519, 74),
(520, 74),
(521, 74),
(522, 74),
(523, 74),
(524, 74),
(525, 74),
(526, 74),
(527, 74),
(528, 74),
(529, 74),
(530, 74),
(531, 74),
(532, 74),
(533, 74),
(534, 74),
(535, 74),
(536, 74),
(537, 74),
(538, 74),
(539, 74),
(540, 74),
(541, 74),
(542, 74),
(543, 74),
(544, 74),
(545, 82),
(546, 82),
(547, 83),
(548, 83),
(549, 83),
(550, 83),
(551, 83),
(552, 83),
(553, 83),
(554, 84),
(555, 84),
(556, 85),
(557, 57),
(558, 86),
(559, 86);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_list_ext`
--

CREATE TABLE IF NOT EXISTS `qinggan_list_ext` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '列表主题ID',
  `field` varchar(30) NOT NULL DEFAULT '' COMMENT '扩展字段变量名',
  `val` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段值',
  PRIMARY KEY (`id`,`field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_list_ext`
--

INSERT INTO `qinggan_list_ext` (`id`, `field`, `val`) VALUES
(79, 'jnum', '10'),
(79, 'age', '26至35岁（含35岁）'),
(79, 'jy', '不限'),
(79, 'sex', '男'),
(79, 'hight', '160CM以上'),
(100, 'kftype', 'wangwang'),
(98, 'kftype', 'qq'),
(188, 'fullname', ''),
(187, 'mobile', ''),
(187, 'email', 'qinggan@188.com'),
(70, 'propic', '169,20,18,170'),
(69, 'propic', '170,21,20,168'),
(68, 'propic', '169,17,20,168'),
(64, 'bigpic', '168,169,17,18,161'),
(66, 'bigpic', '167,168,20,16,158'),
(52, 'propic', '169,20,18,17,16,168'),
(187, 'fullname', ''),
(70, 'tk', 'test,over');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_menu`
--

CREATE TABLE IF NOT EXISTS `qinggan_menu` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `link` varchar(100) NOT NULL COMMENT '网址链接',
  `link_html` varchar(255) NOT NULL COMMENT '静态页链接',
  `link_rewrite` varchar(255) NOT NULL COMMENT '伪静态页链接',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开0否1是',
  `note` varchar(255) NOT NULL COMMENT '文本提示',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `highlight` varchar(50) NOT NULL COMMENT '高亮类型',
  `highlight_id` varchar(255) NOT NULL COMMENT '高亮值',
  `picurl` varchar(255) NOT NULL COMMENT '图片地址',
  `picover` varchar(255) NOT NULL COMMENT '菜单Hover',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `qinggan_menu`
--

INSERT INTO `qinggan_menu` (`id`, `parentid`, `langid`, `title`, `link`, `link_html`, `link_rewrite`, `target`, `note`, `taxis`, `highlight`, `highlight_id`, `picurl`, `picover`, `status`) VALUES
(1, 0, 'zh', '首页', '{index_php}?{control_trigger}=msg&ts=gk', '{site_html}onepage/about_us/gk.html', 'gk.html', 0, '', 10, 'index', '1,3,2', '', '', 1),
(48, 35, 'zh', '公司团队', '{index_php}?{control_trigger}=msg&ts=td', '', '', 0, '', 26, '', '', '', '', 0),
(47, 35, 'zh', '发展历程', '{index_php}?{control_trigger}=msg&ts=lc', '', '', 0, '', 25, '', '', '', '', 1),
(45, 35, 'zh', '企业战略', '{index_php}?{control_trigger}=msg&ts=zl', '', '', 0, '', 23, '', '', '', '', 1),
(46, 35, 'zh', '核心优势', '{index_php}?{control_trigger}=msg&ts=hx', '', '', 0, '', 24, '', '', '', '', 1),
(35, 0, 'zh', '关于益达', '{index_php}?{control_trigger}=msg&ts=gk', '{site_html}onepage/about_us/gk.html', 'gk.html', 0, '', 20, '', '', '', '', 1),
(36, 0, 'zh', '新闻中心', '{index_php}?{control_trigger}=list&cs=news', '{site_html}article/news/index.html', 'cs-news.html', 0, '', 40, '', '', '', '', 1),
(37, 0, 'zh', '企业业务', '{index_php}?{control_trigger}=list&cs=software', '{site_html}pro/software/index.html', 'cs-software.html', 0, '', 30, '', '', '', '', 1),
(80, 38, 'zh', '企业愿景', '{index_php}?{control_trigger}=msg&ts=wenhua', '{site_html}onepage/about_us/wenhua.html', 'wenhua.html', 0, '', 100, '', '', '', '', 1),
(38, 0, 'zh', '企业文化', '{index_php}?{control_trigger}=msg&ts=wenhua', '{site_html}onepage/about_us/wenhua.html', 'wenhua.html', 0, '', 50, '', '', '', '', 1),
(39, 0, 'zh', '联系益达', '{index_php}?{control_trigger}=msg&id=390', '{site_html}onepage/about_us/390.html', 'c390.html', 0, '', 60, '', '', '', '', 1),
(89, 0, 'tc', '關於益達', '{index_php}?{control_trigger}=msg&id=457', '{site_html}onepage/about_us/457.html', 'c457.html', 0, '', 20, '', '', '', '', 1),
(41, 0, 'zh', '社会责任', '{index_php}?{control_trigger}=msg&ts=shehui', '{site_html}onepage/about_us/shehui.html', 'shehui.html', 0, '', 55, '', '', '', '', 0),
(44, 35, 'zh', '企业介绍', '{index_php}?{control_trigger}=msg&ts=gk', '', '', 0, '', 22, '', '', '', '', 1),
(50, 36, 'zh', '企业新闻', '{index_php}?{control_trigger}=list&ms=article&cs=news', '', '', 0, '', 101, '', '', '', '', 1),
(51, 36, 'zh', '媒体关注', '{index_php}?{control_trigger}=list&cs=guanzhu', '{site_html}article/guanzhu/index.html', 'cs-guanzhu.html', 0, '', 102, '', '', '', '', 1),
(88, 0, 'tc', '首頁', 'index.php', '', '', 0, '', 10, '', '', '', '', 1),
(92, 89, 'tc', '核心優勢', '{index_php}?{control_trigger}=msg&id=459', '{site_html}onepage/about_us/459.html', 'c459.html', 0, '', 24, '', '', '', '', 1),
(84, 41, 'zh', '公益理念', '{index_php}?{control_trigger}=msg&ts=shehui', '{site_html}onepage/about_us/shehui.html', 'shehui.html', 0, '', 100, '', '', '', '', 0),
(90, 89, 'tc', '企業介紹', '{index_php}?{control_trigger}=msg&id=457', '{site_html}onepage/about_us/457.html', 'c457.html', 0, '', 22, '', '', '', '', 1),
(91, 89, 'tc', '企業戰略', '{index_php}?{control_trigger}=msg&id=458', '{site_html}onepage/about_us/458.html', 'c458.html', 0, '', 23, '', '', '', '', 1),
(67, 37, 'zh', '教育服务', '{index_php}?{control_trigger}=msg&id=452', '{site_html}onepage/about_us/452.html', 'c452.html', 0, '', 111, '', '', '', '', 1),
(64, 37, 'zh', '教育软件', '{index_php}?{control_trigger}=list&cs=software', '{site_html}pro/software/index.html', 'cs-software.html', 0, '', 110, '', '', '', '', 1),
(66, 35, 'zh', '企业品牌', '{index_php}?{control_trigger}=msg&ts=pp', '', '', 0, '', 27, '', '', '', '', 0),
(81, 38, 'zh', '企业经营宗旨', '{index_php}?{control_trigger}=msg&ts=wenhua', '{site_html}onepage/about_us/wenhua.html', 'wenhua.html', 0, '', 200, '', '', '', '', 1),
(82, 38, 'zh', '企业价值观', '{index_php}?{control_trigger}=msg&ts=wenhua', '{site_html}onepage/about_us/wenhua.html', 'wenhua.html', 0, '', 220, '', '', '', '', 1),
(83, 38, 'zh', '企业文化理念', '{index_php}?{control_trigger}=msg&ts=wenhua', '{site_html}onepage/about_us/wenhua.html', 'wenhua.html', 0, '', 255, '', '', '', '', 1),
(85, 41, 'zh', '社会赞誉', '{index_php}?{control_trigger}=msg&ts=shehui', '{site_html}onepage/about_us/shehui.html', 'shehui.html', 0, '', 255, '', '', '', '', 0),
(86, 39, 'zh', '联系方式', '{index_php}?{control_trigger}=msg&id=390', '{site_html}onepage/about_us/390.html', 'c390.html', 0, '', 100, '', '', '', '', 1),
(87, 39, 'zh', '下属企业', '{index_php}?{control_trigger}=msg&id=391', '{site_html}onepage/about_us/391.html', 'c391.html', 0, '', 255, '', '', '', '', 1),
(93, 89, 'tc', '發展歷程', '{index_php}?{control_trigger}=msg&id=460', '{site_html}onepage/about_us/460.html', 'c460.html', 0, '', 25, '', '', '', '', 1),
(94, 89, 'tc', '公司團隊', '{index_php}?{control_trigger}=msg&id=461', '{site_html}onepage/about_us/461.html', 'c461.html', 0, '', 26, '', '', '', '', 0),
(95, 89, 'tc', '企業品牌', '{index_php}?{control_trigger}=msg&id=462', '{site_html}onepage/about_us/462.html', 'c462.html', 0, '', 27, '', '', '', '', 0),
(96, 0, 'tc', '新聞中心', '{index_php}?{control_trigger}=list&cs=news', '{site_html}article/news/index.html', 'cs-news.html', 0, '', 30, '', '', '', '', 1),
(97, 96, 'tc', '企業新聞', '{index_php}?{control_trigger}=list&cs=news', '{site_html}article/news/index.html', 'cs-news.html', 0, '', 31, '', '', '', '', 1),
(98, 96, 'tc', '媒體關注', '{index_php}?{control_trigger}=list&cs=guanzhu', '{site_html}article/guanzhu/index.html', 'cs-guanzhu.html', 0, '', 32, '', '', '', '', 1),
(99, 0, 'tc', '企業業務', '{index_php}?{control_trigger}=list&ms=pro&cs=software', '{site_html}pro/software/index.html', 'cs-software.html', 0, '', 40, '', '', '', '', 1),
(100, 99, 'tc', '教育軟件', '{index_php}?{control_trigger}=list&cs=software', '{site_html}pro/software/index.html', 'cs-software.html', 0, '', 41, '', '', '', '', 1),
(101, 99, 'tc', '教育服務', '{index_php}?{control_trigger}=msg&id=463', '{site_html}onepage/about_us/463.html', 'c463.html', 0, '', 42, '', '', '', '', 1),
(102, 0, 'tc', '企業文化', '{index_php}?{control_trigger}=msg&id=464', '{site_html}onepage/about_us/464.html', 'c464.html', 0, '', 50, '', '', '', '', 1),
(103, 102, 'tc', '企業宗旨', '{index_php}?{control_trigger}=msg&id=464', '{site_html}onepage/about_us/464.html', 'c464.html', 0, '', 50, '', '', '', '', 1),
(104, 102, 'tc', '企業價值觀', '{index_php}?{control_trigger}=msg&id=464', '{site_html}onepage/about_us/464.html', 'c464.html', 0, '', 51, '', '', '', '', 1),
(105, 102, 'tc', '企業願景', '{index_php}?{control_trigger}=msg&id=464', '{site_html}onepage/about_us/464.html', 'c464.html', 0, '', 52, '', '', '', '', 1),
(106, 102, 'tc', '企業精神', '{index_php}?{control_trigger}=msg&id=464', '{site_html}onepage/about_us/464.html', 'c464.html', 0, '', 55, '', '', '', '', 1),
(107, 0, 'tc', '社會責任', '{index_php}?{control_trigger}=msg&id=465', '{site_html}onepage/about_us/465.html', 'c465.html', 0, '', 60, '', '', '', '', 1),
(108, 107, 'tc', '公益理念', '{index_php}?{control_trigger}=msg&id=465', '{site_html}onepage/about_us/465.html', 'c465.html', 0, '', 61, '', '', '', '', 1),
(109, 107, 'tc', '社會讚譽', '{index_php}?{control_trigger}=msg&id=465', '{site_html}onepage/about_us/465.html', 'c465.html', 0, '', 63, '', '', '', '', 1),
(110, 0, 'tc', '聯繫益達', '{index_php}?{control_trigger}=msg&id=466', '{site_html}onepage/about_us/466.html', 'c466.html', 0, '', 70, '', '', '', '', 1),
(111, 110, 'tc', '企業聯繫方式', '{index_php}?{control_trigger}=msg&id=466', '{site_html}onepage/about_us/466.html', 'c466.html', 0, '', 71, '', '', '', '', 1),
(112, 110, 'tc', '企業下屬企業', '{index_php}?{control_trigger}=msg&id=467', '{site_html}onepage/about_us/467.html', 'c467.html', 0, '', 72, '', '', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_module`
--

CREATE TABLE IF NOT EXISTS `qinggan_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '组ID',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID，默认是zh',
  `identifier` varchar(32) NOT NULL DEFAULT '0' COMMENT '标识符',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `ctrl_init` varchar(100) NOT NULL COMMENT '执行文件，不同模块可能执行相同的文件，使用标识符区分',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序值越小越往靠，最小为0',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统模块2自定义添加模块',
  `if_cate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用分类功能，1使用0不使用',
  `if_biz` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持电子商务，0否1是',
  `if_propety` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持属性，1支持',
  `if_hits` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不持点击1支持',
  `popedom` varchar(255) NOT NULL COMMENT '权限ID，多个权限ID用英文逗号隔开',
  `if_thumb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1支持缩略图0不支持',
  `if_thumb_m` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1必填0非必填',
  `if_point` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持点数1支持点数',
  `if_url_m` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持自定义网址，1支持，2支持且必填',
  `inpic` varchar(100) NOT NULL COMMENT '前台默认图片关联',
  `inpic_desc` text NOT NULL COMMENT '前台图片大小备注',
  `insearch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支持前台搜索',
  `if_content` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持读取内容1读取内容及管理员回复',
  `if_email` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1邮件通知0不通知',
  `psize` tinyint(3) unsigned NOT NULL DEFAULT '30' COMMENT '默认分页数量',
  `if_subtitle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用副标题0否1是',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `small_pic` varchar(255) NOT NULL COMMENT '小图',
  `medium_pic` varchar(255) NOT NULL COMMENT '中图',
  `big_pic` varchar(255) NOT NULL COMMENT '大图',
  `tplset` enum('list','pic') NOT NULL DEFAULT 'list' COMMENT 'list列表，pic图文',
  `title_nickname` varchar(50) NOT NULL COMMENT '主题别称',
  `subtitle_nickname` varchar(50) NOT NULL COMMENT '副标题别称',
  `sign_nickname` varchar(50) NOT NULL COMMENT '标识串别称',
  `if_sign_m` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '标识串是否必填',
  `if_ext` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '可选扩展1使用0不使用',
  `if_des` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '简短描述1允许0不使用',
  `if_list` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1支持0不支持',
  `if_msg` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1支持0不支持',
  `layout` varchar(255) NOT NULL COMMENT '后台布局设置',
  `if_hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不隐藏，1隐藏',
  `lock_identifier` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1锁定0不锁定',
  `if_pl_add` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不允许，1允许',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- 转存表中的数据 `qinggan_module`
--

INSERT INTO `qinggan_module` (`id`, `group_id`, `langid`, `identifier`, `title`, `note`, `ctrl_init`, `status`, `taxis`, `if_system`, `if_cate`, `if_biz`, `if_propety`, `if_hits`, `popedom`, `if_thumb`, `if_thumb_m`, `if_point`, `if_url_m`, `inpic`, `inpic_desc`, `insearch`, `if_content`, `if_email`, `psize`, `if_subtitle`, `ico`, `small_pic`, `medium_pic`, `big_pic`, `tplset`, `title_nickname`, `subtitle_nickname`, `sign_nickname`, `if_sign_m`, `if_ext`, `if_des`, `if_list`, `if_msg`, `layout`, `if_hidden`, `lock_identifier`, `if_pl_add`) VALUES
(1, 1, 'zh', 'module', '模块管理', '配置系统的核心模块', 'ctrl', 1, 255, 1, 0, 0, 0, 0, '3,4,10', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(3, 8, 'zh', 'setting', '网站信息', '', 'setting', 1, 10, 1, 0, 0, 0, 0, '8', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(4, 1, 'zh', 'mypass', '修改个人密码', '修改管理员自己的相关信息', 'mypass', 1, 255, 1, 0, 0, 0, 0, '8', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(7, 3, 'zh', 'article', '新闻中心', '文章模块，可以实现网站资讯基本信息', 'list', 1, 20, 0, 1, 0, 0, 1, '7,3,4,5,6', 0, 0, 0, 1, '', '', 1, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 0, 1, 1, 'hits', 0, 0, 0),
(8, 1, 'zh', 'datalink', '数据联动', '支持二级联动及普通的SELECT参数', 'datalink', 1, 30, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(9, 3, 'zh', 'picture', '图片展示', '网站图片库，适合企业站中的环境展示等', 'list', 0, 40, 0, 1, 0, 1, 1, '7,3,4,5,6', 1, 1, 0, 0, '', '', 1, 0, 0, 30, 0, '', '', '', '', 'pic', '图片标题', '', '', 0, 0, 0, 1, 1, '', 0, 0, 0),
(10, 4, 'zh', 'product', '产品管理', '适用于需要购买产品操作', 'list', 0, 50, 0, 1, 1, 1, 1, '7,3,4,5,6', 1, 1, 0, 1, 'thumb', '', 1, 0, 0, 30, 0, '', '', '', '', 'list', '产品名称', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(11, 8, 'zh', 'cate', '分类管理', '核心模块管理网站所有分类', 'cate', 1, 250, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(12, 11, 'zh', 'tpl', '风格方案', '管理网站风格信息', 'tpl', 1, 251, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(13, 11, 'zh', 'lang', '语言包管理', '管理多语言', 'lang', 1, 252, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(14, 6, 'zh', 'user', '会员列表', '展示会员列表', 'user', 0, 10, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(15, 1, 'zh', 'admin', '管理员', '后台管理员相关信息', 'admin', 1, 250, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(16, 3, 'zh', 'phpok', '数据调用中心', '网站前台数据调用参数配置', 'phpok', 1, 50, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(17, 1, 'zh', 'html', 'HTML生成', '静态页生成管理', 'html', 1, 60, 0, 0, 0, 0, 0, '7', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(18, 4, 'zh', 'order', '订单管理', '订单管理，可以在后台创建新订单', 'order', 0, 60, 0, 0, 0, 0, 0, '7,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(19, 4, 'zh', 'payment', '付款方案', '付款方案配置管理', 'payment', 0, 70, 0, 0, 0, 0, 0, '7,3,4,5,6,8', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(20, 3, 'zh', 'onepage', '单页管理', '如管理公司简介，联系我们等', 'list', 1, 30, 0, 1, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 0, 0, 1, '', 1, 1, 0),
(21, 10, 'zh', 'gd', 'GD图片生成设置', '配置图片要生成的规格', 'gd', 0, 100, 0, 0, 0, 0, 0, '7,4', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(22, 10, 'zh', 'files', '附件管理', '批量管理上传的附件信息', 'files', 1, 255, 0, 0, 0, 0, 0, '7,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(23, 3, 'zh', 'book', '留言本', '用户可以自己发布的留言信息', 'list', 0, 60, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'thumb', '', 0, 1, 1, 20, 0, '', '', '', 'upfiles/201005/16/2de9e5981c8f2fbf.jpg', 'list', '', '', '', 0, 1, 1, 1, 0, '', 0, 0, 0),
(24, 3, 'zh', 'picplayer', '图片播放器', '放在首页的图片播放器', 'list', 0, 50, 0, 0, 0, 0, 0, '', 1, 1, 0, 2, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0),
(25, 9, 'zh', 'reply', '回复管理', '管理客户在前台的信息', 'reply', 0, 254, 0, 0, 0, 0, 0, '7,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(26, 3, 'zh', 'link', '友情链接', '网站友情链接', 'list', 0, 150, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 2, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '网站名称', '', '', 0, 0, 0, 1, 0, 'link_url', 0, 0, 0),
(27, 8, 'zh', 'menu', '导航管理', '放在前台头部的导航', 'menu', 1, 200, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(31, 3, 'zh', 'qq', '在线客服', '前台客服代码', 'list', 0, 80, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '客服名称', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0),
(32, 3, 'zh', 'download', '下载中心', '网站下载中心模块', 'list', 0, 45, 0, 1, 0, 1, 0, '7,3,4,5,6', 1, 0, 0, 0, 'thumb', '', 1, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 0, '', 0, 0, 0),
(33, 4, 'zh', 'xunjia', '产品咨询', '应用于产品咨询操作', 'list', 0, 60, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 1, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 0, 0, '', 0, 0, 0),
(34, 3, 'zh', 'jobs', '人才招聘', '网站人才招聘', 'list', 0, 90, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 0, '', 0, 0, 0),
(35, 3, 'zh', 'apply', '应聘信息', '应聘信息', 'list', 0, 100, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 1, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 0, 0, '', 0, 0, 0),
(36, 8, 'zh', 'nav', '底部导航', '管理前台底部的导航列表', 'nav', 0, 210, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(37, 1, 'zh', 'phpoksql', '数据库管理', '', 'phpoksql', 1, 254, 0, 0, 0, 0, 0, '7,8', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(40, 6, 'zh', 'subscribers', '订阅用户', '网站上的订阅邮件用户', 'subscribers', 0, 30, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(41, 9, 'zh', 'email', '邮件群发', '群发邮件操作', 'email', 0, 40, 0, 0, 0, 0, 0, '7', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(43, 8, 'zh', 'usergroup', '会员组', '会员组管理中心', 'usergroup', 0, 20, 0, 0, 0, 0, 0, '7,3,4,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(45, 9, 'zh', 'plugin', '插件中心', '', 'plugin', 0, 255, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(46, 9, 'zh', 'collection', '采集中心', '网站采集模块', 'collection', 0, 20, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(47, 3, 'zh', 'notice', '站内公告', '网站的公告信息', 'list', 0, 15, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 1, 0, 100, 0, '', '', '', '', 'list', '公告主题', '', '', 0, 0, 0, 1, 0, '', 0, 0, 0),
(48, 1, 'zh', 'hotlink', '快捷导航', '设置左侧的快捷导航', 'hotlink', 1, 90, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(49, 4, 'zh', 'currency', '货币管理', '需要支付的货币管理', 'currency', 0, 90, 0, 0, 0, 0, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 1, 1, 1, '', 0, 0, 0),
(52, 3, 'zh', 'pro', '企业业务', '企业业务列表', 'list', 1, 30, 0, 1, 0, 0, 0, '7,3,4,5,6', 1, 1, 0, 0, '', '148px*148px(1:1)', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 0, 1, 1, 'hits', 0, 1, 0),
(54, 3, 'zh', 'ad', '首页广告焦点图', '放在首页的轮播图', 'list', 0, 30, 0, 0, 0, 0, 0, '7,3,4,5,6', 1, 1, 0, 1, '', '', 0, 0, 0, 255, 0, '', '', '', '', 'pic', '', '', '', 0, 0, 0, 0, 0, 'hits', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_module_fields`
--

CREATE TABLE IF NOT EXISTS `qinggan_module_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `module_id` mediumint(8) unsigned NOT NULL COMMENT '模块ID',
  `identifier` varchar(32) NOT NULL COMMENT '标识符',
  `title` varchar(100) NOT NULL COMMENT '主题',
  `if_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1支持会员0不支持',
  `if_guest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1支持游客0不支持',
  `sub_left` varchar(60) NOT NULL COMMENT '左侧主题',
  `sub_note` varchar(120) NOT NULL COMMENT '右侧备注信息',
  `input` varchar(50) NOT NULL DEFAULT 'text' COMMENT '表单类型',
  `width` varchar(20) NOT NULL COMMENT '宽度',
  `height` varchar(20) NOT NULL COMMENT '高度',
  `default_val` varchar(50) NOT NULL COMMENT '默认值',
  `list_val` varchar(255) NOT NULL COMMENT '值列表',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '联动组ID',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '自定义排序，值越小越往前靠',
  `if_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1必填0非必填',
  `if_html` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1支持HTML，0不支持',
  `error_note` varchar(255) NOT NULL COMMENT '错误时的提示',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1启用0禁用',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统字段，0用户配置字段',
  `tbl` enum('ext','c') NOT NULL COMMENT 'ext指长度不大于255的表中，c指长度大于255的数据',
  `show_html` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不显示源码1显示源码',
  `if_js` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1支持0不支持',
  `if_search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许搜索',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `qinggan_module_fields`
--

INSERT INTO `qinggan_module_fields` (`id`, `module_id`, `identifier`, `title`, `if_post`, `if_guest`, `sub_left`, `sub_note`, `input`, `width`, `height`, `default_val`, `list_val`, `link_id`, `taxis`, `if_must`, `if_html`, `error_note`, `status`, `if_system`, `tbl`, `show_html`, `if_js`, `if_search`) VALUES
(3, 7, 'content', '内容', 1, 0, '内容信息', '', 'edit', '880px', '900px', '', '', 0, 255, 1, 1, '内容不允许为空', 1, 0, 'c', 0, 1, 0),
(9, 10, 'content', '产品描述', 0, 0, '产品描述', '', 'edit', '680', '330', '', '', 0, 255, 0, 1, '请填写内容描述信息', 1, 0, 'c', 0, 0, 0),
(26, 9, 'content', '内容', 0, 0, '', '', 'edit', '680px', '300', '', '', 0, 255, 0, 1, '请填写描述', 1, 0, 'c', 0, 0, 0),
(75, 20, 'content', '内容', 0, 0, '', '', 'edit', '880px', '900px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 1, 0),
(14, 10, 'propic', '产品图片', 1, 0, '', '', 'img', '', '', '', '', 0, 30, 1, 0, '请产图片不允许为空', 1, 0, 'ext', 0, 0, 0),
(18, 9, 'bigpic', '大图', 0, 0, '', '', 'img', '', '', '', '', 0, 10, 1, 0, '请选择图片', 1, 0, 'ext', 0, 0, 0),
(70, 23, 'content', '内容', 1, 1, '', '', 'edit', '450px', '120px', '', '', 0, 200, 0, 0, '', 1, 0, 'c', 0, 0, 0),
(20, 23, 'email', 'Email', 1, 1, '', '', 'text', '200px', '', '', '', 0, 10, 1, 0, '邮箱不能为空', 1, 0, 'ext', 0, 0, 0),
(22, 23, 'mobile', '电话', 1, 1, '', '请填写您的手机号或是电话以方便联系', 'text', '200px', '', '', '', 0, 15, 0, 0, '电话不能为空！', 1, 0, 'ext', 0, 0, 0),
(30, 23, 'fullname', '姓名', 1, 1, '', '请填写您的姓名', 'text', '200px', '', '', '', 0, 5, 0, 0, '姓名不允许为空', 1, 0, 'ext', 0, 0, 0),
(31, 23, 'admreply', '管理员回复', 0, 0, '', '', 'edit', '630px', '200px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 0, 0),
(35, 32, 'download', '下载地址', 0, 0, '', '请选择要下载的附件', 'download', '', '', '', '', 0, 10, 1, 0, '下载文件不允许为空', 1, 0, 'ext', 0, 0, 0),
(40, 33, 'fullname', '姓名', 1, 1, '', '请填写您的名字', 'text', '120px', '', '', '', 0, 10, 1, 0, '姓名不允许为空', 1, 0, 'ext', 0, 0, 0),
(41, 33, 'mailqq', '联系方式', 1, 1, '', '请填写您的联系方式，QQ或MSN或手机等', 'text', '120px', '', '', '', 0, 30, 1, 0, '联系方式不允许为空', 1, 0, 'ext', 0, 0, 0),
(42, 33, 'ctype', '联系方式类型', 1, 1, '', '请选择联系方式的类型', 'select', '', '', '邮箱', '邮箱\n手机\n电话\nQQ号\nMSN\nSkype\n其他', 0, 20, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(43, 33, 'content', '咨询内容', 1, 1, '', '请填写您要咨询的信息', 'textarea', '470px', '200px', '', '', 0, 50, 1, 0, '请填写您要咨询的内容', 1, 0, 'ext', 0, 0, 0),
(44, 34, 'jnum', '招聘人数', 0, 0, '', '填写要招聘的人数', 'text', '80px', '', '', '', 0, 10, 1, 0, '请填写招聘人数，不能小于1', 1, 0, 'ext', 0, 0, 0),
(45, 34, 'age', '年龄要求', 0, 0, '', '', 'select', '', '', '不限', '不限\n18至25岁（含25岁）\n26至35岁（含35岁）\n35岁以上', 0, 20, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(46, 34, 'jy', '工作经验', 0, 0, '', '', 'select', '', '', '不限', '不限\n毕业生\n至少一年工作经验\n不少于三年工作经验', 0, 30, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(47, 34, 'sex', '性别要求', 0, 0, '', '', 'radio', '', '', '不限', '不限\n男\n女', 0, 40, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(48, 34, 'hight', '身高要求', 0, 0, '', '', 'select', '', '', '不限', '不限\n155CM以上\n160CM以上\n165CM以上\n170CM以上', 0, 50, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(49, 35, 'fullname', '姓名', 1, 1, '', '请填写您的姓名', 'text', '150px', '', '', '', 0, 10, 1, 0, '请填写您的姓名', 1, 0, 'ext', 0, 0, 0),
(50, 35, 'sex', '性别', 1, 1, '', '', 'radio', '', '', '男', '男\n女', 0, 20, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(51, 35, 'mobile', '联系手机', 1, 1, '', '填写手机或电话号码', 'text', '150px', '', '', '', 0, 30, 1, 0, '请填写手机联系方式！', 1, 0, 'ext', 0, 0, 0),
(52, 35, 'age', '年龄', 1, 1, '', '请填写您的年龄', 'text', '80px', '', '', '', 0, 40, 1, 0, '请填写您的年龄', 1, 0, 'ext', 0, 0, 0),
(53, 35, 'hight', '身高', 1, 1, '', 'CM', 'text', '80px', '', '', '', 0, 50, 1, 0, '请填写您的身高，单位CM', 1, 0, 'ext', 0, 0, 0),
(54, 35, 'school', '学历', 1, 1, '', '', 'select', '', '', '本科', '中专\n高中\n大专\n本科\n硕士', 0, 60, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(55, 35, 'email', 'Email', 1, 1, '', '', 'text', '150px', '', '', '', 0, 70, 1, 0, '请填写您的Email', 1, 0, 'ext', 0, 0, 0),
(57, 26, 'logo', '图片', 0, 0, '', '请选择一张图片！', 'simg', '', '', '', '', 0, 10, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(61, 31, 'kfcode', '客服代码', 0, 0, '', '', 'edit', '650px', '299px', '', '', 0, 255, 1, 1, '请填写客服代码', 1, 0, 'c', 1, 1, 0),
(80, 47, 'content', '公告内容', 0, 0, '', '注意，此公告内容不支持分页', 'edit', '680px', '360px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 0, 0),
(81, 10, 'pronum', '产品编号', 0, 0, '', '请设置产品的编号', 'text', '100px', '', '', '', 0, 10, 0, 0, '编号不允许为空', 1, 0, 'ext', 0, 0, 1),
(82, 10, 'prostd', '产品规格', 0, 0, '', '请设置产品规格，示例：180*180*180等', 'text', '180px', '', '', '', 0, 20, 0, 0, '', 1, 0, 'ext', 0, 0, 0),
(83, 52, 'content', '产品内容', 0, 0, '', '', 'edit', '880px', '900px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_module_group`
--

CREATE TABLE IF NOT EXISTS `qinggan_module_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `langid` varchar(32) NOT NULL DEFAULT 'zh' COMMENT '语言编号，如zh,en等',
  `title` varchar(100) NOT NULL COMMENT '组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '值越小越往靠，最小为0',
  `js_function` varchar(100) NOT NULL DEFAULT '' COMMENT 'JS控制器，为空使用系统自动生成',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统0自定义',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `qinggan_module_group`
--

INSERT INTO `qinggan_module_group` (`id`, `langid`, `title`, `status`, `taxis`, `js_function`, `if_system`) VALUES
(1, 'zh', '核心配置', 1, 255, '', 1),
(3, 'zh', '内容管理', 1, 10, '', 1),
(4, 'zh', '电子商务', 1, 12, '', 1),
(6, 'zh', '会员中心', 1, 30, '', 0),
(8, 'zh', '栏目配置', 1, 15, '', 0),
(9, 'zh', '扩展插件', 1, 50, '', 0),
(10, 'zh', '附件管理', 1, 60, '', 0),
(11, 'zh', '风格语言', 1, 80, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_module_link`
--

CREATE TABLE IF NOT EXISTS `qinggan_module_link` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `langid` varchar(5) NOT NULL COMMENT '语言包',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `ico` varchar(30) NOT NULL COMMENT '图片地址',
  `linkurl` varchar(200) NOT NULL COMMENT '链接地址',
  `status` tinyint(1) NOT NULL COMMENT '0未审核1审核',
  `taxis` tinyint(3) unsigned NOT NULL COMMENT '排序，值越小越往前靠',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `qinggan_module_link`
--

INSERT INTO `qinggan_module_link` (`id`, `langid`, `title`, `ico`, `linkurl`, `status`, `taxis`) VALUES
(34, 'tc', '单页管理', 'list.gif', 'admin.php?c=list&module_id=20', 1, 30),
(29, 'zh', '企业业务', 'list.gif', 'admin.php?c=list&module_id=52&', 1, 30),
(35, 'tc', '导航管理', 'list.gif', 'admin.php?c=menu&module_id=27&', 1, 50),
(32, 'tc', '新闻中心', 'list.gif', 'admin.php?c=list&module_id=7&', 1, 10),
(33, 'tc', '企业业务', 'list.gif', 'admin.php?c=list&module_id=52&', 1, 20),
(28, 'zh', '新闻中心', 'list.gif', 'admin.php?c=list&module_id=7&', 1, 10),
(23, 'zh', '单页管理', 'list.gif', '{admin}?{c}=list&module_id=20', 1, 30);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_nav`
--

CREATE TABLE IF NOT EXISTS `qinggan_nav` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `link` varchar(100) NOT NULL COMMENT '网址链接',
  `link_html` varchar(255) NOT NULL COMMENT '静态页地址',
  `link_rewrite` varchar(255) NOT NULL COMMENT '伪静态页地址',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开0否1是',
  `note` varchar(255) NOT NULL COMMENT '文本提示',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `qinggan_nav`
--

INSERT INTO `qinggan_nav` (`id`, `parentid`, `langid`, `title`, `link`, `link_html`, `link_rewrite`, `target`, `note`, `taxis`, `status`) VALUES
(1, 0, 'zh', '测试导航一', '{index_php}', '{site_html}', 'index.html', 0, '', 10, 1),
(2, 0, 'zh', '测试导航二', '{index_php}?{control_trigger}=cart', '{site_url}{index_php}?{control_trigger}=cart', '{index_php}?{control_trigger}=cart', 0, '', 20, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_order`
--

CREATE TABLE IF NOT EXISTS `qinggan_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `otype` enum('cart','user') NOT NULL DEFAULT 'cart' COMMENT 'cart从购物车购买，user用户咨询购买',
  `sn` varchar(20) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `pass` varchar(50) NOT NULL COMMENT '密码串，用于游客查看订单',
  `price` float NOT NULL DEFAULT '0' COMMENT '金额',
  `price_currency` varchar(5) NOT NULL COMMENT '货币类型',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，游客为0',
  `email` varchar(50) NOT NULL COMMENT '客户邮箱',
  `note` varchar(255) NOT NULL COMMENT '留言信息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1已审核',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未付款1已付款',
  `pay_type` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '付款方式0表示未设定',
  `pay_code` varchar(100) NOT NULL COMMENT '付款识别码',
  `pay_price` float NOT NULL DEFAULT '0' COMMENT '付款金额',
  `pay_currency` varchar(5) NOT NULL DEFAULT 'CNY' COMMENT '货币类型，默认是CNY，即人民币',
  `pay_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款时间',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_order_address`
--

CREATE TABLE IF NOT EXISTS `qinggan_order_address` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID号',
  `address_type` enum('billing','shipping') NOT NULL DEFAULT 'shipping' COMMENT '地址类型，shipping送货地址，billing订单地址',
  `fullname` varchar(100) NOT NULL COMMENT '姓名，全名',
  `tel` varchar(30) NOT NULL COMMENT '电话或手机号',
  `email` varchar(70) NOT NULL COMMENT '邮件地址',
  `zipcode` varchar(20) NOT NULL COMMENT '邮编',
  `country` varchar(100) NOT NULL COMMENT '国家名称',
  `address` text NOT NULL COMMENT '地址',
  `note` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`order_id`,`address_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_order_address`
--

INSERT INTO `qinggan_order_address` (`order_id`, `address_type`, `fullname`, `tel`, `email`, `zipcode`, `country`, `address`, `note`) VALUES
(1, 'shipping', '苏相锟', '086-0755-88888888', 'admin@phpok.com', '518000', '中2', '广东深圳坂田四季花城-8', ''),
(1, 'billing', '苏相锟999', '086-0755-88888888', 'admin@phpok.com', '518000', '中国', '广东深圳坂田四季花城', ''),
(2, 'shipping', '苏相锟', '086-0755-88888888', 'admin@phpok.com', '518000', '中国', '广东深圳坂田四季花城', ''),
(2, 'billing', '苏相锟', '086-0755-88888888', 'admin@phpok.com', '518000', '中国', '广东深圳坂田四季花城', ''),
(3, 'shipping', '苏相锟', '086-0755-88888888', 'admin@phpok.com', '518000', '中国', '广东深圳坂田四季花城', ''),
(3, 'billing', '苏相锟', '086-0755-88888888', 'admin@phpok.com', '518000', '中国', '广东深圳坂田四季花城', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_order_products`
--

CREATE TABLE IF NOT EXISTS `qinggan_order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单中的产品ID',
  `orderid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `proid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID，0表示人工输入',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `amount` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '产品数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '产品单价',
  `price_currency` varchar(5) NOT NULL COMMENT '货币类型',
  `thumb_id` int(11) NOT NULL COMMENT '图片ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_payment`
--

CREATE TABLE IF NOT EXISTS `qinggan_payment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `code` varchar(100) NOT NULL COMMENT '标识ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未使用1正在使用中',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `next_act` varchar(100) NOT NULL COMMENT '后续动作，为空表示线下付款',
  `note` text NOT NULL COMMENT '付款注意事项说明',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `qinggan_payment`
--

INSERT INTO `qinggan_payment` (`id`, `code`, `title`, `status`, `taxis`, `next_act`, `note`, `langid`) VALUES
(1, 'paypal', 'Paypal在线付款', 1, 20, 'paypal', 'Paypal在线付款<strong>支持HTML的说明</strong>', 'zh'),
(2, 'alipay', '支付宝付款', 1, 10, 'alipay', '使用支付宝付款<br />\r\n支付宝账号：<strong>qinggan@188.com</strong>', 'zh'),
(3, 'tenpay', '财付通支付', 1, 15, 'tenpay', '财付通在线支付', 'zh');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_payment_val`
--

CREATE TABLE IF NOT EXISTS `qinggan_payment_val` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `payid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '付款ID号',
  `title` varchar(255) NOT NULL COMMENT '主题说明',
  `code` varchar(100) NOT NULL COMMENT '字段名称',
  `val` varchar(100) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`),
  KEY `payid` (`payid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `qinggan_payment_val`
--

INSERT INTO `qinggan_payment_val` (`id`, `payid`, `title`, `code`, `val`) VALUES
(1, 1, 'Paypal账号', 'business', 'qingga_1241773495_biz@188.com'),
(2, 1, 'PayPal服务的模式', 'action_url', 'https://www.sandbox.paypal.com/cgi-bin/webscr'),
(3, 1, '人民币转美金', 'price_format', '0.147'),
(4, 1, '验证字符串，获取远程数据', 'at', 'Z4pfmBl3kZrGaOPpB-vvJ-qaZhNb2NUsFmwDH9V7mWEI7fFdOWeb0yedeMK'),
(5, 1, '结算币种', 'currency_code', 'USD'),
(6, 2, '合作商号', 'partner', '2088002080074890'),
(7, 2, '支付宝账号', 'seller_email', 'qinggan@188.com'),
(8, 2, '安全较检码', 'code', '47w906e3o5hkibgnc6tjmngakx85skbb'),
(9, 2, '货币符号', 'currency', 'RMB'),
(10, 2, '验证方式', 'sign_type', 'MD5'),
(11, 3, '商务账号', 'bargainor_id', '1206023301'),
(12, 3, '语言包标识', 'cs', 'utf-8'),
(13, 3, '密钥', 'key', '15839bbc0bc5c7f667313b62e958a6f6'),
(14, 3, '付款地址', 'payurl', 'http://service.tenpay.com/cgi-bin/v3.0/payservice.cgi');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_phpok`
--

CREATE TABLE IF NOT EXISTS `qinggan_phpok` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `note` varchar(255) NOT NULL COMMENT '备注提示',
  `vartext` varchar(255) NOT NULL COMMENT '参数值，多个参数用英文逗号隔开',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，在同一个语言系中只能是唯一的',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '最多调用数据，如果填写1表示读详细信息',
  `intype` enum('sign','sql','html') NOT NULL DEFAULT 'sign' COMMENT '调用方式，默认是标签调用，sql指自写SQL调用，html指自己写的HTML代码',
  `typetext` text NOT NULL COMMENT 'SQL语句或是HTML代码',
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID号，0表示不限制',
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID号，0表示不限制',
  `orderby` enum('rand','post_desc','post_asc','modify_desc','modify_asc','reply_desc','reply_asc','hits_desc','hits_asc') NOT NULL DEFAULT 'post_desc' COMMENT '常用排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `inpic` varchar(100) NOT NULL COMMENT '关联图片类型',
  `pic_required` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1必填0否',
  `linkurl` varchar(255) NOT NULL COMMENT '指定目标链接',
  `attr` varchar(50) NOT NULL COMMENT '属性',
  `datatype` enum('list','cate') NOT NULL DEFAULT 'list' COMMENT '调用的数据类型',
  `extsign` varchar(100) NOT NULL COMMENT '扩展标签，适合只调用指定主题或是分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`,`langid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `qinggan_phpok`
--

INSERT INTO `qinggan_phpok` (`id`, `title`, `note`, `vartext`, `identifier`, `langid`, `maxcount`, `intype`, `typetext`, `mid`, `cid`, `orderby`, `status`, `inpic`, `pic_required`, `linkurl`, `attr`, `datatype`, `extsign`) VALUES
(30, '广告焦点图', '放在首页的3张轮播图', '', 'ad', 'zh', 3, 'sign', '', 54, 0, 'post_desc', 1, '', 1, '', '', 'list', ''),
(23, '页脚版权', '放在任意页的页脚上', '', 'copyright', 'zh', 1, 'html', '<div align="center">益达(广州)科技有限公司    版权所有    京ICP备14029572号</div>', 0, 0, 'post_desc', 1, '', 0, '', '', 'list', ''),
(33, '页脚版权', '放在任意页的页脚上', '', 'copyright', 'tc', 1, 'html', '<div align="center">        益達(廣州)科技有限公司    版權所有    京ICP備14029572號</div>', 0, 0, 'post_desc', 1, '', 0, '', '', 'list', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_plugins`
--

CREATE TABLE IF NOT EXISTS `qinggan_plugins` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '插件ID',
  `langid` varchar(10) NOT NULL DEFAULT '-' COMMENT '-表示全部，zh表示中文，其他语言用相应字母替代',
  `identifier` varchar(100) NOT NULL COMMENT '标识符，仅英文数字及下线划，且要求以字母开头',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `title` varchar(100) NOT NULL COMMENT '插件名称',
  `note` varchar(255) NOT NULL COMMENT '简要描述一下该插件是做什么用的',
  `uninstall_sql` text NOT NULL COMMENT '删除SQL操作',
  `install_sql` text NOT NULL COMMENT '安装SQL',
  `hooks` text NOT NULL COMMENT '一行一个节点参数，格式有file:xml,function:index',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `author` varchar(100) NOT NULL COMMENT '开发者',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `ext` text NOT NULL COMMENT '扩展参数配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `qinggan_plugins`
--

INSERT INTO `qinggan_plugins` (`id`, `langid`, `identifier`, `status`, `title`, `note`, `uninstall_sql`, `install_sql`, `hooks`, `taxis`, `version`, `author`, `postdate`, `ext`) VALUES
(4, '-', 'picplay', 1, 'Flash图片播放器', '应用于网站中图片播放器的XML文件！', '', '', '', 10, '1.0', 'qinggan', 1305505656, 'a:5:{s:5:"phpok";s:9:"picplayer";s:5:"width";s:3:"330";s:6:"height";s:3:"190";s:9:"showtitle";i:0;s:7:"showbtn";i:1;}');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_reply`
--

CREATE TABLE IF NOT EXISTS `qinggan_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID号',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号0为游客',
  `username` varchar(100) NOT NULL COMMENT '会员名称',
  `ip` varchar(30) NOT NULL COMMENT '发布时的IP地址',
  `title` varchar(100) NOT NULL COMMENT '主题',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `modifydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常2锁定',
  `ifbest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通回复1精华回复',
  `content` text NOT NULL COMMENT '回复的内容',
  `admreply` text NOT NULL COMMENT '管理员回复',
  `replydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员回复时间',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '星级评论，最大为5，最小为0',
  PRIMARY KEY (`id`),
  KEY `listid` (`tid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_select`
--

CREATE TABLE IF NOT EXISTS `qinggan_select` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `gid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组ID',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，根级用0表示',
  `val` varchar(100) NOT NULL DEFAULT '' COMMENT '值',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=364 ;

--
-- 转存表中的数据 `qinggan_select`
--

INSERT INTO `qinggan_select` (`id`, `langid`, `gid`, `pid`, `val`, `title`, `taxis`) VALUES
(1, 'zh', 1, 0, 'beijing', '北京市', 1),
(2, 'zh', 1, 0, 'shanghai', '上海市', 2),
(3, 'zh', 1, 0, 'tianjin', '天津市', 3),
(4, 'zh', 1, 0, 'chongqing', '重庆市', 4),
(5, 'zh', 1, 0, 'hebei', '河北省', 5),
(6, 'zh', 1, 5, 'sjz', '石家庄市', 6),
(7, 'zh', 1, 5, 'hd', '邯郸市', 7),
(8, 'zh', 1, 5, 'xt', '邢台市', 8),
(9, 'zh', 1, 5, 'bd', '保定市', 9),
(10, 'zh', 1, 5, 'zjk', '张家口市', 10),
(11, 'zh', 1, 5, 'cd', '承德市', 11),
(12, 'zh', 1, 5, 'lf', '廊坊市', 12),
(13, 'zh', 1, 5, 'ts', '唐山市', 13),
(14, 'zh', 1, 5, 'qhd', '秦皇岛市', 14),
(15, 'zh', 1, 5, 'cz', '沧州市', 15),
(16, 'zh', 1, 5, 'hs', '衡水市', 16),
(17, 'zh', 1, 0, 'shanxi', '山西省', 17),
(18, 'zh', 1, 17, 'ty', '太原市', 18),
(19, 'zh', 1, 17, 'dt', '大同市', 19),
(20, 'zh', 1, 17, 'yq', '阳泉市', 20),
(21, 'zh', 1, 17, 'czi', '长治市', 21),
(22, 'zh', 1, 17, 'jc', '晋城市', 22),
(23, 'zh', 1, 17, 'sz', '朔州市', 23),
(24, 'zh', 1, 17, 'nl', '吕梁市', 24),
(25, 'zh', 1, 17, 'yz', '忻州市', 25),
(26, 'zh', 1, 17, 'jz', '晋中市', 26),
(27, 'zh', 1, 17, 'linfen', '临汾市', 27),
(28, 'zh', 1, 17, 'yc', '运城市', 28),
(29, 'zh', 1, 0, 'liaoning', '辽宁省', 29),
(30, 'zh', 1, 29, 'sy', '沈阳市', 30),
(31, 'zh', 1, 29, 'dl', '大连市', 31),
(32, 'zh', 1, 29, 'as', '鞍山市', 32),
(33, 'zh', 1, 29, 'fs', '抚顺市', 33),
(34, 'zh', 1, 29, 'bx', '本溪市', 34),
(35, 'zh', 1, 29, 'dd', '丹东市', 35),
(36, 'zh', 1, 29, 'jzhou', '锦州市', 36),
(37, 'zh', 1, 29, 'yk', '营口市', 37),
(38, 'zh', 1, 29, 'px', '阜新市', 38),
(39, 'zh', 1, 29, 'ly', '辽阳市', 39),
(40, 'zh', 1, 29, 'pj', '盘锦市', 40),
(41, 'zh', 1, 29, 'tl', '铁岭市', 41),
(42, 'zh', 1, 29, 'cy', '朝阳市', 42),
(43, 'zh', 1, 29, 'hld', '葫芦岛市', 43),
(44, 'zh', 1, 0, 'jilin', '吉林省', 44),
(45, 'zh', 1, 44, 'cc', '长春市', 45),
(46, 'zh', 1, 44, 'jl', '吉林市', 46),
(47, 'zh', 1, 44, 'sp', '四平市', 47),
(48, 'zh', 1, 44, 'lyuan', '辽源市', 48),
(49, 'zh', 1, 44, 'th', '通化市', 49),
(50, 'zh', 1, 44, 'bs', '白山市', 50),
(51, 'zh', 1, 44, 'bc', '白城市', 51),
(52, 'zh', 1, 44, 'yb', '延边市', 52),
(53, 'zh', 1, 0, 'heilongjiang', '黑龙江省', 53),
(54, 'zh', 1, 53, 'heb', '哈尔滨市', 54),
(55, 'zh', 1, 53, 'qqhe', '齐齐哈尔市', 55),
(56, 'zh', 1, 53, 'mdj', '牡丹江市', 56),
(57, 'zh', 1, 53, 'jms', '佳木斯市', 57),
(58, 'zh', 1, 53, 'dq', '大庆市', 58),
(59, 'zh', 1, 53, 'sh', '绥化市', 59),
(60, 'zh', 1, 53, 'hg', '鹤岗市', 60),
(61, 'zh', 1, 53, 'jx', '鸡西市', 61),
(62, 'zh', 1, 53, 'hh', '黑河市', 62),
(63, 'zh', 1, 53, 'sys', '双鸭山市', 63),
(64, 'zh', 1, 53, 'ychun', '伊春市', 64),
(65, 'zh', 1, 53, 'qth', '七台河市', 65),
(66, 'zh', 1, 53, 'dxal', '大兴安岭市', 66),
(67, 'zh', 1, 0, 'jiangsu', '江苏省', 67),
(68, 'zh', 1, 67, 'nj', '南京市', 68),
(69, 'zh', 1, 67, 'zj', '镇江市', 69),
(70, 'zh', 1, 67, 'szhou', '苏州市', 70),
(71, 'zh', 1, 67, 'ntong', '南通市', 71),
(72, 'zh', 1, 67, 'yzhou', '扬州市', 72),
(73, 'zh', 1, 67, 'yanc', '盐城市', 73),
(74, 'zh', 1, 67, 'xz', '徐州市', 74),
(75, 'zh', 1, 67, 'lyg', '连云港市', 75),
(76, 'zh', 1, 67, 'czhou', '常州市', 76),
(77, 'zh', 1, 67, 'wx', '无锡市', 77),
(78, 'zh', 1, 67, 'xq', '宿迁市', 78),
(79, 'zh', 1, 67, 'tz', '泰州市', 79),
(80, 'zh', 1, 67, 'ha', '淮安市', 80),
(81, 'zh', 1, 0, 'zhejiang', '浙江省', 81),
(82, 'zh', 1, 81, 'hz', '杭州市', 82),
(83, 'zh', 1, 81, 'nb', '宁波市', 83),
(84, 'zh', 1, 81, 'wz', '温州市', 84),
(85, 'zh', 1, 81, 'jiax', '嘉兴市', 85),
(86, 'zh', 1, 81, 'hzs', '湖州市', 86),
(87, 'zh', 1, 81, 'sx', '绍兴市', 87),
(88, 'zh', 1, 81, 'jh', '金华市', 88),
(89, 'zh', 1, 81, 'qz', '衢州市', 89),
(90, 'zh', 1, 81, 'zs', '舟山市', 90),
(91, 'zh', 1, 81, 'tzs', '台州市', 91),
(92, 'zh', 1, 81, 'ls', '丽水市', 92),
(93, 'zh', 1, 0, 'anhui', '安徽省', 93),
(94, 'zh', 1, 93, 'hf', '合肥市', 94),
(95, 'zh', 1, 93, 'wh', '芜湖市', 95),
(96, 'zh', 1, 93, 'bb', '蚌埠市', 96),
(97, 'zh', 1, 93, 'mas', '马鞍山市', 97),
(98, 'zh', 1, 93, 'hb', '淮北市', 98),
(99, 'zh', 1, 93, 'tongl', '铜陵市', 99),
(100, 'zh', 1, 93, 'aq', '安庆市', 100),
(101, 'zh', 1, 93, 'hshan', '黄山市', 101),
(102, 'zh', 1, 93, 'chuz', '滁州市', 102),
(103, 'zh', 1, 93, 'shuz', '宿州市', 103),
(104, 'zh', 1, 93, 'czs', '池州市', 104),
(105, 'zh', 1, 93, 'hn', '淮南市', 105),
(106, 'zh', 1, 93, 'ch', '巢湖市', 106),
(107, 'zh', 1, 93, 'py', '阜阳市', 107),
(108, 'zh', 1, 93, 'la', '六安市', 108),
(109, 'zh', 1, 93, 'xc', '宣城市', 109),
(110, 'zh', 1, 93, 'bz', '亳州市', 110),
(111, 'zh', 1, 0, 'fujian', '福建省', 111),
(112, 'zh', 1, 111, 'fz', '福州市', 112),
(113, 'zh', 1, 111, 'xm', '厦门市', 113),
(114, 'zh', 1, 111, 'pt', '莆田市', 114),
(115, 'zh', 1, 111, 'sm', '三明市', 115),
(116, 'zh', 1, 111, 'quanz', '泉州市', 116),
(117, 'zh', 1, 111, 'zzs', '漳州市', 117),
(118, 'zh', 1, 111, 'np', '南平市', 118),
(119, 'zh', 1, 111, 'lyan', '龙岩市', 119),
(120, 'zh', 1, 111, 'nd', '宁德市', 120),
(121, 'zh', 1, 0, 'jiangxi', '江西省', 121),
(122, 'zh', 1, 121, 'nc', '南昌市', 122),
(123, 'zh', 1, 121, 'jdz', '景德镇市', 123),
(124, 'zh', 1, 121, 'jj', '九江市', 124),
(125, 'zh', 1, 121, 'yt', '鹰潭市', 125),
(126, 'zh', 1, 121, 'pxiang', '萍乡市', 126),
(127, 'zh', 1, 121, 'xy', '新馀市', 127),
(128, 'zh', 1, 121, 'gz', '赣州市', 128),
(129, 'zh', 1, 121, 'ja', '吉安市', 129),
(130, 'zh', 1, 121, 'yic', '宜春市', 130),
(131, 'zh', 1, 121, 'wzhou', '抚州市', 131),
(132, 'zh', 1, 121, 'sr', '上饶市', 132),
(133, 'zh', 1, 0, 'shandong', '山东省', 133),
(134, 'zh', 1, 133, 'jin', '济南市', 134),
(135, 'zh', 1, 133, 'zb', '淄博市', 135),
(136, 'zh', 1, 133, 'zhaoz', '枣庄市', 136),
(137, 'zh', 1, 133, 'dy', '东营市', 137),
(138, 'zh', 1, 133, 'yts', '烟台市', 138),
(139, 'zh', 1, 133, 'wf', '潍坊市', 139),
(140, 'zh', 1, 133, 'jns', '济宁市', 140),
(141, 'zh', 1, 133, 'tans', '泰安市', 141),
(142, 'zh', 1, 133, 'whai', '威海市', 142),
(143, 'zh', 1, 133, 'rz', '日照市', 143),
(144, 'zh', 1, 133, 'lw', '莱芜市', 144),
(145, 'zh', 1, 133, 'lys', '临沂市', 145),
(146, 'zh', 1, 133, 'dz', '德州市', 146),
(147, 'zh', 1, 133, 'lc', '聊城市', 147),
(148, 'zh', 1, 133, 'bzhou', '滨州市', 148),
(149, 'zh', 1, 133, 'hze', '菏泽市', 149),
(150, 'zh', 1, 0, 'henan', '河南省', 150),
(151, 'zh', 1, 150, 'zzhou', '郑州市', 151),
(152, 'zh', 1, 150, 'kf', '开封市', 152),
(153, 'zh', 1, 150, 'lyang', '洛阳市', 153),
(154, 'zh', 1, 150, 'pds', '平顶山市', 154),
(155, 'zh', 1, 150, 'ay', '安阳市', 155),
(156, 'zh', 1, 150, 'hbi', '鹤壁市', 156),
(157, 'zh', 1, 150, 'xinx', '新乡市', 157),
(158, 'zh', 1, 150, 'jzuo', '焦作市', 158),
(159, 'zh', 1, 150, 'puy', '濮阳市', 159),
(160, 'zh', 1, 150, 'xuc', '许昌市', 160),
(161, 'zh', 1, 150, 'lh', '漯河市', 161),
(162, 'zh', 1, 150, 'smx', '三门峡市', 162),
(163, 'zh', 1, 150, 'ny', '南阳市', 163),
(164, 'zh', 1, 150, 'sq', '商丘市', 164),
(165, 'zh', 1, 150, 'xyang', '信阳市', 165),
(166, 'zh', 1, 150, 'zk', '周口市', 166),
(167, 'zh', 1, 150, 'zmd', '驻马店市', 167),
(168, 'zh', 1, 150, 'jy', '济源市', 168),
(169, 'zh', 1, 0, 'hubei', '湖北省', 169),
(170, 'zh', 1, 169, 'whs', '武汉市', 170),
(171, 'zh', 1, 169, 'ez', '鄂州市', 171),
(172, 'zh', 1, 169, 'ychang', '宜昌市', 172),
(173, 'zh', 1, 169, 'jzs', '荆州市', 173),
(174, 'zh', 1, 169, 'xf', '襄樊市', 174),
(175, 'zh', 1, 169, 'hss', '黄石市', 175),
(176, 'zh', 1, 169, 'jm', '荆门市', 176),
(177, 'zh', 1, 169, 'hgang', '黄冈市', 177),
(178, 'zh', 1, 169, 'syan', '十堰市', 178),
(179, 'zh', 1, 169, 'es', '恩施市', 179),
(180, 'zh', 1, 169, 'qj', '潜江市', 180),
(181, 'zh', 1, 169, 'tm', '天门市', 181),
(182, 'zh', 1, 169, 'xiantao', '仙桃市', 182),
(183, 'zh', 1, 169, 'suiz', '随州市', 183),
(184, 'zh', 1, 169, 'xn', '咸宁市', 184),
(185, 'zh', 1, 169, 'xg', '孝感市', 185),
(186, 'zh', 1, 0, 'hunan', '湖南省', 186),
(187, 'zh', 1, 186, 'cs', '长沙市', 187),
(188, 'zh', 1, 186, 'cds', '常德市', 188),
(189, 'zh', 1, 186, 'zhuz', '株洲市', 189),
(190, 'zh', 1, 186, 'xiangtan', '湘潭市', 190),
(191, 'zh', 1, 186, 'hy', '衡阳市', 191),
(192, 'zh', 1, 186, 'yuey', '岳阳市', 192),
(193, 'zh', 1, 186, 'syang', '邵阳市', 193),
(194, 'zh', 1, 186, 'yys', '益阳市', 194),
(195, 'zh', 1, 186, 'ld', '娄底市', 195),
(196, 'zh', 1, 186, 'hhua', '怀化市', 196),
(197, 'zh', 1, 186, 'chengz', '郴州市', 197),
(198, 'zh', 1, 186, 'yzs', '永州市', 198),
(199, 'zh', 1, 186, 'xxis', '湘西市', 199),
(200, 'zh', 1, 186, 'zjj', '张家界市', 200),
(201, 'zh', 1, 0, 'guangdong', '广东省', 201),
(202, 'zh', 1, 201, 'gzhou', '广州市', 202),
(203, 'zh', 1, 201, 'szhen', '深圳市', 203),
(204, 'zh', 1, 201, 'zhuhai', '珠海市', 204),
(205, 'zh', 1, 201, 'shantou', '汕头市', 205),
(206, 'zh', 1, 201, 'dg', '东莞市', 206),
(207, 'zh', 1, 201, 'zshan', '中山市', 207),
(208, 'zh', 1, 201, 'fss', '佛山市', 208),
(209, 'zh', 1, 201, 'sg', '韶关市', 209),
(210, 'zh', 1, 201, 'jmen', '江门市', 210),
(211, 'zh', 1, 201, 'zhanj', '湛江市', 211),
(212, 'zh', 1, 201, 'mm', '茂名市', 212),
(213, 'zh', 1, 201, 'zq', '肇庆市', 213),
(214, 'zh', 1, 201, 'huiz', '惠州市', 214),
(215, 'zh', 1, 201, 'mz', '梅州市', 215),
(216, 'zh', 1, 201, 'sw', '汕尾市', 216),
(217, 'zh', 1, 201, 'hyuan', '河源市', 217),
(218, 'zh', 1, 201, 'yj', '阳江市', 218),
(219, 'zh', 1, 201, 'qy', '清远市', 219),
(220, 'zh', 1, 201, 'chaoz', '潮州市', 220),
(221, 'zh', 1, 201, 'jiey', '揭阳市', 221),
(222, 'zh', 1, 201, 'yf', '云浮市', 222),
(223, 'zh', 1, 0, 'gansu', '甘肃省', 223),
(224, 'zh', 1, 223, 'lz', '兰州市', 224),
(225, 'zh', 1, 223, 'jyg', '嘉峪关市', 225),
(226, 'zh', 1, 223, 'jcs', '金昌市', 226),
(227, 'zh', 1, 223, 'by', '白银市', 224),
(228, 'zh', 1, 223, 'tss', '天水市', 228),
(229, 'zh', 1, 223, 'jq', '酒泉市', 229),
(230, 'zh', 1, 223, 'zy', '张掖市', 230),
(231, 'zh', 1, 223, 'ww', '武威市', 231),
(232, 'zh', 1, 223, 'dx', '定西市', 232),
(233, 'zh', 1, 223, 'ln', '陇南市', 233),
(234, 'zh', 1, 223, 'pl', '平凉市', 234),
(235, 'zh', 1, 223, 'qingy', '庆阳市', 235),
(236, 'zh', 1, 223, 'lx', '临夏市', 236),
(237, 'zh', 1, 223, 'gn', '甘南市', 237),
(238, 'zh', 1, 0, 'shanxisheng', '陕西省', 238),
(239, 'zh', 1, 238, 'xa', '西安市', 239),
(240, 'zh', 1, 238, 'bj', '宝鸡市', 240),
(241, 'zh', 1, 238, 'xiany', '咸阳市', 241),
(242, 'zh', 1, 238, 'tc', '铜川市', 242),
(243, 'zh', 1, 238, 'wn', '渭南市', 243),
(244, 'zh', 1, 238, 'yanan', '延安市', 244),
(245, 'zh', 1, 238, 'yls', '榆林市', 245),
(246, 'zh', 1, 238, 'hanz', '汉中市', 246),
(247, 'zh', 1, 238, 'ak', '安康市', 247),
(248, 'zh', 1, 238, 'sl', '商洛市', 248),
(249, 'zh', 1, 0, 'neimenggu', '内蒙古', 249),
(250, 'zh', 1, 249, 'fhht', '呼和浩特市', 250),
(251, 'zh', 1, 249, 'bt', '包头市', 251),
(252, 'zh', 1, 249, 'wuhai', '乌海市', 252),
(253, 'zh', 1, 249, 'jning', '集宁市', 253),
(254, 'zh', 1, 249, 'tliao', '通辽市', 254),
(255, 'zh', 1, 249, 'cf', '赤峰市', 255),
(256, 'zh', 1, 249, 'hlbe', '呼伦贝尔盟', 255),
(257, 'zh', 1, 249, 'als', '阿拉善盟', 255),
(258, 'zh', 1, 249, 'zlm', '哲里木盟', 255),
(259, 'zh', 1, 249, 'xam', '兴安盟', 255),
(260, 'zh', 1, 249, 'wlcb', '乌兰察布盟', 255),
(261, 'zh', 1, 249, 'xlgl', '锡林郭勒盟', 255),
(262, 'zh', 1, 249, 'byze', '巴彦淖尔盟', 255),
(263, 'zh', 1, 249, 'ykz', '伊克昭盟', 255),
(264, 'zh', 1, 0, 'guangxi', '广西', 255),
(265, 'zh', 1, 264, 'nls', '南宁市', 255),
(266, 'zh', 1, 264, 'liuz', '柳州市', 255),
(267, 'zh', 1, 264, 'glx', '桂林市', 255),
(268, 'zh', 1, 264, 'wuz', '梧州市', 255),
(269, 'zh', 1, 264, 'bh', '北海市', 255),
(270, 'zh', 1, 264, 'fcg', '防城港市', 255),
(271, 'zh', 1, 264, 'qingz', '钦州市', 255),
(272, 'zh', 1, 264, 'gg', '贵港市', 255),
(273, 'zh', 1, 264, 'yul', '玉林市', 255),
(274, 'zh', 1, 264, 'hezhou', '贺州市', 255),
(275, 'zh', 1, 264, 'bse', '百色市', 255),
(276, 'zh', 1, 264, 'hc', '河池市', 255),
(277, 'zh', 1, 0, 'sichuan', '四川省', 255),
(278, 'zh', 1, 277, 'cdou', '成都市', 255),
(279, 'zh', 1, 277, 'my', '绵阳市', 255),
(280, 'zh', 1, 277, 'dey', '德阳市', 255),
(281, 'zh', 1, 277, 'zg', '自贡市', 255),
(282, 'zh', 1, 277, 'pzh', '攀枝花市', 255),
(283, 'zh', 1, 277, 'gy', '广元市', 255),
(284, 'zh', 1, 277, 'neij', '内江市', 255),
(285, 'zh', 1, 277, 'lshan', '乐山市', 255),
(286, 'zh', 1, 277, 'nchong', '南充市', 255),
(287, 'zh', 1, 277, 'ybin', '宜宾市', 255),
(288, 'zh', 1, 277, 'ga', '广安市', 255),
(289, 'zh', 1, 277, 'dc', '达川市', 255),
(290, 'zh', 1, 277, 'yaan', '雅安市', 255),
(291, 'zh', 1, 277, 'ms', '眉山市', 255),
(292, 'zh', 1, 277, 'ganzhi', '甘孜市', 255),
(293, 'zh', 1, 277, 'lss', '凉山市', 255),
(294, 'zh', 1, 277, 'luz', '泸州市', 255),
(295, 'zh', 1, 0, 'guizhou', '贵州省', 255),
(296, 'zh', 1, 295, 'guiy', '贵阳市', 255),
(297, 'zh', 1, 295, 'lps', '六盘水市', 255),
(298, 'zh', 1, 295, 'zyi', '遵义市', 255),
(299, 'zh', 1, 295, 'ashun', '安顺市', 255),
(300, 'zh', 1, 295, 'tr', '铜仁市', 255),
(301, 'zh', 1, 295, 'qxn', '黔西南市', 255),
(302, 'zh', 1, 295, 'bijie', '毕节市', 255),
(303, 'zh', 1, 295, 'qdn', '黔东南市', 255),
(304, 'zh', 1, 295, 'qn', '黔南市', 255),
(305, 'zh', 1, 0, 'yunnan', '云南省', 255),
(306, 'zh', 1, 305, 'km', '昆明市', 255),
(307, 'zh', 1, 305, 'dls', '大理市', 255),
(308, 'zh', 1, 305, 'quj', '曲靖市', 255),
(309, 'zh', 1, 305, 'yx', '玉溪市', 255),
(310, 'zh', 1, 305, 'zt', '昭通市', 255),
(311, 'zh', 1, 305, 'cx', '楚雄市', 255),
(312, 'zh', 1, 305, 'hhe', '红河市', 255),
(313, 'zh', 1, 305, 'ws', '文山市', 255),
(314, 'zh', 1, 305, 'smao', '思茅市', 255),
(315, 'zh', 1, 305, 'xsbn', '西双版纳市', 255),
(316, 'zh', 1, 305, 'bshan', '保山市', 255),
(317, 'zh', 1, 305, 'dh', '德宏市', 255),
(318, 'zh', 1, 305, 'lj', '丽江市', 255),
(319, 'zh', 1, 305, 'nouj', '怒江市', 255),
(320, 'zh', 1, 305, 'diq', '迪庆市', 255),
(321, 'zh', 1, 305, 'linc', '临沧市', 255),
(322, 'zh', 1, 0, 'xizang', '西藏', 255),
(323, 'zh', 1, 322, 'lsa', '拉萨市', 255),
(324, 'zh', 1, 322, 'rkz', '日喀则市', 255),
(325, 'zh', 1, 322, 'sn', '山南市', 255),
(326, 'zh', 1, 322, 'linz', '林芝市', 255),
(327, 'zh', 1, 322, 'changdu', '昌都市', 255),
(328, 'zh', 1, 322, 'als', '阿里市', 255),
(329, 'zh', 1, 322, 'nq', '那曲市', 255),
(330, 'zh', 1, 0, 'hainan', '海南省', 255),
(331, 'zh', 1, 330, 'hk', '海口市', 255),
(332, 'zh', 1, 330, 'sya', '三亚市', 255),
(333, 'zh', 1, 0, 'ningxia', '宁夏', 255),
(334, 'zh', 1, 333, 'ychuan', '银川市', 255),
(335, 'zh', 1, 333, 'szs', '石嘴山市', 255),
(336, 'zh', 1, 333, 'wzhong', '吴忠市', 255),
(337, 'zh', 1, 333, 'guy', '固原市', 255),
(338, 'zh', 1, 0, 'qinghai', '青海省', 255),
(339, 'zh', 1, 338, 'xning', '西宁市', 255),
(340, 'zh', 1, 338, 'hds', '海东市', 255),
(341, 'zh', 1, 338, 'hnan', '海南市', 255),
(342, 'zh', 1, 338, 'hbei', '海北市', 255),
(343, 'zh', 1, 338, 'yss', '玉树市', 255),
(344, 'zh', 1, 338, 'gl', '果洛市', 255),
(345, 'zh', 1, 338, 'hx', '海西市', 255),
(346, 'zh', 1, 338, 'hns', '黄南市', 255),
(347, 'zh', 1, 0, 'xinjiang', '新疆', 255),
(348, 'zh', 1, 347, 'wlmq', '乌鲁木齐市', 255),
(349, 'zh', 1, 347, 'shz', '石河子市', 255),
(350, 'zh', 1, 347, 'klmy', '克拉玛依市', 255),
(351, 'zh', 1, 347, 'yl', '伊犁市', 255),
(352, 'zh', 1, 347, 'bygl', '巴音郭勒市', 255),
(353, 'zh', 1, 347, 'cj', '昌吉市', 255),
(354, 'zh', 1, 347, 'kzlskekz', '克孜勒苏柯尔克孜市', 255),
(355, 'zh', 1, 347, 'betl', '博尔塔拉市', 255),
(356, 'zh', 1, 347, 'tlf', '吐鲁番市', 255),
(357, 'zh', 1, 347, 'hm', '哈密市', 255),
(358, 'zh', 1, 347, 'ks', '喀什市', 255),
(359, 'zh', 1, 347, 'ht', '和田市', 255),
(360, 'zh', 1, 347, 'aks', '阿克苏市', 255),
(361, 'zh', 1, 0, 'xianggang', '香港', 255),
(362, 'zh', 1, 0, 'aomen', '澳门', 255),
(363, 'zh', 1, 0, 'taiwan', '台湾省', 255);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_select_group`
--

CREATE TABLE IF NOT EXISTS `qinggan_select_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '组ID号',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID',
  `title` varchar(100) DEFAULT NULL COMMENT '组名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `qinggan_select_group`
--

INSERT INTO `qinggan_select_group` (`id`, `langid`, `title`) VALUES
(1, 'zh', '省份/城市');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_session`
--

CREATE TABLE IF NOT EXISTS `qinggan_session` (
  `id` varchar(32) NOT NULL COMMENT 'session_id',
  `data` text NOT NULL COMMENT 'session 内容',
  `lasttime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_session`
--

INSERT INTO `qinggan_session` (`id`, `data`, `lasttime`) VALUES
('59bt9dtobdta7um39i9o0df9q7', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450424444),
('qhkc890o6bg8vbeirlkki41a93', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450447535),
('mm2tr20bncc52j2d0ggpfdfhd2', 'sys_lang_id|s:2:"zh";', 1450431261),
('v0mccp9200gk229okupb7ja9d0', 'sys_lang_id|s:2:"zh";', 1450431136),
('kjsddpavc5qgsu9o7ivpo4g2q7', 'sys_lang_id|s:2:"zh";', 1450432974),
('039sgv3qj0j8rmtpd9255jhk76', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450432897),
('vg4atb97g8osr9nk027itljpm1', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450432886);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_subscribers`
--

CREATE TABLE IF NOT EXISTS `qinggan_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件订阅编号，自动增加',
  `email` varchar(100) NOT NULL COMMENT '电子邮件地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '电子邮件确认状态，1表示已确认，0表示未确认',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `md5pass` varchar(32) NOT NULL COMMENT '验证串，用于前台会员手动删除邮件订阅',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `qinggan_subscribers`
--

INSERT INTO `qinggan_subscribers` (`id`, `email`, `status`, `postdate`, `md5pass`) VALUES
(1, 'qinggan@188.com', 1, 1299837031, '7cfc5398883d16fa237957fcf83b8150');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_tpl`
--

CREATE TABLE IF NOT EXISTS `qinggan_tpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `langid` varchar(5) NOT NULL DEFAULT 'zh' COMMENT '语言ID，默认是zh',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `folder` varchar(50) NOT NULL COMMENT '文件夹',
  `ext` varchar(10) NOT NULL DEFAULT 'html' COMMENT '模板后缀',
  `autoimg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自动解析图片地址',
  `ifdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `ifsystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1系统模板0用户模板',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1正在使用0未使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `qinggan_tpl`
--

INSERT INTO `qinggan_tpl` (`id`, `langid`, `title`, `folder`, `ext`, `autoimg`, `ifdefault`, `ifsystem`, `taxis`, `status`) VALUES
(1, 'zh', '前台默认风格', 'www', 'html', 1, 1, 0, 10, 1),
(4, 'en', 'en', 'en', 'html', 1, 1, 0, 255, 1),
(5, 'tc', 'tc', 'tc', 'html', 1, 1, 0, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_upfiles`
--

CREATE TABLE IF NOT EXISTS `qinggan_upfiles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `filename` varchar(255) NOT NULL COMMENT '图片路径，基于网站根目录的相对路径',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图路径，基于网站根目录的相对路径',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `ftype` varchar(10) NOT NULL COMMENT '附件类型',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，0表示管理员上传',
  `flv_pic` varchar(255) NOT NULL COMMENT 'FLV封面图片',
  `sessid` varchar(50) NOT NULL COMMENT '游客上传标识串',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=307 ;

--
-- 转存表中的数据 `qinggan_upfiles`
--

INSERT INTO `qinggan_upfiles` (`id`, `title`, `filename`, `thumb`, `postdate`, `ftype`, `uid`, `flv_pic`, `sessid`) VALUES
(208, '图片1.jpg', 'upfiles/201512/17/ee718056de5282b1.jpg', 'upfiles/201512/17/thumb208.jpg', 1450317149, 'jpg', 0, '', ''),
(209, '图片2.jpg', 'upfiles/201512/17/e05a440562fd0de8.jpg', 'upfiles/201512/17/thumb209.jpg', 1450317172, 'jpg', 0, '', ''),
(205, '11.jpg', 'upfiles/201512/17/56079f54e9fc465f.jpg', '', 1450314553, 'jpg', 0, '', ''),
(206, '图片1.jpg', 'upfiles/201512/17/7f57a7845d5c7e47.jpg', 'upfiles/201512/17/thumb206.jpg', 1450316586, 'jpg', 0, '', ''),
(207, '555.jpg', 'upfiles/201512/17/46034507b553148a.jpg', 'upfiles/201512/17/thumb207.jpg', 1450316794, 'jpg', 0, '', ''),
(203, '11.jpg', 'upfiles/201512/17/10ade0545b0ffc9a.jpg', 'upfiles/201512/17/thumb203.jpg', 1450314128, 'jpg', 0, '', ''),
(204, '1122.jpg', 'upfiles/201512/17/594f30bc77405bad.jpg', 'upfiles/201512/17/thumb204.jpg', 1450314438, 'jpg', 0, '', ''),
(200, 'fazhan licheng.jpg', 'upfiles/201512/17/5c91324bd728d38f.jpg', 'upfiles/201512/17/thumb200.jpg', 1450313682, 'jpg', 0, '', ''),
(201, 'fazhan licheng00.jpg', 'upfiles/201512/17/cee569042921fa7d.jpg', 'upfiles/201512/17/thumb201.jpg', 1450313826, 'jpg', 0, '', ''),
(202, '00.jpg', 'upfiles/201512/17/2becbe72524f5bc5.jpg', 'upfiles/201512/17/thumb202.jpg', 1450313866, 'jpg', 0, '', ''),
(199, 'fazhan licheng.jpg', 'upfiles/201512/17/70b7b6c8e6ca5e4f.jpg', 'upfiles/201512/17/thumb199.jpg', 1450313546, 'jpg', 0, '', ''),
(198, '仿站小工具.zip', 'upfiles/201512/16/8d9fca3c4605a931.zip', '', 1450248754, 'zip', 0, '', ''),
(196, '20150122134231_5764.jpg', 'upfiles/201512/15/5b58dc1d1b2f80a5.jpg', 'upfiles/201512/15/thumb196.jpg', 1450141390, 'jpg', 0, '', ''),
(293, '学练考赛证1_03.png', 'upfiles/201512/18/bcdcb812555118da.png', 'upfiles/201512/18/thumb293.png', 1450424478, 'png', 0, '', ''),
(210, '图片4.jpg', 'upfiles/201512/17/35dcdbe4581e229d.jpg', 'upfiles/201512/17/thumb210.jpg', 1450317202, 'jpg', 0, '', ''),
(211, '图片8.jpg', 'upfiles/201512/17/e27d5547cfb8110e.jpg', 'upfiles/201512/17/thumb211.jpg', 1450317221, 'jpg', 0, '', ''),
(212, '企业介绍.jpg', 'upfiles/201512/17/bf8d2192d936559c.jpg', 'upfiles/201512/17/thumb212.jpg', 1450317346, 'jpg', 0, '', ''),
(213, '图片7.jpg', 'upfiles/201512/17/90602fb38d94a9dc.jpg', 'upfiles/201512/17/thumb213.jpg', 1450317375, 'jpg', 0, '', ''),
(214, '图片6.jpg', 'upfiles/201512/17/e1c90031b4f3be6f.jpg', 'upfiles/201512/17/thumb214.jpg', 1450317406, 'jpg', 0, '', ''),
(215, '图片3.jpg', 'upfiles/201512/17/2821b21fcf59275b.jpg', 'upfiles/201512/17/thumb215.jpg', 1450317431, 'jpg', 0, '', ''),
(216, '企业介绍.jpg', 'upfiles/201512/17/e498c4dc2e01925b.jpg', 'upfiles/201512/17/thumb216.jpg', 1450317559, 'jpg', 0, '', ''),
(217, '企业介绍哦.jpg', 'upfiles/201512/17/3cb49ce30a86c0ca.jpg', 'upfiles/201512/17/thumb217.jpg', 1450317636, 'jpg', 0, '', ''),
(218, '图片4.png', 'upfiles/201512/17/5e101693e1ec9040.png', 'upfiles/201512/17/thumb218.png', 1450318019, 'png', 0, '', ''),
(219, '20151117101726828.jpg', 'upfiles/201512/17/c7b2b34e37a6d97e.jpg', 'upfiles/201512/17/thumb219.jpg', 1450318049, 'jpg', 0, '', ''),
(220, '图片2.png', 'upfiles/201512/17/75cf866c4e32d02d.png', 'upfiles/201512/17/thumb220.png', 1450318050, 'png', 0, '', ''),
(221, '图片1.png', 'upfiles/201512/17/6b838af0630ab657.png', 'upfiles/201512/17/thumb221.png', 1450318157, 'png', 0, '', ''),
(222, '企业介绍.jpg', 'upfiles/201512/17/0c1c81c4f9b696e1.jpg', 'upfiles/201512/17/thumb222.jpg', 1450318729, 'jpg', 0, '', ''),
(223, '企业介绍.jpg', 'upfiles/201512/17/2d34972811ab88d9.jpg', 'upfiles/201512/17/thumb223.jpg', 1450318785, 'jpg', 0, '', ''),
(224, '企业介绍哦.jpg', 'upfiles/201512/17/dcfbf005d1a3f957.jpg', 'upfiles/201512/17/thumb224.jpg', 1450319150, 'jpg', 0, '', ''),
(225, '企业战略.png', 'upfiles/201512/17/3464826d63cb46d5.png', 'upfiles/201512/17/thumb225.png', 1450319584, 'png', 0, '', ''),
(226, '企业战略.png', 'upfiles/201512/17/28e4663301423deb.png', 'upfiles/201512/17/thumb226.png', 1450319639, 'png', 0, '', ''),
(227, '企业战略2.png', 'upfiles/201512/17/075fefe881eb937b.png', 'upfiles/201512/17/thumb227.png', 1450319796, 'png', 0, '', ''),
(228, '图片2_副本.jpg', 'upfiles/201512/17/d57dbac055b464ea.jpg', 'upfiles/201512/17/thumb228.jpg', 1450319924, 'jpg', 0, '', ''),
(229, '企业战略2.png', 'upfiles/201512/17/4cc8654ab449a6c3.png', 'upfiles/201512/17/thumb229.png', 1450320012, 'png', 0, '', ''),
(230, '图片1.png', 'upfiles/201512/17/7ef6b61d51614f54.png', 'upfiles/201512/17/thumb230.png', 1450320047, 'png', 0, '', ''),
(231, '图片1.png', 'upfiles/201512/17/98acb95ea14f9a87.png', 'upfiles/201512/17/thumb231.png', 1450320197, 'png', 0, '', ''),
(232, '历程.png', 'upfiles/201512/17/376a72c3ca15a71d.png', 'upfiles/201512/17/thumb232.png', 1450320852, 'png', 0, '', ''),
(233, '历程.png', 'upfiles/201512/17/2256874082083632.png', 'upfiles/201512/17/thumb233.png', 1450321025, 'png', 0, '', ''),
(234, '历程.png', 'upfiles/201512/17/cf7ebc0c4be9c7d6.png', 'upfiles/201512/17/thumb234.png', 1450321170, 'png', 0, '', ''),
(235, '历程.png', 'upfiles/201512/17/376896db840f8414.png', 'upfiles/201512/17/thumb235.png', 1450321408, 'png', 0, '', ''),
(236, '图片3_副本.jpg', 'upfiles/201512/17/cb664d49d0e21b43.jpg', 'upfiles/201512/17/thumb236.jpg', 1450321559, 'jpg', 0, '', ''),
(237, '图片4_副本.jpg', 'upfiles/201512/17/20f281d9cd0bf27a.jpg', 'upfiles/201512/17/thumb237.jpg', 1450321605, 'jpg', 0, '', ''),
(238, '图片5_副本.jpg', 'upfiles/201512/17/aba97b90b018869a.jpg', 'upfiles/201512/17/thumb238.jpg', 1450321660, 'jpg', 0, '', ''),
(239, '图片3.png', 'upfiles/201512/17/ec4826a7dd790f48.png', 'upfiles/201512/17/thumb239.png', 1450321697, 'png', 0, '', ''),
(240, '图片3.png', 'upfiles/201512/17/ab726e0d4ae8bad3.png', 'upfiles/201512/17/thumb240.png', 1450321786, 'png', 0, '', ''),
(241, '图片3.png', 'upfiles/201512/17/18c54158e67948d0.png', 'upfiles/201512/17/thumb241.png', 1450321986, 'png', 0, '', ''),
(242, '图片1_副本.jpg', 'upfiles/201512/17/1f25a02b7ce181fa.jpg', 'upfiles/201512/17/thumb242.jpg', 1450322230, 'jpg', 0, '', ''),
(243, '图片2_副本1.jpg', 'upfiles/201512/17/3d201ae0a57f792e.jpg', 'upfiles/201512/17/thumb243.jpg', 1450322230, 'jpg', 0, '', ''),
(244, '图片2.png', 'upfiles/201512/17/dd067a9e0848c8bd.png', 'upfiles/201512/17/thumb244.png', 1450322298, 'png', 0, '', ''),
(245, '图片3_副本1.jpg', 'upfiles/201512/17/706dc269ad78b569.jpg', 'upfiles/201512/17/thumb245.jpg', 1450322298, 'jpg', 0, '', ''),
(246, '图片4_副本1.jpg', 'upfiles/201512/17/9f50eea4f22c32b0.jpg', 'upfiles/201512/17/thumb246.jpg', 1450322337, 'jpg', 0, '', ''),
(247, '图片5_副本1.jpg', 'upfiles/201512/17/6e1c67552baeb01f.jpg', 'upfiles/201512/17/thumb247.jpg', 1450322434, 'jpg', 0, '', ''),
(248, '图片5.png', 'upfiles/201512/17/47f5afecc7e32b09.png', 'upfiles/201512/17/thumb248.png', 1450322853, 'png', 0, '', ''),
(249, '图片1.jpg', 'upfiles/201512/17/bcb08a30e1af3183.jpg', 'upfiles/201512/17/thumb249.jpg', 1450322902, 'jpg', 0, '', ''),
(250, '图片5.png', 'upfiles/201512/17/11bd046b53ca8a47.png', 'upfiles/201512/17/thumb250.png', 1450322913, 'png', 0, '', ''),
(251, '图片5.png', 'upfiles/201512/17/fce4dbb515ca5997.png', 'upfiles/201512/17/thumb251.png', 1450323169, 'png', 0, '', ''),
(252, '图片7.png', 'upfiles/201512/17/44dd4fbe4e0c52b0.png', 'upfiles/201512/17/thumb252.png', 1450323336, 'png', 0, '', ''),
(253, '图片8.png', 'upfiles/201512/17/f5a117f51f09b294.png', 'upfiles/201512/17/thumb253.png', 1450323489, 'png', 0, '', ''),
(254, '1.jpg', 'upfiles/201512/17/b2c95815e99483ee.jpg', 'upfiles/201512/17/thumb254.jpg', 1450323580, 'jpg', 0, '', ''),
(255, '2.jpg', 'upfiles/201512/17/311ffaa6e1431f9d.jpg', 'upfiles/201512/17/thumb255.jpg', 1450323680, 'jpg', 0, '', ''),
(256, '3.png', 'upfiles/201512/17/eca75ab8db893b15.png', 'upfiles/201512/17/thumb256.png', 1450323735, 'png', 0, '', ''),
(257, '4.jpg', 'upfiles/201512/17/b92ede35ad8bb1a7.jpg', 'upfiles/201512/17/thumb257.jpg', 1450323788, 'jpg', 0, '', ''),
(258, '图片1.jpg', 'upfiles/201512/17/56fd79fa5a300bb8.jpg', 'upfiles/201512/17/thumb258.jpg', 1450324395, 'jpg', 0, '', ''),
(259, '小图2.jpg', 'upfiles/201512/17/59a57a23af2c21b4.jpg', 'upfiles/201512/17/thumb259.jpg', 1450330365, 'jpg', 0, '', ''),
(260, '5626e26f08b80.jpg', 'upfiles/201512/17/6d3aeeed37ef4c72.jpg', 'upfiles/201512/17/thumb260.jpg', 1450330435, 'jpg', 0, '', ''),
(261, '图片3.jpg', 'upfiles/201512/17/a3b247207fc91647.jpg', 'upfiles/201512/17/thumb261.jpg', 1450330938, 'jpg', 0, '', ''),
(262, '图片4.jpg', 'upfiles/201512/17/5bb6245a5f3076b1.jpg', 'upfiles/201512/17/thumb262.jpg', 1450331005, 'jpg', 0, '', ''),
(263, '图片5.jpg', 'upfiles/201512/17/fadf119e485ecbd3.jpg', 'upfiles/201512/17/thumb263.jpg', 1450331045, 'jpg', 0, '', ''),
(264, 'QQ截图20151204141324.jpg', 'upfiles/201512/17/1e58421fdb3e46ca.jpg', 'upfiles/201512/17/thumb264.jpg', 1450331101, 'jpg', 0, '', ''),
(265, '新.jpg', 'upfiles/201512/17/70bf6465d8a54d00.jpg', 'upfiles/201512/17/thumb265.jpg', 1450331101, 'jpg', 0, '', ''),
(266, '新2.jpg', 'upfiles/201512/17/2c71570690f8e0c2.jpg', 'upfiles/201512/17/thumb266.jpg', 1450331101, 'jpg', 0, '', ''),
(267, '图片1.jpg', 'upfiles/201512/17/b67c82da26b29068.jpg', 'upfiles/201512/17/thumb267.jpg', 1450332106, 'jpg', 0, '', ''),
(268, '图片2.jpg', 'upfiles/201512/17/6f3a67fe46456f72.jpg', 'upfiles/201512/17/thumb268.jpg', 1450332353, 'jpg', 0, '', ''),
(269, 'mp26219929_1438915485227_2.jpeg', 'upfiles/201512/17/a2342b71c2ee94dd.jpeg', 'upfiles/201512/17/thumb269.jpg', 1450334984, 'jpeg', 0, '', ''),
(270, 'mp26219929_1438915485227_3.jpeg', 'upfiles/201512/17/c83c4744c8b32615.jpeg', 'upfiles/201512/17/thumb270.jpg', 1450335028, 'jpeg', 0, '', ''),
(271, 'mp26219929_1438915485227_4.jpeg', 'upfiles/201512/17/7d6149f4a1012454.jpeg', 'upfiles/201512/17/thumb271.jpg', 1450335078, 'jpeg', 0, '', ''),
(272, 'mp26219929_1438915485227_5.jpeg', 'upfiles/201512/17/1a811dbe527929dd.jpeg', 'upfiles/201512/17/thumb272.jpg', 1450335111, 'jpeg', 0, '', ''),
(273, 'mp26219929_1438915485227_6.jpeg', 'upfiles/201512/17/79cb4a1687b20908.jpeg', 'upfiles/201512/17/thumb273.jpg', 1450335441, 'jpeg', 0, '', ''),
(274, 'mp26219929_1438915485227_7.jpeg', 'upfiles/201512/17/a8f6f6f4b8b930a0.jpeg', 'upfiles/201512/17/thumb274.jpg', 1450335546, 'jpeg', 0, '', ''),
(275, 'mp26219929_1438915485227_8.jpeg', 'upfiles/201512/17/6ffa65c443627d9a.jpeg', 'upfiles/201512/17/thumb275.jpg', 1450336083, 'jpeg', 0, '', ''),
(276, '企业yuanjing.png', 'upfiles/201512/17/c82703fc732832c6.png', 'upfiles/201512/17/thumb276.png', 1450337366, 'png', 0, '', ''),
(277, '图片1.jpg', 'upfiles/201512/17/951cd84b11f633e5.jpg', 'upfiles/201512/17/thumb277.jpg', 1450337587, 'jpg', 0, '', ''),
(278, '图片2.jpg', 'upfiles/201512/17/9e18b24ed7170d97.jpg', 'upfiles/201512/17/thumb278.jpg', 1450337647, 'jpg', 0, '', ''),
(279, '企业yuanjing.png', 'upfiles/201512/17/9ad53ecb0cdc3565.png', 'upfiles/201512/17/thumb279.png', 1450337724, 'png', 0, '', ''),
(280, '企业yuanjing02.png', 'upfiles/201512/17/9639a455fcf4756b.png', 'upfiles/201512/17/thumb280.png', 1450337885, 'png', 0, '', ''),
(281, '图片1.jpg', 'upfiles/201512/17/5bd6d2dfab44599a.jpg', 'upfiles/201512/17/thumb281.jpg', 1450338200, 'jpg', 0, '', ''),
(282, '图片2.jpg', 'upfiles/201512/17/b9e2744ee429ead3.jpg', 'upfiles/201512/17/thumb282.jpg', 1450338238, 'jpg', 0, '', ''),
(283, '图片5.jpg', 'upfiles/201512/17/1e41edabdac56d17.jpg', 'upfiles/201512/17/thumb283.jpg', 1450339090, 'jpg', 0, '', ''),
(284, '益达教育联系方式.png', 'upfiles/201512/17/56482175758d6061.png', 'upfiles/201512/17/thumb284.png', 1450339218, 'png', 0, '', ''),
(285, '102249_6319959342479_4fc5c6f93e157.jpg', 'upfiles/201512/17/0ed80b6eda1078ad.jpg', 'upfiles/201512/17/thumb285.jpg', 1450339614, 'jpg', 0, '', ''),
(286, '集团联系方式22.png', 'upfiles/201512/17/c1208358f152e125.png', 'upfiles/201512/17/thumb286.png', 1450339705, 'png', 0, '', ''),
(287, '企业介绍55.jpg', 'upfiles/201512/17/915c8c77f23b07ca.jpg', 'upfiles/201512/17/thumb287.jpg', 1450343559, 'jpg', 0, '', ''),
(288, '企业介绍6.jpg', 'upfiles/201512/17/701006083974471e.jpg', 'upfiles/201512/17/thumb288.jpg', 1450343666, 'jpg', 0, '', ''),
(289, 'logo2(1).png', 'upfiles/201512/17/a856bd6e4db665d2.png', 'upfiles/201512/17/thumb289.png', 1450344224, 'png', 0, '', ''),
(290, '企业介绍88.jpg', 'upfiles/201512/17/7d9c559105fbfc8e.jpg', 'upfiles/201512/17/thumb290.jpg', 1450345653, 'jpg', 0, '', ''),
(292, '图片1.jpg', 'upfiles/201512/18/7029037050bff2d1.jpg', 'upfiles/201512/18/thumb292.jpg', 1450416673, 'jpg', 0, '', ''),
(294, '学练考赛证1_05.png', 'upfiles/201512/18/aaae5491bba51b5a.png', 'upfiles/201512/18/thumb294.png', 1450424542, 'png', 0, '', ''),
(295, '学练考赛证1_10.png', 'upfiles/201512/18/de6840e0c89fcb0a.png', 'upfiles/201512/18/thumb295.png', 1450424588, 'png', 0, '', ''),
(296, '学练考赛证1_12.png', 'upfiles/201512/18/727e46f8c116a655.png', 'upfiles/201512/18/thumb296.png', 1450424623, 'png', 0, '', ''),
(297, '学练考赛证1_14.png', 'upfiles/201512/18/55740332a664d48b.png', 'upfiles/201512/18/thumb297.png', 1450424661, 'png', 0, '', ''),
(298, '学练考赛证1_16.png', 'upfiles/201512/18/3ff7298b64f88fbd.png', 'upfiles/201512/18/thumb298.png', 1450424683, 'png', 0, '', ''),
(299, '学练考赛证1_22.png', 'upfiles/201512/18/43dddce092d34ef8.png', 'upfiles/201512/18/thumb299.png', 1450424715, 'png', 0, '', ''),
(300, '学练考赛证1_23.png', 'upfiles/201512/18/f11a926b98c9af59.png', 'upfiles/201512/18/thumb300.png', 1450424746, 'png', 0, '', ''),
(301, '学练考赛证1_24.png', 'upfiles/201512/18/9a110a70f4e6ecc1.png', 'upfiles/201512/18/thumb301.png', 1450424780, 'png', 0, '', ''),
(302, '学练考赛证1_28.png', 'upfiles/201512/18/9c7835fca92684c9.png', 'upfiles/201512/18/thumb302.png', 1450424823, 'png', 0, '', ''),
(303, '学练考赛证1_30.png', 'upfiles/201512/18/bdef5b6f1ace95fb.png', 'upfiles/201512/18/thumb303.png', 1450424854, 'png', 0, '', ''),
(304, '学练考赛证1_34.png', 'upfiles/201512/18/c7d5fc5de430ab5d.png', 'upfiles/201512/18/thumb304.png', 1450424891, 'png', 0, '', ''),
(305, '学练考赛证1_36.png', 'upfiles/201512/18/0ebb820442b1d7d7.png', 'upfiles/201512/18/thumb305.png', 1450424946, 'png', 0, '', ''),
(306, '学练考赛证1_37.png', 'upfiles/201512/18/f1dc8daab51eaae8.png', 'upfiles/201512/18/thumb306.png', 1450424964, 'png', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_upfiles_gd`
--

CREATE TABLE IF NOT EXISTS `qinggan_upfiles_gd` (
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片ID，对应upfiles里的ID',
  `gdtype` varchar(100) NOT NULL COMMENT '图片类型',
  `filename` varchar(255) NOT NULL COMMENT '图片地址（生成类型的图片地址）',
  PRIMARY KEY (`pid`,`gdtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_upfiles_gd`
--

INSERT INTO `qinggan_upfiles_gd` (`pid`, `gdtype`, `filename`) VALUES
(209, 'thumb', 'upfiles/201512/17/thumb_209.jpg'),
(209, 'big', 'upfiles/201512/17/big_209.jpg'),
(207, 'big', 'upfiles/201512/17/big_207.jpg'),
(208, 'thumb', 'upfiles/201512/17/thumb_208.jpg'),
(208, 'big', 'upfiles/201512/17/big_208.jpg'),
(206, 'big', 'upfiles/201512/17/big_206.jpg'),
(207, 'thumb', 'upfiles/201512/17/thumb_207.jpg'),
(196, 'thumb', 'upfiles/201512/15/thumb_196.jpg'),
(196, 'big', 'upfiles/201512/15/big_196.jpg'),
(293, 'thumb', 'upfiles/201512/18/thumb_293.png'),
(199, 'thumb', 'upfiles/201512/17/thumb_199.jpg'),
(199, 'big', 'upfiles/201512/17/big_199.jpg'),
(200, 'thumb', 'upfiles/201512/17/thumb_200.jpg'),
(200, 'big', 'upfiles/201512/17/big_200.jpg'),
(201, 'thumb', 'upfiles/201512/17/thumb_201.jpg'),
(201, 'big', 'upfiles/201512/17/big_201.jpg'),
(202, 'thumb', 'upfiles/201512/17/thumb_202.jpg'),
(202, 'big', 'upfiles/201512/17/big_202.jpg'),
(203, 'thumb', 'upfiles/201512/17/thumb_203.jpg'),
(203, 'big', 'upfiles/201512/17/big_203.jpg'),
(204, 'thumb', 'upfiles/201512/17/thumb_204.jpg'),
(204, 'big', 'upfiles/201512/17/big_204.jpg'),
(206, 'thumb', 'upfiles/201512/17/thumb_206.jpg'),
(210, 'thumb', 'upfiles/201512/17/thumb_210.jpg'),
(210, 'big', 'upfiles/201512/17/big_210.jpg'),
(211, 'thumb', 'upfiles/201512/17/thumb_211.jpg'),
(211, 'big', 'upfiles/201512/17/big_211.jpg'),
(212, 'thumb', 'upfiles/201512/17/thumb_212.jpg'),
(212, 'big', 'upfiles/201512/17/big_212.jpg'),
(213, 'thumb', 'upfiles/201512/17/thumb_213.jpg'),
(213, 'big', 'upfiles/201512/17/big_213.jpg'),
(214, 'thumb', 'upfiles/201512/17/thumb_214.jpg'),
(214, 'big', 'upfiles/201512/17/big_214.jpg'),
(215, 'thumb', 'upfiles/201512/17/thumb_215.jpg'),
(215, 'big', 'upfiles/201512/17/big_215.jpg'),
(216, 'thumb', 'upfiles/201512/17/thumb_216.jpg'),
(216, 'big', 'upfiles/201512/17/big_216.jpg'),
(217, 'thumb', 'upfiles/201512/17/thumb_217.jpg'),
(217, 'big', 'upfiles/201512/17/big_217.jpg'),
(218, 'thumb', 'upfiles/201512/17/thumb_218.png'),
(218, 'big', 'upfiles/201512/17/big_218.png'),
(219, 'thumb', 'upfiles/201512/17/thumb_219.jpg'),
(219, 'big', 'upfiles/201512/17/big_219.jpg'),
(220, 'thumb', 'upfiles/201512/17/thumb_220.png'),
(220, 'big', 'upfiles/201512/17/big_220.png'),
(221, 'thumb', 'upfiles/201512/17/thumb_221.png'),
(221, 'big', 'upfiles/201512/17/big_221.png'),
(222, 'thumb', 'upfiles/201512/17/thumb_222.jpg'),
(222, 'big', 'upfiles/201512/17/big_222.jpg'),
(223, 'thumb', 'upfiles/201512/17/thumb_223.jpg'),
(223, 'big', 'upfiles/201512/17/big_223.jpg'),
(224, 'thumb', 'upfiles/201512/17/thumb_224.jpg'),
(224, 'big', 'upfiles/201512/17/big_224.jpg'),
(225, 'thumb', 'upfiles/201512/17/thumb_225.png'),
(225, 'big', 'upfiles/201512/17/big_225.png'),
(226, 'thumb', 'upfiles/201512/17/thumb_226.png'),
(226, 'big', 'upfiles/201512/17/big_226.png'),
(227, 'thumb', 'upfiles/201512/17/thumb_227.png'),
(227, 'big', 'upfiles/201512/17/big_227.png'),
(228, 'thumb', 'upfiles/201512/17/thumb_228.jpg'),
(228, 'big', 'upfiles/201512/17/big_228.jpg'),
(229, 'thumb', 'upfiles/201512/17/thumb_229.png'),
(229, 'big', 'upfiles/201512/17/big_229.png'),
(230, 'thumb', 'upfiles/201512/17/thumb_230.png'),
(230, 'big', 'upfiles/201512/17/big_230.png'),
(231, 'thumb', 'upfiles/201512/17/thumb_231.png'),
(231, 'big', 'upfiles/201512/17/big_231.png'),
(232, 'thumb', 'upfiles/201512/17/thumb_232.png'),
(232, 'big', 'upfiles/201512/17/big_232.png'),
(233, 'thumb', 'upfiles/201512/17/thumb_233.png'),
(233, 'big', 'upfiles/201512/17/big_233.png'),
(234, 'thumb', 'upfiles/201512/17/thumb_234.png'),
(234, 'big', 'upfiles/201512/17/big_234.png'),
(235, 'thumb', 'upfiles/201512/17/thumb_235.png'),
(235, 'big', 'upfiles/201512/17/big_235.png'),
(236, 'thumb', 'upfiles/201512/17/thumb_236.jpg'),
(236, 'big', 'upfiles/201512/17/big_236.jpg'),
(237, 'thumb', 'upfiles/201512/17/thumb_237.jpg'),
(237, 'big', 'upfiles/201512/17/big_237.jpg'),
(238, 'thumb', 'upfiles/201512/17/thumb_238.jpg'),
(238, 'big', 'upfiles/201512/17/big_238.jpg'),
(239, 'thumb', 'upfiles/201512/17/thumb_239.png'),
(239, 'big', 'upfiles/201512/17/big_239.png'),
(240, 'thumb', 'upfiles/201512/17/thumb_240.png'),
(240, 'big', 'upfiles/201512/17/big_240.png'),
(241, 'thumb', 'upfiles/201512/17/thumb_241.png'),
(241, 'big', 'upfiles/201512/17/big_241.png'),
(242, 'thumb', 'upfiles/201512/17/thumb_242.jpg'),
(242, 'big', 'upfiles/201512/17/big_242.jpg'),
(243, 'thumb', 'upfiles/201512/17/thumb_243.jpg'),
(243, 'big', 'upfiles/201512/17/big_243.jpg'),
(244, 'thumb', 'upfiles/201512/17/thumb_244.png'),
(244, 'big', 'upfiles/201512/17/big_244.png'),
(245, 'thumb', 'upfiles/201512/17/thumb_245.jpg'),
(245, 'big', 'upfiles/201512/17/big_245.jpg'),
(246, 'thumb', 'upfiles/201512/17/thumb_246.jpg'),
(246, 'big', 'upfiles/201512/17/big_246.jpg'),
(247, 'thumb', 'upfiles/201512/17/thumb_247.jpg'),
(247, 'big', 'upfiles/201512/17/big_247.jpg'),
(248, 'thumb', 'upfiles/201512/17/thumb_248.png'),
(248, 'big', 'upfiles/201512/17/big_248.png'),
(249, 'thumb', 'upfiles/201512/17/thumb_249.jpg'),
(249, 'big', 'upfiles/201512/17/big_249.jpg'),
(250, 'thumb', 'upfiles/201512/17/thumb_250.png'),
(250, 'big', 'upfiles/201512/17/big_250.png'),
(251, 'thumb', 'upfiles/201512/17/thumb_251.png'),
(251, 'big', 'upfiles/201512/17/big_251.png'),
(252, 'thumb', 'upfiles/201512/17/thumb_252.png'),
(252, 'big', 'upfiles/201512/17/big_252.png'),
(253, 'thumb', 'upfiles/201512/17/thumb_253.png'),
(253, 'big', 'upfiles/201512/17/big_253.png'),
(254, 'thumb', 'upfiles/201512/17/thumb_254.jpg'),
(254, 'big', 'upfiles/201512/17/big_254.jpg'),
(255, 'thumb', 'upfiles/201512/17/thumb_255.jpg'),
(255, 'big', 'upfiles/201512/17/big_255.jpg'),
(256, 'thumb', 'upfiles/201512/17/thumb_256.png'),
(256, 'big', 'upfiles/201512/17/big_256.png'),
(257, 'thumb', 'upfiles/201512/17/thumb_257.jpg'),
(257, 'big', 'upfiles/201512/17/big_257.jpg'),
(258, 'thumb', 'upfiles/201512/17/thumb_258.jpg'),
(258, 'big', 'upfiles/201512/17/big_258.jpg'),
(259, 'thumb', 'upfiles/201512/17/thumb_259.jpg'),
(259, 'big', 'upfiles/201512/17/big_259.jpg'),
(260, 'thumb', 'upfiles/201512/17/thumb_260.jpg'),
(260, 'big', 'upfiles/201512/17/big_260.jpg'),
(261, 'thumb', 'upfiles/201512/17/thumb_261.jpg'),
(261, 'big', 'upfiles/201512/17/big_261.jpg'),
(262, 'thumb', 'upfiles/201512/17/thumb_262.jpg'),
(262, 'big', 'upfiles/201512/17/big_262.jpg'),
(263, 'thumb', 'upfiles/201512/17/thumb_263.jpg'),
(263, 'big', 'upfiles/201512/17/big_263.jpg'),
(264, 'thumb', 'upfiles/201512/17/thumb_264.jpg'),
(264, 'big', 'upfiles/201512/17/big_264.jpg'),
(265, 'thumb', 'upfiles/201512/17/thumb_265.jpg'),
(265, 'big', 'upfiles/201512/17/big_265.jpg'),
(266, 'thumb', 'upfiles/201512/17/thumb_266.jpg'),
(266, 'big', 'upfiles/201512/17/big_266.jpg'),
(267, 'thumb', 'upfiles/201512/17/thumb_267.jpg'),
(267, 'big', 'upfiles/201512/17/big_267.jpg'),
(268, 'thumb', 'upfiles/201512/17/thumb_268.jpg'),
(268, 'big', 'upfiles/201512/17/big_268.jpg'),
(269, 'thumb', 'upfiles/201512/17/thumb_269.jpg'),
(269, 'big', 'upfiles/201512/17/big_269.jpg'),
(270, 'thumb', 'upfiles/201512/17/thumb_270.jpg'),
(270, 'big', 'upfiles/201512/17/big_270.jpg'),
(271, 'thumb', 'upfiles/201512/17/thumb_271.jpg'),
(271, 'big', 'upfiles/201512/17/big_271.jpg'),
(272, 'thumb', 'upfiles/201512/17/thumb_272.jpg'),
(272, 'big', 'upfiles/201512/17/big_272.jpg'),
(273, 'thumb', 'upfiles/201512/17/thumb_273.jpg'),
(273, 'big', 'upfiles/201512/17/big_273.jpg'),
(274, 'thumb', 'upfiles/201512/17/thumb_274.jpg'),
(274, 'big', 'upfiles/201512/17/big_274.jpg'),
(275, 'thumb', 'upfiles/201512/17/thumb_275.jpg'),
(275, 'big', 'upfiles/201512/17/big_275.jpg'),
(276, 'thumb', 'upfiles/201512/17/thumb_276.png'),
(276, 'big', 'upfiles/201512/17/big_276.png'),
(277, 'thumb', 'upfiles/201512/17/thumb_277.jpg'),
(277, 'big', 'upfiles/201512/17/big_277.jpg'),
(278, 'thumb', 'upfiles/201512/17/thumb_278.jpg'),
(278, 'big', 'upfiles/201512/17/big_278.jpg'),
(279, 'thumb', 'upfiles/201512/17/thumb_279.png'),
(279, 'big', 'upfiles/201512/17/big_279.png'),
(280, 'thumb', 'upfiles/201512/17/thumb_280.png'),
(280, 'big', 'upfiles/201512/17/big_280.png'),
(281, 'thumb', 'upfiles/201512/17/thumb_281.jpg'),
(281, 'big', 'upfiles/201512/17/big_281.jpg'),
(282, 'thumb', 'upfiles/201512/17/thumb_282.jpg'),
(282, 'big', 'upfiles/201512/17/big_282.jpg'),
(283, 'thumb', 'upfiles/201512/17/thumb_283.jpg'),
(283, 'big', 'upfiles/201512/17/big_283.jpg'),
(284, 'thumb', 'upfiles/201512/17/thumb_284.png'),
(284, 'big', 'upfiles/201512/17/big_284.png'),
(285, 'thumb', 'upfiles/201512/17/thumb_285.jpg'),
(285, 'big', 'upfiles/201512/17/big_285.jpg'),
(286, 'thumb', 'upfiles/201512/17/thumb_286.png'),
(286, 'big', 'upfiles/201512/17/big_286.png'),
(287, 'thumb', 'upfiles/201512/17/thumb_287.jpg'),
(287, 'big', 'upfiles/201512/17/big_287.jpg'),
(288, 'thumb', 'upfiles/201512/17/thumb_288.jpg'),
(288, 'big', 'upfiles/201512/17/big_288.jpg'),
(289, 'thumb', 'upfiles/201512/17/thumb_289.png'),
(289, 'big', 'upfiles/201512/17/big_289.png'),
(290, 'thumb', 'upfiles/201512/17/thumb_290.jpg'),
(290, 'big', 'upfiles/201512/17/big_290.jpg'),
(292, 'thumb', 'upfiles/201512/18/thumb_292.jpg'),
(292, 'big', 'upfiles/201512/18/big_292.jpg'),
(293, 'big', 'upfiles/201512/18/big_293.png'),
(294, 'thumb', 'upfiles/201512/18/thumb_294.png'),
(294, 'big', 'upfiles/201512/18/big_294.png'),
(295, 'thumb', 'upfiles/201512/18/thumb_295.png'),
(295, 'big', 'upfiles/201512/18/big_295.png'),
(296, 'thumb', 'upfiles/201512/18/thumb_296.png'),
(296, 'big', 'upfiles/201512/18/big_296.png'),
(297, 'thumb', 'upfiles/201512/18/thumb_297.png'),
(297, 'big', 'upfiles/201512/18/big_297.png'),
(298, 'thumb', 'upfiles/201512/18/thumb_298.png'),
(298, 'big', 'upfiles/201512/18/big_298.png'),
(299, 'thumb', 'upfiles/201512/18/thumb_299.png'),
(299, 'big', 'upfiles/201512/18/big_299.png'),
(300, 'thumb', 'upfiles/201512/18/thumb_300.png'),
(300, 'big', 'upfiles/201512/18/big_300.png'),
(301, 'thumb', 'upfiles/201512/18/thumb_301.png'),
(301, 'big', 'upfiles/201512/18/big_301.png'),
(302, 'thumb', 'upfiles/201512/18/thumb_302.png'),
(302, 'big', 'upfiles/201512/18/big_302.png'),
(303, 'thumb', 'upfiles/201512/18/thumb_303.png'),
(303, 'big', 'upfiles/201512/18/big_303.png'),
(304, 'thumb', 'upfiles/201512/18/thumb_304.png'),
(304, 'big', 'upfiles/201512/18/big_304.png'),
(305, 'thumb', 'upfiles/201512/18/thumb_305.png'),
(305, 'big', 'upfiles/201512/18/big_305.png'),
(306, 'thumb', 'upfiles/201512/18/thumb_306.png'),
(306, 'big', 'upfiles/201512/18/big_306.png');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_user`
--

CREATE TABLE IF NOT EXISTS `qinggan_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `groupid` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '会员组ID',
  `name` varchar(100) NOT NULL COMMENT '会员名称',
  `pass` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态1已审核0未审核2锁定',
  `codetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码生成时间',
  `chkcode` varchar(50) NOT NULL COMMENT '随机验证码',
  `thumb_id` int(10) unsigned NOT NULL COMMENT '个性头像ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `qinggan_user`
--

INSERT INTO `qinggan_user` (`id`, `groupid`, `name`, `pass`, `email`, `regdate`, `status`, `codetime`, `chkcode`, `thumb_id`) VALUES
(6, 2, 'qinggan', '2db85f9cb0040b55a65ffe77bc25e23b', 'admin@phpok.com', 1300071720, 1, 0, '', 0),
(8, 2, 'vip', '2db85f9cb0040b55a65ffe77bc25e23b', 'vip@ecshop.com', 0, 1, 0, '', 0),
(11, 2, 'suxiangkun', '2db85f9cb0040b55a65ffe77bc25e23b', 'suxiangkun@126.com', 1306565190, 1, 0, '', 0),
(13, 2, 'seika', '2db85f9cb0040b55a65ffe77bc25e23b', 'suxiangkun@gmail.com', 1306586220, 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_user_ext`
--

CREATE TABLE IF NOT EXISTS `qinggan_user_ext` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `field` varchar(30) NOT NULL COMMENT '扩展字段变量名',
  `val` text NOT NULL COMMENT '扩展字段值',
  PRIMARY KEY (`id`,`field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qinggan_user_ext`
--

INSERT INTO `qinggan_user_ext` (`id`, `field`, `val`) VALUES
(6, 'cityfrom', 'szhen'),
(6, 'address', '广东深圳坂田四季花城'),
(6, 'fullname', '苏相锟'),
(6, 'tel', '086-0755-88888888'),
(6, 'mobile', '15818533971'),
(6, 'zipcode', '518000'),
(13, 'fullname', 'seika'),
(13, 'tel', '15818533971'),
(13, 'mobile', '0755-12345678'),
(13, 'address', 'dfafsdafsda'),
(13, 'zipcode', '518000');

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_user_fields`
--

CREATE TABLE IF NOT EXISTS `qinggan_user_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '会员组ID',
  `identifier` varchar(32) NOT NULL COMMENT '标识符',
  `title` varchar(100) NOT NULL COMMENT '主题',
  `sub_left` varchar(60) NOT NULL COMMENT '左侧主题',
  `sub_note` varchar(120) NOT NULL COMMENT '右侧备注信息',
  `input` varchar(50) NOT NULL DEFAULT 'text' COMMENT '表单类型',
  `width` varchar(20) NOT NULL COMMENT '宽度',
  `height` varchar(20) NOT NULL COMMENT '高度',
  `default_val` varchar(50) NOT NULL COMMENT '默认值',
  `list_val` varchar(255) NOT NULL COMMENT '值列表',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '联动组ID',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '自定义排序，值越小越往前靠',
  `if_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1必填0非必填',
  `error_note` varchar(255) NOT NULL COMMENT '错误时的提示',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1启用0禁用',
  PRIMARY KEY (`id`),
  KEY `module_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `qinggan_user_fields`
--

INSERT INTO `qinggan_user_fields` (`id`, `group_id`, `identifier`, `title`, `sub_left`, `sub_note`, `input`, `width`, `height`, `default_val`, `list_val`, `link_id`, `taxis`, `if_must`, `error_note`, `status`) VALUES
(2, 4, 'test', '测试一下', '', '2222', 'text', '300px', '', '', '', 0, 255, 0, '', 1),
(6, 2, 'fullname', '姓名', '', '', 'text', '200px', '', '', '', 0, 10, 0, '', 1),
(5, 2, 'address', '地址', '', '请填写联系地址，带上省市', 'text', '300px', '', '', '', 0, 80, 0, '', 1),
(7, 2, 'tel', '电话', '', '请填写联系电话，格式：086-0755-88888888', 'text', '200px', '', '', '', 0, 20, 0, '', 1),
(8, 2, 'mobile', '手机', '', '请填写您的手机，如：13XXXXXXXXX', 'text', '200px', '', '', '', 0, 30, 0, '', 1),
(9, 2, 'zipcode', '邮编', '', '请填写六位邮编，如：518000', 'text', '80px', '', '', '', 0, 90, 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qinggan_user_group`
--

CREATE TABLE IF NOT EXISTS `qinggan_user_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员组ID',
  `group_type` enum('user','guest') NOT NULL DEFAULT 'user' COMMENT '用户组类型',
  `title` varchar(100) NOT NULL COMMENT '组名称',
  `popedom_post` text NOT NULL COMMENT '发布权限',
  `popedom_reply` text NOT NULL COMMENT '回复权限',
  `popedom_read` text NOT NULL COMMENT '阅读权限，默认为all',
  `post_cert` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发布0需要验证1免验证',
  `reply_cert` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回复0需要验证1免验证',
  `ifsystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统组0否1是',
  `ifdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员注册后默认选择的组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `qinggan_user_group`
--

INSERT INTO `qinggan_user_group` (`id`, `group_type`, `title`, `popedom_post`, `popedom_reply`, `popedom_read`, `post_cert`, `reply_cert`, `ifsystem`, `ifdefault`) VALUES
(1, 'guest', '游客', 'm:33,m:23,m:35,m:26', '', 'all', 0, 0, 1, 1),
(2, 'user', '会员', 'm:34,m:35,m:26', 'm:26,c:3', 'all', 1, 0, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
