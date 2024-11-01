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

	String mail=request.getParameter("email");
	String reason=request.getParameter("reason");
	
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
 	
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			int i=st.executeUpdate("insert into bankcontact values ('"+mail+"','"+reason+"')");
			if(i>0)
				{
				   response.sendRedirect("customerpage.jsp");
				}
       		else
       		 out.println("<center><b>Not send. Try Again!</b></center>");
        }
	catch(Exception e)
	{
		out.println("hello"+e.getMessage());
	}
%>
