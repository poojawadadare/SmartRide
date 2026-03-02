<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - Bus Ticket Booking</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_homepage.css"> 
<style type="text/css"> <%@include file="CSS/Admin_homepage.css" %> </style>
</head>
<body>

<%
    int totalUsers = 0;
    int totalBuses = 0;
    int totalBookings = 0;
    int cancelledBookings = 0;
    int pendingRefunds = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
        Statement st = cn.createStatement();

        // Total Users
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM user_signup");
        if(rs1.next()) totalUsers = rs1.getInt(1);

        // Total Buses
        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM admin_bus_details");
        if(rs2.next()) totalBuses = rs2.getInt(1);

        // Total Bookings
        ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM seat_booking");
        if(rs3.next()) totalBookings = rs3.getInt(1);

        // Cancelled Bookings
        ResultSet rs4 = st.executeQuery("SELECT COUNT(*) FROM seat_booking WHERE booking_status='Cancelled'");
        if(rs4.next()) cancelledBookings = rs4.getInt(1);

        // Pending Refunds
        ResultSet rs5 = st.executeQuery("SELECT COUNT(*) FROM seat_booking WHERE refund_status='Not Refunded'");
        if(rs5.next()) pendingRefunds = rs5.getInt(1);

    } catch(Exception e) {
        out.println(e);
    }
%>

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
            <li><i class="fa fa-home"></i><a href="Admin_homepage.jsp"> Dashboard</a></li>
            <li><i class="fa fa-user"></i><a href="Admin_user_list.jsp"> Users</a></li>
            <li><i class="fa fa-bus"></i><a href="Admin_add_bus.jsp"> Bus Management</a></li>
            <li><i class="fa fa-map"></i><a href="Admin_route_management.jsp"> Route And Scheduling</a></li>
            <li><i class="fa fa-tasks"></i><a href="Admin_booking_management.jsp"> Booking Management</a></li>
            <li><i class="fa fa-credit-card"></i><a href="Admin_refund.jsp"> Payments</a></li>
            <li><i class="fa fa-sign-out"></i><a href="Admin_login.jsp"> Logout</a></li>
        </ul>
        </div>
    </aside>

    <main class="main-content">
        <img src="Images/star2.png" class="logo">
        <h1>Admin Dashboard</h1>

       <div class="cards">

    <div class="card blue">
     <p>Total Users</p>
        <h2><i class="fa fa-users icon"></i> <%= totalUsers %></h2>
       
    </div>

    <div class="card green">
     <p>Total Buses</p>
        <h2><i class="fa fa-bus icon"></i> <%= totalBuses %></h2>
       
    </div>

    <div class="card yellow">
    <p>Total Bookings</p>
        <h2><i class="fa fa-ticket icon"></i> <%= totalBookings %></h2>
        
    </div>

    <div class="card red">
    <p>Cancelled Bookings</p>
        <h2><i class="fa fa-times-circle icon"></i> <%= cancelledBookings %></h2>
        
    </div>

    <div class="card dark-blue">
     <p>Pending Refunds</p>
        <h2><i class="fa fa-money icon"></i> <%= pendingRefunds %></h2>
       
    </div>

</div>

    </main>
</div>

</body>
</html>
