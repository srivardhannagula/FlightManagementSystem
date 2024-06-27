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
.leftalign{
	float:left;
	font-size:1rem;
}
body{
    margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;  
            align-items: center; 
            background: url(https://wallpapercave.com/wp/wp4128800.jpg) no-repeat center center fixed;
            background-size: cover;
  
}
.rightalign{
	float:right;
	font-size:1rem;
}
.container{
  width: 300px;
            text-align: center;
            vertical-align:center;
            background-color: rgba(255, 255, 255, 0.8);  
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
 
  <div class="container">
    <header><b>Flight Management System</b> <a href="/register">SignIn</a></header>
    <br>
    <br>
    

    <form:form action="/login" method="post" modelAttribute="userRecord">
    	 
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <br><br>
    <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
	<br><br>
        <button type="submit">Login</button>
        <br><br>
    </form:form>

    <footer>Flight Reservation System 2024 | <a href="aboutUs.jsp">About Us</a></footer>
</div>
 
</html>