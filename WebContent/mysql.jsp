<%@page import="java.util.ArrayList"%>
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

	String insertQuery = "INSERT INTO `living_being_database`.`person` (`id`, `firstname`, `middlename`, `lastname`, `city`, `Maritalstatus`, `language`, `condition`) VALUES (?,?,?,?,?,?,?,?)";
	
	preparedStatement = connection.prepareStatement(insertQuery);
	
	preparedStatement.setString(1, request.getParameter("id"));
	preparedStatement.setString(2, request.getParameter("firstname"));
	preparedStatement.setString(3, request.getParameter("middlename"));
	preparedStatement.setString(4, request.getParameter("lastname"));
	preparedStatement.setString(5, request.getParameter("cities"));
	preparedStatement.setString(6, request.getParameter("status"));

	String []langarr=request.getParameterValues("language");
	ArrayList<String> arrayList = new ArrayList<String>();
	for(String str: langarr) {
		arrayList.add(str);
	}	
	preparedStatement.setString(7, arrayList.toString());
	preparedStatement.setString(8, "Yes");
 	if (request.getParameter("terms")!=null) {
		preparedStatement.setString(8, "Yes");
	} else {
		preparedStatement.setString(8, "No");
	}
	 
	preparedStatement.execute();
	
    connection.close();

} catch (Exception e) {
	out.print(e);
	e.printStackTrace();
}

%>

<form action="showPersonData.jsp">
<input type="submit" value="Show Data">
</form>

<%--INSERT INTO `living_being_database`.`person` (`id`, `firstname`, `middlename`, `lastname`, `city`, `Maritalstatus`, `language`, `condition`) VALUES ('1', 'test', 'test', 'test', 'test', 'test', 'test', 'test');
--%>
</body>
</html>