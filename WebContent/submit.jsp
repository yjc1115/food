<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%	
String b1 =request.getParameter("name");		
String b2 =request.getParameter("menu");		
String b3 =request.getParameter("home");		
String b4 =request.getParameter("price");		
String b5 =request.getParameter("loc");		
String b6 =request.getParameter("star");		
String b7 =request.getParameter("tel");		
String b8 =request.getParameter("time");		

//위 데이터를 데이터 베이스에 넣기
	Connection conn = null;			
	Boolean connect = false;
		
	try {	
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
		conn = ds.getConnection();
		
		String sql = "INSERT INTO food (name, menu, home, price, loc, star, tel, time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b1);	
		pstmt.setString(2, b2);	
		pstmt.setString(3, b3);	
		pstmt.setString(4, b4);	
		pstmt.setString(5, b5);	
		pstmt.setString(6, b6);	
		pstmt.setString(7, b7);	
		pstmt.setString(8, b8);	
		pstmt.executeUpdate();	
		connect = true;
		conn.close();
	} catch (Exception e) {	
		connect = false;
		e.printStackTrace();
	}	
		
	if (connect == true) {	
		System.out.println("연결되었습니다.");
	} else {	
		System.out.println("연결실패.");
	}	


%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=b1 %><br>	
<%=b2 %><br>	
<%=b3 %><br>	
<%=b4 %><br>	
<%=b5 %><br>	
<%=b6 %><br>	
<%=b7 %><br>	
<%=b8 %><br>		

</body>
</html>