<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup - Bus Ticket Booking</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_signup.css">
<style type="text/css"> <%@include file="CSS/Admin_signup.css" %> </style>
</head>
<body>
<div class="page-header">
    <img src="Images/star2.png" alt="Logo" class="login-logo">
</div>
<main class="main-content">
   
    <div class="signup-box">
        <h2>ADMIN SIGNUP</h2>
        <form name="Admin_Signup_Page" action="Admin_signup" method="post">
            <div class="input-group">
               
                    <div class="profile_icon">
	    <i class="fa fa-user"> </i>
                <input type="text" id="name" name="name" placeholder="Enter your full name">
            </div></div>
            
            
            <div class="input-group">
                
                    <div class="profile_icon">
	    <i class="fa fa-envelope"> </i>
                <input type="email" id="email" name="email" placeholder="Enter your email">
            </div></div>
            
            <div class="input-group">
               
                    <div class="profile_icon">
	    <i class="fa fa-key"> </i>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div></div>
            
            
            <div class="input-group">
              
                    <div class="profile_icon">
	    <i class="fa fa-key"> </i>
                <input type="password" id="confirm-password" name="cpassword" placeholder="Confirm your password">
            </div>
            </div>
            <button class="signup-btn" type="submit" name="submit" value="Signup">Signup</button>
        </form>
        <div class="extra-links">
            Already have an account? <a href="Admin_login.jsp">Login</a>
        </div>
    </div>
</main>

</body>
</html>