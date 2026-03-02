<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css" >
<link rel="stylesheet" type="text/css" href="CSS/Admin_login.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">

<style type="text/css"> <%@include file="CSS/Admin_login.css" %> </style>



</head>
<body>

<div class="page-header">
    <img src="Images/star2.png" alt="Logo" class="login-logo">
</div>

<form name="Admin_Login" action="Admin_login" method="post">

	<div class="login_div">
	     <h2 class="heading">ADMIN LOGIN</h2>
	     <h6>Please fill in this form to login in your account!</h6>     
	    <div class="profile_icon">
	    <i class="fa fa-envelope"></i> <input type="text" class="textbox" name="email" placeholder="Email"><br><br>
	    </div> 
	    <div class="profile_icon">
	    <i class="fa fa-key"> </i> <input type="password" class="textbox" name="password" placeholder="Password"><br> 
	     </div>
	     <input type="submit" name="submit" value="Submit" class="button"> <br>
	     <br>
	     <a href="Admin_signup.jsp">Don't have an account?... Signup Here!</a>
	</div>
	 
</form>
</body>
</html>