<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*, movie_seat.*"%>
<jsp:useBean id="movie_list" class="movie.movie_Beans" scope="request" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add_film</title>
<%
	String movie_title = request.getParameter("movie_title");
	String movie_age = request.getParameter("movie_age");
	String movie_seat = request.getParameter("movie_seat");
	String movie_date = request.getParameter("movie_date");
	System.out.println(movie_title);
	System.out.println(movie_age);
	System.out.println(movie_seat);
	System.out.println(movie_date);

	
	Movie movie = new Movie();
	
	movie.setId_film(movie_list.getDBList().size() + 1);
	movie.setName_film(movie_title);
	movie.setSeat_num(Integer.parseInt(movie_seat));
	movie.setAge_phase(Integer.parseInt(movie_age));
	movie.setDate(movie_date);

	movie_list.insertDB(movie); // 영화 목록 추가
	
	movie_seat seat = new movie_seat();
	seat_Beans seat_bean = new seat_Beans();
	seat.setId_film(movie_list.getDBList().size());
	seat.setId_seat(movie_list.getDBList().size());
	seat.setS1(0);
	seat.setS2(0);
	seat.setS3(0);
	seat.setS4(0);
	seat.setS5(0);
	seat.setS6(0);
	seat.setS7(0);
	seat.setS8(0);				
	seat.setS9(0);		
	seat_bean.insertDB(seat); // 영화 좌석 추가
	
	response.sendRedirect("admin_list.jsp");
	
%>














</head>
<body>

</body>
</html>