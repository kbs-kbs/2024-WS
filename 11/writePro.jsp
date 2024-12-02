<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String name = request.getParameter("name");
   String pass= request.getParameter("pass");
   String email = request.getParameter("email");
   String title = request.getParameter("title");
   String contents = request.getParameter("contents");
   Timestamp writedate = new Timestamp(System.currentTimeMillis());
   int readcount = 0;

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   try{
 	 String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
     String dbId="jspid";
     String dbPass="jsppass";
 	 
 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	 
 	 Calendar dateIn = Calendar.getInstance();
 	 String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
 	 indate += Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
 	 indate += Integer.toString(dateIn.get(Calendar.DATE)) + " ";
 	 indate += Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
 	 indate += Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
 	 indate += Integer.toString(dateIn.get(Calendar.SECOND));
 	
 	 
 	 String sql= "insert into tblboard (name,pass,email,title,contents,writedate,readcount)";
 	 sql += "values (?,?,?,?,?,?,?)";
 	 
 	 pstmt=conn.prepareStatement(sql);
 	 pstmt.setString(1,name);
     pstmt.setString(2,pass);
 	 pstmt.setString(3,email);
 	 pstmt.setString(4,title);
 	 pstmt.setString(5,contents);
 	 pstmt.setString(6,indate);
 	 pstmt.setInt(7,readcount);
 	 pstmt.executeUpdate();
 	 
 	 str= "tblboard 테이블에 새로운 레코드를 추가했습니다.";

 	}catch(Exception e){ 
 		e.printStackTrace();
 		str="tblboard 테이블에 새로운 레코드를 추가에 실패했습니다";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 		response.sendRedirect("listboard.jsp"); 
 	}
 %>

<html>
<head>
<title>레코드 추가</title>
</head>
<body>
  <%=str %>
</body>
</html>