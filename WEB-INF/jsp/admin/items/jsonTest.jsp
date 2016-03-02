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
	json交互测试
</title>

</head>
<body>
<br/>
<input type="button" onclick="requestJson()" value="请求json,输出是json" />
<input type="button" onclick="responseJson()" value="请求key/value,输出是json"/>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
//请求json，输出是json
function requestJson(){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/items/json2json.action?json',
		contentType:'application/json;charset=utf-8',
		//数据格式是json串
		data:'{"name":"华为手机","price":999}',
		success:function(data){
			console.log(data);
			alert(data.name);
		}
	});
}

//请求key/value,输出是json
function responseJson(){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/items/bean2json.action?json',
		//请求时key/value这里不需要指定contentType,因为默认就是key/value类型
		//contentType:'application/json;charset=utf-8',
		//数据格式是key=value
		data:'name=三星&price=6000',
		success:function(data){
			console.log(data);
			alert(data.name);
		}
	});
}

</script>
</body>
</html>