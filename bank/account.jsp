<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	String driver="com.mysql.jdbc.Driver";
	try
	{
		Class.forName(driver);
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
	String acc_no=request.getParameter("accno");
	String pin_no=request.getParameter("pin");	
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
     
     int ac=Integer.parseInt(acc_no);
     
     String link1="checkbalance.jsp?accno=";
     String link2="withdraw.jsp?accno=";
     String link3="deposit.jsp?accno=";
     String link4="transfer.jsp?accno=";
     String msg;
%>

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
		.background
		{
			background:url("bg.jpg");
    			background-repeat:no-repeat;
    			background-size:cover;
    			height:400px;
			width:800px;	
			display: flex;
			margin:auto;
			border-radius:5%;	
		}
		.left
		{

			height:380px;
			display:inline-block;
			width:550px;
			background-color:rgba(112,122,131,0.2);
			padding-top:20px;
    		
		}
		.right
		{
		
			height:400px;
			width:250px;
			color:white;
			display:inline-block;
			background-color:rgba(112,122,131,0.2);
    		
		
		}
		a
		{
			text-decoration:none;
			font-size:25px;
			line-height:55px;
			background-color:rgba(222,222,231,0.3);
			margin-left:20px;
			width:100px;
			height:100px;
			padding:10px;
			border-radius:15%;
			margin-top:20px;
			color:white;	
		}
	</style>	
</head>

	<body>
	
		<div id=head>
		<h1>ATM</h1>
		</div>
		<div class="background">
		<div class="left">
		<%
		msg=request.getParameter("msg");
		if(msg!=null)
		out.println("<font size=5 color=white>"+msg+"</font>");
		%>
		</div>
		<div class="right">
				<a href='<%=link2+ac%>'>Withdraw</a><br>
				<a href='<%=link3+ac%>'>Deposit</a><br>
				<a href='<%=link1+ac%>'>CheckBalance</a><br>
				<a href='<%=link4+ac%>'>TransferAmount</a><br>
				<a href="#">Changepin</a><br>
				<a href="#">BACK</a>
		</div>
		</div>	
	</body>
</html>

