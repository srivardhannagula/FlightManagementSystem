<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>WelcometoFlightManegementSystem</title>
<style> 
body{
    margin: 0;
    padding: 0;
     height: 100%;
     background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
  background-size: cover;
  font-family: 'Arial', sans-serif;
    color: #fff;
}
 .container{
 text-align:center;
padding-top:20px;
font-size:1.5em;
 padding: 20px 0;
    color: #fff;
text-shadow: 2px 2px 4px #000;
 }
 nav{
 font-size:1.5em;
 background-color: rgba(0, 0, 0, 0.3);
 height:80px;
 text-align:center;
 
 }
 nav ul li{
 display:inline;
 margin-right:25px;
 margin-top:20px;
 
 }
 nav ul li a{
  
 align:center;
 color:white;
  }
 h1{
 margin:0;
  color:white;
 }
 .select-container {
    display: inline-block;
    margin-top: 20px;
}

.select-container select {
    font-size:0.8em;
    padding: 8px;
    background-color:  rgba(0, 0, 0, 0.2);
    color: white;
    
}
 h1 {
    margin: 0;
    padding: 20px 0;
    color: #fff;
    text-shadow: 2px 2px 4px #000;
}
</style>
</head>
<body>
 <div class="container">
        <h1><b> <u>WelCome To Flight Management System</u></b></h1>
        </div>
   
  <nav>
  <ul>
  <!--    <li class="select-container">
            <select id="airportSelect" onchange="if (this.value) window.location.href=this.value;">
                <option value="">Airport</option>
                <option value="/airport">Airport Entry</option>
               <!--   <option value="/showAirport">Airport Location</option>
                <option value="/showAllAirports">All Airport Details</option>
               <!--   <option value="/showAllAirportCodes">All Airport Codes</option> 
            </select>
        </li>
    <li class="select-container">
            <select id="routes" onchange="if (this.value) window.location.href=this.value;">
                <option value="">Routes</option>
                <option value="/routes">Route Entry</option>
                <option value="/showroutes">Show Routes</option>
            </select>
        </li>
     <li class="select-container">
            <select id="flightselect" onchange="if (this.value) window.location.href=this.value;">
                <option value="">Flight</option>
                <option value="/flight"> Add Flights</option>
                <option value="/showAllAddedFlights">All Added Flights</option>
            </select>
        </li> -->
    <li class="select-container">
            <select id="routeselect" onchange="if (this.value) window.location.href=this.value;">
                <option value="">BookFlight</option>
                <option value="/availableflights">  Flights</option>
                 
            </select>
        </li>
        
     <li class="select-container">
            <select id="airportSelect" onchange="if (this.value) window.location.href=this.value;">
                <option value="">Airport</option>
                <option value="/showAllAirports">All Airport Details</option>
               <!--   <option value="/showAllAirportCodes">All Airport Codes</option>-->
            </select>
        </li>
      <li class="select-container">
            <select id="view" onchange="if (this.value) window.location.href=this.value;">
                <option value="">Tickets</option>
                <option value="/showTicketPage">Ticket details</option>
               <!--   <option value="/showAllAirportCodes">All Airport Codes</option>-->
            </select>
        </li>
   
  <li><a href="/logout">LogOut</a>
  </ul>
  </nav> 
        
    
</body>
</html>