<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie_book.*, movie.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pay_cost</title>
</head>
<body>
	<a href="main.jsp"> main으로 이동</a>

	<div align="center">
		<h1>예매 영화 리스트  </h1>
		<hr>
		<table height="70%" width="90%">
			<tr>
				<th>타이틀</th>
				<th>상영기간</th>
				<th>예약일</th>
				<th>좌석번호</th>
				<th>예약 상황</th>
				<th colspan = 2>결제 및 취소</th>
			</tr>
			<%
				ArrayList<movie_book> book_list = new ArrayList<movie_book>();
				Customer customer = (Customer) session.getAttribute("user");

				book_Beans book_bean = new book_Beans();
				book_list = book_bean.getDBList(customer.getId_mem());
				for (movie_book i : book_list) {
			%>
			<tr align="center">
				<td>
					<%
						out.println(i.getFilm_name());
					%>
				</td>
				<td>
					<%
						out.println(i.getDate());
					%>
				</td>
				<td>
					<%
						out.println(i.getResv_date());
					%>
				</td>
				<td>
					<%
						out.println(i.getSeat_no());
					%>
				</td>
				<td>
					<%
						out.println(i.getStatus());
					%>
				</td>
				<form name=form1 method=get action="pay_middle.jsp">
					<td><input style="border:none;height:34px;width:120px;background-color:blue;color:white;" type=submit value="결제" />
					<input type=hidden name=choice value=<%=i.getId_film()%> /></td>
				</form>
				<form name=form1 method=get action="delete_book.jsp">
					>
					<td><input style="border:none;height:34px;width:120px;background-color:blue;color:white;" type=submit value="예매내역 삭제" />
					<input type=hidden name=delete value=<%=i.getId_resv()%> /></td>
				</form>
			</tr>

			<%
				}
			%>
		</table>


	</div>
</body>
</html>