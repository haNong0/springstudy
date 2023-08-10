<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	c:catch var "exName" 의 형태로 exception이 발생하면 해당 익셉션객체르 exName에 
	저장하는 태그이다. 그 이후에 exName객체가 잇을 경우에는 익셉션처리를 할 수가 있다.
 -->
 
 
 <h1>c:catch </h1>
 
 <c:catch var ="e">
 	name 파라미터 값 = <%= request.getParameter("name") %> <br />
 	
 	<%
 		if(request.getParameter("name").equals("hong")) {
 			
 	%>
 		${param.name} 회원이름은 홍길동입니다.
 		
 	<%
 		}
 	
 	
 	%>
 </c:catch>
 
 <c:if test = '${e != null}'>
 	에러가 발생!
 	${e}
 
 
 </c:if>