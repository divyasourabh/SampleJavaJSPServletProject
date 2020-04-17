<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aa.Person"%>
<html>

<body>

<%
Person person = new Person();
person.firstName = request.getParameter("firstname");
person.middleName = request.getParameter("middlename");
person.lastName = request.getParameter("lastname");
person.cityName = request.getParameter("cities");
person.isMarried =  request.getParameter("status");

String []langarr=request.getParameterValues("language");
ArrayList<String> arrayList = new ArrayList<String>();
for(String str: langarr) {
	arrayList.add(str);
}

person.languageList.addAll(arrayList);

person.conditionAccepted = request.getParameter("terms")!=null;

//Get saved list from Session
List<Person> storePersonList = (List<Person>) session.getAttribute("personlist");
if (storePersonList == null) {
	storePersonList = new ArrayList<Person>();
}

storePersonList.add(person);

//Save updated list into Session
session.setAttribute("personlist",storePersonList);

out.println("Updated Size of Person List: " + storePersonList.size() + "<br> <br>");

out.println("<b>List of Persons: </b> <br><br>");

for (int i = 0 ; i< storePersonList.size(); i++) {
	Person pers = storePersonList.get(i);
	out.println("<b>Person Id:</b> " + i + "<br>");
	out.println("<b>FirstName:</b> " + pers.firstName + "<br>");
	out.println("<b>MIddleName:</b> " + pers.middleName + "<br>");
	out.println("<b>LastName:</b> " + pers.lastName + "<br>");
	out.println("<b>CityName:</b> " + pers.cityName + "<br>");
	ArrayList<String> langList = pers.languageList;
	out.println("<b>Language Known:</b> " + langList.toString() + "<br>");
	out.println("<b>Condition Accepted?:</b> " + pers.conditionAccepted + "<br>");
	out.println("<br>");
	out.println("<br>");
}

%>

</body>

</html>