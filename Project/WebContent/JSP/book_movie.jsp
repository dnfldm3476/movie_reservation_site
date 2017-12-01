<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, movie_seat.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book_movie</title>
</head>
<body>
<a href="pay_cost.jsp">결제 화면</a>  

	<div align="center">
		<h1>영화 예매 화면</h1>
		<form name=form1 method=get action=book_controll.jsp>
			<table height="70%" width="90%">
				<tr>
					<th>좌석 번호</th>
					<th>좌석 현황</th>
					<th>에매</th>
				</tr>
				<tr>
					<%
					int movie_num = Integer.valueOf(session.getAttribute("movie_choice").toString());					seat_Beans seat_list = new seat_Beans();
					movie_seat seat = seat_list.getDB(movie_num);
				
					for (int i = 0; i < 9; i++) {						
					%>
					
					<form name=form1 method=get action="book_controll.jsp">
			<tr align="center">
				<td>
					<%
						out.println(i + 1);
					%>
				</td>
				<td>
					<%
						if (seat.seat[i] == 0)
							out.println("예약 가능");
						else
							out.println("예약 불가");
					%>
				</td>
				<%  if (seat.seat[i] == 0) { %>
				<td><input style="border: none" type=submit value="선택" /></td>
				<td><input type=hidden name=favorite value=<%=i + 1%> /></td>
				<% } 
				else {
				%>
				<td> 예약 불가 </td>
				<% } %>
			</tr>
			</form>
					
					<% } %>
					</div>
</body>
</html>