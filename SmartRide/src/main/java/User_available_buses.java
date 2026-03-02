

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
 * Servlet implementation class User_available_buses
 */
public class User_available_buses extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		
		String bus_id = req.getParameter("bus_id");
		String bus_name = req.getParameter("bus_name");
		String bus_no = req.getParameter("bus_no");
		String bus_type = req.getParameter("bus_type"); 
		String total_seats = req.getParameter("total_seats");
		String fare_per_seat = req.getParameter("fare_per_seat");
		String event = req.getParameter("submit");
		
		out.println(bus_name);
		out.println(bus_no);
		out.println(bus_type); 
		out.println(total_seats);
		out.println(fare_per_seat);
		out.println(event);
		
		if(event.equals("Book Now"))
		{
			if(bus_name.equals("") || bus_no.equals("") || bus_type.equals("") || total_seats.equals("") || fare_per_seat.equals("")  )
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='User_Search_Bus.jsp';   </script> ");
			}
			else
			{
				try
				{
					session.setAttribute("bus_id", bus_id);
					session.setAttribute("bus_name", bus_name);
					session.setAttribute("bus_no", bus_no);
					session.setAttribute("bus_type", bus_type);
					session.setAttribute("total_seats", total_seats);
					session.setAttribute("fare_per_seat", fare_per_seat); 
					
					resp.sendRedirect("User_select_seat.jsp");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}

	}

}
