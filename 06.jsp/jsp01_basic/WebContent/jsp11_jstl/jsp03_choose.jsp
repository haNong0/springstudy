<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ?name=hong&age=20  -->
	<!--  when = if , otherwise=else  -->
	<ul>
	<c:choose>
	<c:when test="${param.name == 'hong'} ">
	<li>사용자의 이름은${param.name} </li>
	
	</c:when>
	<c:when test="${param.age > 18} ">
		<li>당신의 나이는  ${param.age}</li>
	</c:when>
	<c:otherwise>
	<li>당신의 정보를 찾지 못했습니다.</li>
	
	</c:otherwise>
	</c:choose>
	
	</ul>
</body>
</html>