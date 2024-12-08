<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container">
		<h1>Create Your Account</h1>
		<form action="createAccount" method="post">
			<label for="eid">Employee id:</label> 
			<input type="text" id="eid" name="eid" required> 
				
			<label for="name">Full Name:</label> 
			<input type="text" id="name" name="name" required> 
			
			<label for="gender">Gender:</label> 
			<select id="gender" name="gender" required>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Other">Other</option>
			</select> 
			
			<label for="dob">Date of Birth:</label> 
			<input type="date" id="dob" name="dob" required> 
			
			<label for="phone">Contact Number:</label> 
			<input type="tel" id="phone" name="phone" required>
			
			<label for="email">Email:</label> 
			<input type="email" id="email" name="email" required> 
			
			<label for="password">Password:</label> 
			<input type="password" id="password" name="password" required>
			
			<label for="department">Department:</label> 
			<select id="department" name="department" required>
				<option value="Not Assigned">Not Assigned</option>
				<option value="Human Resources (HR)">Human Resources (HR)</option>
				<option value="Information Technology (IT)">Information Technology (IT)</option>
				<option value="Development">Development</option>
				<option value="Finance">Finance</option>
				<option value="Sales">Sales</option>
			</select> 
			
			<label for="role">Role:</label>
			<select id="role" name="role" required>
				<option value="Employee">Employee</option>
				<option value="Manager">Manager</option>
				<option value="HR">HR</option>
			</select> 
			
			

			<button type="submit" class="login-btn">Create Account</button>
		</form>
		<p>
			Already have an account? <a href="index.jsp">Login here</a>.
		</p>
	</div>
</body>
</html>
