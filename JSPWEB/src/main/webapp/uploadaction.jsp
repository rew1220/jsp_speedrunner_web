<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로딩</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int index = Integer.parseInt(request.getParameter("index"));
String[] cleartime = new String[index];
int i = 0;
for (;i<index;i++){
	cleartime[i] = request.getParameter("cleartime"+(i+1));
}
Connection conn = null;
ResultSet rs = null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "1234");

String sql = "SELECT * FROM ready_tbl ORDER BY postdate"; 

PreparedStatement pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();
String updsql = null;
	i = 0;
	while(rs.next()){
		if(cleartime[i].length() != 11){
			i++;
			continue;
		}

		updsql = "INSERT INTO runner_tbl values(?, ?, ?, ?)";
		PreparedStatement updpstmt = conn.prepareStatement(updsql);
		updpstmt.setString(1, rs.getString("PLAYER"));
		updpstmt.setString(2, cleartime[i]);
		updpstmt.setString(3, rs.getString("video_link"));
		updpstmt.setDate(4, rs.getDate("postdate"));
		updpstmt.executeUpdate();

		updsql = "DELETE FROM ready_tbl WHERE player = ?";
		updpstmt = conn.prepareStatement(updsql);
		updpstmt.setString(1, rs.getString("player"));
		updpstmt.executeUpdate();
		
		i++;
	}


}catch(Exception e){
e.printStackTrace();
System.out.println(e);
}
%>
<jsp:forward page="record.jsp"></jsp:forward>
</body>
</html>