<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String lm= request.getParameter("lm");
if(lm!=null){
	session.setAttribute("lm",lm);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="微信页面"/></title>
<decorator:head/>
</head>
<body>
<decorator:body/>
  <!--底部栏-->
    <!--页面公用底部导航-->
      <div class="bottom_nav"><!--导航选中效果加class：nav_actived-->
         <ul>
           <li class="fangyuan <c:if test="${lm=='fy'}">nav_actived</c:if>">
             <a href='${pageContext.request.contextPath}/index.jsp?lm=fy'>
              <i></i>
              <p>房源</p>
             </a>
           </li>
           <li class="yuding <c:if test="${lm=='yd'}">nav_actived</c:if>">
             <a href='${pageContext.request.contextPath}/lc/start.action?flowSign=book&lm=yd'>
              <i></i>
              <p>预定</p>
             </a>
           </li>
           <li class="yewu <c:if test="${lm=='yw'}">nav_actived</c:if>">
             <a href='${pageContext.request.contextPath}/lc/list.action?lm=yw'>
              <i></i>
              <p>业务</p>
             </a>
           </li>
           <li class="chaobiao <c:if test="${lm=='cb'}">nav_actived</c:if>">
             <a href='${pageContext.request.contextPath}/meterinfo.action?lm=cb'>
              <i></i>
              <p>抄表</p>
             </a>
           </li>
         </ul>
      </div>
    <!--页面公用底部导航-->
  <!--底部栏-->
</body>
</html>