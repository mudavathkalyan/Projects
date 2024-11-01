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
	int accno=Integer.parseInt(request.getParameter("accno"));
	String pass=request.getParameter("pass");
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;     
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
    			String sql = "SELECT * FROM bank WHERE account_no="+accno+" AND password= '"+pass+"'";
			rs=st.executeQuery(sql);
			int i=0;
			while(rs.next())
			{
				i=1;
			}
			if(i==0)
			{
				response.sendRedirect("customerinput.jsp?msg=Invalid Credentials!<br>");
			}
			else
			{
			     session.setAttribute("customeraccno",accno);
     			session.setAttribute("customerpassword",pass);
    
				response.sendRedirect("customerpage.jsp");
			}
	con.close();
	}
	catch(Exception e)
	{
		out.println("hellokk"+e.getMessage());
	}
%>
