<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    
<%@include file="admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
			<form method="post" style="width:40%">
			  <div class="form-group">
			    <input type="text" name="staff_id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Staff Register ID">
			  </div>
			  <button type="submit" class="btn btn-primary">Search</button>
			</form>

			<br><br>
			
			<%
			
			try
			{
				String st_name,st_email,st_contact,st_doj,st_dos;
				double st_bsalary;
				int sid=Integer.parseInt(request.getParameter("staff_id"));
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empsystem","root","");
					
				
				String query="select * from staff where id='"+sid+"'";
				
				PreparedStatement psmt=conn.prepareStatement(query);
				
				ResultSet rs=psmt.executeQuery();
				
				while(rs.next())
				{
					st_name=rs.getString("name");
					st_email=rs.getString("email");
					st_contact=rs.getString("contact");
					st_doj=rs.getString("doj");
					st_bsalary=rs.getDouble("bsalary");
					%>
					<form method="post" action="savePayslip.jsp"  style="width:40%">
					  <div class="form-group">
					    <label for="exampleInputEmail1">Name</label>
					    <input type="text" name="staff_name" value="<%=st_name %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
					 
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email</label>
					    <input type="text" name="staff_email" value="<%=st_email %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
					 
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Contact</label>
					    <input type="text" name="staff_contact" value="<%=st_contact %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact">
					 
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Date Of Joining</label>
					    <input type="date" name="staff_doj" value="<%=st_doj %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
					 
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">Salary</label>
					    <input type="text" name="staff_salary" value="<%=st_bsalary %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Salary">
					 
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">DOS</label>
					    <input type="date" name="staff_dos" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Salary">
					 
					  </div>
					  
					  
			  		  <button type="submit" class="btn btn-primary">Generate</button>
				    </form>
					<%
				}	
			}
			catch(Exception e)
			{
				
			}
			
			%>


			
</body>
</html>