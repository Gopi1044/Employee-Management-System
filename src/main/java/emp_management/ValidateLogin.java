package emp_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("email");
		String pswd=req.getParameter("password");
		
		String qry = "select eid,email,password from employee_management_system where password=? and ";
		if(uname.contains("@")) qry+="email=?";
		else qry+="eid=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&&password=root");
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, pswd);
			ps.setString(2, uname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				if(rs.getString(3).equals(pswd) && (rs.getString(1).equals(uname) || rs.getString(2).equals(uname))) {
					resp.sendRedirect("home-employee.jsp?eid="+rs.getString(1));
				}
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<body>");
				pw.println("<link rel=\"stylesheet\" href=\"css/style.css\">");
				pw.println("<div class=\"error-container\">");
				pw.println("<h1>Entered Wrong Crediantials</h1>");
				pw.println("<a href=\"index.html\" class=\"action-btn home-btn\">Return to Login Page</a>");
		        pw.println("</div>");
		        pw.println("</body>");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
