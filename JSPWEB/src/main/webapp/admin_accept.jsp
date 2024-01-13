<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
	Connection conn = null;
	ResultSet rs = null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "1234");
	
	String sql = "SELECT * FROM ready_tbl ORDER BY postdate"; 

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();

	
}catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
	
}
%>

<meta charset="UTF-8">
<link rel = "stylesheet" href = "style.css">
<title>신청확인</title>
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
<form class = "content_style" action="uploadaction.jsp">
<h1>●신청 목록</h1>
<table border="1" style = "text-align: center;">
<tr>
	<td>목록</td>
	<td>플레이어</td>
	<td>클리어 시간</td>
	<td>영상</td>
	<td>달성일자</td>
</tr>
<% 
	int i = 1;
	try{
	while(rs.next()){
	
	%>

<tr>
	<td><%=i%></td>
	<td><%=rs.getString("player") %></td>
	<td><input type="text" placeholder="시간을 입력해주세요.(DD-HH-MM-SS로 작성)" size = "40" name = <%="cleartime"+i %> maxlength="11"></td>
	<td><a href = <%=rs.getString("video_link") %>>링크</a></td>
	<td><%=rs.getDate("postdate") %></td>
</tr>

<%i++;}
}catch(Exception e){
	e.printStackTrace();
}%>
<tr>
<td colspan="5"><input type = "submit" value = "확인" style = "width: 100%"></td>
</tr>
</table>
<input type = "hidden" name = "index" value = <%=i-1 %>>
</form>
</body>
</html>