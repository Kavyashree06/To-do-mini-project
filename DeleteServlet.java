import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class DeleteEntryServlet
 */
public class DeleteServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // JDBC database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/ngpdb";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

            // Get entry ID from the form 
            int entryId = Integer.parseInt(request.getParameter("entryId"));
            String Username=request.getParameter("Username");
             // System.out.print(entryId);
            // SQL query to delete entry by ID
            String deleteQuery = "DELETE FROM task_list WHERE entryId = '" + entryId + "'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {


                // Execute the update statement
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Entry deleted successfully.");
                    request.setAttribute("username", Username);
                    RequestDispatcher req = request.getRequestDispatcher("main.jsp");
                    req.forward(request, response);
                } else {
                    out.println("Entry not found or could not be deleted.");
                }
            }

            // Close the connection
            connection.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
