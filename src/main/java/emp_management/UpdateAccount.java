package emp_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String eid=req.getParameter("eid");
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String dob=req.getParameter("dob");
		long contact=Long.parseLong(req.getParameter("phone"));
		String email=req.getParameter("email");
		String pswd=req.getParameter("password");
		String dept=req.getParameter("department");
		String role=req.getParameter("role");
		
		String qry="UPDATE employee_management_system SET name = ?, gender = ?, dob = ?, contact = ?, email = ?, password = ?, dept = ?, role = ? WHERE eid = ?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&&password=root");
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, name);
			ps.setString(2, gender);
			ps.setString(3, dob);
			ps.setLong(4, contact);
			ps.setString(5, email);
			ps.setString(6, pswd);
			ps.setString(7, dept);
			ps.setString(8, role);
			ps.setString(9, eid);
			ps.executeUpdate();
			
			PrintWriter pw = resp.getWriter();
			pw.println("<body>");
			pw.println("<link rel=\"stylesheet\" href=\"css/style.css\">");
			pw.println("<div class=\"error-container\">");
			pw.println("<h1>Account Updated Successfully</h1>");
			pw.println("<a href=\"index.html\" class=\"action-btn home-btn\">Return to Login Page</a>");
	        pw.println("</div>");
	        pw.println("</body>");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
