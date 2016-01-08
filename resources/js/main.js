// JavaScript Document
var touchedAble = 'createTouch' in document;
var touchend = touchedAble ? "touchend" : "mouseup";
var touchstart = touchedAble ? "touchstart" : "mousedown";
var touchmove = touchedAble ? "touchmove" : "mousemove";
$(function(){
	//登录输入框效果
	$('.input_box').find('input').each(function(){
		$(this).bind("focus",function(e){
			$(this).parent().addClass('input_style_active');
			$(this).siblings('em').addClass('actived');
    	});
		$(this).bind("blur",function(e){
			$(this).parent().removeClass('input_style_active');
			$(this).siblings('em').removeClass('actived');
    	});
	});
	
	//登录图标功能
	$('.count em').unbind(touchend).bind(touchend, deleteCount);
	$('.apply_input_box em').unbind(touchend).bind(touchend, deleteCount);
	$('.password em').unbind(touchend).bind(touchend, showPassword);
	//
	$('.ywsp_button .refuse').eq(1).addClass('pass');
	//init初始化
	$('.ywsp_button').addClass('feedback_content');
	$('.fixed_button').addClass('feedback_content');
	$('.submit_message').addClass('feedback_content');
	$('.bottom_floor_btn').addClass('feedback_content');
	
	var li_height = ($('.floor_info ol li').width()*140)/194;
	$('.floor_info ol li').height(li_height);
	//
	var li_padding = (parseFloat($('.floor_info ol li').css('marginLeft'))*46)/39;
	$('.floor_info').css('padding-top',li_padding+'px');
	$('.floor_info').css('padding-bottom',(li_padding-10)+'px');
	//
	var h2_padding =(30*li_height)/140;
	$('.floor_info ol li h2').css('margin-top',h2_padding+'px');
	//
	var house_box_padding = ($('.house_box').width()*49)/1000;
	$('.house_box').css('padding-top',house_box_padding);
	//
	$('.house_wrappe').height($('html').height()-$('.top_nav').height()-$('.bottom_nav').height()-$('.fixed_button').height()-parseFloat($('.bottom_nav').css('paddingTop'))-parseFloat($('.top_nav').css('paddingTop')));
	$('.message_wrappe').height($('html').height()-$('.message_goback').height()-$('.bottom_submit').height()+parseFloat($('.all_messages').css('marginTop'))-10);
	$('.phone_work').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop')));
	$('.phone_work_sp').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop'))-$('.message_goback').height()-$('.ywsp_button').height());
	$('.phone_meter_reading').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop'))-$('.bottom_floor_btn').height()-$('.read_meter').height());
	$('.center_phone_pages').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop'))-$('.center_top_tab').height()-parseFloat($('.center_top_tab').css('paddingTop'))*2);
	$('.phone_jiaofei').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop'))-$('.center_top_tab').height()-parseFloat($('.center_top_tab').css('paddingTop'))*2-$('.fixed_button').height());
	$('.write_feedback').height($('html').height()-$('.bottom_nav').height()-parseFloat($('.bottom_nav').css('paddingTop'))-$('.message_goback').height()-$('.fixed_button').height());
	//
	$('.house_wrappe').css('margin-top',$('.top_nav').height()+16);
	$('.phone_work_sp').css('margin-top',$('.message_goback').height());
	$('.phone_meter_reading').css('margin-top',$('.read_meter').height());
	$('.center_phone_pages').css('margin-top',$('.center_top_tab').height()+parseFloat($('.center_top_tab').css('paddingTop'))*2-parseFloat($('.each_box').css('marginTop')));
	$('.feedback_btn').css('bottom',$('.bottom_nav').height()+$('.feedback_content').height()+15);
	
	
	//
	var sum=0;
	$('.building_num ul li').each(function(){
		sum+=$(this).width();
	})
	//
	var ul_width = $('.building_num ul li').length*parseFloat($('.building_num ul li').css("marginRight"))+sum+5;
	$('.building_num ul').width(ul_width);
	//
	$('.popDiv').css('top',$('.top_nav').height()+16);
	$('.popDiv').height($('.house_wrappe').height()+$('.bottom_nav').height());
	//
	var bottomarea = $('.bottom_nav').height()+parseFloat($('.bottom_nav').css('paddingTop'));
	$('.fixed_button').css('bottom',bottomarea+'px');
	$('.ywsp_button').css('bottom',bottomarea+'px');
	$('.bottom_floor_btn').css('bottom',bottomarea+'px');
	//
	var building_list = ($('.meter_popDiv ul li').height())*5+5;
	$('.bulidings_list').height(building_list);
	$('.meter_popDiv').css('top',$('.select_box').height()+parseFloat($('.select_box ').css('paddingTop')));
	
	
	
	//弹出层
	$('.slide_btn').unbind(touchend).bind(touchend,showPopDiv);
	
	//底部选项卡bottomNavTabbottomNavTabup
	$('.bottom_nav ul li').unbind(touchstart).bind(touchstart, bottomNavTab);
	//$('.bottom_nav ul li').unbind(touchend).bind(touchend, bottomNavTabup);
	
	//选择表以及栋数 
	$('.choose_meter a').unbind(touchend).bind(touchend, meterChoose);
	$('.choose_buildings a').unbind(touchend).bind(touchend, meterChoose);
	//$('.choose_meter ul li').unbind(touchend).bind(touchend, getMeterText);
	//$('.choose_buildings ul li').unbind(touchend).bind(touchend, getBuildingText);
	
	//抄表加备注和收起备注
	$('.add_meter_txt').unbind(touchend).bind(touchend, addMeterTxt);
	
	//选择缴费项目chooseToPay
	$('.each_choose').unbind(touchend).bind(touchend, chooseToPay);
	
})

function deleteCount(){
	$(this).siblings('input').val("");
}
function showPassword(){
	var text_value = $(this).siblings('#password').val();
	if(text_value==""){
		$(this).siblings('#password').show();
		$(this).siblings('#showpassword').hide();
		$('#showpassword').val('');
		$('#password').val('');
	}
	else{
		if($(this).siblings('#showpassword').is(':hidden')){
			$(this).siblings('#showpassword').val(text_value);
			$(this).siblings('#password').hide();
			$(this).siblings('#showpassword').show().focus();
		}else{
			if($(this).siblings('#showpassword').val()==""){
				$(this).siblings('#password').val("");
			}else if (/[\u4E00-\u9FA5]/i.test($(this).siblings('#showpassword').val())) {
				alert('有中文,请重新输入！');
				$(this).siblings('#password').val("");
			}
			$(this).siblings('#password').show().focus();
			$(this).siblings('#showpassword').hide()
		}
	}
}



function hideButton(){
	$('.fixed_button').hide();
	$(".fyyd ol li").each(function(){
		if($(this).hasClass('choose')){
		   $(this).removeClass('choose').addClass('normal');
	    }
	})
	$(".fyyd ol li").find('em').hide();
}

function showPopDiv(){
	if($('.popDiv').is(':hidden')){
		$(this).addClass('click');
		$('.popDiv').show();
	}
	else{
		$(this).removeClass('click');
		$('.popDiv').hide();
	}
}
function bottomNavTab(){
	$(this).addClass('nav_actived');
}
//function bottomNavTabup(){
//   $(this).removeClass('nav_actived');
//}
function meterChoose(){
	$(this).siblings(".meter_popDiv").show();
	$(this).parent().siblings().find(".meter_popDiv").hide();
}
/*function getMeterText(){
	var choose_text = $(this).find("span").text();
	var parent = $(this).parent().parent();
	parent.siblings('a').find('span').text(choose_text);
	$('.meter_popDiv').hide();
}*/
function getBuildingText(){
	//var choose_text = $(this).find("span").text();
	//var parent = $(this).parent().parent().parent();
	//parent.siblings('a').find('span').text(choose_text);
	//$('.meter_popDiv').hide();
}
function addMeterTxt(){
	if($(this).hasClass('show_textarea')){
		$(this).parent().siblings().find('.write_meter_txt').show();
		$(this).parent().siblings().find('.write_meter_txt').addClass("write_meter_txt_height");
		$(this).html("-收起");
		$(this).removeClass("show_textarea");
	}else{
		$(this).parent().siblings().find('.write_meter_txt').hide();
		$(this).parent().siblings().find('.write_meter_txt').removeClass("write_meter_txt_height");
		$(this).html("+加备注");
		$(this).addClass("show_textarea");
	}
}
function chooseToPay(){
	if($(this).hasClass("actived")){
		$(this).removeClass("actived");
	}else{
		$(this).addClass("actived");
	}
}

