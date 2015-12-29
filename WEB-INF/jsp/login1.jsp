<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
	登录页面
</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login.action" method="post">
用户账户：<input type="text" name="username" /><br/>
用户密码：<input type="password" name="password"  /><br/>
<input type="submit" value="登录" />
    <!-- 无头像  -->
    <div class="WB_panel oauth_main">
        <div class="oauth_error">
            <div class="oauth_error_content clearfix">
                <dl class="error_content">
                    <dt>HI,${user.nickname}</dt>
                    <img src="${user.headimgurl}" style="width:100px;height:100px"/>
                    <dd>
                        ${userInfo}
                        </br>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</form>

</body>
</html>