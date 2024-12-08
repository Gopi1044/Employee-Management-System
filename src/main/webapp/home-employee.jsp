<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Employee Dashboard</title>
</head>
<body>
<div class="container">
	<%
	String uname = request.getParameter("eid");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&&password=root");
	String qry = "select * from employee_management_system where eid=?";
	PreparedStatement ps = con.prepareStatement(qry);
	ps.setString(1, uname);
	ResultSet rs = ps.executeQuery();
	rs.next();
	out.println("<h1>Welcome, "+rs.getString(2)+"</h1>");
	out.println("<h2>Your Role: "+rs.getString(9)+"</h2>");
	out.println("<h3>Your Details</h3>");
	out.println("<table><thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Designation</th><th>Actions</th></tr></thead>");
	out.println("<tbody>");
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(8)+"</td>");
	out.println("<td>"+rs.getString(9)+"</td>");
	out.println("<td>");
	out.println("<a href='update-employee.jsp?eid="+rs.getString(1)+"'><button class='action-btn edit-btn'>Edit Profile</button></a>");
	out.println("<a href='delete-employee.jsp?eid="+rs.getString(1)+"'><button class='action-btn delete-btn'>Delete</button></a>");
	out.println("</td>");
	out.println("</tr>");
	out.println("</tbody></table>");
	if(rs.getString(9).equals("HR")){
				
		        Statement st = con.createStatement();
		        ResultSet mgr = st.executeQuery("select * from employee_management_system where role='Manager'");
		        if(mgr.next()){
		        	out.println("<h3>Details of Managers in Company</h3>");
					out.println("<table><thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Designation</th><th>Actions</th></tr></thead>");
			        out.println("<tbody>");
		        	do{
		        		
		        		String bgclr="";
		 		        if(mgr.getString(8).equals("Not Assigned")) bgclr+="'red'";
		        		out.println("<tr>");
			        	out.println("<td>"+mgr.getString(1)+"</td>");
			        	out.println("<td>"+mgr.getString(2)+"</td>");
			        	out.println("<td>"+mgr.getString(6)+"</td>");
			        	out.println("<td bgcolor="+bgclr+">"+mgr.getString(8)+"</td>");
			        	out.println("<td>"+mgr.getString(9)+"</td>");
			        	out.println("<td>");
			        	out.println("<a href='update-employee.jsp?eid="+mgr.getString(1)+"'><button class='action-btn edit-btn'>Edit Profile</button></a>");
			        	out.println("<a href='delete-employee.jsp?eid="+mgr.getString(1)+"'><button class='action-btn delete-btn'>Delete</button></a>");
			        	out.println("</td>");
			        	out.println("</tr>");
		        	}while(mgr.next());
		        	
		        	out.println("</tbody></table>");
		        }else{
		        	out.println("<h4>There are no Managers Working Currently in Company</h4>");
		        }
		            
			}
		if(!rs.getString(9).equals("Employee")){
			
	        Statement st = con.createStatement();
	        String qry1="select * from employee_management_system where role='Employee'";
	        if(rs.getString(9).equals("Manager")) qry1+=" and dept='"+rs.getString(8)+"'";
	        ResultSet mgr = st.executeQuery(qry1);
	        if(mgr.next()){
	        	out.println("<h3>Details of Employees in Company</h3>");
    			out.println("<table><thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Designation</th><th>Actions</th></tr></thead>");
    	        out.println("<tbody>");
	        	do{
	        		
	        		String bgclr="";
	 		        if(mgr.getString(8).equals("Not Assigned")) bgclr+="'red'";
	        		out.println("<tr>");
		        	out.println("<td>"+mgr.getString(1)+"</td>");
		        	out.println("<td>"+mgr.getString(2)+"</td>");
		        	out.println("<td>"+mgr.getString(6)+"</td>");
		        	out.println("<td bgcolor="+bgclr+">"+mgr.getString(8)+"</td>");
		        	out.println("<td>"+mgr.getString(9)+"</td>");
		        	out.println("<td>");
		        	out.println("<a href='update-employee.jsp?eid="+mgr.getString(1)+"'><button class='action-btn edit-btn'>Edit Profile</button></a>");
		        	out.println("<a href='delete-employee.jsp?eid="+mgr.getString(1)+"'><button class='action-btn delete-btn'>Delete</button></a>");
		        	out.println("</td>");
		        	out.println("</tr>");
	        	}while(mgr.next());
	        	
	        	out.println("</tbody></table>");
	        }else{
	        	out.println("<h4>There are no Employees Working Currently in Company</h4>");
	        }
	            
		}
			
		%>

        <a href="index.html" class="logout-btn">Logout</a>
    </div>
</body>
</html>

