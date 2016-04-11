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
        <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/user/ucpayfeep.action?lm=jf","UTF-8") %>"></a>
      </div>
      <!--意见反馈-->
    <!--头部页卡-->
    <div class="center_top_tab">
       <div class="center_tab_nav clearfix">
         <ul>
         	<c:if test="${userInfo.lessee_type!=2}">
           		<li class="tab_left normal"><a href="${pageContext.request.contextPath}/user/ucpayfeel.action?lm=jf">租赁缴费</a></li>
           </c:if>
           <li class="tab_right normal actived"><a href="${pageContext.request.contextPath}/user/ucpayfeep.action?lm=jf">物业缴费</a></li><!--页卡选中：class：actived-->
         </ul>
       </div>
    </div>
    <!--头部页卡-->
    <!--缴费-->
    <div class="center_phone_pages phone_jiaofei">
      <div class="inner_content">
        <!--每一条合同信息-->
         <c:forEach var='ppayfee' items='${plist}' varStatus='status'>
        <div class="each_box">
          <h1 class="each_h1 clearfix">
            <span class=" fl">${ppayfee.bill_type }</span>
            <em class="fr each_choose normal" id="${ppayfee.bill_id }"></em><!--选中：actived-->
            <span class="fr each_time change_color">${ppayfee.true_pay_fee }</span><!--红色字加class：change_color-->
          </h1>
          <div class="clearfix each_info">
             <span class="fl info_text">
               <a>${ppayfee.house_no }</a>
             </span>
             <span class="fr each_time">${ppayfee.date }</span>
          </div>
        </div>
        </c:forEach>
        <!--每一条合同信息-->
 
      </div>
    </div>
    <!--缴费-->
  </div>
  <!--底部栏-->
    <!--房源预定页面的预定提交按钮-->
      <div class="fixed_button"><!--<span>立即缴费</span>-->
        <p class="button_value"><input type="submit" value="立即缴费"></p>
      </div>
  	<!--房源预定页面的预定提交按钮-->
  <!--底部栏-->
  <!--content-->
 </body>
</html>
