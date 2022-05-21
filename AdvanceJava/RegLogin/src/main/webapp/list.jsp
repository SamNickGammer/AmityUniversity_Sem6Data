<%@ page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%
String name = " ", uid = " ", add = "", pass = "";
Statement pst = null;
%>
<table border="2">
<tr>
<td>name</td>
<td>address</td>
<td>id</td>
<td>password</td>
</tr>
<%
try {
pst = conn.createStatement();
String a = request.getParameter("n1");
ResultSet rs = pst.executeQuery("Select * from user_details where muid='" + a + "'");
while (rs.next()) {
uid = rs.getString(1);
pass = rs.getString(2);
name = rs.getString(3);
add = rs.getString(4);
%>
<tr>
<td><%=name%></td>
<td><%=add%></td>
<td><%=uid%></td>
<td><%=pass%></td>
</tr>
<%
}
%>
</table>
<%
rs.close();
conn.close();
} catch (Exception e) {
}
%>