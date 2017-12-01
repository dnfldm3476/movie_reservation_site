<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,customer.*, movie.*, movie_book.*, movie_seat.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book_controll</title>
<%
	

	Customer user = (Customer) session.getAttribute("user");
	int seat_num = Integer.valueOf(request.getParameter("favorite"));
	int movie_num = Integer.valueOf(session.getAttribute("movie_choice").toString());
	
	movie_Beans movie_bean = new movie_Beans(); // 영화정보 DB
	Movie movie = movie_bean.getDB(movie_num); // 예매할 영화 정보
	
	seat_Beans seat_list = new seat_Beans(); // 좌석 DB
	
	book_Beans book_bean = new book_Beans(); // 예약 DB
	movie_book book = new movie_book();
	for (movie_book i : book_bean.getAllDBList()) {
		System.out.println(movie_num);
		System.out.println(user.getId_mem());
		System.out.println(seat_num);
		if (i.getId_film() == movie_num && i.getId_mem() == user.getId_mem() && i.getSeat_no() == seat_num)
		{
			out.println("<script type='text/javascript'>alert('someone booking');history.back();</script>");
			return;
		}
	}
		
	book.setDate(movie.getDate()); 
	book.setFilm_name(movie.getName_film());
	book.setId_mem(user.getId_mem());
	book.setId_film(movie.getId_film());
	book.setId_resv(book_bean.getAllDBList().size() + 1);
	book.setResv_date("222"); // 오늘날짜
	book.setSeat_no(seat_num);
	book.setStatus(" - ");

	seat_list.updateDB(movie.getId_film(), seat_num, 1); // db 수정
	book_bean.insertDB(book);
	
	response.sendRedirect("pay_cost.jsp");
%>








</head>
<body>

</body>
</html>