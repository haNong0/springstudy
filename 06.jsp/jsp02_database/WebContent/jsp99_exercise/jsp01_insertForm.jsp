<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h1>게시판등록하기</h1>
		
		
		<form action="jsp01_insertBoard2.jsp" method="post">
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
			<tr>
				<td width = "20%">작성날짜</td>
				<td><input type ="date" name ="crtdate" class ="form-control" size ="30"  value =""></td>
			</tr>
			<tr>
				<td width = "20%">조회수</td>
				<td><input type ="number" name ="readcnt" class ="form-control" size ="30"  value =""></td>
			</tr>
		
		</table>
		<input type="submit" class= "btn btn-info mt-sm-2" value ="게시글작성하기" />
		
		</form>
	
	
	</div>
</body>
</html>