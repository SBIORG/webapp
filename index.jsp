<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>微信页面</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/page.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/center.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll_date.css"/>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.7.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.touchSwipe.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/iscroll.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js" type="text/javascript"></script>
</head>
<body>
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
  <script>
  var houseMsgUrl = "${pageContext.request.contextPath}/msglist.action";
  //function alert(){alert('343434');}
 function getHouseList(build_id)
  {
	  searchFun='houseMangerBybuildid';
	 
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
						houseHtml += '<a href="'+houseMsgUrl+'?houseId='+houselistdata[key].house_id+'&houseNO='+houselistdata[key].house_number+'"><h2>'+houselistdata[key].house_number+'</h2><span>'+houselistdata[key].lease_area+'平</span><em></em></a></li>';
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
			}
		 }
	  });
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
				$('.building_num ul li').each(function(){
					sum+=$(this).width();
				})
				//
				var ul_width = $('.building_num ul li').length*parseFloat($('.building_num ul li').css("marginRight"))+sum+5;
				$('.building_num ul').width(ul_width);
				//
				$("#buildlistbox li").bind(touchend,function(){
					$("#buildlistbox a").removeClass("actived");
					$(this).find('a').addClass("actived");
					$('.fixed_button').hide();
					getHouseList($(this).attr("data-id")); 
				});
				$("#buildlistbox1 li").bind(touchend,function(){
					$("#buildlistbox1 a").removeClass("actived");
					$(this).find('a').addClass("actived");
					$('.fixed_button').hide();
					getHouseList($(this).attr("data-id")); 
					$('.slide_btn').removeClass('click');
					$('.popDiv').hide();
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
</body>
</html>
