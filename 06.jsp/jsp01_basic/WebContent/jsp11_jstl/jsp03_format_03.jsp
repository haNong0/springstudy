<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<c:set var="price" value="12345"> </c:set>
	<fmt:formatNumber value="${ price }" type="number"/><br>
	number       : <fmt:formatNumber value="${ price }" type="number"/><br>
	currency     :<fmt:formatNumber value="${ price }" type="currency"/><br>
	currency     :<fmt:formatNumber value="${ price }" type="currency" currencySymbol="$"/><br>
	groupingUsed :<fmt:formatNumber value="${ price }" type="currency" currencySymbol="$" groupingUsed="false"/><br>
	pattern      :<fmt:formatNumber value="${ price }" type="currency" currencySymbol="$" pattern="000000.00"/><br>
	<hr />
	
	<h3>2. formatDate</h3>
	<c:set var="now" value="<%= new java.util.Date() %>"/>
	${ now }<br>
	default : <fmt:formatDate value="${ now }" type="date"/>
	
	
	
	<hr />
	<h3>3. timeZone</h3>
	<h3>4. timeZone 목록</h3>
</body>
</html>