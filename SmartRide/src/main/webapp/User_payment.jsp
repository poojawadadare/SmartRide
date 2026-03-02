<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Payment</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_payment.css"> 
<style type="text/css"> <%@include file="CSS/User_payment.css" %> </style>
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
             <h1>Secure Payment</h1>
    <div class="payment-box">
        <h3>Enter Payment Details</h3>
        <form name="User_payment" action="User_payment" method="post">
            <div class="input-group">
                <label for="cardholder">Card Holder Name</label>
                <input type="text" name="cardholder" id="cardholder" placeholder="Enter cardholder name">
            </div>
            <div class="input-group">
                <label for="cardnumber">Card Number</label>
                <input type="text" name="cardnumber" id="cardnumber" placeholder="Enter card number">
            </div>
            <div class="input-group">
                <label for="expiry">Expiery Date</label>
                <input type="month" name="expiry" id="expiry">
            </div>
            <div class="input-group">
                <label for="cvv">CVV</label>
                <input type="password" name="cvv" id="cvv" placeholder="Enter CVV">
            </div>
            <button class="pay-btn" type="submit" name="submit" value="Pay Now">Pay Now</button>
        </form>
    </div>
   
</main>
           
        
    </div>

    
</body>
</html>


