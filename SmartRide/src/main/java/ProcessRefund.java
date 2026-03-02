

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
 * Servlet implementation class ProcessRefund
 */
public class ProcessRefund extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 PrintWriter out = resp.getWriter();
	
		 try {
	            String booking_id = req.getParameter("booking_id");
	            Database db = new Database();
	            db.Connectdb();

	            db.update("UPDATE seat_booking SET refund_status='Refunded' WHERE booking_id='" + booking_id + "'");

	            out.println("<script>alert('Refund Processed Successfully!'); location='Admin_refund.jsp';</script>");

	        } catch (Exception e) {
	            out.println(e.toString());
	        }}
}
