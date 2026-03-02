

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
 * Servlet implementation class Admin_add_bus
 */
public class Admin_add_bus extends HttpServlet {
	
	Connection cn = null;
	Statement st = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
PrintWriter out = resp.getWriter();
		
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
		
		 
		out.println(event);
		
		
		if(event.equals("Add"))
		{
			if(bus_name.equals("") || bus_no.equals("") || bus_type.equals("") || total_seats.equals("") || fare_per_seat.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='Admin_add_bus.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = " insert into admin_bus_details (bus_name, bus_no, bus_type, total_seats, fare_per_seat ) values ('"+bus_name+"','"+bus_no+"', '"+bus_type+"','"+total_seats+"', '"+fare_per_seat+"') ";
					String insert = db.Insert(sql);
					out.println(insert);
					
					resp.setContentType("text/html");	
					out.println("  <script type=\"text/javascript\"> alert('Bus Added');  location='Admin_add_bus.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
		
		
		if(event.equals("Update"))
		{
			if(bus_name.equals("") || bus_no.equals("") || bus_type.equals("") || total_seats.equals("") || fare_per_seat.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='Admin_add_bus.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = " update admin_bus_details set bus_name='"+bus_name+"', bus_no='"+bus_no+"', total_seats='"+total_seats+"', fare_per_seat='"+fare_per_seat+"' where bus_id = '"+bus_id+"' ";
					String update = db.update(sql);
					out.println(update);
					
					resp.setContentType("text/html");	
					out.println("  <script type=\"text/javascript\"> alert('Bus Updated');  location='Admin_add_bus.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
		
		
		if(event.equals("Cancel"))
		{
			if(bus_id.equals("") )
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='Admin_add_bus.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = " delete from admin_bus_details where bus_id = '"+bus_id+"' ";
					String delete = db.delete(sql);
					out.println(delete);
					
					resp.setContentType("text/html");	
					out.println("  <script type=\"text/javascript\"> alert('Bus Deleted');  location='Admin_add_bus.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}

	}

}
