<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show All Routes</title>
 <style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
        }
        h2 {
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
     </style>
</head>
<body>
<h2>All Routes Data</h2>
  
    <table border="1">
        <thead>
            <tr>
                <th>route_Id</th>
                  <th>Source_airportCode</th>
                  <th>Destination_airportCode</th>
                    <th>route_fair</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${routesdata}" var="data">
                <tr>
                    <td>${data.routeId}</td>
                    <td>${data.sourceAirportCode}</td>
                    <td>${data.destinationAirportCode}</td>
                     <td>${data.fair}</td>
                    
                     
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>
   
    <br>
    <br>
 <a href="/index">Back to home</a>

</body>
</html>