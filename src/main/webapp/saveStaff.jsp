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

	String Sname,Semail,Scontact,Sdoj;
	double Ssalary;
	
	
	Sname=request.getParameter("staff_name");
	Semail=request.getParameter("staff_email");
	Scontact=request.getParameter("staff_contact");
	Sdoj=request.getParameter("staff_doj");
	Ssalary=Double.parseDouble(request.getParameter("staff_salary"));
	
	try
	{

		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");
		
		String q="insert into staff(name,email,contact,doj,bsalary) values('"+Sname+"','"+Semail+"','"+Scontact+"','"+Sdoj+"','"+Ssalary+"')";
		
		PreparedStatement psmt=conn.prepareStatement(q);
		
		int row=psmt.executeUpdate();
		
		if(row>0)
		{
			%>
			<script>alert("Staff Added Successfully");window.location.href="admin.jsp";</script>
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