/**
 * Yet another jquery color picker plugin,simple is the best.
 * @author levinhuang
 * @site http://www.vivasky.com
 * @note It's the jquery version of "Prototype color picker" by Myles Eftos,BUT a refined version.
 * Visit the raw prototype version here:myles.eftos.id.au/blog/2006/04/13/javascript-colour-picker-based-on-prototype/
 */
;(function($){var p={};p.getId=function(){var id=$(document).data("icolorID");if(!id){id=1;}else{id=id+1;};$(document).data("icolorID",id);return id;};p.colorMap=["00","33","66","99","AA","CC","EE","FF"];p.M=function($t,opts){this.$t=$t;this.$layout=null;this.$colors=null;this.$tb=null;this.flat=opts.flat;this.colors=opts.colors;this.trigger=opts.trigger;this.className=opts.cl;this.showInput=opts.showInput;this.defaultColor=!(this.colors&&this.colors.length>0);this.curColor="";this._opts=opts;this._init();};p.M.prototype={_init:function(){this._initColors();this._initCbk();this._initLayout();},_initColors:function(){if(!this.defaultColor)return;for(var i=0;i<p.colorMap.length;i++)this.colors.push(p.colorMap[i]+p.colorMap[i]+p.colorMap[i]);for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[0]+p.colorMap[0]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[i]+p.colorMap[i]+p.colorMap[7]);};for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[0]+p.colorMap[i]+p.colorMap[0]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[i]+p.colorMap[7]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[i]+p.colorMap[0]+p.colorMap[0]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[7]+p.colorMap[i]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[i]+p.colorMap[i]+p.colorMap[0]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[7]+p.colorMap[7]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[0]+p.colorMap[i]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[i]+p.colorMap[7]+p.colorMap[7]);};for(var i=1;i<p.colorMap.length;i++){if(i!=4&&i!=6)this.colors.push(p.colorMap[i]+p.colorMap[0]+p.colorMap[i]);};for(var i=1;i<p.colorMap.length;i++){if(i!=2&&i!=4&&i!=6&&i!=7)this.colors.push(p.colorMap[7]+p.colorMap[i]+p.colorMap[7]);};},_initLayout:function(){var _this=this;var go=true;if(this._opts.beforeInit){go=this._opts.beforeInit();};if(!go)return;this._opts.col=this._opts.col||this.colors.length;var colNum=this.defaultColor?8:(this._opts.col<1?1:this._opts.col);var html='<div class="'+this.className+'" id="icolor_'+p.getId()+'">',title="";html+='<table class="icolor_ct">';for(var i=0;i<this.colors.length;i++){if(i%colNum==0){html+="<tr>";};title=this._opts.title?(' title="#'+this.colors[i]+'"'):"";html+='<td style="background-color:#'+this.colors[i]+';"'+title+' abbr="'+this.colors[i]+'"></td>';if(i%colNum==(colNum-1)){html+="</tr>";};};html+='</table>';if(this.showInput){html+='<div class="icolor_ft"><input type="text" name="icolor" class="icolor_tbx"/>'+this._opts.okTpl+'</div>';};html+='</div>';this.$layout=$(html);this.$tb=this.$layout.find("table");this.$colors=this.$tb.find("td");if(this.flat){this.$t.append(this.$layout.addClass("icolor_flat"));}else{$("body").append(this.$layout.hide());};this.$colors.click(function(e){if(this.className=="hot")return;_this.$colors.removeClass();$(this).addClass("hot");_this.curColor="#"+this.abbr;if(_this._$ipt)_this._$ipt.val(_this.curColor);_this.submit();});if(this._opts.hover){this.$colors.mouseenter(function(e){var c="#"+this.abbr;_this._opts.onOver?_this._opts.onOver(c):(function(){_this._$ipt.css("background-color",c);})();});this.$tb.mouseleave(function(e){_this._opts.onOut?_this._opts.onOut():(function(){_this._$ipt.css("background-color","");})();});};if(this.showInput){this._$ipt=this.$layout.find(".icolor_tbx").keyup(function(e){if(e.keyCode!=13)return;var v="";if((v=_this._$ipt.val())==""||v.indexOf("#")!=0)return;_this.curColor=v;_this.submit();});this.$layout.find(".icolor_ok").click(function(e){var v="";if((v=_this._$ipt.val())==""||v.indexOf("#")!=0)return false;_this.curColor=v;_this.submit();return false;});};if(!this.flat){this.$t.bind(this.trigger,function(e){if(_this.$layout.is(":hidden"))_this.show();else _this.$layout.hide();return false;});};if(this._opts.afterInit)this._opts.afterInit();},show:function(){var _this=this;var pos=this.$t.offset(),cbk=this._opts.onShow?function(){_this._opts.onShow(pos);}:null;this.$layout.css({left:pos.left,top:pos.top+this.$t.height()});if(this._opts.slide){this.$layout.slideDown("fast",cbk);}else{this.$layout.show(0,cbk);};},submit:function(){if(this._opts.onSelect){this._opts.onSelect(this.curColor);};if((!this.flat)&&this._opts.autoClose){this.$layout.hide();};},_proxy:function(f){if(!f)return null;var i=this;return function(){return f.apply(i,arguments);};},_initCbk:function(){this._opts.onShow=this._proxy(this._opts.onShow);this._opts.onSelect=this._proxy(this._opts.onSelect);this._opts.beforeInit=this._proxy(this._opts.beforeInit);this._opts.afterInit=this._proxy(this._opts.afterInit);this._opts.onOver=this._proxy(this._opts.onOver);this._opts.onOut=this._proxy(this._opts.onOut);}};$.fn.icolor=function(opts){opts=$.extend({},$.fn.icolor.defaults,opts);return this.each(function(){var $i=$(this);if(!$i.data("icolor"))$i.data("icolor",new p.M($i,opts));});};$.fn.icolor.defaults={trigger:'click',flat:false,col:8,colors:[],showInput:false,cl:"icolor",title:true,autoClose:true,slide:true,okTpl:'',onShow:null,onSelect:null,beforeInit:null,afterInit:null,onOver:null,onOut:null,hover:true};$.fn.icolor.isDark=function(c){var colr=parseInt(c.substr(1),16);return(colr>>>16)+((colr>>>8)&0x00ff)+(colr&0x0000ff)<500;};})(jQuery);


/*
	dynDateTime 0.2
	
	A jQuery date time picker.
	
	Author: Toolman
	Version: 0.2
	Website: http://code.google.com/p/dyndatetime/

*/
(function($){$.fn.dynDateTime=function(options){$.fn.dynDateTime.defaults={displayArea:null,button:null,eventName:"click",ifFormat:"%Y/%m/%d",daFormat:"%Y/%m/%d",singleClick:true,dateStatusFunc:null,dateText:null,firstDay:null,align:"Br",range:[1900,2999],weekNumbers:true,flat:null,flatCallback:null,onSelect:null,onClose:null,onUpdate:null,date:null,showsTime:false,timeFormat:"24",electric:true,step:2,position:null,cache:false,showOthers:false,multiple:null,debug:false};var opts=$.extend({},$.fn.dynDateTime.defaults,options);return this.each(function(){var this_inputField=this;var this_displayArea=null;var this_button=null;var this_flat=null;if(opts.displayArea){try{this_displayArea=eval("jQuery(this)"+opts.displayArea+".get(0);");}catch(err){opts.displayArea=null;}}if(opts.button){try{this_button=eval("jQuery(this)"+opts.button+".get(0);");}catch(err){opts.button=null;}}if(opts.flat){try{this_flat=eval("jQuery(this)"+opts.flat+".get(0);");}catch(err){opts.flat=null;}}if(!(this_flat||opts.multiple||this_inputField||this_displayArea||this_button)){log("opts");return;}function onSelect(cal){var p=cal.opts;var update=(cal.dateClicked||p.electric);if(update&&this_inputField){this_inputField.value=cal.date.print(p.ifFormat);if(typeof this_inputField.onchange=="function")this_inputField.onchange();}if(update&&this_displayArea)this_displayArea.innerHTML=cal.date.print(p.daFormat);if(update&&typeof p.onUpdate=="function")p.onUpdate(cal);if(update&&p.flat){if(typeof p.flatCallback=="function")p.flatCallback(cal);}if(update&&p.singleClick&&cal.dateClicked)cal.callCloseHandler();};if(this_flat!=null){var cal=new Calendar(opts.firstDay,opts.date,opts.onSelect||onSelect);cal.showsOtherMonths=opts.showOthers;cal.showsTime=opts.showsTime;cal.time24=(opts.timeFormat=="24");cal.opts=opts;cal.weekNumbers=opts.weekNumbers;cal.setRange(opts.range[0],opts.range[1]);cal.setDateStatusHandler(opts.dateStatusFunc);cal.getDateText=opts.dateText;if(opts.ifFormat){cal.setDateFormat(opts.ifFormat);}if(this_inputField&&typeof this_inputField.value=="string"){log("rar");}cal.create(this_flat);cal.show();return;}var triggerEl=this_button||this_displayArea||this_inputField;triggerEl["on"+opts.eventName]=function(){log("clicked");var dateEl=this_inputField||this_displayArea;var dateFmt=this_inputField?opts.ifFormat:opts.daFormat;var mustCreate=false;var cal=window.calendar;if(dateEl)opts.date=Date.parseDate(dateEl.value||dateEl.innerHTML,dateFmt);if(!(cal&&opts.cache)){window.calendar=cal=new Calendar(opts.firstDay,opts.date,opts.onSelect||onSelect,opts.onClose||function(cal){cal.hide();});cal.showsTime=opts.showsTime;cal.time24=(opts.timeFormat=="24");cal.weekNumbers=opts.weekNumbers;mustCreate=true;}else{if(opts.date)cal.setDate(opts.date);cal.hide();}if(opts.multiple){cal.multiple={};for(var i=opts.multiple.length;--i>=0;){var d=opts.multiple[i];var ds=d.print("%Y%m%d");cal.multiple[ds]=d;}}cal.showsOtherMonths=opts.showOthers;cal.yearStep=opts.step;cal.setRange(opts.range[0],opts.range[1]);cal.opts=opts;cal.setDateStatusHandler(opts.dateStatusFunc);cal.getDateText=opts.dateText;cal.setDateFormat(dateFmt);if(mustCreate)cal.create();cal.refresh();if(!opts.position)cal.showAtElement(this_button||this_displayArea||this_inputField,opts.align);else
cal.showAt(opts.position[0],opts.position[1]);return false;};});function log(msg){if(opts.debug){window.loadFirebugConsole();if(window.console&&window.console.log)window.console.log("dynDateTime: "+msg);}};};})(jQuery);Calendar=function(firstDayOfWeek,dateStr,onSelected,onClose){this.activeDiv=null;this.currentDateEl=null;this.getDateStatus=null;this.getDateToolTip=null;this.getDateText=null;this.timeout=null;this.onSelected=onSelected||null;this.onClose=onClose||null;this.dragging=false;this.hidden=false;this.minYear=1970;this.maxYear=2050;this.dateFormat=Calendar._TT["DEF_DATE_FORMAT"];this.ttDateFormat=Calendar._TT["TT_DATE_FORMAT"];this.isPopup=true;this.weekNumbers=true;this.firstDayOfWeek=typeof firstDayOfWeek=="number"?firstDayOfWeek:Calendar._FD;this.showsOtherMonths=false;this.dateStr=dateStr;this.ar_days=null;this.showsTime=false;this.time24=true;this.yearStep=2;this.hiliteToday=true;this.multiple=null;this.table=null;this.element=null;this.tbody=null;this.firstdayname=null;this.monthsCombo=null;this.yearsCombo=null;this.hilitedMonth=null;this.activeMonth=null;this.hilitedYear=null;this.activeYear=null;this.dateClicked=false;if(typeof Calendar._SDN=="undefined"){if(typeof Calendar._SDN_len=="undefined")Calendar._SDN_len=3;var ar=new Array();for(var i=8;i>0;){ar[--i]=Calendar._DN[i].substr(0,Calendar._SDN_len);}Calendar._SDN=ar;if(typeof Calendar._SMN_len=="undefined")Calendar._SMN_len=3;ar=new Array();for(var i=12;i>0;){ar[--i]=Calendar._MN[i].substr(0,Calendar._SMN_len);}Calendar._SMN=ar;}};Calendar._C=null;Calendar.is_ie=(/msie/i.test(navigator.userAgent)&&!/opera/i.test(navigator.userAgent));Calendar.is_ie5=(Calendar.is_ie&&/msie 5\.0/i.test(navigator.userAgent));Calendar.is_opera=/opera/i.test(navigator.userAgent);Calendar.is_khtml=/Konqueror|Safari|KHTML/i.test(navigator.userAgent);Calendar.getAbsolutePos=function(el){var SL=0,ST=0;var is_div=/^div$/i.test(el.tagName);if(is_div&&el.scrollLeft)SL=el.scrollLeft;if(is_div&&el.scrollTop)ST=el.scrollTop;var r={x:el.offsetLeft-SL,y:el.offsetTop-ST};if(el.offsetParent){var tmp=this.getAbsolutePos(el.offsetParent);r.x+=tmp.x;r.y+=tmp.y;}return r;};Calendar.isRelated=function(el,evt){var related=evt.relatedTarget;if(!related){var type=evt.type;if(type=="mouseover"){related=evt.fromElement;}else if(type=="mouseout"){related=evt.toElement;}}while(related){if(related==el){return true;}related=related.parentNode;}return false;};Calendar.removeClass=function(el,className){if(!(el&&el.className)){return;}var cls=el.className.split(" ");var ar=new Array();for(var i=cls.length;i>0;){if(cls[--i]!=className){ar[ar.length]=cls[i];}}el.className=ar.join(" ");};Calendar.addClass=function(el,className){Calendar.removeClass(el,className);el.className+=" "+className;};Calendar.getElement=function(ev){var f=Calendar.is_ie?window.event.srcElement:ev.currentTarget;while(f.nodeType!=1||/^div$/i.test(f.tagName))f=f.parentNode;return f;};Calendar.getTargetElement=function(ev){var f=Calendar.is_ie?window.event.srcElement:ev.target;while(f.nodeType!=1)f=f.parentNode;return f;};Calendar.stopEvent=function(ev){ev||(ev=window.event);if(Calendar.is_ie){ev.cancelBubble=true;ev.returnValue=false;}else{ev.preventDefault();ev.stopPropagation();}return false;};Calendar.addEvent=function(el,evname,func){if(el.attachEvent){el.attachEvent("on"+evname,func);}else if(el.addEventListener){el.addEventListener(evname,func,true);}else{el["on"+evname]=func;}};Calendar.removeEvent=function(el,evname,func){if(el.detachEvent){el.detachEvent("on"+evname,func);}else if(el.removeEventListener){el.removeEventListener(evname,func,true);}else{el["on"+evname]=null;}};Calendar.createElement=function(type,parent){var el=null;if(document.createElementNS){el=document.createElementNS("http://www.w3.org/1999/xhtml",type);}else{el=document.createElement(type);}if(typeof parent!="undefined"){parent.appendChild(el);}return el;};Calendar._add_evs=function(el){with(Calendar){addEvent(el,"mouseover",dayMouseOver);addEvent(el,"mousedown",dayMouseDown);addEvent(el,"mouseout",dayMouseOut);if(is_ie){addEvent(el,"dblclick",dayMouseDblClick);el.setAttribute("unselectable",true);}}};Calendar.findMonth=function(el){if(typeof el.month!="undefined"){return el;}else if(typeof el.parentNode.month!="undefined"){return el.parentNode;}return null;};Calendar.findYear=function(el){if(typeof el.year!="undefined"){return el;}else if(typeof el.parentNode.year!="undefined"){return el.parentNode;}return null;};Calendar.showMonthsCombo=function(){var cal=Calendar._C;if(!cal){return false;}var cal=cal;var cd=cal.activeDiv;var mc=cal.monthsCombo;if(cal.hilitedMonth){Calendar.removeClass(cal.hilitedMonth,"hilite");}if(cal.activeMonth){Calendar.removeClass(cal.activeMonth,"active");}var mon=cal.monthsCombo.getElementsByTagName("div")[cal.date.getMonth()];Calendar.addClass(mon,"active");cal.activeMonth=mon;var s=mc.style;s.display="block";if(cd.navtype<0)s.left=cd.offsetLeft+"px";else{var mcw=mc.offsetWidth;if(typeof mcw=="undefined")mcw=50;s.left=(cd.offsetLeft+cd.offsetWidth-mcw)+"px";}s.top=(cd.offsetTop+cd.offsetHeight)+"px";};Calendar.showYearsCombo=function(fwd){var cal=Calendar._C;if(!cal){return false;}var cal=cal;var cd=cal.activeDiv;var yc=cal.yearsCombo;if(cal.hilitedYear){Calendar.removeClass(cal.hilitedYear,"hilite");}if(cal.activeYear){Calendar.removeClass(cal.activeYear,"active");}cal.activeYear=null;var Y=cal.date.getFullYear()+(fwd?1:-1);var yr=yc.firstChild;var show=false;for(var i=12;i>0;--i){if(Y>=cal.minYear&&Y<=cal.maxYear){yr.innerHTML=Y;yr.year=Y;yr.style.display="block";show=true;}else{yr.style.display="none";}yr=yr.nextSibling;Y+=fwd?cal.yearStep:-cal.yearStep;}if(show){var s=yc.style;s.display="block";if(cd.navtype<0)s.left=cd.offsetLeft+"px";else{var ycw=yc.offsetWidth;if(typeof ycw=="undefined")ycw=50;s.left=(cd.offsetLeft+cd.offsetWidth-ycw)+"px";}s.top=(cd.offsetTop+cd.offsetHeight)+"px";}};Calendar.tableMouseUp=function(ev){var cal=Calendar._C;if(!cal){return false;}if(cal.timeout){clearTimeout(cal.timeout);}var el=cal.activeDiv;if(!el){return false;}var target=Calendar.getTargetElement(ev);ev||(ev=window.event);Calendar.removeClass(el,"active");if(target==el||target.parentNode==el){Calendar.cellClick(el,ev);}var mon=Calendar.findMonth(target);var date=null;if(mon){date=new Date(cal.date);if(mon.month!=date.getMonth()){date.setMonth(mon.month);cal.setDate(date);cal.dateClicked=false;cal.callHandler();}}else{var year=Calendar.findYear(target);if(year){date=new Date(cal.date);if(year.year!=date.getFullYear()){date.setFullYear(year.year);cal.setDate(date);cal.dateClicked=false;cal.callHandler();}}}with(Calendar){removeEvent(document,"mouseup",tableMouseUp);removeEvent(document,"mouseover",tableMouseOver);removeEvent(document,"mousemove",tableMouseOver);cal._hideCombos();_C=null;return stopEvent(ev);}};Calendar.tableMouseOver=function(ev){var cal=Calendar._C;if(!cal){return;}var el=cal.activeDiv;var target=Calendar.getTargetElement(ev);if(target==el||target.parentNode==el){Calendar.addClass(el,"hilite active");Calendar.addClass(el.parentNode,"rowhilite");}else{if(typeof el.navtype=="undefined"||(el.navtype!=50&&(el.navtype==0||Math.abs(el.navtype)>2)))Calendar.removeClass(el,"active");Calendar.removeClass(el,"hilite");Calendar.removeClass(el.parentNode,"rowhilite");}ev||(ev=window.event);if(el.navtype==50&&target!=el){var pos=Calendar.getAbsolutePos(el);var w=el.offsetWidth;var x=ev.clientX;var dx;var decrease=true;if(x>pos.x+w){dx=x-pos.x-w;decrease=false;}else
dx=pos.x-x;if(dx<0)dx=0;var range=el._range;var current=el._current;var count=Math.floor(dx/10)%range.length;for(var i=range.length;--i>=0;)if(range[i]==current)break;while(count-->0)if(decrease){if(--i<0)i=range.length-1;}else if(++i>=range.length)i=0;var newval=range[i];el.innerHTML=newval;cal.onUpdateTime();}var mon=Calendar.findMonth(target);if(mon){if(mon.month!=cal.date.getMonth()){if(cal.hilitedMonth){Calendar.removeClass(cal.hilitedMonth,"hilite");}Calendar.addClass(mon,"hilite");cal.hilitedMonth=mon;}else if(cal.hilitedMonth){Calendar.removeClass(cal.hilitedMonth,"hilite");}}else{if(cal.hilitedMonth){Calendar.removeClass(cal.hilitedMonth,"hilite");}var year=Calendar.findYear(target);if(year){if(year.year!=cal.date.getFullYear()){if(cal.hilitedYear){Calendar.removeClass(cal.hilitedYear,"hilite");}Calendar.addClass(year,"hilite");cal.hilitedYear=year;}else if(cal.hilitedYear){Calendar.removeClass(cal.hilitedYear,"hilite");}}else if(cal.hilitedYear){Calendar.removeClass(cal.hilitedYear,"hilite");}}return Calendar.stopEvent(ev);};Calendar.tableMouseDown=function(ev){if(Calendar.getTargetElement(ev)==Calendar.getElement(ev)){return Calendar.stopEvent(ev);}};Calendar.calDragIt=function(ev){var cal=Calendar._C;if(!(cal&&cal.dragging)){return false;}var posX;var posY;if(Calendar.is_ie){posY=window.event.clientY+document.body.scrollTop;posX=window.event.clientX+document.body.scrollLeft;}else{posX=ev.pageX;posY=ev.pageY;}cal.hideShowCovered();var st=cal.element.style;st.left=(posX-cal.xOffs)+"px";st.top=(posY-cal.yOffs)+"px";return Calendar.stopEvent(ev);};Calendar.calDragEnd=function(ev){var cal=Calendar._C;if(!cal){return false;}cal.dragging=false;with(Calendar){removeEvent(document,"mousemove",calDragIt);removeEvent(document,"mouseup",calDragEnd);tableMouseUp(ev);}cal.hideShowCovered();};Calendar.dayMouseDown=function(ev){var el=Calendar.getElement(ev);if(el.disabled){return false;}var cal=el.calendar;cal.activeDiv=el;Calendar._C=cal;if(el.navtype!=300)with(Calendar){if(el.navtype==50){el._current=el.innerHTML;addEvent(document,"mousemove",tableMouseOver);}else
addEvent(document,Calendar.is_ie5?"mousemove":"mouseover",tableMouseOver);addClass(el,"hilite active");addEvent(document,"mouseup",tableMouseUp);}else if(cal.isPopup){cal._dragStart(ev);}if(el.navtype==-1||el.navtype==1){if(cal.timeout)clearTimeout(cal.timeout);cal.timeout=setTimeout("Calendar.showMonthsCombo()",250);}else if(el.navtype==-2||el.navtype==2){if(cal.timeout)clearTimeout(cal.timeout);cal.timeout=setTimeout((el.navtype>0)?"Calendar.showYearsCombo(true)":"Calendar.showYearsCombo(false)",250);}else{cal.timeout=null;}return Calendar.stopEvent(ev);};Calendar.dayMouseDblClick=function(ev){Calendar.cellClick(Calendar.getElement(ev),ev||window.event);if(Calendar.is_ie){document.selection.empty();}};Calendar.dayMouseOver=function(ev){var el=Calendar.getElement(ev);if(Calendar.isRelated(el,ev)||Calendar._C||el.disabled){return false;}if(el.ttip){if(el.ttip.substr(0,1)=="_"){el.ttip=el.caldate.print(el.calendar.ttDateFormat)+el.ttip.substr(1);}el.calendar.tooltips.innerHTML=el.ttip;}if(el.navtype!=300){Calendar.addClass(el,"hilite");if(el.caldate){Calendar.addClass(el.parentNode,"rowhilite");}}return Calendar.stopEvent(ev);};Calendar.dayMouseOut=function(ev){with(Calendar){var el=getElement(ev);if(isRelated(el,ev)||_C||el.disabled)return false;removeClass(el,"hilite");if(el.caldate)removeClass(el.parentNode,"rowhilite");if(el.calendar)el.calendar.tooltips.innerHTML=_TT["SEL_DATE"];return stopEvent(ev);}};Calendar.cellClick=function(el,ev){var cal=el.calendar;var closing=false;var newdate=false;var date=null;if(typeof el.navtype=="undefined"){if(cal.currentDateEl){Calendar.removeClass(cal.currentDateEl,"selected");Calendar.addClass(el,"selected");closing=(cal.currentDateEl==el);if(!closing){cal.currentDateEl=el;}}cal.date.setDateOnly(el.caldate);date=cal.date;var other_month=!(cal.dateClicked=!el.otherMonth);if(!other_month&&!cal.currentDateEl)cal._toggleMultipleDate(new Date(date));else
newdate=!el.disabled;if(other_month)cal._init(cal.firstDayOfWeek,date);}else{if(el.navtype==200){Calendar.removeClass(el,"hilite");cal.callCloseHandler();return;}date=new Date(cal.date);if(el.navtype==0)date.setDateOnly(new Date());cal.dateClicked=false;var year=date.getFullYear();var mon=date.getMonth();function setMonth(m){var day=date.getDate();var max=date.getMonthDays(m);if(day>max){date.setDate(max);}date.setMonth(m);};switch(el.navtype){case 400:Calendar.removeClass(el,"hilite");var text=Calendar._TT["ABOUT"];if(typeof text!="undefined"){text+=cal.showsTime?Calendar._TT["ABOUT_TIME"]:"";}else{text="Help and about box text is not translated into this language.\n"+"If you know this language and you feel generous please update\n"+"the corresponding file in \"lang\" subdir to match calendar-en.js\n"+"and send it back to <mihai_bazon@yahoo.com> to get it into the distribution  ;-)\n\n"+"Thank you!\n"+"http://dynarch.com/mishoo/calendar.epl\n";}alert(text);return;case-2:if(year>cal.minYear){date.setFullYear(year-1);}break;case-1:if(mon>0){setMonth(mon-1);}else if(year-->cal.minYear){date.setFullYear(year);setMonth(11);}break;case 1:if(mon<11){setMonth(mon+1);}else if(year<cal.maxYear){date.setFullYear(year+1);setMonth(0);}break;case 2:if(year<cal.maxYear){date.setFullYear(year+1);}break;case 100:cal.setFirstDayOfWeek(el.fdow);return;case 50:var range=el._range;var current=el.innerHTML;for(var i=range.length;--i>=0;)if(range[i]==current)break;if(ev&&ev.shiftKey){if(--i<0)i=range.length-1;}else if(++i>=range.length)i=0;var newval=range[i];el.innerHTML=newval;cal.onUpdateTime();return;case 0:if((typeof cal.getDateStatus=="function")&&cal.getDateStatus(date,date.getFullYear(),date.getMonth(),date.getDate())){return false;}break;}if(!date.equalsTo(cal.date)){cal.setDate(date);newdate=true;}else if(el.navtype==0)newdate=closing=true;}if(newdate){ev&&cal.callHandler();}if(closing){Calendar.removeClass(el,"hilite");ev&&cal.callCloseHandler();}};Calendar.prototype.create=function(_par){var parent=null;if(!_par){parent=document.getElementsByTagName("body")[0];this.isPopup=true;}else{parent=_par;this.isPopup=false;}this.date=this.dateStr?new Date(this.dateStr):new Date();var table=Calendar.createElement("table");this.table=table;table.cellSpacing=0;table.cellPadding=0;table.calendar=this;Calendar.addEvent(table,"mousedown",Calendar.tableMouseDown);var div=Calendar.createElement("div");this.element=div;div.className="calendar";if(this.isPopup){div.style.position="absolute";div.style.display="none";}div.appendChild(table);var thead=Calendar.createElement("thead",table);var cell=null;var row=null;var cal=this;var hh=function(text,cs,navtype){cell=Calendar.createElement("td",row);cell.colSpan=cs;cell.className="button";if(navtype!=0&&Math.abs(navtype)<=2)cell.className+=" nav";Calendar._add_evs(cell);cell.calendar=cal;cell.navtype=navtype;cell.innerHTML="<div unselectable='on'>"+text+"</div>";return cell;};row=Calendar.createElement("tr",thead);var title_length=6;(this.isPopup)&&--title_length;(this.weekNumbers)&&++title_length;hh("?",1,400).ttip=Calendar._TT["INFO"];this.title=hh("",title_length,300);this.title.className="title";if(this.isPopup){this.title.ttip=Calendar._TT["DRAG_TO_MOVE"];this.title.style.cursor="move";hh("&#x00d7;",1,200).ttip=Calendar._TT["CLOSE"];}row=Calendar.createElement("tr",thead);row.className="headrow";this._nav_py=hh("&#x00ab;",1,-2);this._nav_py.ttip=Calendar._TT["PREV_YEAR"];this._nav_pm=hh("&#x2039;",1,-1);this._nav_pm.ttip=Calendar._TT["PREV_MONTH"];this._nav_now=hh(Calendar._TT["TODAY"],this.weekNumbers?4:3,0);this._nav_now.ttip=Calendar._TT["GO_TODAY"];this._nav_nm=hh("&#x203a;",1,1);this._nav_nm.ttip=Calendar._TT["NEXT_MONTH"];this._nav_ny=hh("&#x00bb;",1,2);this._nav_ny.ttip=Calendar._TT["NEXT_YEAR"];row=Calendar.createElement("tr",thead);row.className="daynames";if(this.weekNumbers){cell=Calendar.createElement("td",row);cell.className="name wn";cell.innerHTML=Calendar._TT["WK"];}for(var i=7;i>0;--i){cell=Calendar.createElement("td",row);if(!i){cell.navtype=100;cell.calendar=this;Calendar._add_evs(cell);}}this.firstdayname=(this.weekNumbers)?row.firstChild.nextSibling:row.firstChild;this._displayWeekdays();var tbody=Calendar.createElement("tbody",table);this.tbody=tbody;for(i=6;i>0;--i){row=Calendar.createElement("tr",tbody);if(this.weekNumbers){cell=Calendar.createElement("td",row);}for(var j=7;j>0;--j){cell=Calendar.createElement("td",row);cell.calendar=this;Calendar._add_evs(cell);}}if(this.showsTime){row=Calendar.createElement("tr",tbody);row.className="time";cell=Calendar.createElement("td",row);cell.className="time";cell.colSpan=2;cell.innerHTML=Calendar._TT["TIME"]||"&nbsp;";cell=Calendar.createElement("td",row);cell.className="time";cell.colSpan=this.weekNumbers?4:3;(function(){function makeTimePart(className,init,range_start,range_end){var part=Calendar.createElement("span",cell);part.className=className;part.innerHTML=init;part.calendar=cal;part.ttip=Calendar._TT["TIME_PART"];part.navtype=50;part._range=[];if(typeof range_start!="number")part._range=range_start;else{for(var i=range_start;i<=range_end;++i){var txt;if(i<10&&range_end>=10)txt='0'+i;else txt=''+i;part._range[part._range.length]=txt;}}Calendar._add_evs(part);return part;};var hrs=cal.date.getHours();var mins=cal.date.getMinutes();var t12=!cal.time24;var pm=(hrs>12);if(t12&&pm)hrs-=12;var H=makeTimePart("hour",hrs,t12?1:0,t12?12:23);var span=Calendar.createElement("span",cell);span.innerHTML=":";span.className="colon";var M=makeTimePart("minute",mins,0,59);var AP=null;cell=Calendar.createElement("td",row);cell.className="time";cell.colSpan=2;if(t12)AP=makeTimePart("ampm",pm?"pm":"am",["am","pm"]);else
cell.innerHTML="&nbsp;";cal.onSetTime=function(){var pm,hrs=this.date.getHours(),mins=this.date.getMinutes();if(t12){pm=(hrs>=12);if(pm)hrs-=12;if(hrs==0)hrs=12;AP.innerHTML=pm?"pm":"am";}H.innerHTML=(hrs<10)?("0"+hrs):hrs;M.innerHTML=(mins<10)?("0"+mins):mins;};cal.onUpdateTime=function(){var date=this.date;var h=parseInt(H.innerHTML,10);if(t12){if(/pm/i.test(AP.innerHTML)&&h<12)h+=12;else if(/am/i.test(AP.innerHTML)&&h==12)h=0;}var d=date.getDate();var m=date.getMonth();var y=date.getFullYear();date.setHours(h);date.setMinutes(parseInt(M.innerHTML,10));date.setFullYear(y);date.setMonth(m);date.setDate(d);this.dateClicked=false;this.callHandler();};})();}else{this.onSetTime=this.onUpdateTime=function(){};}var tfoot=Calendar.createElement("tfoot",table);row=Calendar.createElement("tr",tfoot);row.className="footrow";cell=hh(Calendar._TT["SEL_DATE"],this.weekNumbers?8:7,300);cell.className="ttip";if(this.isPopup){cell.ttip=Calendar._TT["DRAG_TO_MOVE"];cell.style.cursor="move";}this.tooltips=cell;div=Calendar.createElement("div",this.element);this.monthsCombo=div;div.className="combo";for(i=0;i<Calendar._MN.length;++i){var mn=Calendar.createElement("div");mn.className=Calendar.is_ie?"label-IEfix":"label";mn.month=i;mn.innerHTML=Calendar._SMN[i];div.appendChild(mn);}div=Calendar.createElement("div",this.element);this.yearsCombo=div;div.className="combo";for(i=12;i>0;--i){var yr=Calendar.createElement("div");yr.className=Calendar.is_ie?"label-IEfix":"label";div.appendChild(yr);}this._init(this.firstDayOfWeek,this.date);parent.appendChild(this.element);};Calendar._keyEvent=function(ev){var cal=window._dynarch_popupCalendar;if(!cal||cal.multiple)return false;(Calendar.is_ie)&&(ev=window.event);var act=(Calendar.is_ie||ev.type=="keypress"),K=ev.keyCode;if(ev.ctrlKey){switch(K){case 37:act&&Calendar.cellClick(cal._nav_pm);break;case 38:act&&Calendar.cellClick(cal._nav_py);break;case 39:act&&Calendar.cellClick(cal._nav_nm);break;case 40:act&&Calendar.cellClick(cal._nav_ny);break;default:return false;}}else switch(K){case 32:Calendar.cellClick(cal._nav_now);break;case 27:act&&cal.callCloseHandler();break;case 37:case 38:case 39:case 40:if(act){var prev,x,y,ne,el,step;prev=K==37||K==38;step=(K==37||K==39)?1:7;function setVars(){el=cal.currentDateEl;var p=el.pos;x=p&15;y=p>>4;ne=cal.ar_days[y][x];};setVars();function prevMonth(){var date=new Date(cal.date);date.setDate(date.getDate()-step);cal.setDate(date);};function nextMonth(){var date=new Date(cal.date);date.setDate(date.getDate()+step);cal.setDate(date);};while(1){switch(K){case 37:if(--x>=0)ne=cal.ar_days[y][x];else{x=6;K=38;continue;}break;case 38:if(--y>=0)ne=cal.ar_days[y][x];else{prevMonth();setVars();}break;case 39:if(++x<7)ne=cal.ar_days[y][x];else{x=0;K=40;continue;}break;case 40:if(++y<cal.ar_days.length)ne=cal.ar_days[y][x];else{nextMonth();setVars();}break;}break;}if(ne){if(!ne.disabled)Calendar.cellClick(ne);else if(prev)prevMonth();else
nextMonth();}}break;case 13:if(act)Calendar.cellClick(cal.currentDateEl,ev);break;default:return false;}return Calendar.stopEvent(ev);};Calendar.prototype._init=function(firstDayOfWeek,date){var today=new Date(),TY=today.getFullYear(),TM=today.getMonth(),TD=today.getDate();this.table.style.visibility="hidden";var year=date.getFullYear();if(year<this.minYear){year=this.minYear;date.setFullYear(year);}else if(year>this.maxYear){year=this.maxYear;date.setFullYear(year);}this.firstDayOfWeek=firstDayOfWeek;this.date=new Date(date);var month=date.getMonth();var mday=date.getDate();var no_days=date.getMonthDays();date.setDate(1);var day1=(date.getDay()-this.firstDayOfWeek)%7;if(day1<0)day1+=7;date.setDate(-day1);date.setDate(date.getDate()+1);var row=this.tbody.firstChild;var MN=Calendar._SMN[month];var ar_days=this.ar_days=new Array();var weekend=Calendar._TT["WEEKEND"];var dates=this.multiple?(this.datesCells={}):null;for(var i=0;i<6;++i,row=row.nextSibling){var cell=row.firstChild;if(this.weekNumbers){cell.className="day wn";cell.innerHTML=date.getWeekNumber();cell=cell.nextSibling;}row.className="daysrow";var hasdays=false,iday,dpos=ar_days[i]=[];for(var j=0;j<7;++j,cell=cell.nextSibling,date.setDate(iday+1)){iday=date.getDate();var wday=date.getDay();cell.className="day";cell.pos=i<<4|j;dpos[j]=cell;var current_month=(date.getMonth()==month);if(!current_month){if(this.showsOtherMonths){cell.className+=" othermonth";cell.otherMonth=true;}else{cell.className="emptycell";cell.innerHTML="&nbsp;";cell.disabled=true;continue;}}else{cell.otherMonth=false;hasdays=true;}cell.disabled=false;cell.innerHTML=this.getDateText?this.getDateText(date,iday):iday;if(dates)dates[date.print("%Y%m%d")]=cell;if(this.getDateStatus){var status=this.getDateStatus(date,year,month,iday);if(this.getDateToolTip){var toolTip=this.getDateToolTip(date,year,month,iday);if(toolTip)cell.title=toolTip;}if(status===true){cell.className+=" disabled";cell.disabled=true;}else{if(/disabled/i.test(status))cell.disabled=true;cell.className+=" "+status;}}if(!cell.disabled){cell.caldate=new Date(date);cell.ttip="_";if(!this.multiple&&current_month&&iday==mday&&this.hiliteToday){cell.className+=" selected";this.currentDateEl=cell;}if(date.getFullYear()==TY&&date.getMonth()==TM&&iday==TD){cell.className+=" today";cell.ttip+=Calendar._TT["PART_TODAY"];}if(weekend.indexOf(wday.toString())!=-1)cell.className+=cell.otherMonth?" oweekend":" weekend";}}if(!(hasdays||this.showsOtherMonths))row.className="emptyrow";}this.title.innerHTML=Calendar._MN[month]+", "+year;this.onSetTime();this.table.style.visibility="visible";this._initMultipleDates();};Calendar.prototype._initMultipleDates=function(){if(this.multiple){for(var i in this.multiple){var cell=this.datesCells[i];var d=this.multiple[i];if(!d)continue;if(cell)cell.className+=" selected";}}};Calendar.prototype._toggleMultipleDate=function(date){if(this.multiple){var ds=date.print("%Y%m%d");var cell=this.datesCells[ds];if(cell){var d=this.multiple[ds];if(!d){Calendar.addClass(cell,"selected");this.multiple[ds]=date;}else{Calendar.removeClass(cell,"selected");delete this.multiple[ds];}}}};Calendar.prototype.setDateToolTipHandler=function(unaryFunction){this.getDateToolTip=unaryFunction;};Calendar.prototype.setDate=function(date){if(!date.equalsTo(this.date)){this._init(this.firstDayOfWeek,date);}};Calendar.prototype.refresh=function(){this._init(this.firstDayOfWeek,this.date);};Calendar.prototype.setFirstDayOfWeek=function(firstDayOfWeek){this._init(firstDayOfWeek,this.date);this._displayWeekdays();};Calendar.prototype.setDateStatusHandler=Calendar.prototype.setDisabledHandler=function(unaryFunction){this.getDateStatus=unaryFunction;};Calendar.prototype.setRange=function(a,z){this.minYear=a;this.maxYear=z;};Calendar.prototype.callHandler=function(){if(this.onSelected){this.onSelected(this,this.date.print(this.dateFormat));}};Calendar.prototype.callCloseHandler=function(){if(this.onClose){this.onClose(this);}this.hideShowCovered();};Calendar.prototype.destroy=function(){var el=this.element.parentNode;el.removeChild(this.element);Calendar._C=null;window._dynarch_popupCalendar=null;};Calendar.prototype.reparent=function(new_parent){var el=this.element;el.parentNode.removeChild(el);new_parent.appendChild(el);};Calendar._checkCalendar=function(ev){var calendar=window._dynarch_popupCalendar;if(!calendar){return false;}var el=Calendar.is_ie?Calendar.getElement(ev):Calendar.getTargetElement(ev);for(;el!=null&&el!=calendar.element;el=el.parentNode);if(el==null){window._dynarch_popupCalendar.callCloseHandler();return Calendar.stopEvent(ev);}};Calendar.prototype.show=function(){var rows=this.table.getElementsByTagName("tr");for(var i=rows.length;i>0;){var row=rows[--i];Calendar.removeClass(row,"rowhilite");var cells=row.getElementsByTagName("td");for(var j=cells.length;j>0;){var cell=cells[--j];Calendar.removeClass(cell,"hilite");Calendar.removeClass(cell,"active");}}this.element.style.display="block";this.hidden=false;if(this.isPopup){window._dynarch_popupCalendar=this;Calendar.addEvent(document,"keydown",Calendar._keyEvent);Calendar.addEvent(document,"keypress",Calendar._keyEvent);Calendar.addEvent(document,"mousedown",Calendar._checkCalendar);}this.hideShowCovered();};Calendar.prototype.hide=function(){if(this.isPopup){Calendar.removeEvent(document,"keydown",Calendar._keyEvent);Calendar.removeEvent(document,"keypress",Calendar._keyEvent);Calendar.removeEvent(document,"mousedown",Calendar._checkCalendar);}this.element.style.display="none";this.hidden=true;this.hideShowCovered();};Calendar.prototype.showAt=function(x,y){var s=this.element.style;s.left=x+"px";s.top=y+"px";this.show();};Calendar.prototype.showAtElement=function(el,opts){var self=this;var p=Calendar.getAbsolutePos(el);if(!opts||typeof opts!="string"){this.showAt(p.x,p.y+el.offsetHeight);return true;}function fixPosition(box){if(box.x<0)box.x=0;if(box.y<0)box.y=0;var cp=document.createElement("div");var s=cp.style;s.position="absolute";s.right=s.bottom=s.width=s.height="0px";document.body.appendChild(cp);var br=Calendar.getAbsolutePos(cp);document.body.removeChild(cp);if(Calendar.is_ie){br.y+=document.body.scrollTop;br.x+=document.body.scrollLeft;}else{br.y+=window.scrollY;br.x+=window.scrollX;}var tmp=box.x+box.width-br.x;if(tmp>0)box.x-=tmp;tmp=box.y+box.height-br.y;if(tmp>0)box.y-=tmp;};this.element.style.display="block";Calendar.continuation_for_the_fucking_khtml_browser=function(){var w=self.element.offsetWidth;var h=self.element.offsetHeight;self.element.style.display="none";var valign=opts.substr(0,1);var halign="l";if(opts.length>1){halign=opts.substr(1,1);}switch(valign){case"T":p.y-=h;break;case"B":p.y+=el.offsetHeight;break;case"C":p.y+=(el.offsetHeight-h)/2;break;case"t":p.y+=el.offsetHeight-h;break;case"b":break;}switch(halign){case"L":p.x-=w;break;case"R":p.x+=el.offsetWidth;break;case"C":p.x+=(el.offsetWidth-w)/2;break;case"l":p.x+=el.offsetWidth-w;break;case"r":break;}p.width=w;p.height=h+40;self.monthsCombo.style.display="none";fixPosition(p);self.showAt(p.x,p.y);};if(Calendar.is_khtml)setTimeout("Calendar.continuation_for_the_fucking_khtml_browser()",10);else
Calendar.continuation_for_the_fucking_khtml_browser();};Calendar.prototype.setDateFormat=function(str){this.dateFormat=str;};Calendar.prototype.setTtDateFormat=function(str){this.ttDateFormat=str;};Calendar.prototype.parseDate=function(str,fmt){if(!fmt)fmt=this.dateFormat;this.setDate(Date.parseDate(str,fmt));};Calendar.prototype.hideShowCovered=function(){if(!Calendar.is_ie&&!Calendar.is_opera)return;function getVisib(obj){var value=obj.style.visibility;if(!value){if(document.defaultView&&typeof(document.defaultView.getComputedStyle)=="function"){if(!Calendar.is_khtml)value=document.defaultView.getComputedStyle(obj,"").getPropertyValue("visibility");else
value='';}else if(obj.currentStyle){value=obj.currentStyle.visibility;}else
value='';}return value;};var tags=new Array("applet","iframe","select");var el=this.element;var p=Calendar.getAbsolutePos(el);var EX1=p.x;var EX2=el.offsetWidth+EX1;var EY1=p.y;var EY2=el.offsetHeight+EY1;for(var k=tags.length;k>0;){var ar=document.getElementsByTagName(tags[--k]);var cc=null;for(var i=ar.length;i>0;){cc=ar[--i];p=Calendar.getAbsolutePos(cc);var CX1=p.x;var CX2=cc.offsetWidth+CX1;var CY1=p.y;var CY2=cc.offsetHeight+CY1;if(this.hidden||(CX1>EX2)||(CX2<EX1)||(CY1>EY2)||(CY2<EY1)){if(!cc.__msh_save_visibility){cc.__msh_save_visibility=getVisib(cc);}cc.style.visibility=cc.__msh_save_visibility;}else{if(!cc.__msh_save_visibility){cc.__msh_save_visibility=getVisib(cc);}cc.style.visibility="hidden";}}}};Calendar.prototype._displayWeekdays=function(){var fdow=this.firstDayOfWeek;var cell=this.firstdayname;var weekend=Calendar._TT["WEEKEND"];for(var i=0;i<7;++i){cell.className="day name";var realday=(i+fdow)%7;if(i){cell.ttip=Calendar._TT["DAY_FIRST"].replace("%s",Calendar._DN[realday]);cell.navtype=100;cell.calendar=this;cell.fdow=realday;Calendar._add_evs(cell);}if(weekend.indexOf(realday.toString())!=-1){Calendar.addClass(cell,"weekend");}cell.innerHTML=Calendar._SDN[(i+fdow)%7];cell=cell.nextSibling;}};Calendar.prototype._hideCombos=function(){this.monthsCombo.style.display="none";this.yearsCombo.style.display="none";};Calendar.prototype._dragStart=function(ev){if(this.dragging){return;}this.dragging=true;var posX;var posY;if(Calendar.is_ie){posY=window.event.clientY+document.body.scrollTop;posX=window.event.clientX+document.body.scrollLeft;}else{posY=ev.clientY+window.scrollY;posX=ev.clientX+window.scrollX;}var st=this.element.style;this.xOffs=posX-parseInt(st.left);this.yOffs=posY-parseInt(st.top);with(Calendar){addEvent(document,"mousemove",calDragIt);addEvent(document,"mouseup",calDragEnd);}};Date._MD=new Array(31,28,31,30,31,30,31,31,30,31,30,31);Date.SECOND=1000;Date.MINUTE=60*Date.SECOND;Date.HOUR=60*Date.MINUTE;Date.DAY=24*Date.HOUR;Date.WEEK=7*Date.DAY;Date.parseDate=function(str,fmt){var today=new Date();var y=0;var m=-1;var d=0;var a=str.split(/\W+/);var b=fmt.match(/%./g);var i=0,j=0;var hr=0;var min=0;for(i=0;i<a.length;++i){if(!a[i])continue;switch(b[i]){case"%d":case"%e":d=parseInt(a[i],10);break;case"%m":m=parseInt(a[i],10)-1;break;case"%Y":case"%y":y=parseInt(a[i],10);(y<100)&&(y+=(y>29)?1900:2000);break;case"%b":case"%B":for(j=0;j<12;++j){if(Calendar._MN[j].substr(0,a[i].length).toLowerCase()==a[i].toLowerCase()){m=j;break;}}break;case"%H":case"%I":case"%k":case"%l":hr=parseInt(a[i],10);break;case"%P":case"%p":if(/pm/i.test(a[i])&&hr<12)hr+=12;else if(/am/i.test(a[i])&&hr>=12)hr-=12;break;case"%M":min=parseInt(a[i],10);break;}}if(isNaN(y))y=today.getFullYear();if(isNaN(m))m=today.getMonth();if(isNaN(d))d=today.getDate();if(isNaN(hr))hr=today.getHours();if(isNaN(min))min=today.getMinutes();if(y!=0&&m!=-1&&d!=0)return new Date(y,m,d,hr,min,0);y=0;m=-1;d=0;for(i=0;i<a.length;++i){if(a[i].search(/[a-zA-Z]+/)!=-1){var t=-1;for(j=0;j<12;++j){if(Calendar._MN[j].substr(0,a[i].length).toLowerCase()==a[i].toLowerCase()){t=j;break;}}if(t!=-1){if(m!=-1){d=m+1;}m=t;}}else if(parseInt(a[i],10)<=12&&m==-1){m=a[i]-1;}else if(parseInt(a[i],10)>31&&y==0){y=parseInt(a[i],10);(y<100)&&(y+=(y>29)?1900:2000);}else if(d==0){d=a[i];}}if(y==0)y=today.getFullYear();if(m!=-1&&d!=0)return new Date(y,m,d,hr,min,0);return today;};Date.prototype.getMonthDays=function(month){var year=this.getFullYear();if(typeof month=="undefined"){month=this.getMonth();}if(((0==(year%4))&&((0!=(year%100))||(0==(year%400))))&&month==1){return 29;}else{return Date._MD[month];}};Date.prototype.getDayOfYear=function(){var now=new Date(this.getFullYear(),this.getMonth(),this.getDate(),0,0,0);var then=new Date(this.getFullYear(),0,0,0,0,0);var time=now-then;return Math.floor(time/Date.DAY);};Date.prototype.getWeekNumber=function(){var d=new Date(this.getFullYear(),this.getMonth(),this.getDate(),0,0,0);var DoW=d.getDay();d.setDate(d.getDate()-(DoW+6)%7+3);var ms=d.valueOf();d.setMonth(0);d.setDate(4);return Math.round((ms-d.valueOf())/(7*864e5))+1;};Date.prototype.equalsTo=function(date){return((this.getFullYear()==date.getFullYear())&&(this.getMonth()==date.getMonth())&&(this.getDate()==date.getDate())&&(this.getHours()==date.getHours())&&(this.getMinutes()==date.getMinutes()));};Date.prototype.setDateOnly=function(date){var tmp=new Date(date);this.setDate(1);this.setFullYear(tmp.getFullYear());this.setMonth(tmp.getMonth());this.setDate(tmp.getDate());};Date.prototype.print=function(str){var m=this.getMonth();var d=this.getDate();var y=this.getFullYear();var wn=this.getWeekNumber();var w=this.getDay();var s={};var hr=this.getHours();var pm=(hr>=12);var ir=(pm)?(hr-12):hr;var dy=this.getDayOfYear();if(ir==0)ir=12;var min=this.getMinutes();var sec=this.getSeconds();s["%a"]=Calendar._SDN[w];s["%A"]=Calendar._DN[w];s["%b"]=Calendar._SMN[m];s["%B"]=Calendar._MN[m];s["%C"]=1+Math.floor(y/100);s["%d"]=(d<10)?("0"+d):d;s["%e"]=d;s["%H"]=(hr<10)?("0"+hr):hr;s["%I"]=(ir<10)?("0"+ir):ir;s["%j"]=(dy<100)?((dy<10)?("00"+dy):("0"+dy)):dy;s["%k"]=hr;s["%l"]=ir;s["%m"]=(m<9)?("0"+(1+m)):(1+m);s["%M"]=(min<10)?("0"+min):min;s["%n"]="\n";s["%p"]=pm?"PM":"AM";s["%P"]=pm?"pm":"am";s["%s"]=Math.floor(this.getTime()/1000);s["%S"]=(sec<10)?("0"+sec):sec;s["%t"]="\t";s["%U"]=s["%W"]=s["%V"]=(wn<10)?("0"+wn):wn;s["%u"]=w+1;s["%w"]=w;s["%y"]=(''+y).substr(2,2);s["%Y"]=y;s["%%"]="%";var re=/%./g;if(!Calendar.is_ie5&&!Calendar.is_khtml)return str.replace(re,function(par){return s[par]||par;});var a=str.match(re);for(var i=0;i<a.length;i++){var tmp=s[a[i]];if(tmp){re=new RegExp(a[i],'g');str=str.replace(re,tmp);}}return str;};Date.prototype.__msh_oldSetFullYear=Date.prototype.setFullYear;Date.prototype.setFullYear=function(y){var d=new Date(this);d.__msh_oldSetFullYear(y);if(d.getMonth()!=this.getMonth())this.setDate(28);this.__msh_oldSetFullYear(y);};window._dynarch_popupCalendar=null;

/*
// Calendar EN language
// Author: Mihai Bazon, <mishoo@infoiasi.ro>
// Encoding: any
// Translator : Niko <nikoused@gmail.com>
// Distributed under the same terms as the calendar itself.
*/
Calendar._DN=new Array("\u661f\u671f\u65e5","\u661f\u671f\u4e00","\u661f\u671f\u4e8c","\u661f\u671f\u4e09","\u661f\u671f\u56db","\u661f\u671f\u4e94","\u661f\u671f\u516d","\u661f\u671f\u65e5");Calendar._SDN=new Array("\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d","\u65e5");Calendar._FD=0;Calendar._MN=new Array("\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708");Calendar._SMN=new Array("\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708");Calendar._TT={};Calendar._TT.INFO="\u5e2e\u52a9";Calendar._TT.ABOUT="DHTML Date/Time Selector\n(c) dynarch.com 2002-2005 / Author: Mihai Bazon\nFor latest version visit: http://www.dynarch.com/projects/calendar/\nDistributed under GNU LGPL.  See http://gnu.org/licenses/lgpl.html for details.\n\n\u9009\u62e9\u65e5\u671f:\n- \u70b9\u51fb \xab, \xbb \u6309\u94ae\u9009\u62e9\u5e74\u4efd\n- \u70b9\u51fb "+String.fromCharCode(8249)+", "+String.fromCharCode(8250)+" \u6309\u94ae\u9009\u62e9\u6708\u4efd\n- \u957f\u6309\u4ee5\u4e0a\u6309\u94ae\u53ef\u4ece\u83dc\u5355\u4e2d\u5feb\u901f\u9009\u62e9\u5e74\u4efd\u6216\u6708\u4efd";Calendar._TT.ABOUT_TIME="\n\n\u9009\u62e9\u65f6\u95f4:\n- \u70b9\u51fb\u5c0f\u65f6\u6216\u5206\u949f\u53ef\u4f7f\u6539\u6570\u503c\u52a0\u4e00\n- \u6309\u4f4fShift\u952e\u70b9\u51fb\u5c0f\u65f6\u6216\u5206\u949f\u53ef\u4f7f\u6539\u6570\u503c\u51cf\u4e00\n- \u70b9\u51fb\u62d6\u52a8\u9f20\u6807\u53ef\u8fdb\u884c\u5feb\u901f\u9009\u62e9";Calendar._TT.PREV_YEAR="\u4e0a\u4e00\u5e74 (\u6309\u4f4f\u51fa\u83dc\u5355)";Calendar._TT.PREV_MONTH="\u4e0a\u4e00\u6708 (\u6309\u4f4f\u51fa\u83dc\u5355)";Calendar._TT.GO_TODAY="\u8f6c\u5230\u4eca\u65e5";Calendar._TT.NEXT_MONTH="\u4e0b\u4e00\u6708 (\u6309\u4f4f\u51fa\u83dc\u5355)";Calendar._TT.NEXT_YEAR="\u4e0b\u4e00\u5e74 (\u6309\u4f4f\u51fa\u83dc\u5355)";Calendar._TT.SEL_DATE="\u9009\u62e9\u65e5\u671f";Calendar._TT.DRAG_TO_MOVE="\u62d6\u52a8";Calendar._TT.PART_TODAY=" (\u4eca\u65e5)";Calendar._TT.DAY_FIRST="\u6700\u5de6\u8fb9\u663e\u793a%s";Calendar._TT.WEEKEND="0,6";Calendar._TT.CLOSE="\u5173\u95ed";Calendar._TT.TODAY="\u4eca\u65e5";Calendar._TT.TIME_PART="(Shift-)\u70b9\u51fb\u9f20\u6807\u6216\u62d6\u52a8\u6539\u53d8\u503c";Calendar._TT.DEF_DATE_FORMAT="%Y-%m-%d";Calendar._TT.TT_DATE_FORMAT="%A, %b %e\u65e5";Calendar._TT.WK="\u5468";Calendar._TT.TIME="\u65f6\u95f4:";

/* 按需加载js和css */
(function($){$.extend({ImportBasePath:'',fileinfo:function(data){data=data.replace(/^\s|\s$/g,"");var m;if(/\.\w+$/.test(data)){m=data.match(/([^\/\\]+)\.(\w+)$/);if(m){if(m[2]=='js'){return{filename:m[1],ext:m[2],tag:'script'}}else if(m[2]=='css'){return{filename:m[1],ext:m[2],tag:'link'}}else{return{filename:m[1],ext:m[2],tag:null}}}else{return{filename:null,ext:null}}}else{m=data.match(/([^\/\\]+)$/);if(m){return{filename:m[1],ext:null,tag:null}}else{return{filename:null,ext:null,tag:null}}}},fileExist:function(filename,filetype,attrCheck){var elementsArray=document.getElementsByTagName(filetype);for(var i=0;i<elementsArray.length;i++){if(elementsArray[i].getAttribute(attrCheck)==$.ImportBasePath+filename){return true}}return false},createElement:function(filename,filetype){switch(filetype){case'script':if(!$.fileExist(filename,filetype,'src')){var scriptTag=document.createElement(filetype);scriptTag.setAttribute('language','javascript');scriptTag.setAttribute('type','text/javascript');scriptTag.setAttribute('src',$.ImportBasePath+filename);return scriptTag}else{return false}break;case'link':if(!$.fileExist(filename,filetype,'href')){var styleTag=document.createElement(filetype);styleTag.setAttribute('type','text/css');styleTag.setAttribute('rel','stylesheet');styleTag.setAttribute('href',$.ImportBasePath+filename);return styleTag}else{return false}break;default:return false;break}},cssReady:function(index,callback){function check(){if(document.styleSheets[index]){if(typeof callback=='function'){callback()}window.clearInterval(checkInterval)}}var checkInterval=window.setInterval(check,200)},include:function(file,callback){var headerTag=document.getElementsByTagName('head')[0];var fileArray=[];typeof file=='string'?fileArray[0]=file:fileArray=file;for(var i=0;i<fileArray.length;i++){var elementTag=$.fileinfo(fileArray[i]).tag;var el=[];if(elementTag!==null){el[i]=$.createElement(fileArray[i],elementTag);if(el[i]){headerTag.appendChild(el[i]);if($.browser.msie){el[i].onreadystatechange=function(){if(this.readyState==='loaded'||this.readyState==='complete'){if(typeof callback=='function'){callback()}}}}else{if(elementTag=='link'){$.cssReady(i,callback)}else{el[i].onload=function(){if(typeof callback=='function'){callback()}}}}}}else{return false}}}})})(jQuery);

//DOMWindow
(function(a){a.fn.closeDOMWindow=function(b){if(!b){b={}}var c=function(d){if(b.anchoredClassName){var f=a("."+b.anchoredClassName);f.fadeOut("fast",function(){if(a.fn.draggable){f.draggable("destory").trigger("unload").remove()}else{f.trigger("unload").remove()}});if(b.functionCallOnClose){b.functionCallAfterClose()}}else{var e=a("#DOMWindowOverlay");var g=a("#DOMWindow");e.fadeOut("fast",function(){e.trigger("unload").unbind().remove()});g.fadeOut("fast",function(){if(a.fn.draggable){g.draggable("destroy").trigger("unload").remove()}else{g.trigger("unload").remove()}});a(window).unbind("scroll.DOMWindow");a(window).unbind("resize.DOMWindow");if(a.fn.openDOMWindow.isIE6){a("#DOMWindowIE6FixIframe").remove()}if(b.functionCallOnClose){b.functionCallAfterClose()}}};if(b.eventType){return this.each(function(d){a(this).bind(b.eventType,function(){c(this);return false})})}else{c()}};a.closeDOMWindow=function(b){a.fn.closeDOMWindow(b)};a.fn.openDOMWindow=function(c){var f=a.fn.openDOMWindow;f.defaultsSettings={anchoredClassName:"",anchoredSelector:"",borderColor:"#ccc",borderSize:"4",draggable:0,eventType:null,fixedWindowY:100,functionCallOnOpen:null,functionCallOnClose:null,height:500,loader:0,loaderHeight:0,loaderImagePath:"",loaderWidth:0,modal:0,overlay:1,overlayColor:"#000",overlayOpacity:"85",positionLeft:0,positionTop:0,positionType:"centered",width:500,windowBGColor:"#fff",windowBGImage:null,windowHTTPType:"get",windowPadding:10,windowSource:"inline",windowSourceID:"",windowSourceURL:"",windowSourceAttrURL:"href"};var e=a.extend({},a.fn.openDOMWindow.defaultsSettings,c||{});f.viewPortHeight=function(){return self.innerHeight||document.documentElement.clientHeight||document.body.clientHeight};f.viewPortWidth=function(){return self.innerWidth||document.documentElement.clientWidth||document.body.clientWidth};f.scrollOffsetHeight=function(){return self.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop};f.scrollOffsetWidth=function(){return self.pageXOffset||document.documentElement.scrollLeft||document.body.scrollLeft};f.isIE6=typeof document.body.style.maxHeight==="undefined";var j=function(){var n=a("#DOMWindowOverlay");if(f.isIE6){var o=document.documentElement.offsetHeight+document.documentElement.scrollTop-4;var m=document.documentElement.offsetWidth-21;n.css({height:o+"px",width:m+"px"})}else{n.css({height:"100%",width:"100%",position:"fixed"})}};var h=function(){var n=document.documentElement.offsetHeight+document.documentElement.scrollTop-4;var m=document.documentElement.offsetWidth-21;a("#DOMWindowIE6FixIframe").css({height:n+"px",width:m+"px"})};var k=function(){var m=a("#DOMWindow");if(e.height+50>f.viewPortHeight()){m.css("left",Math.round(f.viewPortWidth()/2)+f.scrollOffsetWidth()-Math.round((m.outerWidth())/2))}else{m.css("left",Math.round(f.viewPortWidth()/2)+f.scrollOffsetWidth()-Math.round((m.outerWidth())/2));m.css("top",Math.round(f.viewPortHeight()/2)+f.scrollOffsetHeight()-Math.round((m.outerHeight())/2))}};var b=function(){var m=a("#DOMWindowLoader");if(f.isIE6){m.css({left:Math.round(f.viewPortWidth()/2)+f.scrollOffsetWidth()-Math.round((m.innerWidth())/2),position:"absolute"});m.css({top:Math.round(f.viewPortHeight()/2)+f.scrollOffsetHeight()-Math.round((m.innerHeight())/2),position:"absolute"})}else{m.css({left:"50%",top:"50%",position:"fixed"})}};var l=function(){var m=a("#DOMWindow");m.css("left",e.positionLeft+f.scrollOffsetWidth());m.css("top",+e.positionTop+f.scrollOffsetHeight())};var i=function(m){if(arguments[0]){a("."+m+" #DOMWindowLoader").remove();a("."+m+" #DOMWindowContent").fadeIn("fast",function(){if(e.functionCallOnOpen){e.functionCallOnOpen()}});a("."+m+".closeDOMWindow").click(function(){a.closeDOMWindow();return false})}else{a("#DOMWindowLoader").remove();a("#DOMWindow").fadeIn("fast",function(){if(e.functionCallOnOpen){e.functionCallOnOpen()}});a("#DOMWindow .closeDOMWindow").click(function(){a.closeDOMWindow();return false})}};var g=function(m){var n={};m.replace(/b([^&=]*)=([^&=]*)b/g,function(o,p,q){if(typeof n[p]!="undefined"){n[p]+=","+q}else{n[p]=q}});return n};var d=function(n){e.windowSourceID=a(n).attr("href")||e.windowSourceID;e.windowSourceURL=a(n).attr(e.windowSourceAttrURL)||e.windowSourceURL;e.windowBGImage=e.windowBGImage?"background-image:url("+e.windowBGImage+")":"";var s,q;if(e.positionType=="anchored"){var r=a(e.anchoredSelector).position();var o=r.left+e.positionLeft;var m=r.top+e.positionTop;a("body").append('<div class="'+e.anchoredClassName+'" style="'+e.windowBGImage+";background-repeat:no-repeat;padding:"+e.windowPadding+"px;overflow:auto;position:absolute;top:"+m+"px;left:"+o+"px;height:"+e.height+"px;width:"+e.width+"px;background-color:"+e.windowBGColor+";border:"+e.borderSize+"px solid "+e.borderColor+';z-index:10001"><div id="DOMWindowContent" style="display:none"></div></div>');if(e.loader&&e.loaderImagePath!==""){a("."+e.anchoredClassName).append('<div id="DOMWindowLoader" style="width:'+e.loaderWidth+"px;height:"+e.loaderHeight+'px;"><img src="'+e.loaderImagePath+'" /></div>')}if(a.fn.draggable){if(e.draggable){a("."+e.anchoredClassName).draggable({cursor:"move"})}}switch(e.windowSource){case"inline":a("."+e.anchoredClassName+" #DOMWindowContent").append(a(e.windowSourceID).children());a("."+e.anchoredClassName).unload(function(){a("."+e.windowSourceID).append(a("."+e.anchoredClassName+" #DOMWindowContent").children())});i(e.anchoredClassName);break;case"iframe":a("."+e.anchoredClassName+" #DOMWindowContent").append('<iframe frameborder="0" hspace="0" wspace="0" src="'+e.windowSourceURL+'" name="DOMWindowIframe'+Math.round(Math.random()*1000)+'" style="width:100%;height:100%;border:none;background-color:#fff;" class="'+e.anchoredClassName+'Iframe" ></iframe>');a("."+e.anchoredClassName+"Iframe").load(i(e.anchoredClassName));break;case"ajax":if(e.windowHTTPType=="post"){if(e.windowSourceURL.indexOf("?")!==-1){s=e.windowSourceURL.substr(0,e.windowSourceURL.indexOf("?"));q=g(e.windowSourceURL)}else{s=e.windowSourceURL;q={}}a("."+e.anchoredClassName+" #DOMWindowContent").load(s,q,function(){i(e.anchoredClassName)})}else{if(e.windowSourceURL.indexOf("?")==-1){e.windowSourceURL+="?"}a("."+e.anchoredClassName+" #DOMWindowContent").load(e.windowSourceURL+"&random="+(new Date().getTime()),function(){i(e.anchoredClassName)})}break}}else{if(e.overlay){a("body").append('<div id="DOMWindowOverlay" style="z-index:10000;display:none;position:absolute;top:0;left:0;background-color:'+e.overlayColor+";filter:alpha(opacity="+e.overlayOpacity+");-moz-opacity: 0."+e.overlayOpacity+";opacity: 0."+e.overlayOpacity+';"></div>');if(f.isIE6){a("body").append('<iframe id="DOMWindowIE6FixIframe"  src="blank.html"  style="width:100%;height:100%;z-index:9999;position:absolute;top:0;left:0;filter:alpha(opacity=0);"></iframe>');h()}j();var p=a("#DOMWindowOverlay");p.fadeIn("fast");if(!e.modal){p.click(function(){a.closeDOMWindow()})}}if(e.loader&&e.loaderImagePath!==""){a("body").append('<div id="DOMWindowLoader" style="z-index:10002;width:'+e.loaderWidth+"px;height:"+e.loaderHeight+'px;"><img src="'+e.loaderImagePath+'" /></div>');b()}a("body").append('<div id="DOMWindow" style="background-repeat:no-repeat;'+e.windowBGImage+";overflow:auto;padding:"+e.windowPadding+"px;display:none;height:"+e.height+"px;width:"+e.width+"px;background-color:"+e.windowBGColor+";border:"+e.borderSize+"px solid "+e.borderColor+'; position:absolute;z-index:10001"></div>');var t=a("#DOMWindow");switch(e.positionType){case"centered":k();if(e.height+50>f.viewPortHeight()){t.css("top",(e.fixedWindowY+f.scrollOffsetHeight())+"px")}break;case"absolute":t.css({top:(e.positionTop+f.scrollOffsetHeight())+"px",left:(e.positionLeft+f.scrollOffsetWidth())+"px"});if(a.fn.draggable){if(e.draggable){t.draggable({cursor:"move"})}}break;case"fixed":l();break;case"anchoredSingleWindow":var r=a(e.anchoredSelector).position();var o=r.left+e.positionLeft;var m=r.top+e.positionTop;t.css({top:m+"px",left:o+"px"});break}a(window).bind("scroll.DOMWindow",function(){if(e.overlay){j()}if(f.isIE6){h()}if(e.positionType=="centered"){k()}if(e.positionType=="fixed"){l()}});a(window).bind("resize.DOMWindow",function(){if(f.isIE6){h()}if(e.overlay){j()}if(e.positionType=="centered"){k()}});switch(e.windowSource){case"inline":t.append(a(e.windowSourceID).children());t.unload(function(){a(e.windowSourceID).append(t.children())});i();break;case"iframe":t.append('<iframe frameborder="0" hspace="0" wspace="0" src="'+e.windowSourceURL+'" name="DOMWindowIframe'+Math.round(Math.random()*1000)+'" style="width:100%;height:100%;border:none;background-color:#fff;" id="DOMWindowIframe" ></iframe>');a("#DOMWindowIframe").load(i());break;case"ajax":if(e.windowHTTPType=="post"){if(e.windowSourceURL.indexOf("?")!==-1){s=e.windowSourceURL.substr(0,e.windowSourceURL.indexOf("?"));q=g(e.windowSourceURL)}else{s=e.windowSourceURL;q={}}t.load(s,q,function(){i()})}else{if(e.windowSourceURL.indexOf("?")==-1){e.windowSourceURL+="?"}t.load(e.windowSourceURL+"&random="+(new Date().getTime()),function(){i()})}break}}};if(e.eventType){return this.each(function(m){a(this).bind(e.eventType,function(){d(this);return false})})}else{d()}};a.openDOMWindow=function(b){a.fn.openDOMWindow(b)}})(jQuery);


var tb_pathToImage = "images/loading_animation.gif";

eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(o).2S(9(){1u(\'a.18, 3n.18, 3i.18\');1w=1p 1t();1w.L=2H});9 1u(b){$(b).s(9(){6 t=X.Q||X.1v||M;6 a=X.u||X.23;6 g=X.1N||P;19(t,a,g);X.2E();H P})}9 19(d,f,g){3m{3(2t o.v.J.2i==="2g"){$("v","11").r({A:"28%",z:"28%"});$("11").r("22","2Z");3(o.1Y("1F")===M){$("v").q("<U 5=\'1F\'></U><4 5=\'B\'></4><4 5=\'8\'></4>");$("#B").s(G)}}n{3(o.1Y("B")===M){$("v").q("<4 5=\'B\'></4><4 5=\'8\'></4>");$("#B").s(G)}}3(1K()){$("#B").1J("2B")}n{$("#B").1J("2z")}3(d===M){d=""}$("v").q("<4 5=\'K\'><1I L=\'"+1w.L+"\' /></4>");$(\'#K\').2y();6 h;3(f.O("?")!==-1){h=f.3l(0,f.O("?"))}n{h=f}6 i=/\\.2s$|\\.2q$|\\.2m$|\\.2l$|\\.2k$/;6 j=h.1C().2h(i);3(j==\'.2s\'||j==\'.2q\'||j==\'.2m\'||j==\'.2l\'||j==\'.2k\'){1D="";1G="";14="";1z="";1x="";R="";1n="";1r=P;3(g){E=$("a[@1N="+g+"]").36();25(D=0;((D<E.1c)&&(R===""));D++){6 k=E[D].u.1C().2h(i);3(!(E[D].u==f)){3(1r){1z=E[D].Q;1x=E[D].u;R="<1e 5=\'1X\'>&1d;&1d;<a u=\'#\'>2T &2R;</a></1e>"}n{1D=E[D].Q;1G=E[D].u;14="<1e 5=\'1U\'>&1d;&1d;<a u=\'#\'>&2O; 2N</a></1e>"}}n{1r=1b;1n="1t "+(D+1)+" 2L "+(E.1c)}}}S=1p 1t();S.1g=9(){S.1g=M;6 a=2x();6 x=a[0]-1M;6 y=a[1]-1M;6 b=S.z;6 c=S.A;3(b>x){c=c*(x/b);b=x;3(c>y){b=b*(y/c);c=y}}n 3(c>y){b=b*(y/c);c=y;3(b>x){c=c*(x/b);b=x}}13=b+30;1a=c+2G;$("#8").q("<a u=\'\' 5=\'1L\' Q=\'1o\'><1I 5=\'2F\' L=\'"+f+"\' z=\'"+b+"\' A=\'"+c+"\' 23=\'"+d+"\'/></a>"+"<4 5=\'2D\'>"+d+"<4 5=\'2C\'>"+1n+14+R+"</4></4><4 5=\'2A\'><a u=\'#\' 5=\'Z\' Q=\'1o\'>1l</a> 1k 1j 1s</4>");$("#Z").s(G);3(!(14==="")){9 12(){3($(o).N("s",12)){$(o).N("s",12)}$("#8").C();$("v").q("<4 5=\'8\'></4>");19(1D,1G,g);H P}$("#1U").s(12)}3(!(R==="")){9 1i(){$("#8").C();$("v").q("<4 5=\'8\'></4>");19(1z,1x,g);H P}$("#1X").s(1i)}o.1h=9(e){3(e==M){I=2w.2v}n{I=e.2u}3(I==27){G()}n 3(I==3k){3(!(R=="")){o.1h="";1i()}}n 3(I==3j){3(!(14=="")){o.1h="";12()}}};16();$("#K").C();$("#1L").s(G);$("#8").r({Y:"T"})};S.L=f}n{6 l=f.2r(/^[^\\?]+\\??/,\'\');6 m=2p(l);13=(m[\'z\']*1)+30||3h;1a=(m[\'A\']*1)+3g||3f;W=13-30;V=1a-3e;3(f.O(\'2j\')!=-1){1E=f.1B(\'3d\');$("#15").C();3(m[\'1A\']!="1b"){$("#8").q("<4 5=\'2f\'><4 5=\'1H\'>"+d+"</4><4 5=\'2e\'><a u=\'#\' 5=\'Z\' Q=\'1o\'>1l</a> 1k 1j 1s</4></4><U 1W=\'0\' 2d=\'0\' L=\'"+1E[0]+"\' 5=\'15\' 1v=\'15"+1f.2c(1f.1y()*2b)+"\' 1g=\'1m()\' J=\'z:"+(W+29)+"p;A:"+(V+17)+"p;\' > </U>")}n{$("#B").N();$("#8").q("<U 1W=\'0\' 2d=\'0\' L=\'"+1E[0]+"\' 5=\'15\' 1v=\'15"+1f.2c(1f.1y()*2b)+"\' 1g=\'1m()\' J=\'z:"+(W+29)+"p;A:"+(V+17)+"p;\'> </U>")}}n{3($("#8").r("Y")!="T"){3(m[\'1A\']!="1b"){$("#8").q("<4 5=\'2f\'><4 5=\'1H\'>"+d+"</4><4 5=\'2e\'><a u=\'#\' 5=\'Z\'>1l</a> 1k 1j 1s</4></4><4 5=\'F\' J=\'z:"+W+"p;A:"+V+"p\'></4>")}n{$("#B").N();$("#8").q("<4 5=\'F\' 3c=\'3b\' J=\'z:"+W+"p;A:"+V+"p;\'></4>")}}n{$("#F")[0].J.z=W+"p";$("#F")[0].J.A=V+"p";$("#F")[0].3a=0;$("#1H").11(d)}}$("#Z").s(G);3(f.O(\'37\')!=-1){$("#F").q($(\'#\'+m[\'26\']).1T());$("#8").24(9(){$(\'#\'+m[\'26\']).q($("#F").1T())});16();$("#K").C();$("#8").r({Y:"T"})}n 3(f.O(\'2j\')!=-1){16();3($.1q.35){$("#K").C();$("#8").r({Y:"T"})}}n{$("#F").34(f+="&1y="+(1p 33().32()),9(){16();$("#K").C();1u("#F a.18");$("#8").r({Y:"T"})})}}3(!m[\'1A\']){o.21=9(e){3(e==M){I=2w.2v}n{I=e.2u}3(I==27){G()}}}}31(e){}}9 1m(){$("#K").C();$("#8").r({Y:"T"})}9 G(){$("#2Y").N("s");$("#Z").N("s");$("#8").2X("2W",9(){$(\'#8,#B,#1F\').2V("24").N().C()});$("#K").C();3(2t o.v.J.2i=="2g"){$("v","11").r({A:"1Z",z:"1Z"});$("11").r("22","")}o.1h="";o.21="";H P}9 16(){$("#8").r({2U:\'-\'+20((13/2),10)+\'p\',z:13+\'p\'});3(!(1V.1q.2Q&&1V.1q.2P<7)){$("#8").r({38:\'-\'+20((1a/2),10)+\'p\'})}}9 2p(a){6 b={};3(!a){H b}6 c=a.1B(/[;&]/);25(6 i=0;i<c.1c;i++){6 d=c[i].1B(\'=\');3(!d||d.1c!=2){39}6 e=2a(d[0]);6 f=2a(d[1]);f=f.2r(/\\+/g,\' \');b[e]=f}H b}9 2x(){6 a=o.2M;6 w=1S.2o||1R.2o||(a&&a.1Q)||o.v.1Q;6 h=1S.1P||1R.1P||(a&&a.2n)||o.v.2n;1O=[w,h];H 1O}9 1K(){6 a=2K.2J.1C();3(a.O(\'2I\')!=-1&&a.O(\'3o\')!=-1){H 1b}}',62,211,'|||if|div|id|var||TB_window|function||||||||||||||else|document|px|append|css|click||href|body||||width|height|TB_overlay|remove|TB_Counter|TB_TempArray|TB_ajaxContent|tb_remove|return|keycode|style|TB_load|src|null|unbind|indexOf|false|title|TB_NextHTML|imgPreloader|block|iframe|ajaxContentH|ajaxContentW|this|display|TB_closeWindowButton||html|goPrev|TB_WIDTH|TB_PrevHTML|TB_iframeContent|tb_position||thickbox|tb_show|TB_HEIGHT|true|length|nbsp|span|Math|onload|onkeydown|goNext|Esc|or|close|tb_showIframe|TB_imageCount|Close|new|browser|TB_FoundURL|Key|Image|tb_init|name|imgLoader|TB_NextURL|random|TB_NextCaption|modal|split|toLowerCase|TB_PrevCaption|urlNoQuery|TB_HideSelect|TB_PrevURL|TB_ajaxWindowTitle|img|addClass|tb_detectMacXFF|TB_ImageOff|150|rel|arrayPageSize|innerHeight|clientWidth|self|window|children|TB_prev|jQuery|frameborder|TB_next|getElementById|auto|parseInt|onkeyup|overflow|alt|unload|for|inlineId||100||unescape|1000|round|hspace|TB_closeAjaxWindow|TB_title|undefined|match|maxHeight|TB_iframe|bmp|gif|png|clientHeight|innerWidth|tb_parseQuery|jpeg|replace|jpg|typeof|which|keyCode|event|tb_getPageSize|show|TB_overlayBG|TB_closeWindow|TB_overlayMacFFBGHack|TB_secondLine|TB_caption|blur|TB_Image|60|tb_pathToImage|mac|userAgent|navigator|of|documentElement|Prev|lt|version|msie|gt|ready|Next|marginLeft|trigger|fast|fadeOut|TB_imageOff|hidden||catch|getTime|Date|load|safari|get|TB_inline|marginTop|continue|scrollTop|TB_modal|class|TB_|45|440|40|630|input|188|190|substr|try|area|firefox'.split('|'),0,{}));




/*公共前后台数据*/
var sys_exploer = navigator.appName == "Microsoft Internet Explorer" ? "IE" : "FF";
var str_right = '<span style="color:darkblue;">&#8730;</span>';
var str_wrong = '<span style="color:darkred;">&#215;</span>';
var doc_type = (document.documentElement) ? document.documentElement : document.body;

/*通过JS生成URL信息，仅限动态数据*/
function get_url(cfd,extend)
{
	if(!base_url || !base_ctrl || !base_func || !base_dir)
	{
		return false;
	}
	if(!cfd || cfd == "undefined")
	{
		return base_url;
	}
	var url = base_file + "?";
	var array = cfd.split(",");
	if(array[0] && array[0] != "undefined")
	{
		url += base_ctrl + "=" + encode_utf8(array[0]) + "&";
	}
	if(array[1] && array[1] != "undefined")
	{
		url += base_func + "=" + encode_utf8(array[1]) + "&";
	}
	if(array[2] && array[2] != "undefined")
	{
		url += base_dir + "=" + encode_utf8(array[2]) + "&";
	}
	if(extend && extend != "undefined")
	{
		url += extend + "&";
	}
	return url;
}

//使用短函数getid替代 document.getElementById
function getid(id)
{
	return document.getElementById(id);
}

function getform(formid,id)
{
	if(!formid || formid == "undefined")
	{
		formid = "form";
	}
	return document.forms[formid].elements[id];
}

//预加载图片
function img_load(url,id)
{
	getid(id).src= url;
}

function js_load(url)
{
	$.include(url);
}

//定义跳转网址
//参数 url 要跳转的网址 frameid要跳转到的框架ID isparent是否是父级框架
function direct(url,frameid,isparent)
{
	url = url.replace(/&amp;/g,"&");
	if(!isparent || isparent == "" || isparent == "undefined")
	{
		if(frameid)
		{
			window.frames[frameid].location.href = url;
		}
		else
		{
			window.location.href=url;
		}
	}
	else
	{
		if(!frameid || frameid == "" || frameid == "undefined")
		{
			parent.window.location.href = url;
		}
		else
		{
			window.parent.frames[frameid].location.href = url;
		}
	}
}

//设定多长时间运行脚本
//参数 time 是时间单位是毫秒，为0时表示直接运行 大于0小于10毫秒将自动*1000
//参数 js 要运行的脚本
function eval_js(time,js)
{
	time = parseFloat(time);
	if(time < 0.01)
	{
		eval(js);
	}
	else
	{
		if(time < 10)
		{
			time = time*1000;
		}
		window.setTimeout(js,time);
	}
}

//编码网址
function url_encode(str)
{
	return transform(str);
}

function transform(s)
{
	var hex=''
	var i,j,t

	j=0
	for (i=0; i<s.length; i++)
	{
		t = hexfromdec( s.charCodeAt(i) );
		if (t=='25')
		{
			t='';
		}
		hex += '%' + t;
	}
	return hex;
}

function hexfromdec(num)
{
	if (num > 65535)
	{
		return ("err!");
	}
	first = Math.round(num/4096 - .5);
	temp1 = num - first * 4096;
	second = Math.round(temp1/256 -.5);
	temp2 = temp1 - second * 256;
	third = Math.round(temp2/16 - .5);
	fourth = temp2 - third * 16;
	return (""+getletter(third)+getletter(fourth));
}

function getletter(num) 
{
	if (num < 10) 
	{
		return num;
	}
	else
	{
		if (num == 10) { return "A" }
		if (num == 11) { return "B" }
		if (num == 12) { return "C" }
		if (num == 13) { return "D" }
		if (num == 14) { return "E" }
		if (num == 15) { return "F" }
	}
}

/*取得当前网址所在的目录，仅限后台*/
function site_url()
{
	var siteurl = window.location.href;
	//去除?后面的相关参数
	siteurl = siteurl.substring(7,siteurl.indexOf("?"));
	//切分 / 符号
	var sitearray = siteurl.split("/");
	var newurl = "http://";
	for(var i=0;i<(sitearray.length-1);i++)
	{
		newurl += sitearray[i]+"/";
	}
	return newurl;
}

/*Cookie管理*/
function get_cookie(name)
{
	var cookieValue = "";
	var search = name + "=";
	if(document.cookie.length > 0)
	{
		offset = document.cookie.indexOf(search);
		if (offset != -1)
		{
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1)
			{
				end = document.cookie.length;
			}
			cookieValue = unescape(document.cookie.substring(offset, end));
		}
	}
	return cookieValue;
}

function set_cookie(cookieName,cookieValue,DayValue)
{
	var expire = "";
	var day_value=1;
	if(DayValue!=null)
	{
		day_value=DayValue;
	}
    expire = new Date((new Date()).getTime() + day_value * 86400000);
    expire = "; expires=" + expire.toGMTString();
	document.cookie = cookieName + "=" + escape(cookieValue) +";path=/"+ expire;
}

function del_cookie(cookieName)
{
	var expire = "";
    expire = new Date((new Date()).getTime() - 1 );
    expire = "; expires=" + expire.toGMTString();
	document.cookie = cookieName + "=" + escape("") +";path=/"+ expire;
}

//关闭浏览器错误调试错误
function kill_error()
{
	return true;
}

//去除数组中重复的值
Array.prototype.unique = function()
{
	var a = {};
	var len = this.length;
	for(var i=0; i<len; i++)
	{
		if(typeof a[this[i]] == "undefined")
		a[this[i]] = 1;
	}
	this.length = 0;
	for(var i in a)
	{
		this[this.length] = i;
	}
	return this;
}

//合并字符串
function join_str(str1,str2)
{
	if(str1 == "" && str2 == "" ) return false;
	if(str1 == "") return str2;
	if(str2 == "") return str1;
	var string = str1 + "," +str2;
	var array = string.split(",");
	array = $.unique(array);
	var string = array.join(",");
	return string ? string : false;
}

function encode_utf8(str)
{
	return EncodeUtf8(str);
}

function EncodeUtf8(s1)
{
	var s = escape(s1);
	var sa = s.split("%");
	var retV ="";
	if(sa[0] != "")
	{
		retV = sa[0];
	}
	for(var i = 1; i < sa.length; i ++)
	{
		if(sa[i].substring(0,1) == "u")
		{
			retV += Hex2Utf8(Str2Hex(sa[i].substring(1,5)));
			if(sa[i].length>5)
			{
				retV += sa[i].substring(5);
			}
		}
		else
		{
			retV += "%" + sa[i];
		}
	}
	return retV;
}
function Str2Hex(s)
{
	var c = "";
	var n;
	var ss = "0123456789ABCDEF";
	var digS = "";
	for(var i = 0; i < s.length; i ++)
	{
		c = s.charAt(i);
		n = ss.indexOf(c);
		digS += Dec2Dig(eval(n));
	}
	return digS;
}
function Dec2Dig(n1)
{
	var s = "";
	var n2 = 0;
	for(var i = 0; i < 4; i++)
	{
		n2 = Math.pow(2,3 - i);
		if(n1 >= n2)
		{
			s += '1';
			n1 = n1 - n2;
		}
		else
		{
			s += '0';
		}
	}
	return s;
}
function Dig2Dec(s)
{
	var retV = 0;
	if(s.length == 4)
	{
		for(var i = 0; i < 4; i ++)
		{
			retV += eval(s.charAt(i)) * Math.pow(2, 3 - i);
		}
		return retV;
	}
	return -1;
}
function Hex2Utf8(s)
{
	var retS = "";
	var tempS = "";
	var ss = "";
	if(s.length == 16)
	{
		tempS = "1110" + s.substring(0, 4);
		tempS += "10" +  s.substring(4, 10);
		tempS += "10" + s.substring(10,16);
		var sss = "0123456789ABCDEF";
		for(var i = 0; i < 3; i ++)
		{
			retS += "%";
			ss = tempS.substring(i * 8, (eval(i)+1)*8);
			retS += sss.charAt(Dig2Dec(ss.substring(0,4)));
			retS += sss.charAt(Dig2Dec(ss.substring(4,8)));
		}
		return retS;
	}
	return "";
}

var Layer=
{
	init:function(url,divw,divh)
	{
		var divw = $(window).width() * 0.7;
		var divh = $(window).height() * 0.8;
		if(divw<560) divw = 560;
		if(divh<450) divh = 450;
		//var divw = divw>= 950 ? 950 : divw;
		//var divh = (divh>=500 || divh<50) ? 450 : divh;
		$.openDOMWindow({
			height:divh,
			width:divw,
			windowSourceURL:url,
			windowSource:'iframe',
			windowPadding:0
		});
		return true;
	},
	inline:function(divid,divw,divh)
	{
		$.openDOMWindow({
			height:divh,
			width:divw,
			windowSource:'inline',
			windowSourceID:"#"+divid
		});
		return true;
	},
	over:function()
	{
		$.closeDOMWindow();
	}
}


function select_all(id)
{
	var t = id && id != "undefined" ? $("#"+id+" input[type*=checkbox]") : $("input[type*=checkbox]");
	t.each(function(){$(this).attr("checked",true);});
}

function select_not_all(id)
{
	var t = id && id != "undefined" ? $("#"+id+" input[type*=checkbox]") : $("input[type*=checkbox]");
	var num = 0;
	t.each(function(){
		if($(this).attr("checked") != true && num<5)
		{
			$(this).attr("checked",true);
			num++;
		}
	});
}


function select_none(id)
{
	var t = id && id != "undefined" ? $("#"+id+" input[type*=checkbox]") : $("input[type*=checkbox]");
	t.each(function(){$(this).attr("checked",false);});
}

function select_anti(id)
{
	var t = id && id != "undefined" ? $("#"+id+" input[type*=checkbox]") : $("input[type*=checkbox]");
	t.each(function(){if($(this).attr("checked") == true){$(this).attr("checked",false);}else{$(this).attr("checked",true);}});
}

function join_checkbox(id,type)
{
	var cv = id && id != "undefined" ? $("#"+id+" input[type*=checkbox]") : $("input[type*=checkbox]");
	var idarray = new Array();
	var m = 0;
	cv.each(function()
	{
		if(type == "all"){idarray[m] = $(this).val();m++;}
		else if(type == "unchecked")
		{
			if($(this).attr("checked") == false){idarray[m] = $(this).val();m++;}
		}
		else
		{
			if($(this).attr("checked") == true){idarray[m] = $(this).val();m++;}
		}
	});
	var tid = idarray.join(",");
	return tid;
}

/* jQuery Ajax */
function get_ajax(turl,ajax_func,ext)
{
	turl = turl.replace(/&amp;/g,"&");
	if(ajax_func && ajax_func != "undefined")
	{
		$.ajax({url:turl,cache:false,success:function(rs){ajax_func(rs,ext)}});
	}
	else
	{
		return $.ajax({url:turl,cache:false,async:false}).responseText;
	}
}

function over_tr(v){v.className = "tr_over";}
function out_tr(v){v.className = "tr_out";}


//多功能播放器JS代码，支持swf,wma,wmv,mp3,mp4,mpg,rm,rmvb,mpg,mpeg等多种播放代码
var Media =
{
	init:function(url,width,height,image)
	{
		if(url)
		{
			var tmp_u = url.substr(0,7);
			tmp_u = tmp_u.toLowerCase();
			if(tmp_u != "http://" && tmp_u != "https:/")
			{
				url = site_url() + url;
			}
		}
		Media.url = url ? url : "";
		Media.width = width ? width : "400px";
		Media.height = height ? height : "45px";
		if(image && image != "undefined")
		{
			Media.image = image;
		}
		//分析文件类型
		return Media.Analysis();
	},
	Analysis:function()
	{
		var url = Media.url;
		if(!url)
		{
			return false;
		}
		//常用的播放器类型
		var linktype = new Array();
		//使用 windows media
		linktype['wma'] = 'wmp';
		linktype['mp3'] = 'wmp';
		linktype['wmv'] = 'wmp';
		linktype['asf'] = 'wmp';
		linktype['mpg'] = 'wmp';
		linktype['mpeg'] = 'wmp';
		linktype['avi'] = 'wmp';
		linktype['asx'] = 'wmp';
		linktype['dat'] = 'wmp';

		//使用 real media 
		linktype['rm'] = 'real';
		linktype['rmvb'] = 'real';
		linktype['ram'] = 'real';
		linktype['ra'] = 'real';

		//使用 flash及flv
		linktype['swf'] = 'flash';
		linktype['flv'] = 'flv';
		//获取文件类型
		var start = url.lastIndexOf(".");
		var end = url.length;
		var type =url.substring(start+1,end);
		type=type.toLowerCase();
		var chk_radio = linktype[type];
		if(!chk_radio)
		{
			return false;
		}
		if(chk_radio == "flash")
		{
			return Media.Flash();
		}
		else if(chk_radio == "flv")
		{
			return Media.Flv();
		}
		else if(chk_radio == "real")
		{
			return Media.Real();
		}
		else if(chk_radio == "wmp")
		{
			return Media.Wmp();
		}
	},
	Flash:function()
	{
		var string = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+Media.width+"' height='"+Media.height+"'>";
		string += "<param name='movie' value='"+Media.url+"'>";
		string += "<param name='quality' value='high'>";
		string += "<embed src='"+Media.url+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+Media.width+"' height='"+Media.height+"'></embed>";
		string += "</object>";
		return string;
	},
	Flv:function()
	{
		var string = "<object type='application/x-shockwave-flash' data='libs/vcastr/vcastr.swf' width='"+Media.width+"' height='"+Media.height+"'>";
		string += "<param name='movie' value='libs/vcastr/vcastr.swf' />";
		string += "<param name='allowFullScreen' value='true' />";
		string += "<param name='FlashVars' value='xml={vcastr}{channel}{item}{source}"+Media.url+"{/source}{duration}{/duration}{title}{/title}{/item}{/channel}{config}{isAutoPlay}false{/isAutoPlay}{isLoadBegin}false{/isLoadBegin}{/config}{plugIns}{beginEndImagePlugIn}{url}libs/vcastr/image.swf{/url}{source}"+Media.image+"{/source}{type}beginend{/type}{scaletype}exactFil{/scaletype}{/beginEndImagePlugIn}{/plugIns}{/vcastr}'>";
		string += "</object>";
		return string;
	},
	Real:function()
	{
		var string = "<object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' width='"+Media.width+"' height='"+Media.height+"'>";
		string += "<param name='src' value='"+Media.url+"' />";
		string += "<param name='controls' value='Imagewindow' />";
		string += "<param name='console' value='clip1' />";
		string += "<param name='autostart' value='true' />";
		string += "<embed src='' type='audio/x-pn-realaudio-plugin' autostart='true' console='clip1' controls='Imagewindow' width='"+Media.width+"'height='"+Media.height+"' />";
		string += "</embed></object>";
		return string;
	},
	Wmp:function()
	{
		var string = "<object classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6' width='"+Media.width+"' height='"+Media.height+"'>";
		string += "<param name='url' value='"+Media.url+"' />";
		string += "<embed type='application/x-mplayer2' src='"+Media.url+"' width='"+Media.width+"' height='"+Media.height+"'></embed>";
		string += "</object>";
		return string;
	}
}

// 动态扩展字段中涉及到的JS信息

// 调用模块中的主题信息
function phpjs_module(input_id,input_val)
{
	var extend = "input="+input_id+"&id="+input_val;
	var url = get_url("subject,module",extend);
	Layer.init(url,550,400);
	return true;
}

function phpjs_module_clear(input_id)
{
	$("#"+input_id).attr("value","");
	$("#"+input_id+"_tmp_show").html("");
	return true;
}

function phpjs_viewmodule(id,tid)
{
	if(!id)
	{
		return false;
	}
	$("#"+tid).attr("value",id);
	var url = get_url('subject,ajax_module')+"id="+encode_utf8(id);
	get_ajax(url,_phpjs_viewmodule,tid);
}

function _phpjs_viewmodule(msg,tid)
{
	if(msg && msg != "error")
	{
		var array = $.evalJSON(msg);
		$("#"+tid).attr("value",array['id']);
		$("#"+tid+"_tmp_show").attr("value",array['title']);
		return true;
	}
}

/** 这一部分都是图片相关的JS操作 **/
//弹出图片选择器窗口
function phpjs_img(input_id,view_id)
{
	var extend = "type=img&input="+input_id+"&view="+view_id;
	var url = get_url("open",extend);
	Layer.init(url,550,400);
	return true;
}

//删除图片
function phpjs_clear_img(input_id,view_id)
{
	getid(input_id).value = "";
	getid(view_id).innerHTML = "<img src='images/nopic.gif' />";
	return true;
}

/****这一部分都是视频的操作******/
//弹出视频选择器
function phpjs_video(input_id,view_id)
{
	var extend = "type=video&input="+input_id+"&view="+view_id;
	var url = get_url("open",extend);
	Layer.init(url,550,400);
	return true;
}


//删除视频选择
function phpjs_clear_video(input_id,view_id)
{
	getid(input_id).value = "";
	getid(view_id).innerHTML = "";
	return true;
}


/** 这一部分是下载的操作 *****/
//弹出下载选择窗口
function phpjs_download(input_id,view_id)
{
	var extend = "type=download&input="+input_id+"&view="+view_id;
	var url = get_url("open",extend);
	Layer.init(url,550,400);
	return true;
}
//删除文件下载选择
function phpjs_clear_download(input_id,view_id)
{
	getid(input_id).value = "";
	getid(view_id).innerHTML = "";
	return true;
}

//预览窗口
function phpjs_preview(id,pretype)
{
	var extend = "id="+id+"&";
	if(pretype && pretype != "undefined")
	{
		extend += "pretype="+pretype+"&";
	}
	var url = get_url("open,preview",extend);
	Layer.init(url,550,400);
	return true;
}

//通过通过Ajax存储相关信息
function phpjs_parent_opt(val,id,fid,linkid)
{
	if(!id || id == "undefined" || !linkid || linkid == "undefined")
	{
		return false;
	}
	var extend = "fid="+fid+"&";
	extend += "identifier="+id+"&";
	extend += "linkid="+linkid+"&";
	getid(id).value = val;
	if(val && val != "undefined")
	{
		extend += "val="+EncodeUtf8(val)+"&";
	}
	var url = get_url("datalink,ajax_opt",extend);
	var msg = get_ajax(url);
	if(!msg)
	{
		alert("操作有误");
		return false;
	}
	var array = $.evalJSON(msg);
	if(array["error"])
	{
		getid("_opt_parent_"+id).innerHTML = array["error"];
		return true;
	}
	if(array["parent"] && array["parent"] != "undefined")
	{
		getid("_opt_parent_"+id).innerHTML = array["parent"];
	}
	if(array["son"] && array["son"] != "undefined")
	{
		getid("_opt_son_"+id).innerHTML = array["son"];
	}
	else
	{
		getid("_opt_son_"+id).innerHTML = "";
	}
	return true;
}

function phpjs_son_opt(val,id)
{
	getid(id).value = val;
	return true;
}

function phpjs_fck_page(id)
{
	$("#"+id)[0].xheditor.pasteHTML("[:page:]");
}


//Fck编辑器用到的JS，图片
function phpjs_fck_img(id)
{
	var extend = "fck_id="+id+"&type=img";
	var url = get_url("open,fck",extend);
	Layer.init(url,550,400);
	return true;
}
//Fck编辑器用到的JS，下载
function phpjs_fck_download(id)
{
	var extend = "fck_id="+id+"&type=download";
	var url = get_url("open,fck",extend);
	Layer.init(url,550,400);
	return true;
}
//Fck编辑器用到的JS，视频
function phpjs_fck_video(id)
{
	var extend = "fck_id="+id+"&type=video";
	var url = get_url("open,fck",extend);
	Layer.init(url,550,400);
	return true;
}

//编辑器中当前日期
function phpjs_fck_date()
{
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth() + 1;
	var d = myDate.getDate() + 1;
	m = m.toString();
	if(m.length < 2)
	{
		m = "0" + m;
	}
	d = d.toString();
	if(d.length < 2)
	{
		d = "0" + d;
	}
	return y.toString() + "-" +m+ "-" +d+ " ";
}

function phpjs_fck_time()
{
	var myDate = new Date();
	return myDate.toLocaleTimeString();
}

//扩展模块数据预览，图片
function phpjs_viewpic(n_vid,input)
{
	var input_view = "_view_"+input;
	if(!n_vid || n_vid =="" || n_vid == "undefined")
	{
		getid(input_view).innerHTML = "<img src='images/nopic.gif' />";
		return true;
	}
	var url = get_url('open,ajax_preview_img')+"idstring="+n_vid;
	var msg = get_ajax(url);
	if(msg == "empty")
	{
		phpjs_viewpic("",input_view);
		return true;
	}
	var array = $.evalJSON(msg);
	var length_array = array.length;
	//通过Ajax获取图片列表
	var p_html = '<table><tr>';
	for(var i=0;i<length_array;i++)
	{
		var tmp_i = i+1;
		var srcurl = array[i]["url"];
		if(!srcurl || srcurl == "" || srcurl == "undefined")
		{
			srcurl = "images/nopic.gif";
		}
		p_html += '<td><img src="'+srcurl+'" width="80px" height="80px" class="hand" onclick="phpjs_preview(\''+array[i]["id"]+'\')" /></td>';
		if(tmp_i%8 == "")
		{
			p_html += "</tr><tr>";
		}
	}
	p_html += "</tr></table>";
	getid(input_view).innerHTML = p_html;
	return true;
}
//扩展模块数据预览，下载
function phpjs_viewdown(id,input)
{
	var input_view = "_view_"+input;
	if(!id || id == "" || id == "undefined")
	{
		return false;
	}
	var url = get_url("subject,ajax_file")+"id="+id;
	get_ajax(url,_phpjs_viewdown,input_view);
	return true;
}

function _phpjs_viewdown(msg,id)
{
	if(msg && msg != "error")
	{
		var array = $.evalJSON(msg);
		var viewhtml = '<input type="button" value="详情" class="btn2" onclick="phpjs_preview(\''+array['id']+'\',\'download\')"> 附件ID：'+array['id']+' <img src="images/download.gif" align="absmiddle" /> '+array['title'];
		$("#"+id).html(viewhtml);
		return true;
	}
}

//扩展模块数据预览，影音
function phpjs_viewvideo(id,input)
{
	var input_view = "_view_"+input;
	if(!id || id == "" || id == "undefined")
	{
		return false;
	}
	var url = get_url("subject,ajax_file")+"id="+id;
	get_ajax(url,_phpjs_viewvideo,input_view);
	return true;
}

function _phpjs_viewvideo(msg,id)
{
	if(msg && msg != "error")
	{
		var array = $.evalJSON(msg);
		var viewhtml = '<input type="button" value="预览" class="btn2" onclick="phpjs_preview(\''+array['id']+'\')"> 影音ID：'+array['id']+' <img src="images/video.gif" align="absmiddle" /> '+array['title'];
		$("#"+id).html(viewhtml);
		return true;
	}
}


//单图按钮
function phpjs_onepic(vid)
{
	var extend = "input="+vid;
	var url = get_url("open,img",extend);
	Layer.init(url,550,400);
	return true;
}

function phpjs_onepic_view(vid)
{
	var url = getid(vid).value;
	if(!url)
	{
		alert("没有相关图片信息！");
		return false;
	}
	Layer.init(url,550,400);
	return true;
}

function phpjs_onepic_clear(vid)
{
	getid(vid).value = "";
	return true;
}

function show_date(v,formattype)
{
	if(formattype && formattype != "undefined")
	{
		var datetype = "%Y-%m-%d %H:%M";
		var show_time = true;
	}
	else
	{
		var datetype = "%Y-%m-%d";
		var show_time = false;
	}
	jQuery("#"+v).dynDateTime({
		showsTime: show_time,
		ifFormat: datetype,
		timeFormat:"24"
	});
}

var callback = callback || function(){};

/* JQuery JSON */
(function($){$.toJSON=function(o)
{if(typeof(JSON)=='object'&&JSON.stringify)
return JSON.stringify(o);var type=typeof(o);if(o===null)
return"null";if(type=="undefined")
return undefined;if(type=="number"||type=="boolean")
return o+"";if(type=="string")
return $.quoteString(o);if(type=='object')
{if(typeof o.toJSON=="function")
return $.toJSON(o.toJSON());if(o.constructor===Date)
{var month=o.getUTCMonth()+1;if(month<10)month='0'+month;var day=o.getUTCDate();if(day<10)day='0'+day;var year=o.getUTCFullYear();var hours=o.getUTCHours();if(hours<10)hours='0'+hours;var minutes=o.getUTCMinutes();if(minutes<10)minutes='0'+minutes;var seconds=o.getUTCSeconds();if(seconds<10)seconds='0'+seconds;var milli=o.getUTCMilliseconds();if(milli<100)milli='0'+milli;if(milli<10)milli='0'+milli;return'"'+year+'-'+month+'-'+day+'T'+
hours+':'+minutes+':'+seconds+'.'+milli+'Z"';}
if(o.constructor===Array)
{var ret=[];for(var i=0;i<o.length;i++)
ret.push($.toJSON(o[i])||"null");return"["+ret.join(",")+"]";}
var pairs=[];for(var k in o){var name;var type=typeof k;if(type=="number")
name='"'+k+'"';else if(type=="string")
name=$.quoteString(k);else
continue;if(typeof o[k]=="function")
continue;var val=$.toJSON(o[k]);pairs.push(name+":"+val);}
return"{"+pairs.join(", ")+"}";}};$.evalJSON=function(src)
{if(typeof(JSON)=='object'&&JSON.parse)
return JSON.parse(src);return eval("("+src+")");};$.secureEvalJSON=function(src)
{if(typeof(JSON)=='object'&&JSON.parse)
return JSON.parse(src);var filtered=src;filtered=filtered.replace(/\\["\\\/bfnrtu]/g,'@');filtered=filtered.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,']');filtered=filtered.replace(/(?:^|:|,)(?:\s*\[)+/g,'');if(/^[\],:{}\s]*$/.test(filtered))
return eval("("+src+")");else
throw new SyntaxError("Error parsing JSON, source is not valid.");};$.quoteString=function(string)
{if(string.match(_escapeable))
{return'"'+string.replace(_escapeable,function(a)
{var c=_meta[a];if(typeof c==='string')return c;c=a.charCodeAt();return'\\u00'+Math.floor(c/16).toString(16)+(c%16).toString(16);})+'"';}
return'"'+string+'"';};var _escapeable=/["\\\x00-\x1f\x7f-\x9f]/g;var _meta={'\b':'\\b','\t':'\\t','\n':'\\n','\f':'\\f','\r':'\\r','"':'\\"','\\':'\\\\'};})(jQuery);

