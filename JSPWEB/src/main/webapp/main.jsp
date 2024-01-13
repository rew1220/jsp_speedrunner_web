<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Connection conn = null;
	ResultSet rs = null;
	String[] CT_cmp = new String[4];
	String cleartime = "";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "1234");
	
	String sql = "SELECT * FROM runner_tbl ORDER BY clear_time, postdate"; 

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();


	CT_cmp = rs.getString("clear_time").split("-");
	cleartime = CT_cmp[0]+"일"+CT_cmp[1]+"시간"+CT_cmp[2]+"분"+CT_cmp[3]+"초";
	
}catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
	
}
%>

<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "style.css">
<title>메인</title>
</head>
<body class = "body_all">

<form class = "headstyle">
<h1>speed runners</h1>
<table class = "head_tablestyle">
<tr>
	<td><a href = "main.jsp">메인</a></td>
	<td><a href = "record.jsp">기록</a></td>
	<td><a href = "apply.jsp">신청</a></td>
	<td><a href = "admin_accept.jsp">신청확인</a></td>
</tr>
</table>
</form>
<form class = "content_style">
<h1>● 스피드러너를 위한 스피드런 페이지</h1>
speedrunners는 여러분들의 스피드런 기록을 갱신하여 경쟁하는 사이트입니다.<br>
최대한 빠른 목표 달성을 통해 1위를 쟁취해보세요!
<br>
<br>
<h2>●1위 스피드런 기록</h2>
<table border="1" style = "text-align: center;">
<tr>
	<td>플레이어</td>
	<td>클리어 시간</td>
	<td>영상</td>
	<td>달성일자</td>
</tr>
<% if(rs.next()){ 

	CT_cmp = rs.getString("clear_time").split("-");
	cleartime = CT_cmp[0]+"일"+CT_cmp[1]+"시간"+CT_cmp[2]+"분"+CT_cmp[3]+"초";
	%>
<tr>
	<td><%=rs.getString("player") %></td>
	<td><%=cleartime %></td>
	<td><a href = <%=rs.getString("video_link") %>>링크</a></td>
	<td><%=rs.getDate("postdate") %></td>
</tr>
<%} %>
</table>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "1234");
	
	String sql = "SELECT * FROM runner_tbl ORDER BY postdate desc"; 

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();

	
	
}catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
	
}
%>
<h2>●최근 올라온 스피드런</h2>
<table border="1" style = "text-align: center;">
<tr>
	<td>플레이어</td>
	<td>클리어시간</td>
	<td>영상</td>
	<td>달성일자</td>
</tr>
<% if(rs.next()){ 

	CT_cmp = rs.getString("clear_time").split("-");
	cleartime = CT_cmp[0]+"일"+CT_cmp[1]+"시간"+CT_cmp[2]+"분"+CT_cmp[3]+"초";
	%>
<tr>
	<td><%=rs.getString("player") %></td>
	<td><%=cleartime %></td>
	<td><a href = <%=rs.getString("video_link") %>>링크</a></td>
	<td><%=rs.getDate("postdate") %></td>
</tr>
<%} %>
</table>
</form>
</body>
</html>