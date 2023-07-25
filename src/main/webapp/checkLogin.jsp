<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%


String Susername,Spassword;

Susername=request.getParameter("staff_username");
Spassword=request.getParameter("staff_password");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");


String q="select * from login where username='"+Susername+"' AND password='"+Spassword+"'";

PreparedStatement psmt=conn.prepareStatement(q);

ResultSet rs=psmt.executeQuery();

while(rs.next())
{
	if(rs.getString("username").equals(Susername) && rs.getString("password").equals(Spassword) && rs.getString("role").equals("Admin"))
	{
		response.sendRedirect("admin.jsp");
	}
	
	else if(rs.getString("username").equals(Susername) && rs.getString("password").equals(Spassword) && rs.getString("role").equals("User"))
	{
		response.sendRedirect("user.jsp");
	}
}

%>

<script>alert("Invalid Username or Password");window.location.href="login.jsp";</script>

</body>
</html>