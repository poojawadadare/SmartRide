<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Available Buses - Bus Ticket Booking</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_available_buses.css"> 
<style type="text/css"> <%@include file="CSS/User_available_buses.css" %> </style>
</head>
<body>

    <div class="container">
        <aside class="sidebar">
               <%
               
               String uname = (String) session.getAttribute("username");
               if(uname == null){
                   uname = "User";
               }
           %>

           <h1>Hello&nbsp;<%= uname %>! </h1>
             <div class="profile_icon">
            
            <ul>
            
               <li><i class="fa fa-home"><a href="User_homepage.jsp">&nbsp&nbspDashboard</a></i></li>
                  <li><i class="fa fa-user"><a href="User_profile.jsp">&nbsp&nbspProfile</a></i></li>
              
                 <li><i class="fa fa-search"><a href="User_search_bus.jsp">&nbsp&nbspSearch Bus</a></i></li>  
                 <li><i class="fa fa-bus"><a href="User_booking.jsp">&nbsp&nbspMy Booking</a></i></li>
                 
                <li><i class="fa fa-sign-out"><a href="User_login.jsp">&nbsp&nbspLogout</a></i></li>
 
            </ul>
            </div>
        </aside>

        <main class="main-content">
        <img src="Images/star2.png" class="logo">
            <h1>Available Buses</h1>
    <table class="bus-table">
        <tr>
            <th>Bus Name</th>
            <th>Bus Number</th>
            <th>Arrival Time</th>
            <th>Price per Seat</th>
            <th>Available Seats</th>
            <th>Book Button</th>
        </tr>
        
        
        <%
        	Connection cn = null;
        	Statement st = null;
       		Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
			st = cn.createStatement();
			String sql = "select * from admin_bus_details";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next())
			{
       	%> 
       	
       	<form name="User_available_Buses" action="User_available_buses" method="post">
       		 
       		<input type="hidden" name="bus_id" value="<%=rs.getString("bus_id")%>">
       		<input type="hidden" name="bus_name" value="<%=rs.getString("bus_name")%>">
       		<input type="hidden" name="bus_no" value="<%=rs.getString("bus_no")%>">
       		<input type="hidden" name="bus_type" value="<%=rs.getString("bus_type")%>">
       		<input type="hidden" name="total_seats" value="<%=rs.getString("total_seats")%>">
       		<input type="hidden" name="fare_per_seat" value="<%=rs.getString("fare_per_seat")%>">
       		
       		<tr>
	            <td> <%= rs.getString("bus_name") %>  </td>
	            <td> <%= rs.getString("bus_no") %>    </td>
	            <td> <%= rs.getString("bus_type") %>  </td>
	            <td> <%= rs.getString("total_seats") %> </td>
	            <td> <%= rs.getString("fare_per_seat") %> </td>
	            <td><input class="book-btn" type="submit" name="submit" value="Book Now" ></td>
	        </tr>
	        
       	</form>	 
       		
       <%  } %>
        
    </table>
</main>
           
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


