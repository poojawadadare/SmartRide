

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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class User_booking
 */
public class User_booking extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		Date td = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String current_date = formatter.format(td);
		
		String id = req.getParameter("id").toString(); 
		String event = req.getParameter("submit");
		 
		 
        if(event.equals("Cancel Ticket"))
        {
        	try
        	{
        		 
        			String update = db.update(" update seat_booking set booking_status = 'Cancelled' where id= '"+id+"' ");
        			out.println(update);
        			
        			resp.setContentType("text/html");	
        			out.println("  <script type=\"text/javascript\"> alert('Ticket Cancelled');  location='User_booking.jsp';   </script> ");
        			
        			resp.sendRedirect("User_booking.jsp");
        		 
        	}
        	catch (Exception ex) 
        	{
				out.println(ex.toString());
			}
        	
        }

	}

}
