<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%try{
PreparedStatement pst=conn.prepareStatement("insert into user_details values(?,?,?,?,?)");
pst.setString(1,request.getParameter("n1"));
pst.setString(2,request.getParameter("n2"));
pst.setString(3,request.getParameter("n3"));
pst.setString(4,request.getParameter("n4"));
pst.setString(5,request.getParameter("n6"));
int t=pst.executeUpdate();
if(t>0)
out.println("<h1>register successfully");
conn.close();
}catch(Exception e){out.println("<h1>register unsuccessfully");}
%>
</body>
</html>