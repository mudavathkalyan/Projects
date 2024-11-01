<%@page import="java.sql.*,java.util.*"%>
<%
int sno=Integer.parseInt(request.getParameter("sno"));
try
{
         Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject", "kalyan", "Kalyan.@123");
           Statement st=conn.createStatement();
           
		int i=st.executeUpdate("delete from bankupdate where sno="+sno);
          if(i>0)
           response.sendRedirect("managerpage.jsp");
           else
        out.println("<center><b>Error registering User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }  
    
 %>
