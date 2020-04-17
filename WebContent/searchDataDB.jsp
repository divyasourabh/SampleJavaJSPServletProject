<html>
<body>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.Connection"%>
<html>
<body>

	<%
		out.println("Search For Id= " + request.getParameter("id"));
	
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String dbPath = "jdbc:mysql:///living_being_database";
		String username = "root";
		String password = "Test@123";
		connection = DriverManager.getConnection(dbPath, username, password);
		preparedStatement = connection
		.prepareStatement("select * from person where id =\"" + request.getParameter("id") + "\"");

		resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			out.println("<b>Person Id:</b> " + resultSet.getString(1) + "<br>");
			out.println("<b>FirstName:</b> " + resultSet.getString(2) + "<br>");
			out.println("<b>MIddleName:</b> " + resultSet.getString(3) + "<br>");
			out.println("<b>LastName:</b> " + resultSet.getString(4) + "<br>");
			out.println("<b>Marital Status:</b> " + resultSet.getString(5) + "<br>");
			out.println("<b>CityName:</b> " + resultSet.getString(6) + "<br>");
			out.println("<b>Language Known:</b> " + resultSet.getString(7) + "<br>");
			out.println("<b>Condition Accepted?:</b> " + resultSet.getString(8) + "<br>");
			out.println("<br>");
			out.println("<br>");
		}

	} catch (Exception exception) {
		out.print(exception);
		exception.printStackTrace();
	}
	%>
</body>
</html>