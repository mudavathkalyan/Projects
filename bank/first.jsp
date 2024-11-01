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
     session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * 
        {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }
       
        nav 
        {
            height: 100px;
            /* background-color: #9ba1a18a; */
            background-color: #285480e7;
            width: 100%;
        }
        nav ul 
        {
            line-height: 100px;
            display: flex;
            justify-content: end;
            list-style-type: none;
        }
        nav ul a 
        {
            color: black;
            text-decoration: none;
            margin-right: 50px;
            text-align: center;
            font-size: 22px;
        }
        nav ul a:hover 
        {
            text-decoration: underline;
            
        }
        nav li i 
        {
            color: white;
            margin-right: 5px;
            font-size: 22px;
        }
        nav li:first-child 
        {
            margin-right: auto;
            color: black;
        }
        .bankname 
        {
            font-size: 45px;
            margin-left: 12px;
            line-height: 100px;
        }
        #one 
        {
            display: none;
        }
        .sidebar 
        {
            background-color: #2b537c85;
            position: fixed;
            top: 0;
            right: 0;
            z-index: 99;
            height:700px;
            width: 250px;
            display: none;
            flex-direction: column;
            align-items: start;
            justify-content: flex-start;
            backdrop-filter: blur(100px);
        }
        .sidebar li 
        {
            margin-left: 20px;
            font-size: 25px;
            color: white;
            font-weight: bolder;
        }
        .sidebar li i 
        {
            margin-left: 60px;
        }
        @media (max-width: 890px) 
        {
            .hide 
            {
                display: none;
            }
            #one 
            {
                display: block;
            }
        }
        .cardscontainer 
        {
            background-size: 100%;
            background-repeat: no-repeat;
            background-color:rgba(211, 205, 206, 0.39);
            padding-top:50px;
            padding-bottom:20px;
            display: flex;
            flex-wrap: wrap;
            justify-content:space-around;
        }
       .card 
        {
            width:390px;
            padding:0 30px;
            text-align: center;
            margin:20px;
            display:flex;
            flex-direction: column;
        }
        .card:hover 
        {
            background-color: rgba(134, 134, 133, 0.274);
            outline-style: solid;
            outline-width: 1px;
            outline-offset: 2px;
            outline-color: white;
        }
        .card img
        {
            margin-top:20px;
            max-width: 100%;
        }
        .cardContent 
        {
            text-align: center;
        }
        .cardContent button 
        {
            font-size: 16px;
            padding: 12px;
            margin-top: 8px;
        }
        #msg 
        {
            background-color:#36628fda;
            padding-top: 20px;
            font-size: 17px;
            padding-bottom: 10px;
        }
        .imgcontainer 
        {
            padding: 2rem;
        }
        .slide img:hover
        {
		  border:2px solid grey;
        }
        .sliderwrapper 
        {
            position: relative;
            max-width: 48rem;
            margin: 0 auto;
        }
        .slide 
        {
            display: flex;
            aspect-ratio: 16 / 9;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
            scroll-behavior: smooth;
            box-shadow: 0.1rem 3rem -0.7rem hsla(0, 0%, 0.25);
            border-radius: 0.5rem;
        }
        .slide img 
        {
            flex: 1 0 100%;
            scroll-snap-align: start;
            object-fit: cover;
        }
        .slidenav 
        {
            display: flex;
            column-gap: 1rem;
            position: absolute;
            bottom: 1.25rem;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
        }
        .slidenav a 
        {
            width: 0.5rem;
            height: 0.5rem;
            border-radius: 50%;
            background-color: #fff;
            opacity: 0.75;
            transition: opacity ease 250ms;
        }
        .slidenav a:hover 
        {
            opacity: 1;
        }
        .updates
        {
            background-color:pink;
            padding-top:20px;
            padding-bottom:50px;
        }
        .updates h2
        {
            text-align: center;
        }
        /* update box. */
        .updatebox
        {
           background:linear-gradient(80deg,#fe00948e,#ff8521de);
           text-align: center;
           width:80%;
           margin: auto;
           border-radius:20px;
           padding-bottom:30px;
           margin-top:20px;
        }
        .updatebox #tasks
        {
            height:45px;
            width:500px;
            font-size:18px;
            margin-right:20px;
            border-radius:15px;
            padding-left:20px;
            margin-top:30px;
            margin-bottom:30px;
            border:1.5px solid rgb(99, 96, 96);
        }
        .updatebox #addbtn
        {
            height:45px;
            width:90px;
            font-size:20px; 
            border-radius:30px;
            border:1.5px solid rgb(99, 96, 96);
            cursor: pointer;
        }
        h1
        {
            text-align: center;
            margin-top:30px;
        }
        .unorder li
        {
            list-style-type:none;
            background-color:rgba(148, 40, 40, 0.158);
            height:40px;
            padding-top:10px;
            border-radius:20px;
            cursor: pointer;  
            width:90%; 
            margin: auto;
            margin-top:4px;
            text-align: left;
            padding-left:40px;   
            display:flex;
            justify-content:space-between;    
            position: relative;
        }
        .unorder li::before
        {
            height:22px;
            width:22PX;
            position: absolute;
            content:'';
            background-image:url(star.png);
            background-size:cover;
            left:10px;
            
        }
        li span
        {
            font-size:25px;
            position: absolute;
            width:40px;
            text-align: center;
            right:15px;
            bottom:5px;  
        }
        li span:hover
        {
            background-color:rgba(128, 128, 128, 0.452);
            border-radius:20px;
        }
        .contact
        {
            margin-bottom:40px;
            text-align: center;
        }
        .contact h3
        {
            margin-top:30px;
            text-align: center;
            margin-bottom:30px;
        }
        .contact input[type=text],input[type=email]
        {
            height:2.8rem;
            font-size:18px;
            text-align: center;
            margin: 10px;
            width:20vw;
        }
        .contact input[type="button"],input[type=reset]
        {
            margin:10px;
            height:50px;
            width:10vw;
            font-size:16px;
        }
        .contactform
        {
            border:2px solid rgb(128, 26, 26);
            width:50%;
            margin:auto;
            background-color:rgba(233, 229, 229, 0.671);
        }
        @media (max-width: 430px) 
        {
            .contactform
            {
                width:100%;

            }
        .contact input[type=text],input[type=email]
        {
            height:2.8rem;
            font-size:18px;
            text-align: center;
            margin: 10px;
            width:80vw;
        }
        .contact input[type="button"],input[type=reset]
        {
            margin:10px;
            height:50px;
            width:60px;
            font-size:16px;
        }
        }
        
        /* fotter styling */
        .footer 
        {
            background-color: #2c3e50;
            color: white;
            padding: 30px 0;
            text-align: center;
        }
        .footer .links, .footer .social, .footer .contactimg 
        {
            margin-bottom: 20px;
        }
        .footer .links a, .footer .contactimg a 
        {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer .links a:hover, .footer .contactimg a:hover 
        {
            text-decoration: underline;
        }
        .footer .social a 
        {
            color: white;
            margin: 0 10px;
        }
        .footer .social a:hover 
        {
            color: #3498db;
        }
        .footer .legal 
        {
            font-size: 14px;
        }
        .legal p a
        {
            color:white;
            text-decoration: none;
        }
        
        /* login related*/
        .loginAsk
        {
            position:relative;
            display: none;
        }
        .loginTake
        {
            /* display:none; */
            height:36vh;
            width:28%;
            border:2px solid rgb(158, 149, 149);
            text-align: center;
            position: absolute;
            left:71.7vw;
            z-index: 1;
            border-radius:20px;
            background-color:#53789fea;
        }
        .loginTake h3
        {
            margin-top:10px;
            margin-bottom:10px;
        }
        .loginTake a button
        {
           height:6.9vh;
           width:20vw;
           font-size:15px;
           margin:14px;
        }
        #del
        {
        cursor: pointer;
        position: absolute;
        top: 16px;
        right: 28px;
        height: 56px;
        font-weight:900px; 
        transition:all 4s linear;
        }
       
    </style>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script lang="javascript">
        function f1() 
        {
            let v1 = document.querySelector(".sidebar");
            v1.style.display = "flex";
        }
        function f2() 
        {
            let v1 = document.querySelector(".sidebar");
            v1.style.display = "black";
        }
        //for login page visible


        function loginshow()
        {
            let loginask=document.querySelector('.loginAsk');
           if(loginask.style.display=="block")
           {
                loginask.style.display="none";
           }
           else
           {
                loginask.style.display="block"
           }
        }
        function closeLogin() 
        {

        document.querySelector('.loginAsk').style.display = 'none';
       }
        
    </script>
</head>
<body>
    <nav>
        <ul>
            <li class="bankname">MK Bank</li>
            <li class="hide"><a href="#home">Home</a></li>
            <li class="hide"><a href="#contact">Contact us</a></li>
            <li class="hide"><a href="#loansall">Loans</a></li>
            <li class="hide"><a href="#updates">Updates</a></li>
            <li class="hide"><a href="#" id="loginvisible" onclick="loginshow()">Login</a></li>
            <li id="one" onclick="f1()"><i class="fa-solid fa-bars"></i></li>
        </ul>

        <ul class="sidebar">
            <li>MK Bank<i class="fa-sharp fa-solid fa-x" onclick="f2()"></i></li>
            <li><a href="#home">Home</a></li>
            <li><a href="#contact">Contact us</a></li>
            <li><a href="loansall">Loans</a></li>
            <li><a href="#updates">Updates</a></li>
            <li><a href="#" id="loginvisible">Login</a></li>
        </ul>
    </nav>
    
    <div id="msg">
        <marquee>
            Important Notice: Charges for Loan Accounts | Dear MK bank Customer, please register your email ID in your account to enjoy uninterrupted Internet Banking services. Login to IB page -> Option tab -> My profile -> Update Email | For CVC Integrity Pledge - Click Here | NOTICE TO CUSTOMERS: As per RBI guidelines, all Re-KYC/Periodic KYC due customers are requested to contact your home/nearest branch along with the latest KYC documents and update your due KYC. If you have already updated your latest KYC with the bank, please ignore this communication...
        </marquee>
    </div>
    <hr>
        <!-- <section class="loginAsk">
            <div class="loginTake">
                <h3>Login</h3>
                <a href="managerinput.jsp"><button>Login as Manager</button></a><br>
                <a href="customerinput.jsp"><button>Login as Customer</button></a>
            </div>
        </section> -->
        <section class="loginAsk">
            <div class="loginTake">
                <h3>Login</h3>
                <!-- <button class="closeBtn" onclick="closeLogin()">Close</button> -->
                <i class="fa-solid fa-xmark" id="del" onclick="closeLogin()"  style="cursor: pointer;" ></i>
                <a href="managerinput.jsp"><button>Login as Manager</button></a><br>
                <a href="customerinput.jsp"><button>Login as Customer</button></a><br>
                <!-- Close Button -->
            </div>
        </section>
    

    <section class="imgcontainer" id="home">
        <div class="sliderwrapper">
            <div class="slide">
                <img id="slide1" src="OnlineSavingAC.jpg" alt="Bank image 1">
                <img id="slide1" src="gold_loan_updated.jpg" alt="Bank image 1">
                <img id="slide2" src="stay-vigilant-english-banner.png" alt="Home image">
                <img id="slide1" src="banner5.jpg" alt="Bank image 1">
                <img id="slide1" src="KISAN_updated.jpg" alt="Bank image 1">
                <img id="slide1" src="Nationwide_awareness_poster.jpg" alt="Bank image 1">
            </div>
            <div class="slidenav">
                <a href="#slide1"></a>
                <a href="#slide2"></a>
            </div>
        </div>
    </section>
    
    <div class="cardscontainer" id="loansall">
        <div class="card">
            <img src="home.jpg" height="220px" alt="Card image 1">
            <div class="cardContent">
                <h3>Home Loan</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum.</p>
                <button><a href="https://www.bankofbaroda.in/personal-banking/loans/home-loan" target="_blank" >Know More</a></button>
            </div>
        </div>
        <div class="card">
            <img src="Gold Loan.jpeg" height="240px" alt="Card image 2">
            <div class="cardContent">
                <h3>Gold Loan</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum.</p>
                <button><a href="https://www.bankofbaroda.in/personal-banking/loans/gold-loan" target="_blank">Know More</a></button>
            </div>
        </div>
        <div class="card">
            <img src="Vehicleloan.jpg" height="220px" alt="Card image 3" title="loan">
            <div class="cardContent">
                <h3>Vechile Loan</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum.</p>
                <button><a href="https://www.bankofbaroda.in/personal-banking/loans/vehicle-loan" target="_blank">Know More</a></button>
            </div>
        </div>
    </div>

    <div class="updates" id="updates">
       <h2>Latest updates</h2>
       <div class="updatebox">
      
     <%
	try
	{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Myproject","kalyan","Kalyan.@123");
			st=con.createStatement();
			String sql="select * from bankupdate"; 
			
			rs=st.executeQuery(sql);
			int i=0;
			while(rs.next())
			{
				%>
				<ul class="unorder"><br>
					<li id="alllist"><%=rs.getString("updates")%></li>&nbsp
				</ul>
			<%
			}
	con.close();
	}
	catch(Exception e)
	{
		out.println("hello"+e.getMessage());
	}
%>
      </div>
    </div>
    <section  class="contact" id="contact">
        <h3>Dear customer's please note that we are here to help you 24/7 ,let us know your issues..</h3>
        <div class="contactform" onclick="alert('First do login please...')">
            <form>
            <input type="email" placeholder="Enter your mail id:"><br>
            <input type="text" placeholder="Enter the Reason of your contact.">
            <br>
            <input type="button"value="Submit">
            <input type="reset" value="Reset">
            </form>
        </div>
    </section>
    
    <footer class="footer">
        <div class="links">
            <a href="#home">Home</a>
            <a href="#">About Us</a>
            <a href="#">Services</a>
            <a href="#">Loans</a>
            <a href="#contact">Contact Us</a>
            <a href="#">FAQ</a>
        </div>
        <div class="contactimg">
            <p><strong>Contact Us:</strong> 800-123-456789 || <a href="mailto:mkbank@gmail.com">mkbank@gmail.com</a></p>
        </div>
        <div class="social">
            <a href="https://www.facebook.com/mkbank" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.twitter.com/mkbank" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://www.linkedin.com/company/mkbank" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.instagram.com/mkbank" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
        <div class="legal">
            <p>&copy; 2024 MK Bank. All rights reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

</body>
</html>

