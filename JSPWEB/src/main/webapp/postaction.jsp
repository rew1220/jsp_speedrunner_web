<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로딩중</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
	String player = request.getParameter("playername");
	String link = request.getParameter("link");

	Connection conn = null;
	ResultSet rs = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "1234");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new Date();
		String nowTime = sdf.format(now);
		
		String sql = "INSERT INTO ready_tbl values('"+player+"', null, '"+link+"', '"+nowTime+"')";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e);
		
	}
%>
<jsp:forward page="record.jsp"></jsp:forward>
</body>
</html>