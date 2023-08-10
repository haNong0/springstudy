<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
 String id =request.getParameter("id");
 String pw =request.getParameter("pw");
 String name =request.getParameter("name");
 String email =request.getParameter("email");
 
 
 Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;	
// 실습 업데이트 로직 완성하기
	String url = "jdbc:mariadb://localhost:3306/jspstudy";
	String usr = "root";
	String pwd = "12345";
	String sql = "insert into member values(?,?,?,?)"; 
	
	int insertCount = 0;
	boolean isInsert = true;
	
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);	
		pstmt.setString(2, pw);	
		pstmt.setString(3, name);	
		pstmt.setString(4, email);	
		insertCount = pstmt.executeUpdate();	
	} catch(Exception e) {	
		isInsert = false;
		out.println("<h3 class='bg-danger text-white'>DB접속실패!!</h3><br>" 
				+ e.getMessage());		
	} finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}	
 %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div class="container" align="center">
		<h1>회원등록결과</h1>
		
		<c:choose>
			<c:when test="<%= isInsert %>">
				<h3>회원이 성공적으로 등록되었습니다!!</h3>
				아이디   : <%= id %><br>
				비밀번호 : <%= pw %><br>
				회원이름 : <%= name %><br>
				이메일   : <%= email %><br>
			</c:when>
			<c:otherwise>			
				<h3 class="bg-danger text-white">회원등록이 실패했습니다!!</h3>
			</c:otherwise>
		</c:choose>
		
		<form action="jsp05_listMember.jsp">
			<input type="submit" class="btn btn-info" value="회원목록"/>
			<a href="jsp05_listMember.jsp" class="btn btn-info">회원목록</a>
		</form>		
	</div>
</body>
</html>