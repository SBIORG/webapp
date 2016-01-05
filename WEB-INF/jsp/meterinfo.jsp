<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<c:set var="meterType" value="${map['search_meter_type']}"/>
<c:set var="buildId" value="${map['search_build_id']}"/>
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
<style>
  html,body{
	  background:#f3f3f3;
  }
</style>

<body>
  <!--content-->
  <div class="content">
      <!--意见反馈-->
      <div class="feedback_btn">
       <a href="<%=request.getContextPath()%>/yjfk.jsp?url=<%=sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getSession().getServletContext().getContextPath()+request.getServletPath()%>"></a>
      </div>
      <!--意见反馈-->
    <!--抄表下拉框以及按钮-->
    <div class="read_meter">
        <!--下拉框-->
        <div class="select_box clearfix">
         <div class="metet_select choose_meter fl">
           <a href="${pageContext.request.contextPath}/meterinfo.action?meterType=${map['search_meter_type']}&bid=${map['search_build_id']}"><span>${meterTypes[meterType]}</span></a>
           <!--弹框-->
           <div class="meter_popDiv" style="display:none;">
             <ul>
             <c:forEach var="meter" items="${meterTypes}"> 
               <li><a href="${pageContext.request.contextPath}/meterinfo.action?meterType=${meter.key}&bid=${map['search_build_id']}"><span>${meter.value}</span></a></li>
             </c:forEach>
             </ul>
           </div>
           <!--弹框-->
         </div>
         <!--<div class="metet_select choose_time fl">
           <a><span>2013-02-13</span>至<span>2013-5-12</span></a>
         </div>-->
         <div class="metet_select choose_buildings fl">
         <!--链接地址为:URL?meter_type=search_meter_type&build_id=当前的key，search_meter_type为孵化云平台返回的元素-->
           <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${map['search_build_id']}&meterType=${map['search_meter_type']}"><span>${buildings[buildId]}</span>栋</a>
           <!--弹框-->
           <div class="meter_popDiv" style="display:none;">
             <div class="bulidings_list" id="building_list">
                 <ul>
                 <c:forEach var="building" items="${buildings}"> 
                   <li> <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${ building.key}&meterType=${map['search_meter_type']}"><span>${building.value }</span></a></li>
                </c:forEach>
                 </ul>
             </div>
           </div>
           <!--弹框-->
         </div>
       </div>
        <!--下拉框-->
        <!--上下层按钮-->
        <div class="floor_up_down clearfix">
          <ul>
            <li class="floor_up">
            <c:choose>
          	<c:when test="${map['last_floor'] != null}">
          		 <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${map['search_build_id']}&meterType=${map['search_meter_type']}&floor=${map['last_floor']}">上一层</a>
          	</c:when>
          	<c:otherwise>
          		 <a>上一层</a>
          	</c:otherwise>
          </c:choose>
            </li>
            <!--链接地址为:URL?meter_type=search_meter_type&build_id=search_build_id&floor=last_floor，search_meter_type为孵化云平台返回的元素
            注意last_floor为空时，没有链接
            -->
            
            <li class="floor_num"><span>第${map['on_floor'] }层</span></li><!--第?层，？输出on_floor-->
            <li class="floor_down">
              <c:choose>
          	<c:when test="${map['next_floor'] != null}">
          		 <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${map['search_build_id']}&meterType=${map['search_meter_type']}&floor=${map['next_floor']}">下一层</a>
          	</c:when>
          	<c:otherwise>
          		 <a>下一层</a>
          	</c:otherwise>
          	</c:choose>
            </li>
            
           <!--链接地址为:URL?meter_type=search_meter_type&build_id=search_build_id&floor=next_floor，search_meter_type为孵化云平台返回的元素
           	注意next_floor为空时没有链接
           -->
          </ul>
        </div>
        <!--上下层按钮-->
    </div>
    <!--抄表下拉框以及按钮-->
    <!--业务-->
    <div class="phone_meter_reading">
      <div class="inner_content">
      
      
        <!--抄表业务
        循环开始,循环meter_list
        -->
        
       <c:choose>
        <c:when test="${fn:length(meterList)!=0 }">
         <c:forEach var='meter' items='${meterList}' varStatus='status'>
        <form class='meterForm' method="post" action="${pageContext.request.contextPath}/metersubmit.action">
        <input name="user_id" type="hidden" value="${userInfo.user_id}"><!--值为session的用户ID-->
        <input name="user_name" type="hidden" value="${userInfo.username}"><!--值为session的用户名-->
        <input type="hidden" name='agency_id' value="${userInfo.agency_id }">
        <div class="each_box">
          <h1 class="each_h1 clearfix">
            <span class=" fl">${meter.house_number }</span> <!--循环中的house_number-->
            <span class="fr each_time">【上月表数】${meter.last_meter_num }<!--循环中的last_meter_num--></span>
          </h1>
          <div class="clearfix each_info">
             <input type="text" class="write_meter_num" name="meter[${meter.meter_id}][meter_num]" placeholder="本月表数：">
            <div>
              <textarea class="write_meter_txt" name="meter[${meter.meter_id}][remark]" placeholder="输入备注..."></textarea>
            </div>
            <div class="meter_box clearfix">
               <a class="add_meter_txt fl show_textarea">+加备注</a>
               <input class="save_meter_num fr" type="button" value="保存">
            </div>
          </div>
        </div>
        <!--循环结束
        
        抄表业务-->
        </form> 
        </c:forEach>
        </c:when>
        <c:otherwise>
        	<div style="text-align:center; margin-top:10px;">本层已抄表或无仪表!</div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
    <!--业务-->
  </div>
  <!--底部栏-->
    <!--上下层按钮-->
    <div class="bottom_floor_btn clearfix">
      <ul>
        <li class="floor_up">
          <c:choose>
          	<c:when test="${map['last_floor'] != null}">
          		 <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${map['search_build_id']}&meterType=${map['search_meter_type']}&floor=${map['last_floor']}">上一层</a>
          	</c:when>
          	<c:otherwise>
          		 <a>上一层</a>
          	</c:otherwise>
          </c:choose>
		</li>
        <li class="floor_save"><a>第${map['on_floor'] }层</a></li>
        <li class="floor_down">
            <c:choose>
          	<c:when test="${map['next_floor'] != null}">
          		 <a href="${pageContext.request.contextPath}/meterinfo.action?bid=${map['search_build_id']}&meterType=${map['search_meter_type']}&floor=${map['next_floor']}">下一层</a>
          	</c:when>
          	<c:otherwise>
          		 <a>下一层</a>
          	</c:otherwise>
          	</c:choose>
        </li>
      </ul>
    </div>
    <!--上下层按钮-->
    <script>
	$('.save_meter_num').each(function(i){
	  $(this).bind(touchend,function(){
		    var url =  '${pageContext.request.contextPath}/metersubmit.action';
			var form = $('.meterForm').eq(i);
		    if(form.find('.write_meter_num').val()==''&& form.find('.write_meter_txt').val()==''){
				alert('表单不能为空');
			}else{
				$.ajax({
					url:url,
					data:form.serialize(),
					type:"post",
					success:function(data){//ajax返回的数据
						var dataObj=data;
						if(dataObj.result!=1){
							alert(dataObj.errorMsg);
						}else if(dataObj.result==1){
							form.remove();
						}
					}
				})
			}
	  })
	})
	</script>
 </body>
</html>
