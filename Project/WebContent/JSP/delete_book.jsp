<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList,customer.*, movie.*, movie_book.*, movie_seat.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete_book</title>
</head>
<%
	int id_resv = Integer.valueOf(request.getParameter("delete"));
	int movie_num = Integer.valueOf(session.getAttribute("movie_choice").toString());

	Customer user = (Customer) session.getAttribute("user");
	book_Beans book_bean = new book_Beans();
	seat_Beans seat_bean = new seat_Beans();
	
	movie_book book = book_bean.getDB(id_resv); // 좌석 수정
	int seat_num = book.getSeat_no();
	
	seat_bean.updateDB(movie_num, seat_num, 0); // 좌석 수정
	book_bean.deleteDB(id_resv); // 예약 취소
	response.sendRedirect("pay_cost.jsp");
%>
<body>

</body>
</html>