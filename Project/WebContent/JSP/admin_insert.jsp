<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_list</title>
</head>
<body>
	<h2>
	<a href="admin_list.jsp">Movie List</a>  
	<a href="admin_member.jsp">  Member management</a></h2>
	<div align="center">
		<h1>Insert film</h1>
		<form name = form1 method = get action = "add_film.jsp">
		<table height="50%" width="50%">
			<tr>
				<td style="border: none">Title</td>
				<td><input type=text size=10 name=movie_title></td>
			</tr>
			<tr>
				<td style="border: none">Age</td>
				<td><input type=text size=10 name=movie_age></td>
			</tr>
			<tr>
				<td style="border: none">Total seat</td>
				<td><input type=text size=10 name=movie_seat></td>
			</tr>
			<tr>
				<td style="border: none">Date</td>
				<td><input type=text size=10 name=movie_date></td>
			</tr>
			<tr>
				<td><input type=submit value="Submit"></td>
				<td><input type=reset value="Reset"></td>
			</tr>
			
		</table>
		</form>


	</div>

</body>
</html>