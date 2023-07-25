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

	String Semail,Susername,Spassword,Scpassword,Srole="User";
	
	Semail=request.getParameter("staff_email");
	Susername=request.getParameter("staff_username");
	Spassword=request.getParameter("staff_password");
	Scpassword=request.getParameter("staff_cpassword");
	
	try
	{

		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");
		
		String q="insert into login(email,username,password,cpassword,role) values('"+Semail+"','"+Susername+"','"+Spassword+"','"+Scpassword+"','"+Srole+"')";
		
		PreparedStatement psmt=conn.prepareStatement(q);
		
		int row=psmt.executeUpdate();
		
		if(row>0)
		{
			%>
			<script>alert("User Registered Successfully");window.location.href="admin.jsp";</script>
			<%
		}
		else	
		{
			out.println("Wrong");
		}	
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>
</body>
</html>