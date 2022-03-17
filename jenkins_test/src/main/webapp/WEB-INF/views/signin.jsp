<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
	<link href="css/signin.css" rel="stylesheet" />
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/signin.js"></script>
	<!------ Include the above in your HEAD tag ---------->

<body>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="img/brightness-low.svg" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form id="loginform" method="post" action="/signin">
      <input type="text" class="fadeIn second" id="id" name="id" placeholder="ID">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password"
      style="width:85%; margin:5px; padding: 15px 32px; border: 2px solid #f6f6f6; background-color: #f6f6f6; text-align: center; border: none; color: #0d0d0d; font-size: 16px; border-radius: 5px 5px 5px 5px;">
      <div id="msg" class="form-text"></div>
	  <input type="button" id="loginbtn" value="Log In">
	  <input type="button" id="signupbtn" value="Sign Up" onclick="location.href='/signup'">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</body>
</html>