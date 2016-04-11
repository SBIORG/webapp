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
        <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/user/ucbackfeep.action?lm=tf","UTF-8") %>"></a>
      </div>
      <!--意见反馈-->
    <!--头部页卡-->
    <div class="center_top_tab">
       <div class="center_tab_nav clearfix">
         <ul>
         <c:if test="${userInfo.lessee_type!=2}">
           <li class="tab_left normal"><a href="${pageContext.request.contextPath}/user/ucbackfeel.action?lm=tf">租赁退费</a></li>
         </c:if>
           <li class="tab_right normal actived"><a href="${pageContext.request.contextPath}/user/ucbackfeep.action?lm=tf">物业退费</a></li><!--页卡选中：class：actived-->
         </ul>
       </div>
    </div>
    <!--头部页卡-->
    <!--退费-->
    <div class="center_phone_pages">
      <div class="inner_content">
      
        <!--每一条退费信息-->
         <c:forEach var='pbackfee' items='${plist}' varStatus='status'>
        <a class="all_link">
            <div class="each_box">
              <h1 class="each_h1 clearfix">
                <span class=" fl">${pbackfee.fee_type }(<span class="change_color">${pbackfee.status }</span>)</span>
                <span class="fr each_time change_color">${pbackfee.throw_fee }</span><!--红色字加class：change_color-->
              </h1>
              <div class="clearfix each_info">
                 <span class="fl info_text_building all_link_span">${pbackfee.house_no}</span>
                 <span class="fr each_info_tuifei">${pbackfee.cont }</span>
                 <span></span>
              </div>
            </div>
        </a>
        </c:forEach>
        <!--每一条退费信息-->
        
      </div>
    </div>
    <!--退费-->
  </div>
 
  <!--content-->
 </body>
</html>
