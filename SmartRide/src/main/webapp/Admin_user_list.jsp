<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin User Management</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/Admin_user_list.css"> 
<style type="text/css"> <%@include file="CSS/Admin_user_list.css" %> </style>
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
              
                 <li><i class="fa fa-bus"><a href="Admin_add_bus.jsp">&nbsp&nbspBus Management</a></i></li>  
                 <li><i class="fa fa-map"><a href="Admin_route_management.jsp">&nbsp&nbspRoute And Scheduling</a></i></li>
                 
                <li><i class="fa fa-tasks"><a href="Admin_booking_management.jsp">&nbsp&nbspBooking Management</a></i></li>
                
                <li><i class="fa fa-credit-card"><a href="Admin_refund.jsp">&nbsp&nbspPayments</a></i></li>
               
                 <li><i class="fa fa-sign-out"><a href="Admin_login.jsp">&nbsp&nbspLogout</a></i></li>
            </ul>
            </div>
        </aside>

        <main class="main-content">
        <img src="Images/star2.png" class="logo">
            <h1>User Management</h1>
            <br>
            <table class="user-table">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        
        
        
        <%
			Connection cn =null;
			Statement st=null;
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartRide","root","root");
			st = cn.createStatement();
			String sql = "select * from user_signup ";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next())
			{
			%> 
				<tr>
					<td><%=rs.getString("user_id") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("email") %></td> 
					 <td class="actions">
        
        <form action="Admin_user_management" method="post" style="display:inline;">
    <input type="hidden" name="user_id" value="<%=rs.getInt("user_id")%>">
    <button type="submit" name="submit" value="Cancel" class="btn-delete">
        Delete
    </button>
</form>

    </td>
				<tr>
		 <% } %>

    </table>
            
            </main>
        
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


