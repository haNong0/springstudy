<%@page import="java.io.FileReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	out태그 파라미터 c:out
	
	value   	:Jspwriter에 출력할 값을 지정, 일반적으로 value의 속성타입은 String
	escapeXml 	: 이 속성값이 true일 경우 비교연산자를 아래와 같은 문자로 변환
				 특수문자를 변환할지 여부를 지정하는 옵션
				 <: &lt
				 >: &gt
				 &: &map
				 ': &#039
				 ": &#034
				 
				 default : value속성에 값을 지정을 않았을 경우 기본값으로 default옵션 지정값으로 출력
 -->
 
 <%
 	out.println(20>10);
 	out.println("<br>");
 	out.println("20>10"); 
 %>
 <hr />
 
 <!-- -->
 
 <%
 	FileReader reader = null;
 
 	try{
 		String path = request.getParameter("path");
 		reader = new FileReader(getServletContext().getRealPath(path));
 		%>
 		<pre>
 		소스코드 <%= path %>
 		<c:out value="<%= reader %>"></c:out>
 		</pre>
 		
<%
 	}catch (Exception e) {
 		 %>
 		<h3> 에러 : <%= e.getMessage() %></h3>
<%
 	} finally {
 		if(reader != null) try {reader.close();} catch(Exception e ) {}
 	}
 %>
 
 
 