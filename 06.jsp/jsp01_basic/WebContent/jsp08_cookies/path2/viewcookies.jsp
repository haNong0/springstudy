<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>path1에 있는 쿠키목록읽기</h3>
<%

Cookie[] cookies = request.getCookies();
if(cookies != null && cookies.length>0 ){
	for(int i =0; i<cookies.length; i++)
%>
	<%= cookies[i].getName() %> = <%= URLDecoder.decode(cookies[i].getValue(),"utf-8") %> <br />
		<% 
}

}else {
%>
<p class ="danger"> 쿠키가 존재하지 않습니다.</p>
<%
}
%>

