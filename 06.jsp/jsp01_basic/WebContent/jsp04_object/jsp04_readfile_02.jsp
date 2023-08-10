<%@page import="java.io.InputStreamReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>application객체를 이용해서 파일읽기</h1>
	<h2> aplication.getResourceAsStream(path)이용</h2>
	<%
		char[] cbuf = new char[128000];
		int len = -1;
		String path = "/jsp04_object/jsp04_readfile_02.jsp";
		try(InputStreamReader isr = new InputStreamReader(application.getResourceAsStream(path))){
			while((len =isr.read(cbuf)) != -1) {
				out.println(new String(cbuf, 0, len));
			}
			
		}catch(Exception e) {
			out.println("에러:" + e.getLocalizedMessage());
		}
	
	
	%>
	실제경로 : <%= application.getRealPath(path) %>
	ContextPath : <%=application.getContextPath() %>
</body>
</html>