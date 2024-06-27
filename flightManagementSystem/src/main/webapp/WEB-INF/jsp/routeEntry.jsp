<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>route Entry</title>
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
        width: 400px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
    h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
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
        background-color: #2ed994;
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
<h2>Enter New Route</h2>
<form:form action="/routes" method="post" modelAttribute="routeDetails">
<form:hidden path="routeId"/>
<table> 
<tr>
<td> Enter Source Airport:</td><td><form:input path="sourceAirportCode" required="required"/></td></tr> 
<tr><td> Enter Destination Airport:</td><td><form:input path="destinationAirportCode" required="required"/></td></tr> 
<tr><td> Enter Route Fair:</td><td><form:input path="fair" required="required"/></td></tr> 
</table>
 <button type="submit">Add</button>
</form:form>
 
<a href="index">Back to home</a></div>
</body>
</html>