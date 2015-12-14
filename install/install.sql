-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 12 月 14 日 08:55
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `qinggan_cate`
--

INSERT INTO `qinggan_cate` (`id`, `identifier`, `langid`, `cate_name`, `parentid`, `module_id`, `tpl_index`, `tpl_list`, `tpl_file`, `if_index`, `taxis`, `status`, `if_hidden`, `keywords`, `description`, `ifspec`, `note`, `psize`, `inpic`, `linkurl`, `target`, `ordertype`, `subcate`, `ico`, `small_pic`, `medium_pic`, `big_pic`, `fields`) VALUES
(1, 'news', 'zh', '企业新闻', 0, 7, '', '', '', 0, 10, 1, 0, '企业新闻111', '企业新闻111', 0, '', 12, '', '', 0, 'post_date:desc', '', 'upfiles/201009/01/f2338b8c2f4bc013.jpg', '', '', '', ''),
(44, 'guanzhu', 'zh', '媒体关注', 0, 7, '', '', '', 0, 10, 1, 0, '媒体关注', '媒体关注', 0, '', 12, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(54, 'culture', 'zh', '企业文化', 0, 20, '', '', '', 0, 20, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(55, 'duty', 'zh', '企业责任', 0, 20, '', '', '', 0, 30, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(59, 'learn', 'zh', '学', 57, 52, '', '', '', 0, 10, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(60, 'train', 'zh', '练', 57, 52, '', '', '', 0, 20, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(61, 'check', 'zh', '考', 57, 52, '', '', '', 0, 30, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(62, 'race', 'zh', '赛', 57, 52, '', '', '', 0, 40, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(63, 'proof', 'zh', '证', 57, 52, '', '', '', 0, 50, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(53, 'about_us', 'zh', '关于益达', 0, 20, '', '', '', 0, 10, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(56, 'contact', 'zh', '联系益达', 0, 20, '', '', '', 0, 40, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(57, 'software', 'zh', '教育软件', 0, 52, '', '', '', 0, 10, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', ''),
(58, 'serve', 'zh', '教育服务', 0, 52, '', '', '', 0, 20, 1, 0, '', '', 0, '', 30, '', '', 0, 'post_date:desc', '', '', '', '', '', '');

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
('zh', '简体中文', 1, '中文语言包', 10, 1, 1, '', '', '', ''),
('en', '英文', 0, '', 255, 0, 0, '', '', '', ''),
('tc', '繁体', 1, '', 255, 0, 0, '', '', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=358 ;

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
(357, 'tc', 'www', 'alipay_not_rs', '无法取得相关付款方案信息，请联系管理员');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=387 ;

--
-- 转存表中的数据 `qinggan_list`
--

INSERT INTO `qinggan_list` (`id`, `module_id`, `cate_id`, `title`, `subtitle`, `style`, `status`, `hidden`, `link_url`, `target`, `author`, `author_type`, `keywords`, `description`, `note`, `identifier`, `hits`, `good_hits`, `bad_hits`, `post_date`, `modify_date`, `thumb_id`, `istop`, `isvouch`, `isbest`, `langid`, `points`, `ip`, `replydate`, `taxis`, `htmltype`, `tplfile`, `star`, `price`, `price_currency`, `weight`, `qty`, `is_qty`, `qty_unit`) VALUES
(79, 34, 0, '测试招聘信息', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '简单说明一下！', '', 6, 0, 0, 1280489133, 0, 0, 0, 0, 0, 'zh', 0, '127.0.0.1', 0, 0, 'cateid', '', 0, 0, 'CNY', 0, 0, 0, ''),
(384, 20, 56, '投诉建议', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', 'ts', 2, 0, 0, 1450057621, 0, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(362, 7, 44, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 0, 0, 0, 1450054763, 0, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(363, 7, 1, '爱上对方的撒伐', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450054788, 1450063452, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(376, 20, 54, '企业宗旨', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'zz', 0, 0, 0, 1450057336, 1450057372, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 30, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(377, 20, 54, '企业价值观', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'zzg', 0, 0, 0, 1450057390, 1450057414, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 29, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(378, 20, 54, '企业愿景', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'yj', 0, 0, 0, 1450057419, 1450057447, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 28, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(379, 20, 54, '企业精神', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'js', 0, 0, 0, 1450057451, 1450057479, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 27, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(380, 20, 55, '公益理念', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'ln', 0, 0, 0, 1450057490, 1450057516, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 20, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(381, 20, 55, '社会赞誉', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'zy', 0, 0, 0, 1450057521, 1450057545, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 19, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(382, 20, 56, '企业联系方式', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'lx', 3, 0, 0, 1450057553, 1450057583, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 10, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(383, 20, 56, '企业下属企业', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'xs', 1, 0, 0, 1450057588, 1450061022, 0, 1, 0, 0, 'zh', 0, '0.0.0.0', 0, 9, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(355, 20, 53, '企业概况', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'gk', 25, 0, 0, 1449821310, 1450057181, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 40, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(356, 20, 53, '企业战略', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'zl', 1, 0, 0, 1449821373, 1450057187, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 39, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(357, 20, 53, '核心优势', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'hx', 2, 0, 0, 1449821808, 1450057193, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 38, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(358, 20, 53, '发展历程', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', 'lc', 1, 0, 0, 1449821861, 1450057203, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 37, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(359, 20, 53, '公司团队', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', 'td', 0, 0, 0, 1449821907, 1450057209, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 36, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(360, 20, 53, '企业品牌', '', '', 0, 0, '', 0, 'admin', 'admin', '', '', '', 'pp', 0, 0, 0, 1449821945, 1450057214, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 35, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(385, 52, 57, '123', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 3, 0, 0, 1450057982, 0, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, ''),
(386, 52, 58, '321', '', '', 1, 0, '', 0, 'admin', 'admin', '', '', '', '', 1, 0, 0, 1450058001, 0, 0, 0, 0, 0, 'zh', 0, '0.0.0.0', 0, 0, 'cateid', '', 0, 0, '', 0, 0, 0, '');

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
(355, 'content', '载入内容、、、'),
(356, 'content', '载入……'),
(357, 'content', '载入……'),
(358, 'content', '载入……'),
(359, 'content', '载入……'),
(360, 'content', '载入……'),
(27, 'content', '<div>联系我们</div><div>&nbsp;</div>'),
(16, 'content', '<p>简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实用，初学者可轻易上手简单实</p><p>[:page:]</p><p>再来测试一下分页！囧啊~</p>'),
(362, 'content', '123'),
(363, 'content', '213'),
(376, 'content', '载入……'),
(377, 'content', '载入……'),
(378, 'content', '载入……'),
(379, 'content', '载入……'),
(380, 'content', '载入……'),
(381, 'content', '载入……'),
(382, 'content', '载入……'),
(383, 'content', '载入……'),
(384, 'content', '载入……'),
(385, 'content', '123'),
(386, 'content', '321');

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
(386, 58);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- 转存表中的数据 `qinggan_menu`
--

INSERT INTO `qinggan_menu` (`id`, `parentid`, `langid`, `title`, `link`, `link_html`, `link_rewrite`, `target`, `note`, `taxis`, `highlight`, `highlight_id`, `picurl`, `picover`, `status`) VALUES
(1, 0, 'zh', '首页', '{index_php}?{control_trigger}=msg&ts=gk', '{site_html}onepage/about_us/gk.html', 'gk.html', 0, '', 10, 'index', '1,3,2', '', '', 1),
(48, 35, 'zh', '公司团队', '{index_php}?{control_trigger}=msg&ts=td', '', '', 0, '', 26, '', '', '', '', 0),
(47, 35, 'zh', '发展历程', '{index_php}?{control_trigger}=msg&ts=lc', '', '', 0, '', 25, '', '', '', '', 1),
(45, 35, 'zh', '企业战略', '{index_php}?{control_trigger}=msg&ts=zl', '', '', 0, '', 23, '', '', '', '', 1),
(46, 35, 'zh', '核心优势', '{index_php}?{control_trigger}=msg&ts=hx', '', '', 0, '', 24, '', '', '', '', 1),
(35, 0, 'zh', '关于益达', '###', '', '', 0, '', 20, '', '', '', '', 1),
(36, 0, 'zh', '新闻中心', '{index_php}?{control_trigger}=list&cs=news', '{site_html}article/news/index.html', 'cs-news.html', 0, '', 30, '', '', '', '', 1),
(37, 0, 'zh', '企业业务', '###', '', '', 0, '', 40, '', '', '', '', 1),
(38, 0, 'zh', '企业文化', '###', '', '', 0, '', 50, '', '', '', '', 1),
(39, 0, 'zh', '联系益达', '###', '', '', 0, '', 60, '', '', '', '', 1),
(71, 0, 'zh', '增加模块1', 'index.php', '', '', 0, '', 70, '', '', '', '', 0),
(72, 0, 'zh', '增加模块2', 'index.php', '', '', 0, '', 80, '', '', '', '', 0),
(41, 0, 'zh', '社会责任', '###', '', '', 0, '', 55, '', '', '', '', 1),
(42, 35, 'zh', '主页面', '###', '', '', 0, '', 21, '', '', '', '', 1),
(44, 35, 'zh', '企业概况', '{index_php}?{control_trigger}=msg&ts=gk', '', '', 0, '', 22, '', '', '', '', 1),
(50, 36, 'zh', '企业新闻', '{index_php}?{control_trigger}=list&ms=article&cs=news', '', '', 0, '', 101, '', '', '', '', 1),
(51, 36, 'zh', '媒体关注', '{index_php}?{control_trigger}=list&cs=serve', '{site_html}pro/serve/index.html', 'cs-serve.html', 0, '', 102, '', '', '', '', 1),
(70, 39, 'zh', '投诉建议', '{index_php}?{control_trigger}=msg&ts=ts', '{site_html}onepage/contact/ts.html', 'ts.html', 0, '', 122, '', '', '', '', 0),
(69, 39, 'zh', '企业下属企业', '{index_php}?{control_trigger}=msg&ts=xs', '{site_html}onepage/contact/xs.html', 'xs.html', 0, '', 121, '', '', '', '', 1),
(68, 39, 'zh', '企业联系方式', '{index_php}?{control_trigger}=msg&ts=lx', '{site_html}onepage/contact/lx.html', 'lx.html', 0, '', 120, '', '', '', '', 1),
(67, 37, 'zh', '教育服务', '{index_php}?{control_trigger}=list&cs=serve', '{site_html}pro/serve/index.html', 'cs-serve.html', 0, '', 111, '', '', '', '', 1),
(64, 37, 'zh', '教育软件', '{index_php}?{control_trigger}=list&cs=software', '{site_html}pro/software/index.html', 'cs-software.html', 0, '', 110, '', '', '', '', 1),
(66, 35, 'zh', '企业品牌', '{index_php}?{control_trigger}=msg&ts=pp', '', '', 0, '', 27, '', '', '', '', 0);

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
(20, 3, 'zh', 'onepage', '单页管理', '如管理公司简介，联系我们等', 'list', 1, 30, 0, 1, 0, 1, 0, '7,3,4,5,6', 0, 0, 0, 0, '', '', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 0, 0, 1, '', 1, 1, 0),
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
(52, 3, 'zh', 'pro', '企业业务', '产品布局单页信息', 'list', 1, 30, 0, 1, 0, 0, 0, '7,3,4,5,6', 1, 0, 0, 0, '', '80px*80px', 0, 0, 0, 30, 0, '', '', '', '', 'list', '', '', '', 0, 1, 0, 0, 1, 'hits', 0, 1, 0),
(54, 3, 'zh', 'ad', '首页广告焦点图', '放在首页的轮播图', 'list', 1, 30, 0, 0, 0, 0, 0, '7,3,4,5,6', 1, 1, 0, 1, '', '', 0, 0, 0, 255, 0, '', '', '', '', 'pic', '', '', '', 0, 0, 0, 0, 0, 'hits', 0, 0, 0);

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
(3, 7, 'content', '内容', 1, 0, '内容信息', '', 'edit', '680px', '300px', '', '', 0, 255, 1, 1, '内容不允许为空', 1, 0, 'c', 0, 0, 0),
(9, 10, 'content', '产品描述', 0, 0, '产品描述', '', 'edit', '680', '330', '', '', 0, 255, 0, 1, '请填写内容描述信息', 1, 0, 'c', 0, 0, 0),
(26, 9, 'content', '内容', 0, 0, '', '', 'edit', '680px', '300', '', '', 0, 255, 0, 1, '请填写描述', 1, 0, 'c', 0, 0, 0),
(75, 20, 'content', '内容', 0, 0, '', '', 'edit', '680px', '260px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 0, 0),
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
(83, 52, 'content', '产品内容', 0, 0, '', '', 'edit', '600px', '250px', '', '', 0, 255, 0, 1, '', 1, 0, 'c', 0, 1, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `qinggan_module_link`
--

INSERT INTO `qinggan_module_link` (`id`, `langid`, `title`, `ico`, `linkurl`, `status`, `taxis`) VALUES
(25, 'zh', '导航管理', 'list.gif', '{admin}?{c}=menu&module_id=27', 1, 200),
(29, 'zh', '企业业务', 'list.gif', 'admin.php?c=list&module_id=52&', 1, 30),
(26, 'zh', '分类管理', 'list.gif', '{admin}?{c}=cate&module_id=11', 1, 250),
(31, 'zh', '首页广告焦点图', 'list.gif', 'admin.php?c=list&module_id=54&', 1, 10),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `qinggan_phpok`
--

INSERT INTO `qinggan_phpok` (`id`, `title`, `note`, `vartext`, `identifier`, `langid`, `maxcount`, `intype`, `typetext`, `mid`, `cid`, `orderby`, `status`, `inpic`, `pic_required`, `linkurl`, `attr`, `datatype`, `extsign`) VALUES
(14, '企业新闻', '放在首页的新闻中心', '', 'news', 'zh', 10, 'sign', '', 7, 1, 'post_desc', 1, '', 0, '', '', 'list', ''),
(30, '广告焦点图', '放在首页的3张轮播图', '', 'ad', 'zh', 3, 'sign', '', 54, 0, 'post_desc', 1, '', 1, '', '', 'list', ''),
(23, '页脚版权', '放在任意页的页脚上', '', 'copyright', 'zh', 1, 'html', '<div align="center">益达(广州)科技有限公司    版权所有    京ICP备14029572号</div>', 0, 0, 'post_desc', 1, '', 0, '', '', 'list', ''),
(31, '首页企业新闻', '', '', 'index_news', 'zh', 5, 'sign', '', 7, 1, 'post_desc', 1, '', 0, '', '', 'list', ''),
(32, '首页下属公司', '', '', 'index_company', 'zh', 1, 'sign', '', 20, 56, 'post_desc', 1, '', 0, '', 'istop', 'list', '');

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
('fb83395d54c5b87f6951072ea146f8e1', 'sys_lang_id|s:2:"zh";currency_default|a:8:{s:4:"code";s:3:"CNY";s:3:"val";s:10:"1.00000000";s:9:"ifdefault";s:1:"1";s:5:"taxis";s:2:"10";s:5:"title";s:9:"人民币";s:11:"symbol_left";s:6:"RMB￥";s:12:"symbol_right";s:0:"";s:6:"status";s:1:"1";}admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"b38f7cc365e2147211be7cb46257b150";', 1315984050),
('fa5fed4cfbd956d5ba049b35ef4bb26b', 'sys_lang_id|s:2:"zh";currency_default|a:8:{s:4:"code";s:3:"CNY";s:3:"val";s:10:"1.00000000";s:9:"ifdefault";s:1:"1";s:5:"taxis";s:2:"10";s:5:"title";s:9:"人民币";s:11:"symbol_left";s:6:"RMB￥";s:12:"symbol_right";s:0:"";s:6:"status";s:1:"1";}phpok_login_chk|s:32:"6a0724f1d3e80fd5f761cacb7efe8593";', 1315964506),
('43efad9909f92a9579b9c3fbe7979045', 'sys_lang_id|s:2:"zh";currency_default|a:8:{s:4:"code";s:3:"CNY";s:3:"val";s:10:"1.00000000";s:9:"ifdefault";s:1:"1";s:5:"taxis";s:2:"10";s:5:"title";s:9:"人民币";s:11:"symbol_left";s:6:"RMB￥";s:12:"symbol_right";s:0:"";s:6:"status";s:1:"1";}user_id|s:1:"6";user_name|s:7:"qinggan";group_id|s:1:"2";user_rs|a:17:{s:2:"id";s:1:"6";s:7:"groupid";s:1:"2";s:4:"name";s:7:"qinggan";s:4:"pass";s:32:"2db85f9cb0040b55a65ffe77bc25e23b";s:5:"email";s:15:"admin@phpok.com";s:7:"regdate";s:10:"1300071720";s:6:"status";s:1:"1";s:8:"codetime";s:1:"0";s:7:"chkcode";s:0:"";s:8:"thumb_id";s:1:"0";s:7:"picture";N;s:7:"address";s:30:"广东深圳坂田四季花城";s:8:"cityfrom";s:5:"szhen";s:8:"fullname";s:9:"苏相锟";s:6:"mobile";s:11:"15818533971";s:3:"tel";s:17:"086-0755-88888888";s:7:"zipcode";s:6:"518000";}web_md5|s:32:"fd03ee7ca3ef2db157f62b90e3b47cf0";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"b38f7cc365e2147211be7cb46257b150";', 1315984275),
('up154gfkl4s65t32a6tngieuf2', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1448516862),
('b7f15284fdd963b6bd8fbe20260468ab', 'sys_lang_id|s:2:"zh";currency_default|a:8:{s:4:"code";s:3:"CNY";s:3:"val";s:10:"1.00000000";s:9:"ifdefault";s:1:"1";s:5:"taxis";s:2:"10";s:5:"title";s:9:"人民币";s:11:"symbol_left";s:6:"RMB￥";s:12:"symbol_right";s:0:"";s:6:"status";s:1:"1";}', 1315964131),
('cjpc8k572jm0kkogh2ck3q0r14', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1448447439),
('ibq34e27c6bft0ou8bs5h7uqp4', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";currency_default|a:8:{s:4:"code";s:3:"CNY";s:3:"val";s:10:"1.00000000";s:9:"ifdefault";s:1:"1";s:5:"taxis";s:2:"10";s:5:"title";s:9:"人民币";s:11:"symbol_left";s:6:"RMB￥";s:12:"symbol_right";s:0:"";s:6:"status";s:1:"1";}', 1449743130),
('qe70hicfueq0n7spaeq6ccg3b4', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1449822727),
('df1bntlo9fdmghhnd7j871sta6', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450060145),
('74gj700i8b4s56fpk1lggu5po7', 'sys_lang_id|s:2:"en";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450080199),
('hv072bm8tkulqt3tt2ng9ca7p3', 'sys_lang_id|s:2:"zh";admin_id|s:1:"1";admin_name|s:5:"admin";admin_realname|s:5:"admin";admin_md5|s:32:"636ded21717cad715ae8279f17706ef4";', 1450082949);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=196 ;

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
