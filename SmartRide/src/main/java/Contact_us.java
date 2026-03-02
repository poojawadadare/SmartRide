

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class Contact_us
 */
public class Contact_us extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
PrintWriter out = resp.getWriter();
		
		// Database connection using your Database class
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		// Receive form values
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String message = req.getParameter("message");
		String event = req.getParameter("submit");
		
		out.println(fullname);
		out.println(email);
		out.println(message);
		out.println(event);
		
		// MAIN EVENT CHECK
		if (event == null || event.equals("")) {
			event = "contactSubmit";
		}

		if(event.equals("contactSubmit"))   // auto called
		{
			if(fullname.equals("") || email.equals("") || message.equals(""))
			{
				resp.setContentType("text/html");
				out.println("<script>alert('Please fill all fields'); location='Index.jsp';</script>");
			}
			else
			{
				try {
					
					String sql = "INSERT INTO contact_messages(full_name, email, message) "
							+ "VALUES ('"+fullname+"', '"+email+"', '"+message+"')";
					
					String insert = db.Insert(sql);
					out.println(insert);
					
					resp.setContentType("text/html");
					out.println("<script>alert('Thank you! Your message has been sent.'); "
							+ "location='Index.jsp';</script>");
					
				} catch (Exception ex) {
					out.println(ex.toString());
				}
			}
		}
		

	}
}
