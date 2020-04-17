package aa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchPersonAPI
 */
@WebServlet("/SearchPersonAPI")
public class SearchPersonAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchPersonAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getParameter("id"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//		doGet(request, response);
		Connection connection;
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		ResultSet resultSet1;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbPath = "jdbc:mysql:///living_being_database";
			String username = "root";
			String password = "Test@123";
			connection = DriverManager.getConnection(dbPath, username, password);
			preparedStatement = connection
					.prepareStatement("select * from person where firstname =\"" + request.getParameter("firstname") + "\"");

			resultSet = preparedStatement.executeQuery();
			resultSet1 = resultSet;

			response.setContentType("text/html");
//			PrintWriter printWriter = response.getWriter();
//			printWriter.println("Size : " + resultSet.getFetchSize());
//
//			while (resultSet.next()) {
//				printWriter.println("<b>Person Id:</b> " + resultSet.getString(1) + "<br>");
//				printWriter.println("<b>FirstName:</b> " + resultSet.getString(2) + "<br>");
//				printWriter.println("<b>MiddleName:</b> " + resultSet.getString(3) + "<br>");
//				printWriter.println("<b>LastName:</b> " + resultSet.getString(4) + "<br>");
//				printWriter.println("<b>Marital Status:</b> " + resultSet.getString(5) + "<br>");
//				printWriter.println("<b>CityName:</b> " + resultSet.getString(6) + "<br>");
//				printWriter.println("<b>Language Known:</b> " + resultSet.getString(7) + "<br>");
//				printWriter.println("<b>Condition Accepted?:</b> " + resultSet.getString(8) + "<br>");
//				printWriter.println("<br>");
//				printWriter.println("<br>");
//			}

			
				StringBuffer jsonBuffer = new StringBuffer();
				resultSet1 = preparedStatement.executeQuery();;
				while (resultSet1.next()) {
					String json = "{\n";
					json += "\"PersonId\": \"" + resultSet1.getString(1) + "\",\n";
					json += "\"FirstName\": \"" + resultSet1.getString(2)  + "\",\n";
					json += "\"MiddleName\": \"" + resultSet1.getString(3)  + "\",\n";
					json += "\"LastName\": \"" + resultSet1.getString(4) + "\",\n";
					json += "\"MaritalStatus\": \"" + resultSet1.getString(5)  + "\",\n";
					json += "\"CityName\": \"" + resultSet1.getString(6)  + "\",\n";
					json += "\"LanguageKnown\": \"" + resultSet1.getString(7) + "\",\n";
					json += "\"ConditionAccepted\": \"" + resultSet1.getString(8)  + "\"\n";
					json += "}";
					if (jsonBuffer != null && jsonBuffer.length()>0) {
						jsonBuffer.append(",");
						jsonBuffer.append(json);
					} else {
						jsonBuffer.append(json);
					}
					
				}
				if (jsonBuffer != null || jsonBuffer.length()>0) {
					response.getOutputStream().println(jsonBuffer.toString());
				} else {
					//That person wasn't found, so return an empty JSON object. We could also return an error.
					response.getOutputStream().println("{}");
				}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}

}
