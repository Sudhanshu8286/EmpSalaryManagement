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

	String Sname,Semail,Scontact,Sdoj,Sdos;
	double Ssalary,Spf,Snet;
	
	
	Sname=request.getParameter("staff_name");
	Semail=request.getParameter("staff_email");
	Scontact=request.getParameter("staff_contact");
	Sdoj=request.getParameter("staff_doj");
	Sdos=request.getParameter("staff_dos");
	Ssalary=Double.parseDouble(request.getParameter("staff_salary"));
	
	
	Spf=Ssalary*0.2;
	Snet=Ssalary-Spf;
	
	try
	{

		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");
		
		String q="insert into payslip(name,email,contact,doj,bsalary,dos,pf,netsalary) values('"+Sname+"','"+Semail+"','"+Scontact+"','"+Sdoj+"','"+Ssalary+"','"+Sdos+"','"+Spf+"','"+Snet+"')";
		
		PreparedStatement psmt=conn.prepareStatement(q);
		
		int row=psmt.executeUpdate();
		
		if(row>0)
		{
			%>
			<script>alert("Payslip Generated Successfully");window.location.href="admin.jsp";</script>
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