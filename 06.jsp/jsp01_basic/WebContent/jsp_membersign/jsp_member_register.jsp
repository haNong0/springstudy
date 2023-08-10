<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입해줘</h2>
	<form action="jsp_member_process.jsp" method = "post">
	ID :<input type="text" name= "user_id" /> <br />
	PW :<input type="text" name= "user_pw" /> <br />
	연락처: <input type="text" name = "user_pnum" /><br />
	취미 : 강<input type="checkbox" name ="hobbies" value ="강" />
		  사<input type="checkbox" name ="hobbies" value ="사" />
		  님<input type="checkbox" name ="hobbies" value ="님" />
		  ♥<input type="checkbox" name ="hobbies" value ="♥" /> <br />
	성별 : 남 <input type="radio" name= "user_gender" value ="남자" /> 
		  여 <input type="radio" name= "user_gender" value = "여자"/> <br />
	가입인사: <textarea name="user_ho"  cols="10" rows="10"></textarea> <br />
	<input type="submit" value = "가입하기" />
	<input type="reset" value = "새로고침" />
	
	</form>
</body>
</html>