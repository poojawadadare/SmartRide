

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
 * Servlet implementation class User_signup
 */
public class User_signup extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		String event = req.getParameter("submit");
		
		out.println(name);
		
		out.println(email);
		out.println(password);
		out.println(cpassword);
		out.println(event);
		
		if(event.equals("Signup"))
		{
			if(name.equals("") || email.equals("") || password.equals("") || cpassword.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='User_signup.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = "INSERT INTO User_signup (name, email, password, cpassword) " +
				             "VALUES ('"+name+"', '"+email+"', '"+password+"', '"+cpassword+"')";
					String insert = db.Insert(sql);
					out.println(insert);
					
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Signup Succeed.. Please Login..!');  location='User_login.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
	}

}
