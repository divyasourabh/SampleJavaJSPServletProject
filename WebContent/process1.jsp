<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aa.Person"%>
<%@page import="com.sun.javadoc.Parameter"%>
<html>
<body>

<br>
FirstName: <b><%= request.getParameter("firstname") %></b>
<br>
MiddleName: <b>${param.middlename}</b>

<%--<%=request.getParameter("middlename")%> --%>

<br>
LastName: <b><%= request.getParameter("lastname") %></b>
<br>
Lives in: <b> ${param.cities}</b>
<br>
Matrial Status: <b> ${param.status}</b>
<br>
He Knows: 
<b>
<%
String []arr=request.getParameterValues("language");

if (arr != null) {
	for(String str: arr) {
		out.println("" + str + ",  ");
	}
}

%>
</b>
<br>
<br>
Terms and Conditions
<b>
<%
boolean flag = request.getParameter("terms") != null;
if (flag == true) 
	out.println("Accepted");
else 
	out.println("Not Accepted");
	%>
</b>
	
<br>
<br>

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
	out.println("" + str + ",  ");
	arrayList.add(str);
}

person.languageList.addAll(arrayList);

person.conditionAccepted = request.getParameter("terms")!=null;

List<Person> storePersonList = (List<Person>) session.getAttribute("personlist");
if (storePersonList == null) {
	storePersonList = new ArrayList<Person>();
}

out.println("Size of store person List Before: " + storePersonList.size());

for (int i = 0 ; i< storePersonList.size(); i++) {
	Person pers = storePersonList.get(i);
	out.println("FirstName: " + pers.firstName);
	out.println("MIddleName: " + pers.middleName);
	out.println("LastName: " + pers.lastName);
	out.println("CityName: " + pers.cityName);
	ArrayList<String> langList = pers.languageList;
	out.println("Language Known: " + langList.toString());
	out.println("Condition: " + pers.conditionAccepted);
}

storePersonList.add(person);

session.setAttribute("personlist",storePersonList);

List<Person> storePersonList1 = (List<Person>) session.getAttribute("personlist");
if (storePersonList1 == null) {
	storePersonList1 = new ArrayList<Person>();
}

out.println("Size of store person List After: " + storePersonList1.size());

%>

<form action="form.html">
Click to add more persons:
<input type="submit" value="Add More">
</form>
<br>
</body>
</html>