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
	int depositamt=Integer.parseInt(request.getParameter("damt"));
%>

         <%                      
    		try
		   {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			String sql = "UPDATE bank SET balance =balance + "+depositamt+" WHERE account_no = " + accno;
			int i=st.executeUpdate(sql);
			if(i>0)
				{
					int b=bal+depositamt;
					session.setAttribute("balance",b);
				   response.sendRedirect("atmview.jsp?msg=Deposit sucessfully:");
				}
       		else
       		 out.println("<center><b>Error registering User. Try Again!</b></center>");
        }
	catch(Exception e)
	{
		out.println("hello"+e.getMessage());
	}
%>
                         
