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
	商品修改
</title>
</head>
<body>
<c:if test="${allErrors!=null }">
	<!-- 显示错误信息 --> 
	<c:forEach items="${allErrors}" var="error">
	${error.defaultMessage }<br/>
	</c:forEach>
</c:if>
 	<form action="${pageContext.request.contextPath}/items/editSubmit.action" method="post" enctype="multipart/form-data">
		<input type="text" name="name" value="${items.name }" />
		<input type="text" name="price" value="${items.price }" />
		<input type="text" name="detail" value="${items.detail }" />
		<input type="text" name="createtime" value='<fmt:formatDate value="${items.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>' />
		<c:if test="${items.picPath != null }">
			<img src="${pageContext.request.contextPath}/upload/temp/${items.picPath}" width=100 height=100 />
		</c:if>
		<input type="file" name="itemsPic" />
		<input type="submit" value="修改">
	</form>
</body>
</html>