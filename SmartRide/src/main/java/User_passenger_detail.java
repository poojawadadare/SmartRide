

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class User_passenger_detail
 */
public class User_passenger_detail extends HttpServlet {
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
			
			String seatsselected = session.getAttribute("seatsselected").toString();
	 
	        String[] seats = seatsselected.split(","); 
	        
			String event = req.getParameter("submit");
			 
			 
	        if(event.equals("Confirm Booking"))
	        {
	        	try
	        	{
	        		int booking_id = 0; 
	        		Class.forName("com.mysql.jdbc.Driver");
					cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
					st = cn.createStatement();
					String sql = "select * from seat_booking  ";
					ResultSet rs = st.executeQuery(sql);
					
					while(rs.next())
					{
						booking_id = Integer.parseInt(rs.getString("booking_id"));
					}
					
					booking_id++;
					session.setAttribute("booking_id", booking_id);
					session.setAttribute("passenger_name", req.getParameter("name"+1));
					session.setAttribute("age", req.getParameter("age"+1));  
					session.setAttribute("seats", req.getParameter("seats"));
					
	        		for(int i=1; i<= Integer.parseInt(session.getAttribute("counts").toString()); i++)
	        		{
	        			String insert = db.Insert("insert into seat_booking (booking_id, user_id, bus_id,seat_number, passenger_name, passenger_age,journey_date, booking_date, booking_status, source, destination) values ('"+booking_id+"','"+session.getAttribute("my_id")+"', '"+session.getAttribute("bus_id")+"','"+seats[i]+"', '"+req.getParameter("name"+i)+"', '"+req.getParameter("age"+i)+"', '"+session.getAttribute("date")+"', '"+current_date+"', 'Pending','"+session.getAttribute("source")+"', '"+session.getAttribute("destination")+"') ");
	        			out.println(insert); 
	        		} 
	        		
	        		resp.sendRedirect("User_payment.jsp");
	        		
	        	}
	        	catch (Exception ex) 
	        	{
					out.println(ex.toString());
				}
	        	
	        }
	}
}
