<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*"%>
<jsp:useBean id="customer" class="customer.customer_Beans" scope="page" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><a href="admin_list.jsp">Back</a> Member management
	
	</h2>
	<div align="center">
		<h1>관리자 모드 회원목록 화면</h1>
		<hr>
		<table height="70%" width="90%">
					<tr>
				<th>ID</th>
				<th>Age</th>
				<th>Registration date</th>
				<th>Operation</th>
			</tr>
			<%
				ArrayList<Customer> tmp = new ArrayList<Customer>();
				tmp = customer.getDBList();
				for (Customer i : tmp) {
					if (i.getName_mem().equals("admin"))
						continue;
			%>
			<form name=form1 method=get action="admin_delete_member.jsp">
			<tr align = "center">
			
				<td><%out.println(i.getName_mem()); %> </td>
				<td><%out.println(i.getAge_mem()); %></td>
				<td><%out.println(i.getRegister_date()); %></td>
				<td><input style="border:none" type = "submit" value ="Remove" /></td>
				<td><input type=hidden name=delete value=<%=i.getId_mem()%> /></td>
			</tr>
			</form>
			<%
				}
			%>
		</table>

	</div>
</body>
</html>