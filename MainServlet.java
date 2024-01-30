
import java.time.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("MainServlet")
public class MainServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//User loggedInUser=(User) request.getSession().getAttribute("loggedInUser");

		
		
		String taskname=request.getParameter("taskname");
		String assignedto=request.getParameter("assignedto");
		String status=request.getParameter("status");
		
		String sduedate=request.getParameter("duedate");
		LocalDate duedate=LocalDate.parse(sduedate);
		String hname=request.getParameter("user");
//		System.out.println(hname);		
		
		int action=0;
		request.setAttribute("ta", taskname);
		request.setAttribute("as", assignedto);
		request.setAttribute("st", status);
		request.setAttribute("du", duedate);
		request.setAttribute("ac", action);

		DataBase o= new DataBase(hname,taskname,assignedto,status,duedate,action);
		if(o.addTask()) {
			request.setAttribute("username", hname);
			RequestDispatcher req=request.getRequestDispatcher("main.jsp");
			req.forward(request,response);
		}
		
//		o.showTask();
		
		RequestDispatcher req=request.getRequestDispatcher("main.jsp");
		req.forward(request,response);
		
		

		
		
		doGet(request, response);
	}

}
