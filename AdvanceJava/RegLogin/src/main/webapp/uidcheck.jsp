<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Id check</title>
</head>
<body>
<%
String a=new String();
String b=new String();
Statement pst1=null;
ResultSet rs1=null;
String muid1="";
try{
PreparedStatement pst=conn.prepareStatement("select * from user_details where muid=? ");
String uid=request.getParameter("text1");
pst.setString(1,uid);
ResultSet rs=pst.executeQuery();
if(rs.next()){
out.println("<h1>Hi, "+rs.getString(3));
a=rs.getString(1);
b=request.getParameter("text2");
rs.close();
pst1=conn.createStatement();
rs1=pst1.executeQuery("select muid, mpass from user_details where muid='"+a+"'");
if(rs1.next()){
if(b.equals(rs1.getString("mpass")))
{
out.println("<br></h1><h2>Want to edit your profile?<br></h2>");
muid1=rs1.getString("muid");
session.setAttribute("muidd",muid1);%>
<a href=edit.html>Click here</a>
<% }
else {%>
<h1>Please enter correct password.</h1>
<h2><br><a href="login.html">Retry</a></h2>
<%
}}}
else{
%>
<h1>You're not registered!!!</h1>
<h2><a href="register.html">Register</a></h2>
<%}
}catch(Exception e){out.println("error in database connectivity occured");}%>
</body>
</html>