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
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			String sql="select account_no from bank where account_no='"+acc_no+"' and pin='"+pin_no+"' ";
			rs=st.executeQuery(sql);
			int i=0;
			
			while(rs.next())
			{
				i=1;	
			}
			if(i==0)
			{
				response.sendRedirect("login.jsp?msg='Invalid Credentials!<br>Try Again.'");
			}
			else
			{   
				
			    response.sendRedirect("account.jsp?accno="+acc_no+"&pin="+pin_no);

			}
	
	con.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>
