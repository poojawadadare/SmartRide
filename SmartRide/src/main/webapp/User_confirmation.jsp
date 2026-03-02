<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Confirmation - Bus Ticket Booking</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_confirmation.css"> 
<style type="text/css"> <%@include file="CSS/User_confirmation.css" %> </style>
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
        
    <div class="container1" id="ticket-container">
    <img src="Images/star2.png" class="logo">
        <h2>Ticket Confirmation</h2>
        <p>Your booking is confirmed! Here are your ticket details:</p>
        <div class="ticket-details">
            <p><strong>Booking ID:</strong> <%=session.getAttribute("booking_id") %></p>
            <p><strong>Passenger Name:</strong> <%=session.getAttribute("passenger_name") %></p>
            <p><strong>Age:</strong> <%=session.getAttribute("age") %></p>
            <p><strong>Bus Name:</strong> <%=session.getAttribute("bus_name") %> </p>
            <p><strong>Journey Date & Time:</strong> <%=session.getAttribute("date") %> </p>
        </div>
        <div class="button-group">
            <button class="btn btn-download" onclick="downloadPDF()">Download Ticket (PDF)</button>
            <button class="btn btn-print" onclick="window.print()">Print Ticket</button>
             
        </div>
    </div>

    <script>
        function downloadPDF() {
            const { jsPDF } = window.jspdf;

            html2canvas(document.getElementById("ticket-container")).then(canvas => {
                let imgData = canvas.toDataURL("image/png");
                let pdf = new jsPDF("p", "mm", "a4");
                let imgWidth = 190;
                let imgHeight = (canvas.height * imgWidth) / canvas.width;
                
                pdf.addImage(imgData, "PNG", 10, 10, imgWidth, imgHeight);
                pdf.save("ticket.pdf");
            });
        }
    </script>

  
</main>
           
        </div>
    

    
</body>
</html>


