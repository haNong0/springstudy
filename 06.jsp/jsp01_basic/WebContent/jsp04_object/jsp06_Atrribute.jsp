<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		getAttributeNames()
		
		<h1>application객체의 attributes</h1>
		<% Enumeration<String> app = application.getAttributeNames();
			while(app.hasMoreElements()){
				String name = app.nextElement();
				Object value = application.getAttribute(name);
				
		%>
					<h4>객체속성 :<%= name  %>: <%= value %> </h4>
		<% 
			}
		
		
		
		%>
		
		<h1>session 객체</h1>
		<% 
		
		request.setAttribute("yyy", "request....");
		Enumeration<String> sess = application.getAttributeNames();
			while(sess.hasMoreElements()){
				String name = sess.nextElement();
				Object value = session.getAttribute(name);
				
		%>
					<h4>객체속성 :<%= name  %>: <%= value %> </h4>
		<% 
			}
		
		
		
		%>
		request.setAttribute("yyy", "request....");
		Enumeration<String> sess = request.getAttributeNames();
			while(sess.hasMoreElements()){
				String name = sess.nextElement();
				Object value = session.getAttribute(name);
				
		%>
					<h4>객체속성 :<%= name  %>: <%= value %> </h4>
		<% 
			}
		
		
		
		%>
		
		
</body>
</html>