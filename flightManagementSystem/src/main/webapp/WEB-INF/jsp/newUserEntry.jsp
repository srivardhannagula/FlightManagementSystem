<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New User Registry</title>
<script type="text/javascript">
function passwordCheck(){
	 var pass1 = document.getElementById("pass1").value;
	    var pass2 = document.getElementById("pass2").value;
	    var specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/g;
	    
	    if(pass1 !== pass2) {
	        alert("Passwords do not match");
	    } else if(pass1.length < 8) {
	        alert("Password must be at least 8 characters long");
	    } else if(!specialCharPattern.test(pass1)) {
	        alert("Password must contain at least one special character");
	    } else {
	        document.getElementById("registrationForm").submit();
	    }
}
</script>
<style>
.leftalign{
	float:left;
	 
	font-size:1rem;
}
.rightalign{
	float:right;
	font-size:1rem;
}
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
            vertical-align:center;
            background-color: rgba(255, 255, 255, 0.7); 
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
#select{
width:170px;
text-align:center;}
button{
 background-color: #54a193;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;}
  table{
  margin-left:50px;}
  
</style>
</head>
<body>
 <h1><b> <u>WelCome To Flight Management System</u></b></h1>
  <div class="container">
         
        <h2>Register Here</h2>
        <br/><br>
        <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord">
        <table><tr>
         <td>   <b>Enter New User Id: </b></td><td><form:input path="username" required="required"/> </td></tr>
            <tr><td><b>Select User's Type:</b></td>  <td><form:select path="type" id="select">
                <form:option value="Customer">Customer</form:option>
                <form:option value="Admin">Admin</form:option>
            </form:select></td></tr>
            
         <tr><td>  <b> Enter New Password:</b></td><td> <form:input type="password" id="pass1" path="password" required="required"/></td></tr>
         <tr><td>  <b>Re-type New Password:</b></td><td><input type="password" id="pass2" path="password" required="required"/> </td> 
            </table>  <br/><br>
            <button type="button" onclick="passwordCheck()">Submit</button>
            <br/><br>
            <button type="reset">Reset</button>
            <br/><br>
        </form:form>
        <a href="/loginpage">Have an account?</a>
    </div> 
</body>
</html>