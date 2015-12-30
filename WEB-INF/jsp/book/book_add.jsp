<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
  
 
<div class="content" id="select-house-content">
	<!--意见反馈-->
	<div class="feedback_btn"><a></a></div>
    <!--意见反馈-->
    
    <!--头部导航-->
   	<div class="top_nav clearfix">
    	<div class="building_num" id="slider_box"><ul class="clearfix buildlistbox" id="buildlistbox" style="width:2000px;"></ul></div>
      	<em class="slide_btn"></em>
        <!--弹出层-->
      	<div class="popDiv" style="display:none;"><ul class="buildlistbox" id="buildlistbox1"></ul></div>
    </div>
    <!--头部导航-->
    
    <div class="house_wrappe">
      <!--房源信息-->
      <div class="house_box" id="hosuelistbox"></div>
      <!--房源信息-->
	</div>
</div>


<!--底部栏-->
<div id="page-footer">   
    <!--房源预定页面的预定提交按钮-->
    <div class="fixed_button" style="display:none;">
        <p class="button_value" id="choose_house"><input type="submit" value="确认选择"><i></i></p>
        <em></em>
    </div>
  	<!--房源预定页面的预定提交按钮-->
    <!--页面公用底部导航-->
    <div class="bottom_nav"><!--导航选中效果加class：nav_actived-->
    	<ul>
        	<li class="fangyuan"><a><i></i><p>房源</p></a></li>
        	<li class="yuding nav_actived"><a  href="${pageContext.request.contextPath}/lc/start.action?flowSign=book"><i></i><p>预定</p></a></li>
        	<li class="yewu"><a href="${pageContext.request.contextPath}/lc/list.action"><i></i><p>业务</p></a></li>
        	<li class="chaobiao"><a><i></i><p>抄表</p></a></li>
		</ul>
    </div>
</div>
    <!--页面公用底部导航-->
  <!--底部栏-->
  <!--content-->
  <script src="js/iscroll.js"></script>
  <script>
    var myScroll_h;
	function loaded() {
		setTimeout(function () {
            myScroll_h =new iScroll("slider_box",{hScrollbar:false, vScrollbar:false, bounce:false}); 
        }, 100);
	}
	
	//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
	//document.addEventListener('DOMContentLoaded', loaded, false);
	window.addEventListener('load', loaded, false);
	</script>
  
  <div class="content" id="book_submit_box" style=" display:none;">
      <!--意见反馈-->
      <div class="feedback_btn">
        <a></a>
      </div>
      <!--意见反馈-->
    <div class="inner">
    <form action="${pageContext.request.contextPath}/lc/handle.action" method="post">
      <div class="apply_box">
         <h1>预定信息</h1>
         <div class="apply_form">
            <div class="in">
               <div class="apply_input_box">
                 <label>客户名：</label>
                 <input type="text" name="lessee_data[lessee_name]"  class="input">
                 <em></em>
               </div>
               <div class="apply_input_box">
                 <label>联系人：</label>
                 <input type="text" name="lessee_data[contact]" class="input">
                 <em></em>
               </div>
               <div class="apply_input_box">
                 <label>手机：</label>
                 <input type="tel"  name="lessee_data[mobile]" class="input">
                 <em></em>
               </div>
              
               <div class="apply_input_box short">
                 <label>预订订金：</label>
                 <input type="text"  name="book_data[book_fee]" class="input">
                 <em></em>
                 <i>元</i>
               </div>
               
               <div class="apply_input_box">
                 <label>入住时间：</label>
                 <input type="text" name="book_data[holp_date]" class="input" id="USER_AGE1">
                 <em></em>
               </div>
               <div class="apply_input_box clearfix">
                 <label class="fl">房屋：</label>
                 <span class="house_show fl" id="showhouseno"></span>
               </div>
            </div>
           
              
            <input type="hidden" name='user_id' value="${userInfo.user_id}">
            <input type="hidden" name='agency_id' value="${userInfo.agency_id }">
            <input type="hidden" name='agency_name' value="${userInfo.agency_name }">
            <!-- 需要js获取值 -->
            <input type="hidden" class='hidden_house_id' name='house_ids[]' value='' />
            
    <input id='loan_user_id'  type="hidden" name='lessee_data[user_id]' value=0 />
    <input type='hidden' name='task_flg' value=1 >
    <input type="hidden" id='executed_id' name='executed_id' value="${flow.executed_id }" />
    <input type="hidden" id='xml_model_id' name='xml_model_id' value="${flow.xml_model_id }">
            <input type="submit" style="-webkit-appearance:none; -webkit-border-radius:0; display:none;" class="apply_submit" value="提交预定">
         </div>
      </div>
      </form>
    </div>
  </div>
   <script>
    var myScroll_h;
	function loaded() {
		setTimeout(function () {
            myScroll_h =new iScroll("slider_box",{hScrollbar:false, vScrollbar:false, bounce:false}); 
        }, 100);
	}
	
	//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
	//document.addEventListener('DOMContentLoaded', loaded, false);
	window.addEventListener('load', loaded, false);
  //function alert(){alert('343434');}
 function getHouseList(build_id)
  {
	  searchFun='getHouseListByBuildId';
	 
	  $.ajax({
		type: "GET",
		url: searchUrl+"?searchfun="+searchFun+"&build_id="+build_id,
		dataType: "json",
		success: function(data){
			var dataObj=data;
			if(dataObj.result!=1){
				
			}else if(dataObj.result==1){
				listdata = eval(dataObj.data);
				houseHtml = '';
				$.each(listdata, function(index){
					houseHtml += '<div class="floor_info fyyd"><ol class="clearfix">';
					houselistdata = eval(listdata[index]);
					$.each(houselistdata, function(key){
						if(houselistdata[key].lease_status==0){
							houseHtml += '<li class="normal" data-housenumber="'+houselistdata[key].house_number+'" data-id="'+houselistdata[key].house_id+'">';
						}else{
							houseHtml += '<li class="disable" data-housenumber="'+houselistdata[key].house_number+'" data-id="'+houselistdata[key].house_id+'">';
						}
						houseHtml += '<h2>'+houselistdata[key].house_number+'</h2><span>'+houselistdata[key].lease_area+'平</span><em></em></li>';
					});
					houseHtml += '</ol></div>';
				});
				$("#hosuelistbox").html(houseHtml);
				//$("#hosuelistbox").append(houseHtml);
				
				//房屋样式
				var li_height = ($('.floor_info ol li').width()*140)/194;
				var li_padding = (parseFloat($('.floor_info ol li').css('marginLeft'))*46)/39;
				var h2_padding =(25*li_height)/140;
				$('.floor_info').css('padding-top',li_padding+'px');
				$('.floor_info').css('padding-bottom',(li_padding-10)+'px');
				$('.floor_info ol li').css('padding-top',h2_padding+'px');
				$('.floor_info ol li').css('padding-bottom',h2_padding+'px');
				$('.floor_info ol li').css('margin-bottom',(li_padding-10)+'px');
				//选择房屋fixed_button
			    $('.fyyd ol li').unbind(touchstart).bind(touchstart,choose_house);
				//选定房屋号
				$('#choose_house').bind(touchstart,function(){
					$('.hidden_house_id').each(function(){
						if($(this).val()==''){
							$('.hidden_house_id').remove();
						}
					});
					  var hidden_html='';
					  var house_no_html='';
					  $('.floor_info').find('.choose').each(function(){
						 // alert($(this).attr("data-housenumber")+ " ");
						  house_no_html+=$(this).attr("data-housenumber")+ " ";
						  hidden_html+='<input type="hidden" class="hidden_house_id" name="house_ids[]" value="'+$(this).attr("data-id")+'" />';
					  });
					  $("#showhouseno").html(house_no_html);
					  $("#book_submit_box form").append(hidden_html);
				  })
				  $('#choose_house').bind(touchend,function(){
					  $('#select-house-content').hide();
					  $('#page-footer').hide();
					  $('#book_submit_box').show();
					  setTimeout(function () {
							$('.apply_submit').show();}, 100);
				  })
				 $('.fixed_button em').unbind(touchend).bind(touchend, hideButton);
			}
		 }
	  });
  }
function choose_house(){
	var length=0;
	var num=0;
	if($(this).hasClass('normal')){
		$(this).addClass('choose').removeClass('normal');
		$(this).find('em').show();
		$('.fixed_button').show();
	}
	else if($(this).hasClass('choose')){
		$(this).removeClass('choose').addClass('normal');
		$(this).find('em').hide();
	}
	length=$('.choose').length;
	num+=length;
	$('.button_value i').text(num);
}
function getBuildInfo(){
	 
	  searchFun='getAgencyBuild';
	  agency_id = "${userInfo.agency_id }";
	  build_id = 0;
	 
	  $.ajax({
		type: "GET",
		url: searchUrl+"?searchfun="+searchFun+"&agency_id="+agency_id,
		
		dataType: "json",
		success: function(data){
			
			var dataObj=data;
			
			if(dataObj.result!=1){
				
			}else if(dataObj.result==1){
				
				listdata = eval(dataObj.data);
				buildHtml = '';
				buildHtml_b = '';
				$.each(listdata, function(index){
					buildHtml_b  += '<li   data-id="'+listdata[index].id+'"><a href="#">'+listdata[index].building_number+'</a></li>';
					if(index==0){
						build_id = listdata[index].id;
						buildHtml += '<li  data-id="'+listdata[index].id+'"><a href="#" class="actived">'+listdata[index].building_number+'</a></li>';
						
					}else{
						buildHtml += '<li  data-id="'+listdata[index].id+'"><a href="#">'+listdata[index].building_number+'</a></li>';
					}
						
				})	
				$(".buildlistbox").eq(0).append(buildHtml);
				$(".buildlistbox").eq(1).append(buildHtml_b);
				//计算ul的宽度
				var sum=0;
				var li_width;
				$('.building_num ul li').each(function(){
					sum+=$(this).width();
					li_width = $(this).width()
				})
				var ul_width = $('.building_num ul li').length*parseFloat($('.building_num ul li').css("marginRight"))+sum+5;
				$('.building_num ul').width(ul_width);
				//
				//var myScroll_h;
				$("#buildlistbox li").bind(touchend,function(){
					$("#buildlistbox a").removeClass("actived");
					$(this).find('a').addClass("actived");
					$('.fixed_button').hide();
					getHouseList($(this).attr("data-id")); 
				});
				$("#buildlistbox1 li").bind(touchend,function(){
				//	$("#buildlistbox1 a").removeClass("actived");
				//	$(this).find('a').addClass("actived");
					$('.fixed_button').hide();
					getHouseList($(this).attr("data-id")); 
					$('.slide_btn').removeClass('click');
					$('.popDiv').hide();
					var li_length = parseFloat($(this).width())+parseFloat($(this).css('marginRight'));
					//alert(li_width);
					//alert(parseFloat($(this).width()));
					//alert($(this).index());
					//alert(li_length);
			        myScroll_h.scrollTo(-(li_length*$(this).index()), 0, 200);
				});
				getHouseList(build_id);
			}
			
			
		 }
	  });
	  
	  
  }
	$(function(){
	 
	  searchUrl = '${pageContext.request.contextPath}/lc/search.action';
      getBuildInfo();
 });
</script>
  <script src="<%=request.getContextPath()%>/resources/js/mobiscroll_date.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/js/mobiscroll.js" type="text/javascript"></script>
  
  <script type="text/javascript">
    $(function () {
		var currYear = (new Date()).getFullYear();	
		var opt={};
		opt.date = {preset : 'date'};
		opt.datetime = {preset : 'datetime'};
		opt.time = {preset : 'time'};
		opt.default = {
			theme: 'android-ics light', //皮肤样式
			display: 'modal', //显示方式 
			mode: 'scroller', //日期选择模式
			dateFormat: 'yyyy-mm-dd',
			yearText: '年',
			monthText: '月',
			lang: 'zh',
			dayText: '日',
			showNow: false,
	        setText: '确定', //确认按钮名称
	        cancelText: '取消',//取消按钮
			//nowText: "今天",
			startYear: currYear - 50, //开始年份
			endYear: currYear + 20 //结束年份
		};
		$("#USER_AGE1").mobiscroll($.extend(opt['date'], opt['default']));
  });
  </script>
