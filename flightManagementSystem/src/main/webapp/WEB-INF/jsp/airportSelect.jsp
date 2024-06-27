<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Airport Select</title>
<style>
    body {
        margin: 0;
        padding: 0;
        height: 100%;
        background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
        background-size: cover;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        font-family: Arial, sans-serif;
    }
    h1 {
        margin-top: 20px;
        font-size: 36px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
    }
    label, select, button, a {
    	color:black;
        font-size: 18px;
        margin-top: 10px;
    }
    select, button {
        padding: 10px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
    }
    button {
        background-color: #54a193;
        color: black;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #218838;
    }
    a {
        color: blue;
        
        
         
    }
    a:hover {
        background-color: rgba(255, 255, 255, 0.4);
    }
    form{
    width: 400px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.7);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);}
</style>
</head>
<body align="center">
 
<h1>Get Airport Location</h1>
 <form action="/showAirport" method="post">
        <label for="data">Choose a AirportCode:</label>
        <select name="selectedData" id="data">
        <c:forEach var="option" items="${allairportcodes}">
                <option value="${option}">${option}</option>
            </c:forEach>
        </select>
        <br>
        <br>
        <button type="submit">Submit</button><br><br>
        <a href="index">Back to home</a></div>
    </form>
    
</body>
</html>