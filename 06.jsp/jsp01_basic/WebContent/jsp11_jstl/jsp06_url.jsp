<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!-- 
		url관련태그는 url생성기능과 redirect처리기능


:/search?w=https://velog.io/@nugoory20/JSTLbasic.-cforEach%EB%AC%B8%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%B4-%EA%B5%AC%EA%B5%AC%EB%8B%A8%EC%9D%84-%EB%A7%8C%EB%93%A4%EC%96%B4%EB%B3%B4%EC%9E%90for%EB%B0%98%EB%B3%B5%EB%AC%B8
 -->
 <c:url var="search" value="https://search.daum.net/search" >
 	<c:param name="w" value="news"></c:param>
 	<c:param name="q" value="김민재"></c:param>
 
 
 </c:url>
 
 <ul>
 	<li><a href="${search}">다음뉴스에서 김민재 검색</a></li>
 	<li><c:url value="jsp02_if.jsp"/></li>
 </ul>
 
 <c:redirect url="http://www.google.com"></c:redirect>