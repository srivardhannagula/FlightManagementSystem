<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
      
    color: #fff;
    text-shadow: 2px 2px 4px #000;
             
        }
        h2,h3 {
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.3);
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
        h1 {
        text-align:center;
        margin-top: 20px;
        font-size: 36px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
    }
    h3 {
        margin-top: 20px;
        font-size: 24px;
    }
     </style>
</head>

<body>
<h1>${fromAirport}   -------------------    ${toAirport}</h2>
<h3>${fair}</h3>
<table border="1">
        <thead>
            <tr>
                <th>Flight_Number</th>
                <th>Carrier_Name</th>
                 <th>Route_Id</th>
                <th>Seat_Capacity</th>
                 <th>Departure</th>
                 <th>Arrival</th>
                 <th>Book Flight</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${flightList}" var="data">
                <tr>
                    <td>${data.flightNumber}</td>
                    <td>${data.carrierName}</td>
                    <td>${data.routeId}</td>
                    <td>${data.seatCapacity}</td>
                    <td>${data.departure}</td>
                   <td>${data.arrival}</td>
                    <td><b><a href="/ticket/${data.flightNumber}">BookFlight</a></b></td>
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h3> <a href="/index">Back to Home</a></h3>
</body>
</html>