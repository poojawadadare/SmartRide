<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Select Bus</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/fa/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/User_available_buses.css"> 
<style type="text/css"> <%@include file="CSS/User_select_seat.css" %> </style>
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
            <form name="User_select_seat" action="User_select_seat" method="post">
    <div class="container1">
        <!-- Seat Selection Section -->
        <div class="seat-section">
            <h2>Select Your Seat</h2>
            <div class="seat-layout">
                <% for(int i=1; i<=Integer.parseInt(session.getAttribute("total_seats").toString()); i++ ) { %>
                    <button type="button" id="<%=i%>" value="<%=i%>" class="seat"> <%= i %> </button> 
                <% } %>
            </div>
        </div>

        <!-- Passenger Details Section -->
        <div class="booking-form">
        
            <h2>Passenger Details</h2>
            
            <div id="passenger-details">
            	
            </div>
            
            <button class="btn" id="confirm-booking" name="submit" type="submit" value="Confirm Booking"> Confirm Booking </button>
            <button class="btn" style="background-color: gray;">Cancel</button>
            <input type="hidden" name="seatsselected" value="0" id="seatsselected"> 
    	    <input type="hidden" name="counts" value="0" id="counts"> 
        </div>
    </div>
     
    
    </form>
    
    <script>
        let selectedSeats = new Set();
        const seatButtons = document.querySelectorAll('.seat');
        const passengerDetailsDiv = document.getElementById("passenger-details");

        seatButtons.forEach(seat => 
        {
            seat.addEventListener('click', () => 
            {
            	const seatNumber = seat.innerText; 
            	document.getElementById("seatsselected").value = document.getElementById("seatsselected").value  + ","+ seatNumber;
                
                
                if (selectedSeats.has(seatNumber))
                {
                    selectedSeats.delete(seatNumber);
                    seat.classList.remove('selected');
                    document.getElementById("passenger-details").value +=1;
                } 
                else 
                {
                    selectedSeats.add(seatNumber);
                    seat.classList.add('selected');
                    document.getElementById("passenger-details").value -=1;
                } 
                updatePassengerDetails();
            });
        });

        function updatePassengerDetails()
        {
            passengerDetailsDiv.innerHTML = ""; // Clear previous inputs
            let count = 1;
            selectedSeats.forEach(seat => 
            {  
            	document.getElementById("counts").value = count;
                count++;
                
                
            });
        }
        
        
        document.getElementById("confirm-booking").addEventListener("click", () => {
            let busId = 1;  
            let selectedSeatNumbers = Array.from(selectedSeats); 
            
          
           
        });
 
    </script>
</main>
           
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="admin_homepage.js"></script>

</body>
</html>


