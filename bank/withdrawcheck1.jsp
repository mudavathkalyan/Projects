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
	int withdraw=Integer.parseInt(request.getParameter("wamt"));
%>

         <%                      
    		try
		   {
		   	if(withdraw > bal)
		   	{
		   		
				response.sendRedirect("atmview.jsp?msg=Insufficient balance:");
				return ;	
		   	}

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			String sql = "UPDATE bank SET balance =balance - "+withdraw+" WHERE account_no = " + accno;
			int i=st.executeUpdate(sql);
			if(i>0)
				{
					int b=bal-withdraw;
					session.setAttribute("balance",b);
				   response.sendRedirect("atmview.jsp?msg=withdrawn sucessfully:");
				}
       		else
       		 out.println("<center><b>Error registering User. Try Again!</b></center>");
        }
	catch(Exception e)
	{
		out.println("hellook"+e.getMessage());
	}
%>
                          





 
