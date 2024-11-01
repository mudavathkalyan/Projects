<%@page import="java.sql.*,java.util.*"%>
<%
    String mail1 = request.getParameter("mail");
    if (mail1 == null || mail1.trim().isEmpty()) {
        out.println("<center><b>Error: 'mail' parameter is missing or empty.</b></center>");
        return;
    }

    Connection conn = null;
    Statement st = null;

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject", "kalyan", "Kalyan.@123");
        st = conn.createStatement();
        String sql = "DELETE FROM bankcontact WHERE email='" + mail1 + "'";
        int i = st.executeUpdate(sql);

        if (i > 0) 
        {
            response.sendRedirect("managerpage.jsp");
        }
         else 
        {
            out.println("<center><b>Error: No record found with the provided email.</b></center>");
        }
    } 
    catch (Exception e) 
    {
        out.println("<center><b>Database Error: " + e.getMessage() + "</b></center>");
        e.printStackTrace();
    }
     finally
     {
        try 
        {
            if (st != null) st.close();
            if (conn != null) conn.close();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
%>

