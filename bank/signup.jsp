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

	String name=request.getParameter("name");
	String password=request.getParameter("pass");
    String img=request.getParameter("img");
    
    Random ran=new Random();
    int bal=2000;

    int pin=ran.nextInt(1000);
    if(pin<10)
        pin+=1024;
    else if(pin<100)
        pin+=1000;

    int acc_no=ran.nextInt(100000);

    if(acc_no<=1000)
        acc_no+=23223;
    else 
        acc_no+=9999;
	Connection con=null;
	Statement st=null;
     ResultSet rs=null;
 	
%>
<%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			int i=st.executeUpdate("insert into bank(name,pin,balance,account_no,password,image) values('"+name+"','"+pin+"', '"+bal+"', '"+ acc_no+"','"+ password+"','"+ img+"')");
			if(i>0)
				{
				   response.sendRedirect("first.jsp");
				}
        }
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>
