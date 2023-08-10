<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
	파일전송방식
	
	게시판이나 자료실등에서 제품이미지등의 파일을 업로드 할경우 requeset기본객체등에서 제공하는 기능으로 파일을 업로드 할 수 있다.
	
	일반 파라미터로 전송할 때 사용하는 인코딩자료의 파일을 업로드할 때 사용하는 인코딩자료의 형식이 다르다.
	파일을 업로드 할 경우 스트림기반의 전송방식에는 인코딩 방식에 따라 전송하는 데이터 형식이 다르다.
	
	파일을 업로드 하기 위해서는 "multipart/ form-data'인코딩방식을 사용해야 하는데 데이터를 전송할 때
	form enctype의 속성 + post로 지정해야한다.


  -->
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
	 <div class="container" align="center">
   
      <form action="jsp02_multipartdata.jsp" method="post" enctype="multipart/form-data">
         <input type="text" class="mb-sm-2" placeholder="이름을 입력하세요..."><br>
         <input type="file" class="mb-sm-2" name="file1"><br>
         <input type="file" class="mb-sm-2" name="file2"><br>
         <input type="file" class="mb-sm-2" name="file3"><br>
         <input type="submit" class="btn btn-success" value="파일업로드">
      </form>
   </div>
</body>
</html>