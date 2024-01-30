

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * Servlet implementation class DemoServlet
 */
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemoServlet() {
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
		String name=request.getParameter("name");
//		response.getWriter().append(name);
		String number=request.getParameter("number");
//		response.getWriter().append(number);
		String email=request.getParameter("email");
//		response.getWriter().append(email);
		String gender=request.getParameter("gender");
		String password=request.getParameter("password");
//		response.getWriter().append(password);
		String confirm_password=request.getParameter("confirm_password");
//		response.getWriter().append(confirm_password);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

				
		
		doGet(request, response);
		DataBase o=new DataBase(name,number,email,gender,password,confirm_password);
		o.validate();
		
		request.setAttribute("username", name);
		RequestDispatcher req=request.getRequestDispatcher("Register.html");
		req.forward(request,response);
	}

}
