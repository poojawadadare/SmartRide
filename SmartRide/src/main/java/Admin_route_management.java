

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Admin_route_management
 */
public class Admin_route_management extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String source = req.getParameter("source");
		String destination = req.getParameter("destination");
		String departure_time = req.getParameter("departure_time");
		String arrival_time = req.getParameter("arrival_time");
		String bus_assigned = req.getParameter("bus_assigned");
		String event = req.getParameter("submit");
		 
		out.println(event);
		
		if(event.equals("Save Route"))
		{
			if(source.equals("") || destination.equals("") || departure_time.equals("") || arrival_time.equals("") || bus_assigned.equals(""))
			{
				resp.setContentType("text/html");	
				out.println("  <script type=\"text/javascript\"> alert('Something is Empty');  location='Admin_route_management.jsp';   </script> ");
			}
			else
			{
				try
				{
					String sql = " insert into admin_add_location (source, destination, departure_time, arrival_time, bus_assigned) values ('"+source+"', '"+destination+"', '"+departure_time+"', '"+arrival_time+"' , '"+bus_assigned+"') ";
					String insert = db.Insert(sql);
					out.println(insert);
					
					resp.setContentType("text/html");	
					out.println("  <script type=\"text/javascript\"> alert('Route Added');  location='Admin_route_management.jsp';   </script> ");
					
				}
				catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		}
		
		if(event.equals("CancelRoute"))
		{
		    String root_id = req.getParameter("root_id");

		    if(root_id == null || root_id.equals("")) 
		    {
		        resp.setContentType("text/html");
		        out.println("<script>alert('Route ID Missing'); location='Admin_route_management.jsp';</script>");
		    }
		    else 
		    {
		        try 
		        {
		            String sql = "DELETE FROM admin_add_location WHERE root_id='" + root_id + "' ";
		            String delete = db.delete(sql);

		            resp.setContentType("text/html");
		            out.println("<script>alert('Route Cancelled Successfully'); location='Admin_route_management.jsp';</script>");
		        } 
		        catch(Exception e) 
		        {
		            out.println(e.toString());
		        }
		    }
		}

	
	}

}
