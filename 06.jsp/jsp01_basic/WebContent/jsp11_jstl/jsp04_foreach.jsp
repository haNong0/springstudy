<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<%
	Map<String, String> member = new HashMap<>();
	member.put("id","hong");
	member.put("pw", "12345");
	member.put("name","홍길동");
	member.put("addr", "조선한양");
%>

<%!  %>
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
	아이디 <%=member.get("id") %> -- 메모리영역:page<br /> 
	아이디 ${member.get("id")} --메모리영역:pageScope <br /> 
	<c:set var ="member" value ="<%= member %>"></c:set>
	아이디 ${member.get("id")}
	<div class = "container" align = "center">
		<h1>forEach</h1>
		<c:set var="data" value ="<%= member %>"/>    <!-- 페이지 영역으로 c:set을 이용해서 변수 전달 후 사용해야함  -->
		<h3>Collection(HashMap)계열 반복처리</h3>
		<c:forEach var="m" items ="${data}">
		${m.key} = ${m.value} <br />
		
		</c:forEach>
	
	
	
	<h3>실습1. 1~100까지 홀수 합 (begin end step)</h3>
	<h3>실습2. 구구단에서 9단 출력 </h3>
	
	<h4>실습1</h4>
	<c:forEach var= "j" begin ="1" end= "100" step= "2">
	<c:set var="sum" value ="${sum+j}"></c:set>
	
	
	</c:forEach>
	${sum}
	
	<h4>실습2</h4>
	<c:forEach var="n" begin="1" end= "9">
	<c:out value="4 * ${n} = ${4 *n}" ></c:out><br />
	</c:forEach>
	
	
	</div>


</body>
</html>