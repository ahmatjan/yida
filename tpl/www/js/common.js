// JavaScript Document

$(function() { 

//µÇÂ½×¢²áÇÐ»»

$(".IcoArea li").mouseover(function(){
	
		$(this).css("top",(parseInt($(this).css("top"))-10)+"px");
		$(this).css("left",(parseInt($(this).css("left"))-10)+"px");
		$(this).find("img").css("width",(parseInt($(this).find("img").css("width"))+20)+"px");
		$(this).find("img").css("height",(parseInt($(this).find("img").css("height"))+20)+"px");

});
$(".IcoArea li").mouseout(function(){
	
		$(this).css("top",(parseInt($(this).css("top"))+10)+"px");
		$(this).css("left",(parseInt($(this).css("left"))+10)+"px");
		$(this).find("img").css("width",(parseInt($(this).find("img").css("width"))-20)+"px");
		$(this).find("img").css("height",(parseInt($(this).find("img").css("height"))-20)+"px");

});

$(".TuanItemLine label").mouseover(function(){
	
		$(this).find("img").css("width","139px");
		$(this).find("img").animate({height:"139px"},"slow");

});
$(".TuanItemLine label").mouseout(function(){

		$(this).find("img").css("width","129px");
		$(this).find("img").animate({height:"129px"},"slow");

});
$(".HeaderBox li").onmouseenter(function(){
	
	$(this).addClass("hover");
	$(this).siblings("li").removeClass("hover");

});
$(".HeaderBox li").onmouseleave(function(){
	
	$(this).removeClass("hover");

});


});