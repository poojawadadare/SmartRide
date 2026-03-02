<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Smart Ride - Home</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        *{margin:0;padding:0;box-sizing:border-box;}
        body{
            font-family:'Poppins',sans-serif;
            background:linear-gradient(135deg,#1e3c72,#2a5298);
            min-height:100vh;color:#fff;
        }

        /* NAVBAR */
        .navbar{
            width:100%;padding:15px 60px;
            display:flex;justify-content:space-between;align-items:center;
            position:fixed;top:0;left:0;z-index:10;
            backdrop-filter:blur(12px);
            background:rgba(10,25,51,0.65);
        }

        .nav-logo{
            font-size:24px;font-weight:700;display:flex;align-items:center;gap:8px;
        }
        .logo-dot{
            width:10px;height:10px;border-radius:50%;background:#ffce00;
        }
        .nav-right button{
            padding:8px 18px;border-radius:999px;border:1px solid rgba(255,255,255,0.6);
            background:transparent;color:#fff;font-size:14px;cursor:pointer;
            margin-left:10px;transition:0.3s;
        }
        .nav-right button.primary{
            background:#ffce00;color:#1e2a3a;border-color:#ffce00;
        }
        .nav-right button:hover{
            transform:translateY(-2px);background:rgba(255,255,255,0.12);
        }
        .nav-right button.primary:hover{
            background:#ffd93b;
        }

        /* HERO SECTION */
        .hero-section{
            padding-top:140px;text-align:center;
        }

        .top-logo{
            width:150px;
            margin-bottom:15px;
            animation:fadeDown 0.9s ease-out;
        }

        @keyframes fadeDown{
            from{opacity:0;transform:translateY(-20px);}
            to{opacity:1;transform:translateY(0);}
        }

        .hero-section h1{
            font-size:48px;font-weight:700;letter-spacing:2px;
        }
        .hero-section h2{
            font-size:22px;font-weight:400;margin-top:8px;letter-spacing:3px;color:#ffce00;
        }

        /* SECTIONS */
        .section{
            max-width:900px;margin:40px auto;padding:25px;
            background:rgba(10,25,51,0.85);border-radius:18px;
        }
        .section h3{
            font-size:22px;margin-bottom:12px;font-weight:600;
        }
        .section p{
            font-size:15px;line-height:1.7;color:#d3ddff;
        }

        /* CONTACT */
        .contact-grid{
            display:grid;grid-template-columns:1fr 1fr;gap:20px;
        }
        .form-group label{
            font-size:14px;margin-bottom:5px;display:block;
        }
        .form-group input,.form-group textarea{
            width:100%;padding:10px;background:rgba(3,10,25,0.8);
            border:1px solid rgba(255,255,255,0.25);
            border-radius:10px;color:#fff;outline:none;transition:0.3s;
        }
        .form-group input:focus,.form-group textarea:focus{
            border-color:#ffce00;
        }
        textarea{resize:vertical;height:90px;}
        .contact-submit{
            padding:10px 22px;border-radius:999px;background:#ffce00;
            color:#1e2a3a;border:none;font-weight:600;cursor:pointer;margin-top:10px;
        }

        @media(max-width:768px){
            .contact-grid{grid-template-columns:1fr;}
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="nav-logo">
            <span class="logo-dot"></span>
            Smart Ride
        </div>

        <div class="nav-right">
            <a href="Admin_login.jsp"><button>ADMIN</button></a>
            <a href="User_login.jsp"><button class="primary">USER</button></a>
        </div>
    </div>

    <!-- HERO -->
    <div class="hero-section">
        <img src="Images/star2.png" alt="Logo" class="top-logo">
        <h1>SMART RIDE</h1>
        <h2>ONLINE BUS RESERVATION SYSTEM</h2>
    </div>

    <!-- ABOUT -->
    <div class="section" id="about">
        <h3>About Us</h3>
        <p>
            Smart Ride is an online bus reservation system designed to make travel booking
            easier, faster, and more efficient. Users can search buses, check seat availability,
            and book tickets instantly. Administrators can manage routes, buses, schedules,
            and bookings from a single dashboard  
            while ensuring a smooth user experience.
        </p>
    </div>

    <!-- CONTACT -->
    <div class="section" id="contact">
        <h3>Contact Us</h3>

        <div class="contact-grid">
            <!-- CONTACT FORM CONNECTED TO BACKEND -->
            <form action="Contact_us" method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullname" placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" placeholder="Write your message" required></textarea>
                </div>

                <button class="contact-submit" type="submit">Send Message</button>
            </form>

            <div>
                <p style="line-height:1.8;color:#d3ddff;">
                    <b>Support (Demo):</b><br>
                    Email: support@smartride.demo<br>
                    Phone: +91 98765 43210<br><br>
                    Feel free to send your queries, feedback, or suggestions.
                </p>
            </div>
        </div>
    </div>

</body>
</html>
