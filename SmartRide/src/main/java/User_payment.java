

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class User_payment
 */
public class User_payment extends HttpServlet {
	Connection cn = null;
	Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
PrintWriter out = resp.getWriter();
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String today = formatter.format(date);

		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String cardholder = req.getParameter("cardholder"); 
		String number = req.getParameter("cardnumber");
		String expiry =req.getParameter("expiry");
		String cvv =req.getParameter("cvv");
		String event = req.getParameter("submit");

		
		out.println(event);
		
		if(event.equals("Pay Now"))
		{
			if(cardholder.equals("") ||number.equals("") || expiry.equals("") || cvv.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='User_Payment.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = " insert into user_payment (cardholder, number, expiry, cvv, payment_date) values ('"+cardholder+"', '"+number+"', '"+expiry+"' , '"+cvv+"', '"+today+"') ";
					String insert = db.Insert(sql);
					out.println(insert);
					
					resp.setContentType("text/html");	
					out.println("  <script type=\"text/javascript\"> alert('Payment Success');  location='User_confirmation.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
	
	}
}
