<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
 int bno = Integer.parseInt(request.getParameter("bno"));
 String subject =request.getParameter("subject");
 String content =request.getParameter("content");
 String crtdate =request.getParameter("crtdate");
 String writer =request.getParameter("writer");
 int readcnt =Integer.parseInt(request.getParameter("readcnt"));
 
 
 Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;	
// 실습 업데이트 로직 완성하기
	String url = "jdbc:mariadb://localhost:3306/jspstudy";
	String usr = "root";
	String pwd = "12345";
	String sql = "insert into board values(?,?,?,?,?,?)"; 
	
	int insertCount = 0;
	boolean isInsert = true;
	
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);	
		pstmt.setString(2, subject);	
		pstmt.setString(3, writer);	
		pstmt.setString(4, content);	
		pstmt.setString(5, crtdate);	
		pstmt.setInt(6, readcnt);	
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
		<h1>게시글등록결과</h1>
		
		<c:choose>
			<c:when test="<%= isInsert %>">
				<h3>게시글이 성공적으로 등록되었습니다!!</h3>
				글번호   : <%= bno %><br>
				제목 : <%= subject %><br>
				작성자 : <%= writer %><br>
				내용 : <%= content %><br>
				날짜   : <%= crtdate %><br>
				조회수?   : <%= readcnt %><br>
			</c:when>
			<c:otherwise>			
				<h3 class="bg-danger text-white">게시글등록이 실패했습니다!!</h3>
			</c:otherwise>
		</c:choose>
		
		<form action="jsp05_listBoard.jsp">
			<input type="submit" class="btn btn-info" value="게시글목록"/>
			<a href="jsp05_listBoard.jsp" class="btn btn-info">게시글목록</a>
		</form>		
	</div>
</body>
</html>