<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Delete Employee Account</title>
</head>
<body>
<%
	String uname = request.getParameter("eid");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&&password=root");
	String qry = "select * from employee_management_system where eid=?";
	PreparedStatement ps = con.prepareStatement(qry);
	ps.setString(1, uname);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<div class="container">
		<h1>Delete Employee Account</h1>
		<form action="deleteAccount" method="post">
			<label for="eid">Employee id:</label> 
			<input type="text" id="eid" name="eid" value="<%= rs.getString(1)%>" disabled> 
				
			<label for="name">Full Name:</label> 
			<input type="text" id="name" name="name" value="<%= rs.getString(2)%>" disabled>
			
			<label for="email">Email:</label> 
			<input type="email" id="email" name="email" value="<%= rs.getString(6)%>" disabled> 
			
			<label for="department">Department:</label> 
			<input type="text" id="department" name="department" value="<%= rs.getString(8)%>" disabled>
			
			<label for="role">Role:</label>
			<input type="text" id="role" name="role" value="<%= rs.getString(9)%>" disabled>
			
			<button class="login-btn" name="eid" value="<%= rs.getString(1)%>">Delete</button>
			<a href="index.html" class="logout-btn">Cancel</a>
		</form>
		</div>
</body>
</html>