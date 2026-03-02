

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
 * Servlet implementation class User_select_seat
 */
public class User_select_seat extends HttpServlet {
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
		
		int counts = Integer.parseInt( req.getParameter("counts") ); 
		String seatsselected = req.getParameter("seatsselected");
		String event = req.getParameter("submit");
		out.println(counts);
		 
		
	 
         
        if(event.equals("Confirm Booking"))
        {
        	try
        	{
        		session.setAttribute("counts", counts);
        		session.setAttribute("seatsselected", seatsselected);
        		resp.sendRedirect("User_passenger_detail.jsp");
        	}
        	catch (Exception ex) 
        	{
				out.println(ex.toString());
			}
        	
        }

	}
}
