<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, movie.*"%>
<jsp:useBean id="movie_list" class="movie.movie_Beans" scope="page" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>상영 영화 리스트</h1>
		<hr>
		<table height="70%" width="90%">
			<tr>
				<th>타이틀</th>
				<th>관람가</th>
				<th>총 좌석 수</th>
				<th>상영기간</th>
				<th>예매</th>
			</tr>
			<%
				ArrayList<Movie> tmp = new ArrayList<Movie>();
				tmp = movie_list.getDBList();
				for (Movie i : tmp) {
			%>
			<form name=form1 method=get action="login.jsp">
			<tr align="center">
				<td>
					<%
						out.println(i.getId_film());
					%>
				</td>
				<td>
					<%
						out.println(i.getName_film());
					%>
				</td>
				<td>
					<%
						out.println(i.getAge_phase());
					%>
				</td>
				<td>
					<%
						out.println(i.getSeat_num());
					%>
				</td>
				<td>
					<%
						out.println(i.getDate());
					%>
				</td>
				<td><input style="border: none" type=submit value="선택" /></td>
				<td><input type=hidden name=favorite value=<%=i.getId_film()%> /></td>
			</tr>
			</form>

			<%
				}
			%>
		</table>


	</div>
</body>
</html>