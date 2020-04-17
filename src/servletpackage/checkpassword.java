package servletpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkpassword
 */
@WebServlet("/checkpassword")
public class checkpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkpassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if ("divya".equalsIgnoreCase(username) && "sourabh".equalsIgnoreCase(password)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login");
			dispatcher.forward(request, response);
		} else {
			try {
				PrintWriter printWriter = response.getWriter();
				printWriter.print("<h1>Incorrect Credential<h1>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("requestdispatcherExample.jsp");
				dispatcher.include(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("IOException");
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				System.out.println("ServletException");
				e.printStackTrace();
			}
		}
	}

}
