

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class User_search_bus
 */
public class User_search_bus extends HttpServlet {
	
	Connection cn = null;
	Statement st = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		
		String source = req.getParameter("source");
		String destination = req.getParameter("destination");
		String date = req.getParameter("date"); 
		String event = req.getParameter("submit");
		
		out.println(source);
		out.println(destination);
		out.println(date); 
		out.println(event);
		
		if(event.equals("Search Bus"))
		{
			if(source.equals("") || destination.equals("") || date.equals("")  )
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='User_Search_Bus.jsp';   </script> ");
			}
			else
			{
				try
				{
					session.setAttribute("source", source);
					session.setAttribute("destination", destination);
					session.setAttribute("date", date);
					
					resp.sendRedirect("User_avaialable_buses.jsp");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
	

		
	}

}
