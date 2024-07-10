<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new Flight</title>
 <style>
    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        width: 100vw;
        display: flex;
        justify-content: center;
        align-items: center;
        background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
        background-size: cover;
        font-family: Arial, sans-serif;
    }
    .container {
    	margin-top:60px;
    	hight:100vh;
        width: 400px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.6);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }
    h2 {
    	margin-top:20px;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
    table {
        width: 100%;
        margin-bottom: 5px;
    }
    td {
        padding: 10px;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    button {
        background-color: #54a193;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    button:hover {
        background-color: #218838;
    }
    a {
        display: block;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
 
</head>
<body align="center">
<div class="container"> 
<h2>Add Flight Info</h2>
  <form:form action="/flight" method="post" modelAttribute="flightdetails">
  <table> 
  <tr>
 <td> Enter the FlightNumber:</td>
 <td> <form:input path="flightNumber" required="required"/></td></tr>
  <tr><td>Enter the Carrier Name:</td>
  <td><form:input path="carrierName" required="required"/> </td></tr>
  <tr><td> Enter the Route Id:</td>
 <td> <form:input list="routes" path="routeId" required="required"/>
 	<datalist id="routes">
 	<c:forEach items="${ routeList}" var="route">
 	<option value="${route}">
 	</option></c:forEach></datalist></td></tr>
 <tr> <td>Enter the Seat Capacity:</td><td>
  <form:input path="seatCapacity" required="required"/></td></tr>
  <tr><td> Enter the departure Time:</td><td>
  <form:input path="departure" required="required"/> </td></tr>
  <tr><td> Enter the arrival Time:</td><td>
  <form:input path="arrival" required="required"/> </td></tr>
  <form:hidden path="seatBooked" value="0"/>
  <tr><td> Enter Return Flight Departure  Time:</td><td>
  <input   name="dtime"/> </td></tr>
  <tr><td> Enter Return Flight Arrival  Time:</td><td>
  <input  name="atime"/> </td></tr>
  
  </table>
  <button type="submit">Submit</button>
  </form:form><br><br>
  <a href="index">Back to Home</a></div>
</body>
</html>