<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Search Page</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_search_bus.css"> 
<style type="text/css"> <%@include file="CSS/User_search_bus.css" %> </style>
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
            <h1>Search Bus</h1>
            <div class="search-box">
        <h2>Find Your Bus</h2>
        <form name="User_Search_Bus" action="User_search_bus" method="post">
            <div class="input-group">
                <label for="source">Source</label>
                <select id="source" name="source">
                    <option value="">Select Source</option>
                     
                    <%
	                	Connection cn = null;
	                	Statement st = null;
                		Class.forName("com.mysql.jdbc.Driver");
        				cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
        				st = cn.createStatement();
        				String sql = "select * from admin_add_location  ";
        				ResultSet rs = st.executeQuery(sql);
        				
        				while(rs.next())
        				{
                	%> 
                    		<option value="<%=rs.getString("source") %>"><%=rs.getString("source") %></option>
                    <%  } %>
                </select>
            </div>
            <div class="input-group">
                <label for="destination">Destination</label>
                <select id="destination" name="destination">
                    <option value="">Select Destination</option>
                   
                    <% 
                		Class.forName("com.mysql.jdbc.Driver");
        				cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
        				st = cn.createStatement();
        				sql = "select * from admin_add_location  ";
        				rs = st.executeQuery(sql);
        				
        				while(rs.next())
        				{
                	%> 
                    		<option value="<%=rs.getString("destination") %>"><%=rs.getString("destination") %></option>
                    <%  } %>
                </select>
            </div>
            <div class="input-group">
                <label for="date">Date of Journey</label>
                <input type="date" id="date" name="date">
            </div>
            <div class="btn-group">
                <button type="submit" class="search-btn" name="submit" value="Search Bus">Search Bus</button>
                <button type="reset" class="reset-btn">Reset</button>
            </div>
        </form>
    </div>
           
            
        </main>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


