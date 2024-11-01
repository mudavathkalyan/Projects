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

	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
       
	int pinno=Integer.parseInt(request.getParameter("pin"));
     int accno = Integer.parseInt(session.getAttribute("customeraccno").toString());   
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
    			String sql = "SELECT * FROM bank WHERE pin='"+pinno+"' AND account_no='"+accno+"'";
			rs=st.executeQuery(sql);
			int i=0;
			while(rs.next())
			{
				i=1;
			}
			if(i==0)
			{
				response.sendRedirect("atmentry.jsp?msg='Invalid Credentials!<br>Try Again.'");
			}
			else
			{
			     session.setAttribute("customerpin",pinno);
				response.sendRedirect("atmview.jsp");
			}	
	con.close();
	}
	catch(Exception e)
	{
		out.println("hellokk"+e.getMessage());
	}
%>
