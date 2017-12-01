<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,customer.*, movie.*, movie_book.*, movie_seat.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_customer</title>
</head>
<body>
	<div align="center">
		<h1>회원가입</h1>
		<form name=form1 method=get action=modify_controll.jsp>
			<table>
				<tr>
					<td>ID</td>
					<td><input type=text size=10 disabled ='disabled' value = "<%=((Customer)session.getAttribute("user")).getName_mem() %>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type=password size=11 name=password></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type=password size=11 name=password_2></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type=age size=10 name=age></td>
				</tr>
				<tr>
					<td><input type=submit value="승인" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>