<%@ page import="java.sql.*"%>
<%
	String username = request.getParameter("id");
	String password = request.getParameter("pwd");
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","57489");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(String.format("select password from users where emailid='%s'",username));
		while(rs.next()){
			out.println(rs.getString(1));
		}
	}
	catch(SQLException e){
		out.println("Reg Unsuccessfull: "+e.getMessage());
	}
%>