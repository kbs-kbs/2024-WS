<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="member" class="aa.MemberInfo" scope="page" />
	<jsp:setProperty name="member" property="*" /> 
	<table border="1" cellpadding="0" cellspacing="0">
     <tr>
         <td>아이디</td>
         <td><jsp:getProperty name="member" property="id" /></td>
         <td>암호</td>
         <td><jsp:getProperty name="member" property="password" /></td>
     </tr>
     <tr>
         <td>이름</td>
         <td><jsp:getProperty name="member" property="name" /></td>
         <td>이메일</td>
         <td><jsp:getProperty name="member" property="email" /></td>
     </tr>
     <tr>
         <td>주소</td>
         <td colspan="3"><jsp:getProperty name="member" property="address" /></td>         
     </tr>       
   </table>
</body>
</html>