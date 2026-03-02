create database SmartRide;
use SmartRide;

create table Admin_signup
(
	admin_id int auto_increment primary key,
    name nvarchar(100), 
    email nvarchar(50),
    password nvarchar(15),
    cpassword nvarchar(100)
);

create table User_signup
(
	user_id int auto_increment primary key,
    name nvarchar(100), 
    email nvarchar(50),
    password nvarchar(15),
    cpassword nvarchar(100)
);