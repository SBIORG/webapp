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
    <!--审批业务名称及返回按钮-->
    <div class="message_goback">
      <a href="${pageContext.request.contextPath}/admin/lc/list.action?lm=yw"> < <span>${map['flow_info'].flow_name }</span></a>
    </div>
    <jsp:include page="/WEB-INF/jsp/admin/flowview/${map['flow_info'].flow_sign}.jsp" flush="true"/>
   
  </div>
  <!--底部栏-->
   <!--意见反馈-->
	<div class="feedback_btn">
		<a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/admin/lc/view.action?flowId="+request.getParameter("flowId"),"UTF-8") %>"></a>
	</div>
    <!--意见反馈-->
      
  
    
  
    <!--审批按钮-->
    <div class="ywsp_button">
       <ul>
        <c:forEach items="${btns }" var="btn" varStatus="status">
         <li class="refuse" style='width:${100/fn:length(btns)}%'><a href="${pageContext.request.contextPath}/admin/lc/exec.action?flowId=${btn.flow_id}&nodeId=${btn.node_id}&executedId=${btn.executed_id}">${btn.executed_name }</a></li>
         </c:forEach>
       </ul>
    </div>
    <!--审批按钮-->
  <!--底部栏-->
  <!--content-->
 </body>
</html>
