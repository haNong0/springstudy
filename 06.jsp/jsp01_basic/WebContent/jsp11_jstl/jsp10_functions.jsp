<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<h3>jstl에서 제공하는 el함수들</h3>
	<c:set var="str1" value = "JSTL의 functions 태그를 사용하는 방법"></c:set>
	<c:set var="str2" value = "사용"></c:set>
	<c:set var="nums" value = "1,2,3,4,5,6,7,8,9,10"></c:set>
	<h5>
		<ul>
		<li>문자열의 길이 ${fn:(str1)}}</li>
		</ul>
	
	
	</h5>
</body>
</html>