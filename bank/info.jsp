
<html>
<head>
	<title></title>
	<style>
		.maindiv
		{
			height:200px;
			width:300px;
    			background-color:rgba(227, 232, 233, 0.575);
    			margin-left:422px;
    			margin-top:111px;
    			padding:130px
		}
		body
		{
    			background-color:rgba(22, 22, 22, 0.747);
		}
	</style>	
</head>

	<body>
	<form name="form1" action="logincheck.jsp" method="post">
		<div class="maindiv">
		
			<br>		
			<br>
			<input type="digit" placeholder="Enter pin" id="pin" name="pin">
			<br>
			<br>
			<center><input type="submit" value="submit"><center>
			<br>
			<br>
		<%
		String msg=request.getParameter("msg");
		if(msg!=null)
		out.println("<center><font size=5 color=red>"+msg+"</font></center>");
		%>
		</div>
	</form>
		
	</body>
</html>
