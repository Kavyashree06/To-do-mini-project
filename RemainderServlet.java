import java.time.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RemainderServlet
 */
public class RemainderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemainderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hello");
		String dbUrl = "jdbc:mysql://localhost:3306/ngpdb";
        String dbUname = "root";
        String dbPassword = "";
        String dbDriver="com.mysql.cj.jdbc.Driver";
        Connection con=null;
        try  {
    		Class.forName(dbDriver);  //class not found exception
    		con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);  
            String sql = "SELECT  entryId,taskname,duedate FROM task_list ";
            try (PreparedStatement statement = con.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int taskId = resultSet.getInt("entryId");
                    String task = resultSet.getString("taskname");
                    Date dueDate = resultSet.getTimestamp("duedate");
                    LocalDate localdate= dueDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                    // Print or process the due date tasks
                    System.out.println("Task ID: " + taskId + ", Description: " + task + ", Due Date: " + localdate);

                    // Implement notification mechanism here (e.g., send email, push notification)
//                    setReminder(new Task(description, dueDate));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		doGet(request, response);
	}

}
