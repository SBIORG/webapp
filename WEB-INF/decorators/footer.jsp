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
           <li class="fangyuan">
             <a href='http://www.baidu.com'>
              <i></i>
              <p>合同</p>
             </a>
           </li>
           <li class="yuding">
             <a href='http://www.sina.com.cn/'>
              <i></i>
              <p>缴费</p>
             </a>
           </li>
           <li class="yewu">
             <a href='http://www.weibo.com'>
              <i></i>
              <p>退费</p>
             </a>
           </li>
           <li class="chaobiao">
             <a href='https://wx.qq.com/'>
              <i></i>
              <p>水电</p>
             </a>
           </li>
         </ul>
      </div>
    <!--页面公用底部导航-->
  <!--底部栏-->
</body>
</html>