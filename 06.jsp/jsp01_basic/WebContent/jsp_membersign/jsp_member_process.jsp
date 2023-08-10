<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String[] hb =request.getParameterValues("hobbies"); %>  
<table border =1>
<thead>회원정보</thead>
<tr>
<td>정보값</td>
<td>받아온값</td>
</tr>
<tr>
<td>ID</td>
<td><%= request.getParameter("user_id") %></td>
</tr>
<tr>
<td>PW</td>
<td><%= request.getParameter("user_pw") %></td>
</tr>
<tr>
<td>성별</td>
<td>
<%= request.getParameter("user_gender") %>

</td>
</tr>
<tr>
<td>연락처</td>
<td><%= request.getParameter("user_pnum") %></td>
</tr>
<tr>
<td>취미</td>
<td><%
 	if(hb != null){
 		for(String hobby:hb) {
 %>
			 <%= hobby %>
 <% 
 		}
 	}
 %></td>
</tr>
<tr>
<td>가입인사</td>
<td><%= request.getParameter("user_ho") %></td>
</tr>




</table>
</body>
</html>