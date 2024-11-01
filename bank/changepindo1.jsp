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
	int accno = Integer.parseInt(session.getAttribute("customeraccno").toString());
	int opin=Integer.parseInt(request.getParameter("opin"));
	int npin=Integer.parseInt(request.getParameter("npin"));
%>
	<%
	try
	{
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			
			String sql1="update bank set pin='"+npin+"' where account_no='"+accno+"' ";
			int i = st.executeUpdate(sql1);
			if(i>0)
			{
				
				response.sendRedirect("atmview.jsp?msg='Pin changed Sucessfully:' ");
			}
			else
			{
				response.sendRedirect("atmview.jsp?msg='pin not changed' ");
			}
	con.close();
	}
	catch(Exception e)
	{
		out.println("hello"+e.getMessage());
	}
   %>
