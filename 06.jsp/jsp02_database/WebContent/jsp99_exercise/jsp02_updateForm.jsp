<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


	request.setCharacterEncoding("utf-8");
int bno = Integer.parseInt(request.getParameter("bno"));
	 String writer="";
	 String content="";
	 String subject="";
	 
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs =null;
	
		String url = "jdbc:mariadb://localhost:3306/jspstudy";
		String usr = "root";
		String pwd = "12345";
		String sql = "select * from board where bno = '" + bno + " '";
		
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				writer = rs.getString("writer");
				content = rs.getString("content");
				subject = rs.getString("subject");
			} else {
				out.println("<h3 class='bg-danger text-white'>" + bno + "를 찾지 못했습니다!!</h3>");
			}
		} catch(Exception e) {	
			out.println("<h3 class='bg-danger text-white'>DB접속실패!!</h3><br>" 
					+ e.getMessage());		
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
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
<body>
	<div class="container" align ="center">
		<h1>게시판수정하기</h1>
		
		
		<form action="jsp02_updateBoard.jsp" method="post">
		<table class="table table-bordered table-dark table-hover">
		<tr>
				<td width = "20%">제목</td>
				<td><input type ="text" name ="subject" class ="form-control" size ="30"  value =""></td>
			</tr>
			<tr>
				<td width = "20%">내용</td>
				<td><input type ="text" name ="content" class ="form-control" size ="30"  value =""></td>
			</tr>
			<tr>
				<td width = "20%">작성자</td>
				<td><input type ="text" name ="writer" class ="form-control" size ="30"  value =""></td>
			</tr>
			<tr>
				<td width = "20%">글번호</td>
				<td><input type ="number" name ="bno" class ="form-control" size ="30"  value =""></td>
			</tr>
		
		</table>
		<input type="submit" class= "btn btn-info mt-sm-2" value ="게시글수정하기" />
		
		</form>
	
	
	</div>
</body>
</html>