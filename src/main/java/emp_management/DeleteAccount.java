
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

public class DeleteAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname = req.getParameter("eid");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println(uname);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&&password=root");
			String qry = "delete from employee_management_system where eid=?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, uname);
			ps.executeUpdate();
			PrintWriter pw = resp.getWriter();
			pw.println("<body>");
			pw.println("<link rel=\"stylesheet\" href=\"css/style.css\">");
			pw.println("<div class=\"error-container\">");
			pw.println("<h1>Account Deleted Successfully</h1>");
			pw.println("<a href=\"index.html\" class=\"action-btn home-btn\">Return to Login Page</a>");
	        pw.println("</div>");
	        pw.println("</body>");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
