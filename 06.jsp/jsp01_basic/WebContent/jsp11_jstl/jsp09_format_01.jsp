<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jstl/fmt" %>
<fmt:setLocale value = "ko"/>
<fmt:bundle basename= "resource.message">
	<fmt:message key ="TITLE" var="title"></fmt:message>

</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${title}</h1>
	<fmt:bundle basename="resource.message">
		<fmt:message key="GREETING">
		<c:if test="${!empty param.id}">
		<fmt:message key="USER">
			<fmt:param> </fmt:param>
		</fmt:message>
		
		</c:if>
		
		</fmt:message>
	
	</fmt:bundle>
</body>
</html>