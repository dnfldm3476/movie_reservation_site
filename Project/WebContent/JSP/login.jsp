<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>

		<form name = form1 method=post action=login_controll.jsp>
		<table border=2 cellspacing="1" cellpadding="5">
		
			<tr>
				<td>ID</td>
				<td><input type=text size=10 name=username></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type=password size=11 name=password></td>
			</tr>
			<tr>
				<td><input type=submit value="로그인"/>
				<input type=reset value="초기화" /></td>
				</form>
				<form method=post action=join_member.jsp>
					<td><input type=submit value="회원가입" /></td>
				</form>
			</tr>
		</table>
	</div>
</body>
</html>