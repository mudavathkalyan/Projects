<%@page import="java.util.*"%>
<%@page import ="java.sql.*"%>
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
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null; 
     String acc_no = request.getParameter("accno");
    
     int ac = Integer.parseInt(acc_no);
     String link1="checkbalance.jsp?accno=";
     String link2="withdraw.jsp?accno=";
     String link3="deposit.jsp?accno=";
     String link4="transfer.jsp?accno=";
     String link5="changepin.jsp?accno=";
     String link6="login.jsp";
%>

<!DOCTYPE html>
<html>
<head>
    <title>ATM Interface</title>
    <style>
        body 
        {
            background-color: rgba(227, 232, 233, 0.575);
            scroll-behavior: smooth;

        }

        #head 
        {
            display: flex;
            justify-content: center;
        }

        h1 
        {
            border: 2px solid black;
            letter-spacing: 11px;
            padding: 20px;
            border-radius: 10%;
        }

        .background 
        {
            background: url("bg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 400px;
            width: 800px;
            display: flex;
            margin: auto;
            border-radius: 5%;
        }

        .left 
        {
            height: 380px;
            display: inline-block;
            width: 450px;
            background-color: rgba(112, 122, 131, 0.2);
            padding-top: 20px;
            font-size: 33px;
            padding-left: 40px;
            color: white;
            line-height: 80px;
        }

        .right 
        {
            height: 400px;
            width: 350px;
            color: white;
            display: inline-block;
            background-color: rgba(112, 122, 131, 0.2);
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

        input 
        {
            width: 252px;
            height: 40px;
            font-size: 18px;
            margin-top: 65px;
        }

        #error 
        {
            color: red;
            font-weight: bold;
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
    try 
    {
        String bal = request.getParameter("balance");
        String depo = request.getParameter("deposit");

        double b = Double.parseDouble(bal);
        double d = Double.parseDouble(depo);

      
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject", "kalyan", "Kalyan.@123");

        stmt = con.createStatement();

        // Prepare SQL statement to update the balance
        String sql = "UPDATE bank SET balance = balance + " + d + " WHERE account_no = " + ac;
        int rowsUpdated = stmt.executeUpdate(sql);

        // Check if the update was successful
        if (rowsUpdated > 0)
         {
            out.println("<div>Deposit of Rs. " + d + " successful. New balance is " + (b + d) + ".</div>");
        } 
        else 
        {
           out.println("update failed.");
        }
     con.close();   
    } 
    catch (Exception e) 
    {
        out.println(e.getMessage());
    }
%>
    </div>
    <div class="right">
	   <a href='<%=link2+ac%>'>Withdraw</a><br>
        <a href='<%=link3+ac%>'>Deposit</a><br>
        <a href='<%=link1+ac%>'>Check Balance</a><br>
        <a href='<%=link4+ac%>'>Transfer Amount</a><br>
        <a href='<%=link5+ac%>'>Change PIN</a><br>
        <a href="<%=link6%>">Back</a>
    </div>
</div>


