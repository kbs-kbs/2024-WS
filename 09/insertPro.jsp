<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>

<% 
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   String passwdagain = request.getParameter("passwdagain");
   String name = request.getParameter("name");    
   String phonenum = request.getParameter("phonenum");
   String email = request.getParameter("email");    
   String birthday = request.getParameter("birthday");    

   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";
 
  String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
  String dbId = "jspid";
  String dbPass = "jspass";
 	 
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 	
  String sql= "insert into member2 values (?,?,?,?,?,?,?)";
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, id);
  pstmt.setString(2, passwd);
  pstmt.setString(3, passwdagain);
  pstmt.setString(4, passwdagain);
  pstmt.setString(5, name);
  pstmt.setString(6, email);
  pstmt.setString(7, birthday);
  pstmt.executeUpdate();
 	 
  str= "member2 테이블에 새로운 레코드를 추가했습니다.";
 %>

<html>
<head>
<title>레코드 추가</title>
</head>
<body>
  <%=str %>
</body>
</html>