<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment & Refund Management</title>

<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_Refund.css">
<style type="text/css"> <%@include file="CSS/Admin_Refund.css" %> </style>

</head>
<body>

<div class="container">

    <!-- Sidebar -->
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
           
             <li><i class="fa fa-sign-out"><a href="Admin_login.jsp">&nbsp&nbspLogout</a></i></li>        </ul>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <img src="Images/star2.png" class="logo">
        <h1>Payment & Refund Management</h1>

        <table class="user-table">
            <tr>
                <th>Booking ID</th>
                <th>Transaction ID</th>
                <th>Booking Status</th>
                <th>Refund Status</th>
                <th>Action</th>
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

                    String booking_id = rs.getString("booking_id");
                    String booking_status = rs.getString("booking_status");
                    String refund_status = rs.getString("refund_status");
                    String txn_id = "TXN" + booking_id;
            %>

            <tr>
                <td><%= booking_id %></td>
                <td><%= txn_id %></td>
                <td><%= booking_status %></td>
                <td><%= refund_status %></td>

                <td>
                    <% 
                    // Show button only if booking is Cancelled AND refund is not processed
                    if( booking_status.equalsIgnoreCase("Cancelled") 
                        && refund_status.equalsIgnoreCase("Not Refunded") ) {
                    %>

                        <form action="ProcessRefund" method="post" style="display:inline;">
                            <input type="hidden" name="booking_id" value="<%= booking_id %>">
                            <button type="submit" class="refund-btn" onclick="return refundPopup();">
                                Process Refund
                            </button>
                        </form>

                    <% } else { %>

                        <span><%= refund_status %></span>

                    <% } %>
                </td>
            </tr>

            <% } %>
        </table>

    </main>
</div>

<script>
function refundPopup() {
    return confirm("Payment Refund Processed Successfully?");
}
</script>

</body>
</html>
