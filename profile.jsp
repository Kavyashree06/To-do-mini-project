<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: radial-gradient(#fff, #bbbbfe);
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

    .container {
        max-width: 1300px;
        margin: auto;
        padding-left: 50px;
        padding-right: 50px;
    }

    .row {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .col-2 {
        flex-basis: 50%;
        min-width: 300px;
    }

    .col-2 img {
        max-width: 100%;
        padding: 50px 0;
        padding-left: 25px;
    }

    .login-container {
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        height: 350px;
        width: 300px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-left:100px;
    }

    .im {
        border-radius: 40%;
        margin-top:60px;
       
    }

    .ip2 {
        margin-bottom: 176px;
    }
    .ip2 h2{
    margin-bottom:40px;
    }

    .title {
        font-size: 40px;
        font-weight: bold;
        color: #1b1b1b;
        margin-top: -100px;
        font-family: Verdana, Geneva, sans-serif;
    }

    .quote {
        font-style: italic;
        color: #3e2723;
        font-size: 16px;
        margin-bottom: 50px;
        font-family: 'Caveat', cursive;
    }
    .logo{
    font-size: 150%;
    font-family: lucidia handwriting;
    font-style: italic;
    font-weight: bolder;
    color: #7E38B7;
    margin-left:250px;
}
</style>
</head>
<body>

<% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngpdb", "root", "");
        
        String sql = "SELECT * FROM project_registration where name= '" + request.getAttribute("username") + "'";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        if (!rs.next()) {
            out.println("No records found");
        } else {
    %>

    <div class="title">To Do List</div>
    <div class="quote">"Remember to Remember"</div>
    <div class="logo">
                    <i>
                    <h1 style="display: inline-block;">Profile</h1>
                </i>                    
                </div>

    <div class="container">
        <div class="row">
            <div class="col-2">
                <div class="login-container">
                    <div class="ip">
                        <img class="im"
                            src="https://www.careerguide.com/career/wp-content/uploads/2022/03/21-avatar-outline.gif" width="150px" height="250px">
                           
                    </div>
                    <div class="ip2">
                        <h2><%= rs.getString(1) %></h2>
                        <!-- Add your content here -->
                        <p><%= rs.getString(2)%></p>
                        <p><%= rs.getString(3)%></p>
                    </div>
                </div>
            </div>
    <%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
    <div class="col-2">
        <img src="pic/prof1r.png">
    </div>
    </div>
    </div>

</body>
</html>
