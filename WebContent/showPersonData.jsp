<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<body>

<%

Connection connection;
PreparedStatement preparedStatement;
ResultSet resultSet;
try {
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql:///living_being_database","root","Test@123");
	preparedStatement = connection.prepareStatement("select * from person");
	
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

}catch (Exception exception) {
	exception.printStackTrace();
}

%>

<form action="form1.html">
<input type="submit" value="Add More Person">
</form>


<form action="searchForm.jsp">
<input type="submit" value="Search Person By Id">
</form>

</body>
</html>