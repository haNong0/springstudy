<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage ="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style= "background-color: red;">
	
	<p>요청처리과정에서 에러가 발생했습니다.</p>
	<p>흥</p>
	<p>빠른시간내에 처리하도록 하겠습니다.</p>
	
	
	</div>
	
	<hr />
	에러타입 : <%= exception.getClass().getName() %>
	
</body>
</html>