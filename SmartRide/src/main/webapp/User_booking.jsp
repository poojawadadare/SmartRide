<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Booking - Bus Ticket Booking</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_booking.css"> 
<style type="text/css"> <%@include file="CSS/User_booking.css" %> </style>
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
            <h1>Booking History and Cancellation</h1>
    <table class="history-table">
        <tr>
            <th>Booking ID</th>
            <th>Passenger Name</th>
            <th>Journey Details</th>
            <th>Payment Status</th>
            <th>Actions</th>
        </tr>
        
        <%
        	Connection cn = null;
        	Statement st = null;
        	
        	Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
			st = cn.createStatement();
			String sql = "select * from seat_booking where  user_id = '"+session.getAttribute("my_id")+"' ";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next())
			{
        	
        %>
        <form name="User_booking" action="User_booking" method="post">  
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">   
 		<tr>
            <td><%= rs.getString("booking_id") %> </td>
            <td><%= rs.getString("passenger_name") %></td>
            <td><%= rs.getString("source") %> - <%= rs.getString("destination") %> (<%= rs.getString("journey_date") %>)</td>
            <td><%= rs.getString("booking_status") %></td>
            <td>
               <!-- <button class="btn btn-details" type="submit" name="submit" value="View Details">View Details</button>  --> 
                <button class="btn btn-cancel" type="submit" name="submit" value="Cancel Ticket">Cancel Ticket</button>
            </td>
        </tr>
         </form>     
         <% } %>
    </table>
</main>
           
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


