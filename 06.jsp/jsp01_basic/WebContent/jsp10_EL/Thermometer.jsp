<%@page import="com.lec.EL.Thermometer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<%
			Thermometer thermometer = new Thermometer();
		request.setAttribute("t", thermometer);
		
		
		%>
		<h1>온도 변환기(v1.0)</h1>
		${t.getInfo() } <br />
		$ {t.getXxx()}
		${t.setCelsius("서울",25.6)} <br />
		서울 현재 온도는 섭씨 ${t.getCelsius("서울")}도 입니다!  
</body>
</html>