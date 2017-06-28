<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String un = request.getSession().getAttribute("savedUser").toString();
	if(un == ""){
		response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ChatApp</title>

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
			bottom:0px;
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
		}
		#wlcm{
			display:inline;
			font-size: x-large;
		}
		table{
			width:1000px;
			height:450px;
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
		form{
			margin:20px;
			padding:20px;
			border: 2px solid black;
		}
	</style> 
</head>
<body>
<div style="">
<h1 style="float: center;display:inline;">Message</h1>
<img src="ChatLogo.png" style="margin-left: 400px;">
</div>
<div class="topB"></div>
<div>
	<form action="SendServ" method="post">
		To:
		<select style="margin:10px;height:40px;width:220px;display:inline;" id="to" name="to">
<%@ page import= "java.io.IOException"
import ="java.io.PrintWriter"
import ="java.sql.Connection"
import ="java.sql.DriverManager"
import ="java.sql.ResultSet"
import ="java.sql.SQLException"
import ="java.sql.Statement"
 %>
		<%
		try {
			String url = "jdbc:mysql://localhost:3306/ChatApp";
			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection( url , "root" , "dotapro");
			Statement s = c.createStatement();
			
			String q1 = "select * from auth;";
			ResultSet res = s.executeQuery(q1);
			while(res.next()){
				if(!res.getString(2).toString().equals(un)){
					%>
					<option onclick="getMessages()"><%=res.getString(2)%></option>
					<%
				}
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		%>	
		</select><br/>
		<table id="tt">
		<tr><td>Message</td><td>Time</td></tr>
		</table>
		Message:<br><textarea id="ta" onkeydown="check()" name="message" style="margin:10px auto;height:40px;width:500px"></textarea><br/>
		<input type="submit" value="Send">
	</form>
</div>
<div class="bottomB"></div>

</body>
<script type="text/javascript" src="jquery-1.11.2.min.js"></script>
<script>
function check(){
	if(document.getElementById("ta").value.length >200){
		alert("Maximum message length is 200");
	}
}
function getMessages(){
	<%	
	try {
		String url = "jdbc:mysql://localhost:3306/ChatApp";
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection( url , "root" , "dotapro");
		Statement s = c.createStatement();
		String q2 = "Select * from mlog;";
		ResultSet res2 = s.executeQuery(q2);
		while(res2.next()){
			if(res2.getString(2).toString().equals(un)){
	%>
		var row = $('<tr style="color:red;" />');
		var col = $('<td style="text-align:left;" />');
		col.append('<%=res2.getString(3).toString()%>');
		row.append(col);
		col = $('<td/>');
		col.append('<%=res2.getString(4).toString()%>');
		row.append(col);
		$('#tt').append(row);
	<%
			}
			else if(res2.getString(1).toString().equals(un)){
	%>
		var row = $('<tr style="color:green;" />');
		var col = $('<td style="text-align:right;" />');
		col.append('<%=res2.getString(3).toString()%>');
		row.append(col);
		col = $('<td />');
		col.append('<%=res2.getString(4).toString()%>');
		row.append(col);
		$('#tt').append(row);
	<%
			}
		
		}
	}
	catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
}
</script>
</html>