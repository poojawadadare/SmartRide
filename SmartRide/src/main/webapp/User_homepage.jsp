<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // SESSION CHECK
    HttpSession session1 = request.getSession(false);

    if(session1 == null || session1.getAttribute("my_id") == null){
        response.sendRedirect("User_login.jsp");
        return;
    }

    int uid = Integer.parseInt(session1.getAttribute("my_id").toString());

    // DATABASE COUNTS
    int totalBookings = 0;
    int upcomingTrips = 0;
    int cancelledBookings = 0;
    int refundedPayments = 0;  // ⭐ NEW

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/SmartRide", "root", "root");
        Statement st = cn.createStatement();

        // Total bookings
        ResultSet rs1 = st.executeQuery(
            "SELECT COUNT(*) FROM seat_booking WHERE user_id=" + uid
        );
        if(rs1.next()) totalBookings = rs1.getInt(1);

        // Upcoming trips
        ResultSet rs2 = st.executeQuery(
            "SELECT COUNT(*) FROM seat_booking WHERE user_id=" + uid +
            " AND booking_status='Confirmed'"
        );
        if(rs2.next()) upcomingTrips = rs2.getInt(1);

        
        ResultSet rs3 = st.executeQuery(
            "SELECT COUNT(*) FROM seat_booking WHERE user_id=" + uid +
            " AND booking_status='Cancelled'"
        );
        if(rs3.next()) cancelledBookings = rs3.getInt(1);

        
        ResultSet rs4 = st.executeQuery(
            "SELECT COUNT(*) FROM seat_booking WHERE user_id=" + uid +
            " AND refund_status='Refunded'"
        );
        if(rs4.next()) refundedPayments = rs4.getInt(1);

    } catch(Exception e){
        out.println(e.toString());
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard</title>

<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/User_homepage.css">
<style type="text/css"> <%@include file="CSS/User_homepage.css" %> </style>

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
        <ul>
            <li><i class="fa fa-home"></i> <a href="User_homepage.jsp"> Dashboard </a></li>
            <li><i class="fa fa-user"></i> <a href="User_profile.jsp"> Profile </a></li>
            <li><i class="fa fa-bus"></i> <a href="User_search_bus.jsp"> Search Bus </a></li>
            <li><i class="fa fa-ticket"></i> <a href="User_booking.jsp"> My Booking </a></li>
            <li><i class="fa fa-sign-out"></i> <a href="User_login.jsp"> Logout </a></li>
        </ul>
    </aside>

    <main class="main-content">
        <img src="Images/star2.png" class="logo">
        <h1>User Dashboard</h1>

        <div class="cards">

    <div class="card blue">
         <p>Total Bookings</p>
        <h2><i class="fa fa-ticket icon"></i> <%= totalBookings %></h2>
       
    </div>

    <div class="card green">
        <p>Upcoming Trips</p>
        <h2><i class="fa fa-bus icon"></i> <%= upcomingTrips %></h2>
        
    </div>

    <div class="card yellow">
         <p>Cancelled Bookings</p>
        <h2><i class="fa fa-times-circle icon"></i> <%= cancelledBookings %></h2>
        
    </div>

    <div class="card dark-blue">
        <p>Refunded Payments</p>
        <h2><i class="fa fa-money icon"></i> <%= refundedPayments %></h2>
        
    </div>

</div>


    </main>
</div>

</body>
</html>
