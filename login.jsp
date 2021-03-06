<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<style>
  html,body{background:#478ede;}
</style>
</head>
<body>
  <!--content-->
  <div class="content">
    <!--登录-->
    <div class="inner">
    <form action="${pageContext.request.contextPath}/login.action" method="post">
       <div class="login">
         <h1 class="logo"></h1>
         <div class="input_box">
            <div class="input_style count">
              <label>账号：</label>
              <input type="text" class="input" name="username" />
              <em class=""></em>
            </div>
            <div class="input_style password">
              <label>密码：</label>
              <input type="password" class="input" id="password" name="password" />
              <input type="hidden" class="input" name="openid" value="${param.openid}" />
              <em class=""> </em>
            </div>
         </div>
         <input type="submit" class="login_submit" value="登录">
       </div>
       </form>
        <!-- 
    <div class="WB_panel oauth_main">
        <div class="oauth_error">
            <div class="oauth_error_content clearfix">
                <dl class="error_content">
                    <dt>HI,${user.nickname}</dt>
                    <img src="${user.headimgurl}" style="width:100px;height:100px"/>
                </dl>
            </div>
        </div>
    </div>
	无头像  -->
    </div>
    <!--登录-->
  </div>
  <!--content-->
</body>
</html>
