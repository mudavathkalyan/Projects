
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

	String task=request.getParameter("tasks");
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
 	int mid;
     try 
    {
     mid = Integer.parseInt(request.getParameter("mid"));     
    }
	catch (NumberFormatException e) 
	{System.out.println("Invalid 'id' parameter: " + e.getMessage());}
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			int i=st.executeUpdate("insert into bankupdate (updates) values ('"+task+"')");
			if(i>0)
				{
				   response.sendRedirect("managerpage.jsp?mid="+request.getParameter("mid"));
				}
       		else
       		 out.println("<center><b>Error registering User. Try Again!</b></center>");
        }
	catch(Exception e)
	{
		out.println("hellook"+e.getMessage());
	}
%>
