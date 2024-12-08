<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Update Employee Account</title>
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
		<h1>Update Employee Account</h1>
		<form action="updateAccount" method="post">
			<label for="eid">Employee id:</label> 
			<input type="text" id="eid" name="eid" value="<%= rs.getString(1)%>" disabled> 
				
			<label for="name">Full Name:</label> 
			<input type="text" id="name" name="name" required value="<%= rs.getString(2)%>"> 
			
			<label for="gender">Gender:</label> 
			<select id="gender" name="gender" required">
				<option value="Male" <%= "Male".equals(rs.getString(3)) ? "selected" : "" %>>Male</option>
				<option value="Female" <%= "Female".equals(rs.getString(3)) ? "selected" : "" %>>Female</option>
				<option value="Other" <%= "Other".equals(rs.getString(3)) ? "selected" : "" %>>Other</option>
			</select> 
			
			<label for="dob">Date of Birth:</label> 
			<input type="date" id="dob" name="dob" required value="<%= rs.getString(4)%>"> 
			
			<label for="phone">Contact Number:</label> 
			<input type="tel" id="phone" name="phone" required value="<%= rs.getLong(5)%>">
			
			<label for="email">Email:</label> 
			<input type="email" id="email" name="email" required value="<%= rs.getString(6)%>"> 
			
			<label for="password">Password:</label> 
			<input type="password" id="password" name="password" required value="<%= rs.getString(7)%>">
			
			<label for="department">Department:</label> 
			<select id="department" name="department" required>
    			<option value="Not Assigned" <%= "Not Assigned".equals(rs.getString(8)) ? "selected" : "" %>>Not Assigned</option>
    			<option value="Human Resources (HR)" <%= "Human Resources (HR)".equals(rs.getString(8)) ? "selected" : "" %>>Human Resources (HR)</option>
    			<option value="Information Technology (IT)" <%= "Information Technology (IT)".equals(rs.getString(8)) ? "selected" : "" %>>Information Technology (IT)</option>
    			<option value="Development" <%= "Development".equals(rs.getString(8)) ? "selected" : "" %>>Development</option>
    			<option value="Finance" <%= "Finance".equals(rs.getString(8)) ? "selected" : "" %>>Finance</option>
    			<option value="Sales" <%= "Sales".equals(rs.getString(8)) ? "selected" : "" %>>Sales</option>
            </select>

			
			<label for="role">Role:</label>
			<select id="role" name="role" required>
    			<option value="Employee" <%= "Employee".equals(rs.getString(9)) ? "selected" : "" %>>Employee</option>
    			<option value="Manager" <%= "Manager".equals(rs.getString(9)) ? "selected" : "" %>>Manager</option>
    			<option value="HR" <%= "HR".equals(rs.getString(9)) ? "selected" : "" %>>HR</option>
			</select>

			
			<button type="submit" class="login-btn" name="eid" value="<%= rs.getString(1)%>">Update</button>
			<a href="index.html" class="logout-btn">Cancel</a>
		</form>
		</div>
</body>
</html>