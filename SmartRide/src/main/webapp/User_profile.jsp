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

    // VARIABLES FOR PROFILE
    boolean hasProfile = false;
    String full_name = "";
    String phone = "";
    String gender = "";
    String dob = "";
    String address = "";
    String city = "";
    String state = "";
    String pincode = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/SmartRide", "root", "root");
        Statement st = cn.createStatement();

        ResultSet rs = st.executeQuery(
            "SELECT * FROM user_profile WHERE user_id=" + uid
        );

        if (rs.next()) {
            hasProfile = true;
            full_name = rs.getString("full_name");
            phone = rs.getString("phone");
            gender = rs.getString("gender");
            java.sql.Date d = rs.getDate("dob");
            if(d != null){
                dob = d.toString();   // yyyy-MM-dd format
            }
            address = rs.getString("address");
            city = rs.getString("city");
            state = rs.getString("state");
            pincode = rs.getString("pincode");
        }

        rs.close();
        st.close();
        cn.close();
    } catch(Exception e){
        out.println(e.toString());
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/User_profile.css">
<style type="text/css"> <%@include file="CSS/User_profile.css" %> </style>
</head>
<body>

<div class="container">

    <aside class="sidebar">
        <%
            String uname = (String) session1.getAttribute("username");
            if(uname == null){ uname = "User"; }
        %>
        <h1>Hello <%= uname %>!</h1>
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
        <h1>User Profile</h1>

        <% if(hasProfile) { %>
            <!-- EDIT PROFILE FORM -->
            <h3>Edit Profile</h3>
            <form action="User_profile" method="post" class="profile-form">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="user_id" value="<%= uid %>">

                <label>Full Name</label>
                <input type="text" name="full_name" value="<%= full_name %>" required>

                <label>Phone</label>
                <input type="text" name="phone" value="<%= phone %>" required>

                <label>Gender</label>
                <select name="gender">
                    <option value="">Select</option>
                    <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                </select>

                <label>Date of Birth</label>
                <input type="date" name="dob" value="<%= dob %>">

                <label>Address</label>
                <textarea name="address" rows="3"><%= address %></textarea>

                <label>City</label>
                <input type="text" name="city" value="<%= city %>">

                <label>State</label>
                <input type="text" name="state" value="<%= state %>">

                <label>Pincode</label>
                <input type="text" name="pincode" value="<%= pincode %>">

                <button type="submit" name="submit" value="Update" class="btn btn-primary">Update Profile</button>
            </form>

        <% } else { %>
            <!-- CREATE PROFILE FORM -->
            <h3 class="profile-title">Create Profile</h3>
            <form action="User_profile" method="post" class="profile-form">
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="user_id" value="<%= uid %>">

                <label>Full Name</label>
                <input type="text" name="full_name" required>

                <label>Phone</label>
                <input type="text" name="phone" required>

                <label>Gender</label>
                <select name="gender">
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>

                <label>Date of Birth</label>
                <input type="date" name="dob">

                <label>Address</label>
                <textarea name="address" rows="3"></textarea>

                <label>City</label>
                <input type="text" name="city">

                <label>State</label>
                <input type="text" name="state">

                <label>Pincode</label>
                <input type="text" name="pincode">

                <button type="submit" name="submit" class="btn btn-success" value="Create">Create Profile</button>
            </form>
        <% } %>

    </main>

</div>

</body>
</html>
