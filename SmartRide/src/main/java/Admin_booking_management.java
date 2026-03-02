

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
 * Servlet implementation class Admin_booking_management
 */
@WebServlet("/Admin_booking_management")
public class Admin_booking_management extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	        PrintWriter out = resp.getWriter();

	        String booking_id = req.getParameter("booking_id");
	        String action = req.getParameter("submit");  // confirm OR cancel

	        Database db = new Database();
	        db.Connectdb();

	        try {
	            if(action.equals("confirm")) {
	                db.update("UPDATE seat_booking SET booking_status='Confirmed' WHERE booking_id='" + booking_id + "'");
	                out.println("<script>alert('Booking Confirmed'); location='Admin_booking_management.jsp';</script>");
	            }
	            else if(action.equals("cancel")) {
	                db.update("UPDATE seat_booking SET booking_status='Cancelled' WHERE booking_id='" + booking_id + "'");
	                out.println("<script>alert('Booking Cancelled'); location='Admin_booking_management.jsp';</script>");
	            }

	        } catch(Exception e) {
	            out.println(e.toString());
	        }
	    }
	
}
