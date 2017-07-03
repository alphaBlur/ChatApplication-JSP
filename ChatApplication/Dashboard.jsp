<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>
<%@ page import= "java.io.IOException"
import ="java.io.PrintWriter"
import ="java.sql.Connection"
import ="java.sql.DriverManager"
import ="java.sql.ResultSet"
import ="java.sql.SQLException"
import ="java.sql.Statement"
 %>
<%
String un = request.getSession().getAttribute("savedUser").toString();

if(un == ""){
	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "login.jsp");
}
out.println("ChatApp-"+ un); 

%>
</title>

<style>
		.topB{
			height:30px;
			width:100%;
			background-color:blue;
		}
		.bottomB{
			height:30px;
			width:100%;
			background-color:blue;
			bottom:0;
			margin-top:40px;
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
		input {
		    height: 30px;
		    width: 120px;
		    margin: 10px 5px;
		    display: inline;
		    float: right;
		    background-color: mintcream;
		}
		#wlcm{
			display:inline;
			font-size: x-large;
		}
		table{
			width:1000px;
			margin: 60px auto;
			border-collapse:collapse;
			border: solid black 1px;
			text-align:center;
		}
		tr{
			border: solid black 1px;
			font-size:larger;
			
		}
		th{
			border: solid black 1px;
			height:60px;
			background-color: lightgoldenrodyellow;
		}
		td{
			border: solid black 1px;
			height:50px;
			background-color: whitesmoke;
		}
		#col1{
			width:80px;
		}
		#tags{
			float:right;
			height:50px;
		}
		#sender{
			display: inline;
			position: fixed;
			float: right;
			margin: 80px 20px;
			right: 0px;
		}
	</style>

</head>
<body>
<div style="">
<img src="ChatLogo.png" style="margin-left: 400px;">
<a href="login.jsp"><img style="float:right;height:50px;" src="exit.png" ></a>
</div>
<div class="topB"></div>
	<div style="background-color:lavender;height:50px;">
	<p id="wlcm"> Welcome <%=un%></p>
	<a href="NewMessage.jsp"><img id="sender" src="send.jpg"></a>
	<img src="all.png" id="tags" onclick="show(1)">
	<img src="sent.png" id="tags" onclick="show(2)">
	<img src="received.png" id="tags" onclick="show(3)">
	
	<!-- <a href="NewMessage.jsp"><input type="button" id="newMesg" value="Send Message"></a>
	<input type="button" id="all" value="All Messages" onclick="show(1)">
	<input type="button" id="sent" value="Sent Message" onclick="show(2)">
	<input type="button" id="received" value="Recived Message" onclick="show(3)"> -->
	<hr>
	<hr>
	</div>
	<table id="t1">
		<tr>
			<th id="col1">From</th>
    		<th>To</th>
			<th>Message</th>
			<th>Time</th>
		</tr>
		<% 
		try{
		String url = "jdbc:mysql://localhost:3306/ChatApp";
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(url,"root","dotapro");
		
		Statement s = c.createStatement();
		String q1 = "select * from mlog;";
		
		ResultSet res = s.executeQuery(q1);
		while(res.next())
			res.next();
		
		while(res.previous()){
			if(res.getString(1).equals(un)){
			%>
				<tr style="color:green">
				<td><%=res.getString(1)%></td>
				<td><%=res.getString(2)%></td>
				<td><%=res.getString(3)%></td>
				<td><%=res.getString(4)%></td>
				</tr>
			<%
			}
			else if(res.getString(2).equals(un)){
				%>
					<tr style="color:red">
					<td><%=res.getString(1)%></td>
					<td><%=res.getString(2)%></td>
					<td><%=res.getString(3)%></td>
					<td><%=res.getString(4)%></td>
					</tr>
				<%
			}
		}
				
		
		}
		catch( ClassNotFoundException e){
			
		}
		catch( SQLException e){
			
		}
		%>
	</table>
	
	<table id="t2" style="display:none;">
		<tr>
			<th id="col1">From</th>
    		<th>To</th>
			<th>Message</th>
			<th>Time</th>
		</tr>
		<% 
		try{
		String url = "jdbc:mysql://localhost:3306/ChatApp";
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(url,"root","dotapro");
		
		Statement s = c.createStatement();
		String q1 = "select * from mlog;";
		
		ResultSet res = s.executeQuery(q1);
		while(res.next())
			res.next();
		
		while(res.previous()){
			if(res.getString(2).equals(un)){
				%>
					<tr style="color:red">
					<td><%=res.getString(1)%></td>
					<td><%=res.getString(2)%></td>
					<td><%=res.getString(3)%></td>
					<td><%=res.getString(4)%></td>
					</tr>
				<%
			}
		}
				
		
		}
		catch( ClassNotFoundException e){
			
		}
		catch( SQLException e){
			
		}
		%>
	</table>
	
	
	<table id="t3" style="display:none;">
		<tr>
			<th id="col1">From</th>
    		<th>To</th>
			<th>Message</th>
			<th>Time</th>
		</tr>
		<% 
		try{
		String url = "jdbc:mysql://localhost:3306/ChatApp";
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(url,"root","dotapro");
		
		Statement s = c.createStatement();
		String q1 = "select * from mlog;";
		
		ResultSet res = s.executeQuery(q1);
		while(res.next())
			res.next();
		
		while(res.previous()){
			if(res.getString(1).equals(un)){
			%>
				<tr style="color:green">
				<td><%=res.getString(1)%></td>
				<td><%=res.getString(2)%></td>
				<td><%=res.getString(3)%></td>
				<td><%=res.getString(4)%></td>
				</tr>
			<%
			}
		}
				
		
		}
		catch( ClassNotFoundException e){
			
		}
		catch( SQLException e){
			
		}
		%>
	</table>
	<div class="bottomB"></div>


</body>
<script>
function show(a){
		if(a == 1){
			document.getElementById("t1").style.display= "table";
			document.getElementById("t2").style.display= "none";
			document.getElementById("t3").style.display= "none";
		}
		if(a == 2){
			document.getElementById("t1").style.display= "none";
			document.getElementById("t2").style.display= "table";
			document.getElementById("t3").style.display= "none";
		}
		if(a == 3){
			document.getElementById("t1").style.display= "none";
			document.getElementById("t2").style.display= "none";
			document.getElementById("t3").style.display= "table";
		}
		
}
</script>
</html>