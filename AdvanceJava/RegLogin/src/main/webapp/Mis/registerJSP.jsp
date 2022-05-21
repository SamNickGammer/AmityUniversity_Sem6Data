<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%	
String username = request.getParameter("txt");
String password = request.getParameter("pswd");
String email = request.getParameter("email");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","57489");

	Statement st = con.createStatement();
	st.executeUpdate(String.format("insert into UsersDB values('%s','%s','%s')",username,password,email));
	out.println("Reg Successfully");
%>
<a href="login.html">Return to Login</a>	
<%
}
catch(SQLException e){
	out.println("Reg Unsuccessfull: "+e.getMessage());
}
%>