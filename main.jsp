<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List App</title>
     <style>
   
         .sidebar {

   height: 100%;

   width: 200px; 

   position: fixed;

   z-index: 1;

   top: 0;

   left: 0;

  /*  background-color: #F1EAFF/ */* #111 */; /* Dark background color */
   /* background-color: #D4E7C5; */
  /*  background-color:#E3F4F4; */
   background-color:#F3EEEA;
   padding-top: 20px;

    width: 20%;

    /* background-color: #d7aefb; */

}
.sidebar h2{
     padding: 15px;
     border-bottom:2px solid #34495e;
  }



.sidebar a {

   padding: 16px;

   text-decoration: none;

   font-size: 18px;

   color: #427D9D/* #164863 *//* #5D3587  *//* #818181 */;

   display: block;
   border-bottom:1px solid #34495e;

}



.sidebar a:hover {

   color: #A367B1;

}

          
     
body {
    font-family: 'Arial', sans-serif;
    /* background: #F1EAFF; */
    background:#F8F6F4;
   /*  background:#D2E9E9; */
    /* background: linear-gradient(to right top, #ffffff, #f0f0f5);  */
    /* background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9NY737k9xupGY1wyBSqEfFLGv9b2WCcG7w292t5PHiPLavK9ocVvJvP6XEb-0Ih_dCVw&usqp=CAU'); /* Adjust the URL as needed */ */
    background-repeat: no-repeat;
    background-size: cover; /* or 'contain' depending on your preference */
    margin-left: 30px;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
}

        h1 {

            color: #3498db; /* Blue */
            margin-bottom: 20px;

        }

        .welcome-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .addTaskBtn {

            background-color: #e67e22; /* Carrot Orange */
            color: #fff;
            border: none;
            padding: 15px 40px; /* Larger size */
            font-size: 18px; /* Larger font size */
            cursor: pointer;
            border-radius: 8px;
            margin-bottom: 20px;
            align-self: flex-end; 
            margin-left: 900px;
            margin-top: 20px;

        }

       .modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    width: 300px; /* Adjust the width as needed */
}

.modal-content label {
    display: block;
    margin-bottom: 10px;
}

.modal-content input,
.modal-content select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.modal-content button {
    background-color: #66a5ad;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
}

.modal-content button:last-child {
    background-color: #f1a2b5; 
}

/* .modal-content button:hover {
    background-color: #217dbb; /* Darker Blue on hover */
} */


.modal-content {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.modal-content button,
.modal-content select {
    transition: background-color 0.3s ease;
}
    
       table {

            width: 60%;
            padding: 20px;
            margin-left: 30px;
            margin: 20px auto; 
            border-collapse: collapse;
            background-color:  #fff; /* White */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-left:300px;

        }

        th, td {

            padding: 10px;
            padding-right: 20px;
            width: 25%;
            text-align: left;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;

        }

        th {
            padding: 15px;
            width:25%;
            background-color:#427D9D;/* #164863; *//* #64CCC5;  *//* #6096B4; *//* C4DFDF; *//* #3498db; */ /* Blue */
            color: #fff;

        }

        tr:hover {

            background-color: #E3F4F4; /* #f5f5f5; */

        }


        body, html {

  width: 100%;

  height: 100%;

  margin: 0;

  padding: 0;

  /* background: #5CA4EA; */

  overflow: hidden;

  font-family: 'Lato', sans-serif;

}



.container {

  width: 200px;

  height: 60px;

  position: fixed;

  /* left: 50%; */

  top: 20px;
  right:20px;

  /* transform: translate(-50%, -50%); */

  display: flex;

  justify-content:flex-end;

  align-items: center;

}



.center {

  width: 150px;

  height: 60px;

  position: absolute;

}



.btn {

  width: 150px;

  height: 60px;

  cursor: pointer;

  /* background: transparent; */
  background:#4F95DA;

  border: 1px solid #91C9FF;

  outline: none;

  transition: 1s ease-in-out;

  

}



svg {

  position: absolute;

  left: 0;

  top: 0;

  fill: none;

  stroke: #38419D;/* #fff; */

  stroke-dasharray: 120 480;

  stroke-dashoffset: 120;

  transition: 1s ease-in-out;

}



.btn:hover {

  transition: 1s ease-in-out;

  background: transparent;

}



.btn:hover svg {

  stroke-dashoffset: -480;

}



.btn span {

  color: white;

  font-size: 18px;

  font-weight: 100;

}

.deletebtn {
    background-color: #3887BE;/* #9BBEC8; *//* #86B6F6; *//* #176B87; */ /* #92C7CF; */ /* Set your desired background color */
    color: #fff; /* Set text color to white or any contrasting color */
    padding: 8px 16px; /* Adjust padding as needed */
    border: none; /* Remove border if not needed */
    border-radius: 5px; /* Add rounded corners if desired */
    cursor: pointer; /* Add cursor pointer for interaction */
    transition: background-color 0.3s ease; /* Smooth transition on hover */
}

.deletebtn:hover {
    background-color: #4F95DA; /* Set the background color on hover */
}




</style>   
</head>

<body>
<div class="sidebar">
      <h2>Menu</h2>

      <a href="ProfileServlet?user=<%= request.getAttribute("username") %>">Profile</a>

      <a href="Remainder.jsp?user=<%= request.getAttribute("username") %>">Remainder</a>

      <a href="#">Calendar</a>

      <a href="SignOutServlet">Sign Out</a> <!-- Assuming SignOutServlet handles sign-out logic -->

   </div>







<div class="welcome-container">
        <h1>Welcome <%=request.getAttribute("username") %>!</h1>
    </div>

<div class="container">

    <div class="center">

      <button class="btn" onclick="showAddTaskModal()">

        <svg width="180px" height="60px" viewBox="0 0 180 60" class="border">

          <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />

          <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />

        </svg>

        <span>ADD</span>

      </button>

    </div>

  </div>





<!-- <button class="addTaskBtn" onclick="showAddTaskModal()">Add Task</button> -->

<%-- <form method="post" action="ProfileServlet?user=<%= request.getAttribute("username") %>">
 <input type="hidden" name="hname" value="<%= request.getAttribute("username") %>">
<button type="submit">Profile</button>
</form> --%>


<form method="post" action="MainServlet?user=<%= request.getAttribute("username") %>" >
<div id="taskModal" class="modal">

    <div class="modal-content">

        <label for="taskName">Task:</label>

        <input type="text" id="taskName" name="taskname" required>

        <br>

        <label for="assignedTo">Assigned To:</label>

        <input type="text" id="assignedTo" name="assignedto" required>

        <br>

        <label for="status">Status:</label>
        <select name="status">
        <option value="InProgress">InProgress
        <option value="Completed">Completed
        </select>
        

        <br>

        <label for="dueDate">Due Date:</label>

        <input type="date" id="dueDate" name="duedate" required>

        <br>
        <%-- <input type="hidden" name="hname" value="<%= request.getAttribute("username") %>"> --%>	

        <button type="submit">Add Task</button>
        
        <button onclick="closeTaskModal()">Cancel</button>
       
    </div>

</div>
</form>



    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngpdb", "root", "");
        String sql = "SELECT * FROM task_list where name= '" + request.getAttribute("username") + "'";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        if (!rs.next()) {
            out.println("No records found");
        } else {
    %>

<table>

    <thead>

        <tr>

            <th>Task</th>

            <th>Assigned To</th>

            <th>Status</th>

            <th>Due Date</th>

            <th>Action</th>

        </tr>

    </thead>
    <%
    do{
    	
    %>   

    <tbody>

        <tr>

            <td><%= rs.getString(2) %></td>

            <td><%= rs.getString(3) %></td>

            <td><%= rs.getString(4) %></td>

            <td><%= rs.getDate(5) %></td>

            <td>
              <form action="DeleteServlet" method="post" >
               <input type="hidden" id="Username" name="Username" value="<%= request.getAttribute("username") %>">
               <input type="hidden" name="entryId" value="<%= rs.getString(7) %>" />
               <button type="submit" class="deletebtn">Delete</button>
               </form>
       
            </td>

        </tr>       
    </tbody>
    <%
        }while(rs.next());%>

</table>
<%
        }
        con.close();
    }catch (Exception e){
    	e.printStackTrace();
    }
    
%>





<script>

    function showAddTaskModal() {
    	

        document.getElementById('taskModal').style.display = 'flex'; 
       

    }



    function closeTaskModal() {

        document.getElementById('taskModal').style.display = 'none';

    }



/*     function addTask() {

        // Implement logic to add a new task to the table

        alert("Implement your add task functionality here!");

        closeTaskModal();

    } */

</script>



</body>

</html>
