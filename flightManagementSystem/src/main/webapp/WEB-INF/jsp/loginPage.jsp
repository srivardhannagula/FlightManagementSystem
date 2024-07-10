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
body{
    margin: 0;
    padding: 0;
    height: 100vh;
    width: 100vw;
    display: flex;
    flex-direction: column;
    justify-content: center;  
    align-items: center; 
    background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
    background-size: cover;
}
h1 {
    margin: 0;
    margin-bottom:50px;
    padding: 20px 0;
    color: #fff;
    font-size:3rem;
    text-shadow: 2px 2px 4px #000;
}
h2 {
    display: inline;
}
.container{
    width: 400px;
    text-align: center;
    background-color: rgba(255, 255, 255, 0.6);  
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
button {
    width: 60%;
    padding: 10px;
    background-color: #007BFF;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
}
button:hover {
    background-color: #0056b3;
}
.leftalign, .rightalign {
    float: left;
    font-size: 1rem;
}
.rightalign {
    float: right;
}
</style>
</head>
<body>
 <h1><b> <u>WelCome To Flight Management System</u></b></h1>
  <div class="container">
    <header><h2><b>User Login</b> </header>
    <br>
    <br>
    

    <form:form action="/login" method="post" modelAttribute="userRecord">
    	 
        <label for="username"><b>Username:</b></label>
        <input type="text" id="username" name="username" required><br>
        <br><br>
    <label for="password"><b>Password:</b></label>
        <input type="password" id="password" name="password" required>
	<br><br>
        <button type="submit">Login</button>
        <br><br>
         <a href="/register">Didn't have an account? </a>
        <br><br>
    </form:form>

    <footer>Flight Reservation System 2024 | <a href="aboutUs.jsp">About Us</a></footer>
</div>
 
</html>