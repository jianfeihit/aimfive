// JavaScript Document
$(function(){
	    var $div_li_a =$(".ulNav li");
	    $div_li_a.click(function(){
		$(this).addClass("selected") .siblings().removeClass("selected");	
		})
	});
	
$(function(){
	    var $div_li_a =$(".askshare li");
	    $div_li_a.click(function(){
		$(this).addClass("acti").siblings().removeClass("acti");	
		})
	});
	
$(document).ready(function(){
		$('.listUl li:last,').css('borderBottom','none');
		$('.historyBox > div:eq(0) p a').click(function(){
		$(this).addClass('colorGray').siblings().removeClass('colorGray');	
		})

})
	
$(function(){
	    var $div_li =$("div.tab_menu ul li");
	    $div_li.click(function(){
			$(this).addClass("colorStyle")            //当前<li>元素高亮
				   .siblings().removeClass("colorStyle");  //去掉其它同辈<li>元素的高亮
            var index =  $div_li.index(this);  // 获取当前点击的<li>元素 在 全部li元素中的索引。
			$("div.tab_box > div")   	//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
					.eq(index).fadeIn(500)   //显示 <li>元素对应的<div>元素
					.siblings().hide(); //隐藏其它几个同辈的<div>元素
		}).hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
		})
	})
//上下滚动
$(function(){
        var scrtime;
         $("#con").hover(function(){
                clearInterval(scrtime);
        },function(){  
        scrtime = setInterval(function(){
                var $ul = $("#con ul");
                var liHeight = $ul.find("li:last").height();
                $ul.animate({marginTop : liHeight+20 +"px"},800,function(){
                $ul.find("li:last").prependTo($ul)
                $ul.find("li:first").hide();
                $ul.css({marginTop:0});
                $ul.find("li:first").fadeIn(800);
                });        
        },4000);
        }).trigger("mouseleave");  
});
 function out_concerned(tid,uid){
	 if(tid!='' && uid!=''){
			$.getJSON('index.php?c=forum&a=ajax_con&type=del',{'tid':tid,'uid':uid},function(msg){
			 if(msg.error==1){
					Wind.Util.resultTip({
						msg : msg.msg,
					});
			 }else{
				if(msg.msg=='取消成功'){
					Wind.Util.resultTip({
							msg : msg.msg,
						});
					$("#del_"+tid).attr('style','display:none');
				}else{
					Wind.Util.resultTip({
						msg : msg.msg,
					});
				}
			 }
		})
	 }else{
			alert("登录之后才可以添加关注!");
	 }
 }
  function click_concerned(tid,uid){
	 if(tid!='' && uid!=''){
			$.getJSON('index.php?c=forum&a=ajax_con',{'tid':tid,'uid':uid},function(msg){
			 if(msg.error){
					Wind.Util.resultTip({
						msg : msg.msg,
					});
			 }else{
					Wind.Util.resultTip({
						msg : msg.msg,
					});
			 }
		})
	 }
 }