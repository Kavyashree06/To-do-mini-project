import java.time.*;


import java.sql.*;
import java.util.Scanner;

public class DataBase {
	
	 static String dbUrl="jdbc:mysql://localhost:3306/ngpdb";
	 static String dbUname="root";
	 static String dbPassword="";
	 static String dbDriver="com.mysql.cj.jdbc.Driver";
	 
	 String name,number,email,gender,password,confirm_password;
	 String name1,password1;
	 String taskname,assignedto,status,hname;
	 LocalDate duedate,localdate;
	 int action;
	 
	 
	 DataBase(String name,String number,String email,String gender,String password,String confirm_password){
		 this.name=name;
		 this.number=number;
		 this.email=email;
		 this.gender=gender;
		 this.password=password;
		 this.confirm_password=confirm_password;
	 }
	 
	 DataBase(String name1,String password1){
		 this.name1=name1;
		 this.password1=password1;
	 }
	 
	 DataBase(String hname,String taskname,String assignedto,String status,LocalDate duedate,int action){
		 this.hname=hname;
		 this.taskname=taskname;
		 this.assignedto=assignedto;
		 this.status=status;
		 this.duedate=duedate;	 
		 this.action=action;
		
	 }
	 
	 
	 DataBase(String hname){
		 this.hname=hname;
	 }
	 
	 DataBase(LocalDate localdate){
		 this.localdate=localdate;
	 }
	 
	 DataBase(){
		 
	 }
	 
	 
	void validate() {

	    Connection con = null;
	    System.out.println(name);
   		try {
			Class.forName(dbDriver);  //class not found exception
			con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);   //sql Exception

			
			String sql = "insert into project_registration (name,number,email,gender,password,confirm_password)"
					+ "values('"+name+"','"+number+"','"+email+"','"+gender+"','"+password+"','"+confirm_password+"')";
 		    
			Statement s = con.createStatement();
			s.execute(sql);
		   	
		   	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	boolean login() {
		
		
		Connection con = null;
//		Scanner sc=new Scanner(System.in); 
   		try {
		Class.forName(dbDriver);  //class not found exception
		con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);  
		String sql="select * from project_registration where name='"+name1+"' and password='"+password1+"'" ;
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next())  
		   return true; 
	    else  {
		   return false; 
		}	
//		con.close(); 
		
		
   		}
   		catch (Exception e) {
			e.printStackTrace();
		}
   		return false;
		
	}
	
	
	boolean addTask() {
		
	    Connection con = null;
	   // System.out.println(taskname);
   		try {
			Class.forName(dbDriver);  //class not found exception
			con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);   //sql Exception

			
			String sql = "insert into task_list(name,taskname,assignedto,status,duedate,action)"
					+ "values('"+hname+"','"+taskname+"','"+assignedto+"','"+status+"','"+duedate+"','"+action+"')";
 		    
			Statement s = con.createStatement();
			s.execute(sql);
		   	
		   	con.close();
		   	return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	void showTask() {
		 Connection con = null;
		 //System.out.println(hname);
		try {
			Class.forName(dbDriver);  //class not found exception
			con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		 String sql="select * from task_list where name='"+hname+"'and duedate='"+localdate+"'";
		 Statement s = con.createStatement();
			
		   	ResultSet rs=s.executeQuery(sql);
		   	while(rs.next()) {
		   		String hname=rs.getString("name");
		   		String taskname=rs.getString("taskname");
		   		String assignedto=rs.getString("assignedto");
		   		String status=rs.getString("status");
		   		Date duedate=rs.getDate("duedate");
		   		
//		   		System.out.println(hname);
		   		System.out.println(taskname);
		   		System.out.println(assignedto);
		   		System.out.println(status);
		   		System.out.println(duedate);}
		   	
		   	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	void profile() {
		Connection con = null;
		 //System.out.println(hname);
		try {
			Class.forName(dbDriver);  //class not found exception
			con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		 String sql="select * from project_registration where name='"+hname+"'and duedate='"+localdate+"'";
		 Statement s = con.createStatement();
			
		   	ResultSet rs=s.executeQuery(sql);
		   	while(rs.next()) {
		   		String hname=rs.getString("name");
		   		String number=rs.getString("number");
		   		String email=rs.getString("email");
//		   		String status=rs.getString("status");
//		   		Date duedate=rs.getDate("duedate");
		   		
		   		System.out.println(hname);
		   		System.out.println(number);
		   		System.out.println(email);
//		   		System.out.println(status);
//		   		System.out.println(duedate);
		   		}
		   	
		   	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
