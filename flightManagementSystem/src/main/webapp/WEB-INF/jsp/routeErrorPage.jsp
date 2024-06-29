<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    h3 {
        margin-top: 20px;
        font-size: 24px;
    }
    a {
        color: #00f;
        text-decoration: none;
        padding: 10px 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    a:hover {
        background-color: rgba(255, 255, 255, 1);
    }
</style>
</head>
<body>
<h1>${errorMessage}</h1>
<h3><a href="/index">Back to home</a></h3>
</body>
</html>