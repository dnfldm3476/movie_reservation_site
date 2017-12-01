<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList,customer.*, movie.*, movie_book.*, movie_seat.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%

	Customer user = (Customer) session.getAttribute("user");
	int pay_movie = (Integer) session.getAttribute("pay_movie");
	
	book_Beans book_bean = new book_Beans();
	movie_book book = new movie_book();
	
	book.setId_film(pay_movie);
	book.setId_mem(user.getId_mem());
	
	book_bean.updateDB(book); // ok로 수정
	response.sendRedirect("pay_cost.jsp");

%>
<body>

</body>
</html>