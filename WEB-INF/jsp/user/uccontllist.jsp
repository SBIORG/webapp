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
       <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/user/uccontllist.action?lm=ht","UTF-8") %>"></a>
      </div>
      <!--意见反馈-->
    <!--头部页卡-->
    <div class="center_top_tab">
       <div class="center_tab_nav clearfix">
         <ul>
         <c:if test="${userInfo.lessee_type!=2}">
           <li class="tab_left normal actived"><a href="${pageContext.request.contextPath}/user/uccontllist.action?lm=ht">租赁合同</a></li>
           </c:if>
           <li class="tab_right normal"><a href="${pageContext.request.contextPath}/user/uccontplist.action?lm=ht">物业合同</a></li><!--页卡选中：class：actived-->
         </ul>
       </div>
    </div>
    <!--头部页卡-->
    <!--合同-->
    <div class="center_phone_pages">
      <div class="inner_content">
        <!--每一条合同信息-->
          <c:forEach var='lease' items='${llist}' varStatus='status'>
        <a href="${pageContext.request.contextPath}/user/uccontlview.action?id=${lease.id }&lm=ht" class="all_link">
            <div class="each_box">
              <h1 class="each_h1 clearfix">
                <span class=" fl">${lease.cont_no }</span>
                <span class="fr each_time">${lease.status}</span><!--红色字加class：change_color-->
              </h1>
              <div class="clearfix each_info">
                 <span class="fl info_text all_link_span">${lease.allHouse}</span>
                 <span class="fr each_time">${lease.date}</span>
              </div>
            </div>
        </a>
        </c:forEach>
        <!--每一条合同信息-->
      </div>
    </div>
    <!--合同-->
  </div>
  <!--content-->
 </body>
</html>
