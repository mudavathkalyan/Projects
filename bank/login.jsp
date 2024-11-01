
<html>
<head>
	<title></title>
	<style>
		body
		{
		
    			background-color:rgba(227, 232, 233, 0.575);
				scroll-behavior: smooth;

		}
		#head
		{	
			display:flex;
			justify-content:center;	
		}
		h1
		{
			border:2px solid black;
			letter-spacing:11px;
			padding:20px;
			border-radius:10%;
		}
		.maindiv
		{
			height:400px;
			width:600px;
    			background:url("bg.jpg");
    			background-repeat:no-repeat;
    			background-size:cover;
    			margin-left:300px;
    			padding-left:222px;
    			border:2px solid black;
    			border-radius:5%;
    			margin-top:20px;
		}
		input
		{
			height:50px;
			width:300px;
			font-size:22px;
			background-color:grey;
			border-radius:10px;
		}
		
	</style>	
</head>

	<body>
		<div id=head>
		<h1>ATM</h1>
		</div>
	<form name="form1" action="logincheck.jsp" method="post">
		<div class="maindiv">
		<br>
			<input type="text" placeholder="Enter AccountNo:" id="accno" name="accno">
			<br>
			<br>
			<input type="digit" placeholder="Enter pin" id="pin" name="pin">
			<br>
			<br>
			<input type="submit" value="login">
			<br>
			<br>
		<%
		String msg=request.getParameter("msg");
		if(msg!=null)
		out.println("<font size=5 color=black>"+msg+"</font>");
		%>
		</div>
	</form>
		
	</body>
</html>
