<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
<%!ResultSet rs = null;%>

<html>
<form method="post" action="insert.jsp">
<table>
<tr>
<td>User Name:</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="pass"></td>
</tr>
<tr>
<td>Retype Password:</td>
<td><input type="password" name="repass"></td>
</tr>
<tr>
<td>
<tr>
<td>Role:</td>
<td><select name="ddrole" style="width: 110px">
<option>Admin</option> -->
<option>Editor</option> -->
</select></td>
</tr>

<tr>
<td>Date Input:</td>
<td><input type="text" name="date"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Save" name="btnSave"></td>
</tr>
</table>
</form>
</html>

<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
String repass = request.getParameter("repass");
String role = request.getParameter("ddrole");
String date = request.getParameter("date");

if (request.getParameter("btnSave") != null) {

try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://us-cdbr-iron-east-02.cleardb.net/ad_85078ed526cbf97", "bb928c0116e964", "56d7f0f8");
Statement st = con.createStatement();
int i = st
.executeUpdate("insert into admin(username,password,role,date) values('"
+ uname
+ "','"
+ pass
+ "','"
+ role
+ "','" + date + "')");
Statement s = con.createStatement();

rs.close();
st.close();
con.close();
}

catch (Exception e) {
System.out.print(e);
e.printStackTrace();
}
}

try {
Class.forName("com.mysql.jdbc.Driver");
Connection db = DriverManager.getConnection(
"jdbc:mysql://us-cdbr-iron-east-02.cleardb.net/ad_85078ed526cbf97", "bb928c0116e964", "56d7f0f8");
Statement s = db.createStatement();
rs = s.executeQuery("select * from admin");
%>
<table width="290" border="1" align="left">
<%
while (rs.next()) {
String id = rs.getString(1);
uname = rs.getString(2);
pass = rs.getString(2);
repass = rs.getString(4);
role = rs.getString(1);
date = rs.getString(1);
%>
<tr>
<td width="20"><%=rs.getInt(1)%></td>
<td width="20"><%=rs.getString(2)%></td>
<td width="20"><%=rs.getString(3)%></td>
<td width="20"><%=rs.getString(4)%></td>
<td width="40"><a href=" id=<%=rs.getString(1)%>&action=edit"></a>
<input type="submit" value="edit" name="btnedit"
onclick="getElementById('action').value ='<%=id%>'"></td>

<td width="40">Delete</td>
</tr>



<%
}

rs.close();
s.close();
db.close();
} catch (Exception e) {
//for now, just report the error to the system log
System.out.println(e.toString());

}
%>

</table> 
