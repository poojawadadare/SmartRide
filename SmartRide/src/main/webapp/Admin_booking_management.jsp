<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Booking Management</title>

<link rel="stylesheet" type="text/css" href="CSS/Admin_booking_Management.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<style type="text/css"> <%@include file="CSS/Admin_booking_Management.css" %> </style>


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
            <li><i class="fa fa-home"><a href="Admin_homepage.jsp">&nbsp;&nbsp;Dashboard</a></i></li>
            <li><i class="fa fa-user"><a href="Admin_user_list.jsp">&nbsp;&nbsp;Users</a></i></li>
            <li><i class="fa fa-bus"><a href="Admin_add_bus.jsp">&nbsp;&nbsp;Bus Management</a></i></li>  
            <li><i class="fa fa-map"><a href="Admin_route_management.jsp">&nbsp;&nbsp;Route And Scheduling</a></i></li>
            <li><i class="fa fa-tasks"><a href="Admin_booking_management.jsp">&nbsp;&nbsp;Booking Management</a></i></li>
            <li><i class="fa fa-credit-card"><a href="Admin_refund.jsp">&nbsp;&nbsp;Payments</a></i></li>
          
             <li><i class="fa fa-sign-out"><a href="Admin_login.jsp">&nbsp&nbspLogout</a></i></li>
        </ul>
        </div>
    </aside>

    <main class="main-content">
        <img src="Images/star2.png" class="logo">
        <h1>Booking Management</h1>
        <br>

        <table class="booking-table">
            <tr>
                <th>Booking Id</th>
                <th>Passenger Name</th>
                <th>Age</th>
                <th>Journey Details</th> 
                <th>Actions</th>
                <th>Booking Status</th>
            </tr>

        <%
            Connection cn = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
            st = cn.createStatement();

            String sql = "SELECT * FROM seat_booking";
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
        %>

        <tr>
        <form action="Admin_booking_management" method="post">
            <td>
                <input type="hidden" name="booking_id" value="<%= rs.getString("booking_id") %>">
                <%= rs.getString("booking_id") %>
            </td>

            <td><%= rs.getString("passenger_name") %></td>
            <td><%= rs.getString("passenger_age") %></td>

            <td>
                <%= rs.getString("source") %> to 
                <%= rs.getString("destination") %> - 
                <%= rs.getString("journey_date") %>
            </td>

            <!-- Actions -->
            <td>
                <div class="actions">
                    <button type="submit" name="submit" value="confirm" class="btn btn-view">
                        Confirm
                    </button>

                    <button type="submit" name="submit" value="cancel" class="btn btn-cancel">
                        Cancel Booking
                    </button>
                </div>
            </td>

            <td><%= rs.getString("booking_status") %></td>

        </form>
        </tr>

        <% } %>

        </table>

    </main>
</div>

</body>
</html>
