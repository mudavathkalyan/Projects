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
	int uid=Integer.parseInt(request.getParameter("mid"));
	String upass=request.getParameter("mpass");
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;     
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
    			String sql = "SELECT * FROM manager WHERE id="+uid+" AND password='"+upass+"'";
			rs=st.executeQuery(sql);
			int i=0;
			while(rs.next())
			{
				i=1;
			}
			if(i==0)
			{
				response.sendRedirect("managerinput.jsp?msg='Invalid Credentials!<br>Try Again.'");
			}
			else
			{
			     session.setAttribute("managerid",uid);
     			session.setAttribute("managerpass",upass);

				response.sendRedirect("managerpage.jsp");
			}	
	con.close();
	}
	catch(Exception e)
	{
		out.println("hellokk"+e.getMessage());
	}
%>
