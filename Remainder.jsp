<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.text.*,java.io.*, java.time.*, java.time.temporal.ChronoUnit " %>

<%! // Declare methods outside scriptlet
    boolean checkDate(LocalDate localdate, LocalDate currentDate) {
	    boolean r;
        long daysDifference = ChronoUnit.DAYS.between(currentDate, localdate);
        // Check if the difference is exactly two days
        if(daysDifference <=2){
        	r=true;
        }
        else{
        	r=false;
        }
        return r;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
   <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(#fff, #c2def2);
/*            background:#e4f3ff;
           background-image:url('pic/rem-bg1.png');
           justify-content:flex-start;
           background-repeat:no-repeat;
           background-position:right center;
           display:flex;
           padding:0;           
            margin: 0; */
        }

        .header {
            background-color: #3498db;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .container {
            max-width: 1300px;
            margin: auto;
            padding-left: 50px;
            padding-right: 50px;
        }

        .navbar {
            display: flex;
            align-items: center;
            padding: 20px;
        }

        nav {
            flex: 1;
            text-align: right;
            margin-top: -30px;
        }

        nav ul {
            display: inline-block;
            list-style-type: none;
        }

        nav ul li {
            display: inline-block;
            margin-right: 20px;
            margin-top: -30px;
        }

        a {
            text-decoration: none;
            color: #555;
        }

        p {
            color: #555;
        }

        .row {
            display: flex; 
            /* height:70vh; */
            /* align-items: center; */
             flex-wrap: wrap; 
           /*  justify-content: space-around;
            display-direction:row;  */
        }

        .col-2 {
            flex-basis: 50%; 
            min-width: 350px; 
             display:flex; 
           flex-direction:row; 
           flex:1;
        }
        
        .bg {
             flex-basis: 50%; 
             min-width: 300px; 
            display:flex;
             flex-direction:column; 
            flex:1; 
        }

        .bg img {
            min-width: 120%;
            padding: 50px 80px;
            padding-left: 25px;
             margin-top: -150px;
             margin-left:-100px;
           /*  margin-bottom:70px; */
        }

    .card {
        position: relative;
        width: 260px;
        height: 180px;
        background: #f9cee7;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        font-weight: bold;
        border-radius: 15px;
        cursor: pointer;
        overflow: hidden; 
/*         margin:0 auto;
        padding: 20px; */
    margin-left:50px; 
        margin-top:50px; 
        
        
    }

    .card::before,
    .card::after {
        position: absolute;
        content: "";
        width: 20%;
        height: 20%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 25px;
        font-weight: bold;
        background-color: lightblue;
        transition: all 0.5s;
    }

    .card::before {
        top: 0;
        right: 0;
        border-radius: 0 15px 0 100%;
    }

    .card::after {
        bottom: 0;
        left: 0;
        border-radius: 0 100%  0 15px;
    }

    .card:hover::before,
    .card:hover:after {
        width: 100%;
        height: 100%;
        border-radius: 15px;
        transition: all 0.5s;
    }

    .task-details {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 80%; /* Adjust the width as needed */
        height: 80%; /* Adjust the height as needed */
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-size: 15px;
        /* font-weight: bold; */
        background-color: rgba(255, 255, 255, 0.8);
        visibility: hidden; /* Initially hidden */
        cursor: pointer;
        padding: 20px;
        box-sizing: border-box;
        text-align: center;
        color: #333;
        z-index: 1; /* Ensure it appears above the card */
        opacity: 0; /* Initially transparent */
        transition: opacity 0.5s;
    }

    .card:hover .task-details {
        visibility: visible; /* Show on hover */
        opacity: 1; /* Fade in on hover */
    }
    .b{
 
    margin-top:-30px;
 
    }
    </style>
</head>

<body>
                

<%
    
    try {
        System.out.println("hello");
        System.out.println(request.getParameter("user"));

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngpdb", "root", "");
        String sql = "SELECT duedate FROM task_list where name=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, request.getParameter("user"));
        ResultSet rs = stmt.executeQuery();
       // LocalDate localldate;
        //DataBase o=new DataBase(localldate);
        

        if (!rs.next()) {
            out.println("No records found");
        } else {
            do {
                java.sql.Timestamp timestamp = rs.getTimestamp("duedate");
                if (timestamp != null) {
                    java.util.Date duedate = new java.util.Date(timestamp.getTime());
                    LocalDate localdate = duedate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    System.out.println(localdate);

                    LocalDate currentDate = LocalDate.now();
                    System.out.println(currentDate);
                    //DataBase o=new DataBase(localdate);
                    boolean result = checkDate(localdate, currentDate);
                    System.out.println(result);
                    if(result){
                    	System.out.println("Hello");
                  
                    	 //Connection con = null;
                		 //System.out.println(hname);
                		try {
                			//Class.forName(dbDriver);  //class not found exception
                			//con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
                		 String sql1="select * from task_list where name='"+request.getParameter("user")+"'and duedate='"+localdate+"'";
                		 Statement s1 = con.createStatement();
                			
                		   	ResultSet rs1=s1.executeQuery(sql1);
                		   	while(rs1.next()) {
                		   		String hname=rs1.getString("name");
                		   		String taskname=rs1.getString("taskname");
                		   		String assignedto=rs1.getString("assignedto");
                		   		String status=rs1.getString("status");
                		   		java.util.Date duedate1=rs1.getDate("duedate");
                		   		
//                		   		System.out.println(hname);
                		   		System.out.println(taskname);
                		   		System.out.println(assignedto);
                		   		System.out.println(status);
                		   		System.out.println(duedate);
                		   		%>
                		   		
                		   		<%-- <h1><%= rs1.getString(2) %></h1>
                		   		<h1><%= rs1.getString(3) %></h1>
                		   		<h1><%= rs1.getString(4) %></h1>
                		   		<h1><%= rs1.getString(5) %></h1> --%>
                		   		
      <div class="container">
        <div class="row">
            <div class="col-2">
                <div class="card">
                    <%= rs1.getString(2) %>
                    <div class="task-details">
                        Task Name: <%= rs1.getString(2) %><br>
                        Assigned To: <%= rs1.getString(3) %><br>
                        Status: <%= rs1.getString(4) %><br>
                        Due Date: <%= rs1.getDate(5) %>
                    </div>
                </div>
            </div>		   		
                		   		
      
 
      		   		        		   		
                               		   		
                             <%
                		   	
                		   	}
                		   	
                		   	con.close();
                		} catch (Exception e) {
                			e.printStackTrace();
                		}
                    }
                }
            } while (rs.next());
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

 <div class="b">
<div>
  <img src="pic/rem-bg1.png">
</div>
</div> -
</div>
</div>

</body>
</html>
