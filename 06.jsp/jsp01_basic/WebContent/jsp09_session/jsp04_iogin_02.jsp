<%@page import="com.lec.cookie.MYCookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
		session.setAttribute("id", "sss");
		session.setAttribute("pw", "12134");
		session.setAttribute("name", "홍길동");
	%>
<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   
   if(id.equals(pw)) {
      response.addCookie(MYCookie.createCookie("ADMIN", id, "/", -1));
%>
   <h3>로그인성공</h3>
<%
   } else {
%>
      <script>
      alert("로그인실패 - 아이디와 비밀번호가 일치하지 않습니다")
      </script>
<%
   }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String Id = request.getParameter("id");
   String Pw = request.getParameter("pw");
   
   if(id.equals(pw)) {
      response.addCookie(MYCookie.createCookie("ADMIN", id, "/", -1));
%>
   <h3>로그인성공</h3>
<%
   } else {
%>
      <script>
      alert("로그인실패 - 아이디와 비밀번호가 일치하지 않습니다")
      </script>
<%
   }
%>