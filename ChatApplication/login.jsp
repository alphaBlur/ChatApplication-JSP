<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% request.getSession().setAttribute("toUser",""); %>
<% request.getSession().setAttribute("savedUser",""); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	<style>
		.topB{
			height:30px;
			width:100%;
			background-color:blue;
		}
		.bottomB{
			height:30px;
			width:99%;
			background-color:blue;
			position:absolute;
			bottom:0;
		}
		#f1{
			height:420px;
			width:650px;
			margin:10px auto;
			padding:5px 5px;
			border:2px lightblue solid;
			background-color:#eaeaff;
		}
		form{
			text-align:center;
		}
		input{
			height:50px;
			width:220px;
			margin:10px 5px;
		}
		
	</style>
</head>
<body>
<div style="">
<h1 style="float: left;">Login</h1>
<img src="ChatLogo.png" style="margin-left: 440px;">
</div>
<div class="topB"></div>
	<div id="f1">
	<form method="post" action="AuthServ">
		<br><br><br>
		<input name="username" placeholder="Username" type="text"><br>
		<input name="password" placeholder="Password" type="password"><br>
		<input value="Submit" type="submit"><br>
		<a style="text-decoration:none" href="SignUp.html"><input  value="Register" type="button"></a>
	</form>
	</div>
	<div class="bottomB" style="text-align:right;color:white;font-size:larger;">Bharat Electronics Limited-</div>


</body>
</html>
