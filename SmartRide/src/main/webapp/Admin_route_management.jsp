<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - Add Route</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_route_management.css.css"> 
<style type="text/css"> <%@include file="CSS/Admin_route_management.css" %> </style>
</head>
<body>

    <div class="container">
        <aside class="sidebar">
           <%
    String uname = (String) session.getAttribute("username");
    if(uname == null){
        uname = "Admin";
    }
%>

<h1>Hello&nbsp;<%= uname %>! </h1>
             <div class="profile_icon">
            
            <ul>
            
                <li><i class="fa fa-home"><a href="Admin_homepage.jsp">&nbsp&nbspDashboard</a></i></li>
                   <li><i class="fa fa-user"><a href="Admin_user_list.jsp">&nbsp&nbspUsers</a></i></li>

                 <li><i class="fa fa-bus"><a href="Admin_add_bus.jsp">&nbsp&nbsp Bus Management</a></i></li>
                <li><i class="fa fa-map"><a href="Admin_route_management.jsp">&nbsp&nbspRoute And Scheduling</a></i></li>
                <li><i class="fa fa-tasks"><a href="Admin_booking_management.jsp">&nbsp&nbspBooking Management</a></i></li>
                
                <li><i class="fa fa-credit-card"><a href="Admin_refund.jsp">&nbsp&nbspPayments</a></i></li>
                
                 <li><i class="fa fa-sign-out"><a href="Admin_login.jsp">&nbsp&nbspLogout</a></i></li>            </ul>
            </div>
        </aside>

        <main class="main-content">
        <img src="Images/star2.png" class="logo">
            <h1>Route Management</h1>
            
           <div class="form-container">
        <h2>Manage Routes</h2>
        <form name="Admin_Add_Location" action="Admin_route_management" method="post">
            <div class="input-group">
                <label for="source">Source</label>
                <input type="text" id="source" name="source" placeholder="Enter source location">
            </div>
            <div class="input-group">
                <label for="destination">Destination</label>
                <input type="text" id="destination" name="destination" placeholder="Enter destination">
            </div>
            <div class="input-group">
                <label for="departure">Departure Time</label>
                <input type="time" id="departure" name="departure_time">
            </div>
            <div class="input-group">
                <label for="arrival">Arrival Time</label>
                <input type="time" id="arrival" name="arrival_time">
            </div>
            <div class="input-group">
                <label for="bus">Bus Assigned</label>
                <select id="bus" name="bus_assigned">
                	<option value="">Select Bus</option>
                 <%
	                	Connection cn = null;
	                	Statement st = null;
                		Class.forName("com.mysql.jdbc.Driver");
        				cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
        				st = cn.createStatement();
        				String sql = "select * from admin_bus_details  ";
        				ResultSet rs = st.executeQuery(sql);
        				
        				while(rs.next())
        				{
                	%> 
                    		<option value="<%=rs.getString("bus_no") %>"><%=rs.getString("bus_no") %></option>
                    <%  } %>
                     
                </select>
            </div>
             <div class="btn-group">
            <button class="save" type="submit" name="submit" value="Save Route">Save Route</button>
            </div>
        </form>
        <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide", "root", "root");
    Statement st2 = con2.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT * FROM admin_add_location");
%>

<h2 class="route-list-heading">Route List</h2>

<table class="route-table">
    <thead>
        <tr>
            <th>Route ID</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Departure</th>
            <th>Arrival</th>
            <th>Bus Assigned</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            while(rs2.next()) {
        %>
        <tr>
            <td><%= rs2.getInt("root_id") %></td>
            <td><%= rs2.getString("source") %></td>
            <td><%= rs2.getString("destination") %></td>
            <td><%= rs2.getString("departure_time") %></td>
            <td><%= rs2.getString("arrival_time") %></td>
            <td><%= rs2.getString("bus_assigned") %></td>

            <td>
                <form method="post" action="Admin_route_management">
                    <input type="hidden" name="root_id" value="<%= rs2.getInt("root_id") %>">
                    <button type="submit" name="submit" value="CancelRoute" class="cancel-btn">Cancel</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
        
    </div>
    </main>
    </div>    
</body>
</html>


