<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - Add Bus</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_add_bus.css"> 
<style type="text/css"> <%@include file="CSS/Admin_add_bus.css" %> </style>
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
               
                 <li><i class="fa fa-sign-out"><a href="Admin_login.jsp">&nbsp&nbspLogout</a></i></li>
            </ul>
            </div>
        </aside>

        <main class="main-content">
        <img src="Images/star2.png" class="logo">
            <h1>Bus Management</h1>
           
<div class="bus-management-form">
    <h2>Manage Buses</h2>

    <form action="Admin_add_bus" method="post">

        <label>Bus ID</label>
        <input type="text" name="bus_id" id="bus_id" placeholder="Enter Bus ID">

        <label>Bus Name</label>
        <input type="text" name="bus_name" id="busName"   id="busNumber" placeholder="Enter Bus Name">

        <label>Bus Number</label>
        <input type="text" name="bus_no" placeholder="Enter Bus Number">

        <label>Bus Type</label>
        <select name="bus_type">
            <option value="AC">AC</option>
            <option value="Non-AC">Non-AC</option>
            <option value="Sleeper">Luxury</option>
        </select>

        <label>Total Seats</label>
        <input type="number" name="total_seats" id="totalSeats"  placeholder="Enter Total Seats">

        <label>Fare per Seat</label>
        <input type="number" id="fare" name="fare_per_seat" placeholder="Enter Fare per Seat">

        <div class="btn-group">
            <button type="submit" name="submit" class="add" value="Add">Add Bus</button>
                    </div>

    </form>
    <!-- 🔽🔽🔽  ADD THIS TABLE CODE BELOW FORM  🔽🔽🔽 -->

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide", "root", "root");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM admin_bus_details");
%>

<h2 class="bus-list-heading">Bus List</h2>

<table class="bus-table">    <thead>
        <tr>
            <th>Bus ID</th>
            <th>Bus Name</th>
            <th>Bus Number</th>
            <th>Type</th>
            <th>Total Seats</th>
            <th>Fare</th>
             <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("bus_id") %></td>
            <td><%= rs.getString("bus_name") %></td>
            <td><%= rs.getString("bus_no") %></td>
            <td><%= rs.getString("bus_type") %></td>
            <td><%= rs.getInt("total_seats") %></td>
            <td><%= rs.getInt("fare_per_seat") %></td>
            <td>
             <form action="Admin_add_bus" method="post">
<input type="hidden" name="bus_id" value="<%= rs.getInt("bus_id") %>">
                 <button type="submit" name="submit" value="Cancel" class="cancel-btn">Cancel</button>
             </form>
         </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<!-- 🔼🔼🔼 ADD TABLE CODE ABOVE THIS LINE 🔼🔼🔼 -->
    
    
</div>
            
   
    </main>
    </div>    
</body>
</html>


