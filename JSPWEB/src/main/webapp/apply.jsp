<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "style.css">
<title>신청 페이지</title>
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
<form class = "content_style" action="postaction.jsp" method="post">
<h1>●신청하기</h1>
<table border = "2">
<tr>
	<td>플레이어: </td>
	<td><input type = "text" name = "playername" placeholder="플레이어 이름 입력" maxlength="20"></td>
</tr>
<tr>
	<td>영상주소: </td>
	<td><input type = "text" name = "link" placeholder="영상주소 입력" maxlength="200" size="100"></td>
</tr>
<tr>
	<td colspan="2"><input type = "submit" value="신청" style="width: 100%;"></td>
</tr>
</table>
</form>
</body>
</html>