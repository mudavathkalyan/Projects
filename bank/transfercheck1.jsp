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
	int bal = Integer.parseInt(session.getAttribute("balance").toString());
	int tamt=Integer.parseInt(request.getParameter("tamt"));
	int tacc=Integer.parseInt(request.getParameter("acc"));
%>
	<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			if(bal<tamt)
			{
				response.sendRedirect("atmview.jsp?msg=Insuffient balance<br>Transfer not possible..");
				return;
			}
			else if(tacc==accno)
			{
				response.sendRedirect("atmview.jsp?msg=You cannot transfer yourself..");
				return;
			}
			String sql1="update bank set balance=balance - '"+tamt+"' where account_no='"+accno+"' ";
			String sql2="update bank set balance=balance + '"+tamt+"' where account_no='"+tacc+"' ";
			
			int i = st.executeUpdate(sql1);
			int j = st.executeUpdate(sql2);
			if(i>0 && j>0)
			{
				session.setAttribute("balance",bal-tamt);
				response.sendRedirect("atmview.jsp?msg=Money Transfered Sucessfully.. ");
			}
			else
			{
				response.sendRedirect("atmview.jsp?msg=Money Transfer UnSucessfully.. ");
			}
	con.close();
	}
	catch(Exception e)
	{
		out.println("hello"+e.getMessage());
	}
   %>
