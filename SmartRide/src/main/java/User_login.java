

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 * Servlet implementation class User_login
 */
public class User_login extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String event = req.getParameter("submit");
		
         
		out.println(email);
		out.println(password);
		out.println(event);
		

		if(event.equals("Submit"))
		{
			if(email.equals("") || password.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='User_Login.jsp';   </script> ");
			}
			
			else
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
					st = cn.createStatement();
					String sql = "select * from User_signup where email = '"+email+"' && password='"+password+"' ";
					ResultSet rs = st.executeQuery(sql);
					
				
					if(rs.next())
					{ 
						String userName = rs.getString("name");
						HttpSession session = req.getSession();
						 session.setAttribute("my_id", rs.getInt("user_id"));
						 session.setAttribute("username", userName);


						    // You can also store other data if needed
						    session.setAttribute("user_name", rs.getString("name"));

						resp.setContentType("text/html");	
						out.println("  <script type=\"text/javascript\"> alert('Login Succeed');  location='User_homepage.jsp';   </script> ");
					}
					else
					{
						resp.setContentType("text/html");	
						out.println("  <script type=\"text/javascript\"> alert('Login Failed');  location='User_login.jsp';   </script> ");
					}	
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
				
			}
		}


	}

}
