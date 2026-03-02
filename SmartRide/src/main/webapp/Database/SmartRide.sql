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

create table admin_bus_details
(
    bus_id int auto_increment primary key,
    bus_name nvarchar(50),
    bus_no nvarchar(100),
    bus_type nvarchar(100),
    total_seats int,
    fare_per_seat nvarchar(50)
);

create table admin_add_location
(
   root_id int auto_increment primary key,
   source  varchar(255),
   destination varchar(255),
   departure_time nvarchar(255),
   arrival_time nvarchar(50),
   bus_assigned nvarchar(50)
);

create table seat_booking 
 (
	id int AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    user_id INT,
    bus_id INT,
    source nvarchar(50),
    destination nvarchar(50),
    seat_number INT,
    passenger_name NVARCHAR(100),
    passenger_age INT,
    journey_date nvarchar(50),
    booking_date NVARCHAR(100),
    booking_status nvarchar(50)
);

create table user_profile
(
	profile_id int auto_increment primary key,
    user_id int,
    name nvarchar(50),
    email nvarchar(50),
    phone nvarchar(50),
    address nvarchar(50)

);

create table user_payment
(
   payment_id int auto_increment primary key,
   cardholder nvarchar(100), 
   number nvarchar(100),
   expiry nvarchar(100),
   cvv nvarchar(100),
   payment_date nvarchar(500)
);

ALTER TABLE seat_booking 
ADD refund_status VARCHAR(20) DEFAULT 'Not Refunded';

CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    submitted_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    dob DATE DEFAULT NULL,
    address VARCHAR(255) DEFAULT NULL,
    city VARCHAR(100) DEFAULT NULL,
    state VARCHAR(100) DEFAULT NULL,
    pincode VARCHAR(10) DEFAULT NULL,

    CONSTRAINT fk_user_profile_user
        FOREIGN KEY (user_id) REFERENCES user_signup(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
