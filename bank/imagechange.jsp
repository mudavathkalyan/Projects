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
	int id=124;

	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    	div
    	{
    		margin:auto;
    	}
    </style>
    
</head>
<body>
    	<div>
    		<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			String sql="select * from manager where id="+id;
			rs=st.executeQuery(sql);
			int i=0;
			String img="";
			while(rs.next())
			{
				i=1;	
				img=rs.getString("image");	
			}
			if(i==0)
			{
				response.sendRedirect("imagechange.jsp?msg='Invalid Credentials!<br>Try Again.'");
			}
			else
			{   
				

				%>
				<image src=<%=img%> height:12px>
		    		
			   <%

			}
	
	con.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>

    	</div>
</body>
</html>
