<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ticket Booking Page</title>
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
        font-family: 'Arial', sans-serif;
        color: #333;
    }
    .container {
        width: 80%;
        height:100vh;
        overflow-y: auto;
        scrollbar-width: none;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.6);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
    }
    h1 {
        margin: 20px 0;
        font-size: 2em;
        color: #333;
        font-weight: bold;
    }
    h3 {
        margin-bottom: 20px;
        font-size: 1.5em;
        color: #333;
        font-weight: bold;
    }
    table {
        width: 100%;
        margin-bottom: 15px;
    }
    td {
        padding: 10px;
        font-weight: bold;
    }
    input[type="text"] {
        width: 50%;
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
       a.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    background-color: #007bff;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

a.button:hover {
    background-color: #0056b3;
}
    
</style>
 
</head>
<body>
<div class="container">
        <h1><b>Ticket Booking</b></h1>
        <h3>Book Here</h3>
        <form:form   action="/ticket" method="post" modelAttribute="ticketRecord">
        <form:hidden path="ticketNumber"/>
        <form:hidden path="flightNumber"/>
        <form:hidden path="carrierName"/>
        <table>
        <tr><td> <label>TicketNumber:</label></td><td><form:input path="ticketNumber" disabled="true"/></td>
        <td> <label>Flight Number:</label></td><td><form:input path="flightNumber" disabled="true"/></td>
        <td> <label>Carrier Name:</label></td><td><form:input path="carrierName" disabled="true"/></td></tr>
        <tr>
        <td><label>Form:</label></td><td><input type="text" name="fromLocation" value="${routeRecord.sourceAirportCode}"  readonly/></td> 
         <td><label>To:</label></td><td><input type="text" name="toLocation" value="${routeRecord.destinationAirportCode}"  readonly /></td>
         <td><label>Fare:</label></td><td><input type="text" name="fair" value="${routeRecord.fair}"    readonly /></td> </tr>
         </table>
         <br>
         <br>
        <h3>Enter Passenger Details:</h3>  
         <table>
         <tr>
         <td>Name:<input type="text" name="name1" value="--" required="required"/></td><td>Date of Birth:<input type="date" name="dob1" pattern="\d{1,2}-\d{1,2}-d{4}" required="required"/></td>
         </tr> 
          <tr>
         <td>Name:<input type="text" name="name2" value="--" /></td><td>Date of Birth:<input type="date" name="dob2" pattern="\d{1,2}-\d{1,2}-d{4}" /></td>
         </tr> 
         <tr>
         <td>Name:<input type="text" name="name3" value="--" /></td><td>Date of Birth:<input type="date" name="dob3" pattern="\d{1,2}-\d{1,2}-d{4}" /></td>
         </tr> 
         <tr>
         <td>Name:<input type="text" name="name4" value="--" /></td><td>Date of Birth:<input type="date" name="dob4" pattern="\d{1,2}-\d{1,2}-d{4}" /></td>
         </tr> 
         <tr>
         <td>Name:<input type="text" name="name5" value="--" /></td><td>Date of Birth:<input type="date" name="dob5" pattern="\d{1,2}-\d{1,2}-d{4}" /></td>
         </tr>
         <tr>
         <td>Name:<input type="text" name="name6" value="--" /></td><td>Date of Birth:<input type="date" name="dob6" pattern="\d{1,2}-\d{1,2}-d{4}" /></td>
         </tr>  
         </table>
          <button type="submit">Submit</button> <br>
           <a href="/index" class="button">cancel ticket</a>
           <a href="/index">Back to Login</a>
        </form:form>
        
         <br>
        
    </div> 
</body>
</html>