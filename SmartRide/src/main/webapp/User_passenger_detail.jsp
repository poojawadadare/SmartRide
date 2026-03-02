<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Passenger Detail</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_passenger_detail.css"> 
<style type="text/css"> <%@include file="CSS/User_passenger_detail.css" %> </style>
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
           <form name="User_passenger_detail" action="User_passenger_detail" method="post">
    <div class="container1">
        <!-- Seat Selection Section -->
         

        <!-- Passenger Details Section -->
        <div class="booking-form">
            <h1>Passenger Details</h1>
            <div id="passenger-details">
            	<%
            		for(int i=1; i<= Integer.parseInt(session.getAttribute("counts").toString()); i++)
            		{
            	%>
            	<input type="text" id="name<%=i%>" name="name<%=i%>"   placeholder="Enter Passenger name">
            	<input type="number" id="age<%=i%>" name="age<%=i%>"  placeholder="Enter Passenger age">
            	
            	<% } %>
            </div>
            <button class="btn" id="confirm-booking" name="submit" type="submit" value="Confirm Booking">Confirm Booking</button>
            <button class="btn" style="background-color: gray;">Cancel</button>
        </div>
    </div>
    <input type="hidden" name="seats" value="0" id="seats">
    
    </form>
           
</main>
           
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


