<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>test file for checking DB connection</h2>
	<form action="${pageContext.request.contextPath }/sample/testPro" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pass"><br>
		이름 : <input type="text" name="name"><br>
		<input type="submit" value="회원가입">
	</form>

</body>
</html>
