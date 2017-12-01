<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>card_paye</title>
</head>
<body>
	<div align="center">
		<h1>카드 결제</h1>
		<table>
			<tr>
				<td>카드 번호</td>
				<td><input type = text size = 20 value = card_num></td>
			</tr>
			<tr>
				<td>유효 날짜</td>
				<td></td>
			</tr>
			<tr>
				<td>cvc번호</td>
				<td><input type = password size = 3 name = password></td>
			</tr>
			<tr>
				<td>
					<form name=form1 method=get action="pay_cost_controll.jsp">
						<input type=submit value="결제">
					</form>
				</td>
				<td>
					<form name=form1 method=get action="pay_cost.jsp">
						<input type=submit value="취소">
					</form>
				</td>
			</tr>

		</table>

	</div>
</body>
</html>