<%@page import="java.net.URLEncoder"%>
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
	<h1>쿠키경로 지정하기</h1>
	
	<%
		// 경로를 path1으로 지정해서 쿠키를 추가
		Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/jsp_01_basic/jsp08_cookies/path1", "utf-8"));
		cookie1.setPath("/jsp_01_basic/jsp08_cookies/path1");
		response.addCookie(cookie1);
		Cookie cookie2 = new Cookie("path1", URLEncoder.encode("경로:None", "utf-8"));
		response.addCookie(cookie2);
		Cookie cookie3 = new Cookie("path1", URLEncoder.encode("경로:/", "utf-8"));
		cookie3.setPath("/");
		response.addCookie(cookie3);
		Cookie cookie4 = new Cookie("path1", URLEncoder.encode("경로:/jsp_01_basic/jsp08_cookies/path2", "utf-8"));
		cookie1.setPath("/jsp_01_basic/jsp08_cookies/path2");
		response.addCookie(cookie4);
		// 경로를 지정하지 않고 쿠키를 추가
		// 경로를 root(/)로 지정하고 쿠키를 추가
		// 경로를 path2로 지정해서 쿠키를 추가
	
	%>
	<%= cookie1.getName() %> = <%= cookie1.getValue() %> [<%= cookie1.getDomain() %>] <br />
	<%= cookie2.getName() %> = <%= cookie2.getValue() %> [<%= cookie2.getDomain() %>] <br />
	<%= cookie3.getName() %> = <%= cookie3.getValue() %> [<%= cookie3.getDomain() %>] <br />
	<%= cookie4.getName() %> = <%= cookie4.getValue() %> [<%= cookie4.getDomain() %>] <br />
</body>
</html>