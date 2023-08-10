<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int code = Integer.parseInt(request.getParameter("code"));
   String forward_page = "";
   out.println("<h3>jsp07_forward_02.jsp?code"+ code + "</h3>");
   
   if(code==1) forward_page= "./forward/1st.jsp";
   else if (code==2) forward_page= "./forward/2nd.jsp";
   else  forward_page= "./forward/3rd.jsp";
%>

<jsp:forward page ="<%= forward_page%> ">
	<jsp:param value="admin" name="id"/>
	<jsp:param value="<%= URLEncoder.encode("관리자")%>" name="name"/>
</jsp:forward>