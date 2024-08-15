<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Ticket</title>
 <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            width:100vw;
            display: flex;
    flex-direction: column;
    justify-content: center;  
    align-items: center; 
            background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
             color: #fff;
    text-shadow: 2px 2px 4px #000;
        }
        h1,h3 {
            text-align: center;
        }
        table {
            width: 80%;
            text:bold;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.4);
        }
        table th, table td {
            padding: 10px;
            text-align: center; /* Align content center */
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: rgba(0, 0, 0, 0.2);
            color: white;
        }
        
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: white;
            
        }
         h1,h3 {
    margin: 0;
    padding: 20px 0;
    color: #fff;
    text-shadow: 2px 2px 4px #000;
}
.container{ 
 width: 80%;
 text-align: center;
 padding:25px;
  background-color: rgba(256, 256, 256, 0.5);
}
     </style>
</head>
  <body>
   
<div class="container"> 
 <form action="/deleteTicket" method="get">
<input type="hidden" name="ticketNumber" value=${ticketNum}>
<input type="hidden" name="flightNumber" value=${flightNum}> 
<table>
 
<h1>Ticket</h1>

<tr><td>Ticket Number: ${ticketNum}</td><td>Carrier Name: ${carrierName}</td><td>Flight Number: ${flightNum}</td></tr>
<tr><td>From City: ${fromLoc}</td><td>To City: ${toLoc}</td><td>Ticket Status: Conformed</td></tr></table>
<h3>Passenger Data </h3>
<table border="1">
        <thead>
            <tr>
                <th><b>Passenger_Name</b></th>
                <th><b>Passenger_DOB</b></th>
                <th><b>Fare</b></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${passengerData}" var="data">
                <tr>
                    <td><b>${data.passengerName}</b></td>
                    <td><b>${data.passengerDOB}</b></td>
                   	<td><b>${data.fare}</b></td>
                </tr>
            </c:forEach>
           <tr><td></td> <td>Total</td><td><b>${totalfare}</b></td></tr>
        </tbody>
    </table>
      <a href="/index">BackToHome</a> 
      <button type="submit">Cancel Ticket</button>
          </form>
      </div>
   
     
</body>
 
</html>