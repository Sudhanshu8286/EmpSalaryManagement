<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>

<%@ include file="admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try
{

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");
	
	String q="select * from staff";
	
	PreparedStatement psmt=conn.prepareStatement(q);
	
	ResultSet rs=psmt.executeQuery();
	
	%>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">Contact</th>
	      <th scope="col">Date of Join</th>
	      <th scope="col">Basic Salary</th>
	    </tr>
	  </thead>
	  
	<%
	while(rs.next())
	{
		String st_name,st_email,st_con,st_doj;
		double st_salary;
		int st_id;
		
		st_id=rs.getInt("id");
		st_name=rs.getString("name");
		st_email=rs.getString("email");
		st_con=rs.getString("contact");
		st_doj=rs.getString("doj");
		st_salary=rs.getDouble("bsalary");
		%>
		<tbody>
	    <tr>
	      <th scope="row"><%=st_id %></th>
	      <td><%=st_name %></td>
	      <td><%=st_email %></td>
	      <td><%=st_con %></td>
	      <td><%=st_doj %></td>
	      <td><%=st_salary %></td>
	    </tr>
	  </tbody>
	
	<%		
	}
	
	
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>