<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<h3>회원이 되어 다양한 혜택을 경험해 보세요!</h3>
<form method="post" action="insertPro.jsp">
아이디<br>
<input type="text" name="id" maxlength="50"><input type="submit" value="중복 확인"><br>
비밀번호<br>
<input type="password" name="passwd" maxlength="16"><br>
비밀번호 확인<br>
<input type="password" name="passwdagain" maxlength="16"><br>
이름<br>
<input type="text" name="name" maxlength="10"><br>
전화번호<br>
<input type="text" name="phonenum" maxlength="11"><br>
이메일<br>
<input type="text" name="email" maxlength="50"><br>
생년월일<br>
<input type="text" name="birthday" maxlength="10"><br>
<input type="submit" value="가입하기">
</form>
</body>
</html>