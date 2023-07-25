<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ include file="index.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="checkLogin.jsp">
			  
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Username</label>
			    <input type="text" name="staff_username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Password</label>
			    <input type="password" name="staff_password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Password">
			 
			  </div>
			  
			 
			  
			  
			  
	  		  <button type="submit" class="btn btn-primary">Login</button>
		    </form>
</body>
</html>