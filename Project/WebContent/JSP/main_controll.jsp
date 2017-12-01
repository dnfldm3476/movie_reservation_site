<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*, movie_seat.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main_controll</title>
</head>
<%
	session.setAttribute("movie_choice", request.getParameter("favorite"));

	int movie_num = Integer.valueOf(session.getAttribute("movie_choice").toString());
	movie_Beans movie_bean = new movie_Beans();
	seat_Beans seat_bean = new seat_Beans();
	movie_seat seat = seat_bean.getDB(movie_num);
	int cnt = 0;
	for (int k = 0; k < 9; k++) {
		if (seat.seat[k] == 1) {
			cnt ++;
		}
	}
	if (cnt == 9) { // 다시 main으로 이동 영화선택 모든 좌석 꽉참
		System.out.println("cnt !!!" + cnt);
		out.println("<script type='text/javascript'>alert('no seat in this movie');history.back();</script>");
		//response.sendRedirect("main.jsp");
		return;
	}
	Customer user = (Customer) session.getAttribute("user");
	if (user != null) {
		if (user.getAge_mem() < movie_bean.getDB(movie_num).getAge_phase()) { // 나이가 더 적으면 경고
			out.println("<script type='text/javascript'>alert('no seat in this movie');history.back();</script>");
			return;
		}
		response.sendRedirect("book_movie.jsp");
		return;
	}
	response.sendRedirect("login.jsp");
%>




<body>

</body>
</html>