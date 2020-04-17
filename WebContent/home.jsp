<%@ page import="aa.Student"%>
<%@ page import = "java.util.*" %>

<html>
<body>
<h1>Hello World</h1>


<%

Date date = new Date();
out.println(date);
%>

<%
class Employee {
	String id;
	String salary;
	
	public Employee(String id, String salary) {
		this.id = id;
		this.salary = salary;
	}
	
 void display(String id, String salary){
	 System.out.println("Id= " + id + "  " + "Salary = " + salary);
 }
}
%>

<h1>Object Creation</h1>

<%
Employee employee = new Employee("11","10000");
employee.display("11","11");

out.println(employee.salary);
%>

<br>
<br>

<%

out.println("Name : " + aa.Student.displayName());
%>
</body>
</html>