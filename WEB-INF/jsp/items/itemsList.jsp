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
	商品列表 
</title>
</head>
<body>
当前用户：${userInfo.username },
<c:if test="${userInfo.username != null}">
	<a href="${pageContext.request.contextPath}/logout.action">退出</a>
</c:if>
商品类型：
<select name="itemtypes">
	<option>请选择类型</option>
	<c:forEach items="${itemtypes }" var="itemtype">
		<option value="${itemtype.key }">${itemtype.value }</option>
	</c:forEach>
</select>
<br/>
	<c:forEach items="${itemsList}" var="item" varStatus="status">
		${status.index }---${item.name }
		----${item.price }
		----<fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
		----${item.detail }
	</c:forEach>
	<a href="">房源</a>
	<a href="${pageContext.request.contextPath}/lc/start.action?flowSign=book">预订</a>
	<a href="">业务</a>
	<a href="">抄表</a>
	<a href="${pageContext.request.contextPath}/lc/list.action">流程列表</a>
</body>
</html>