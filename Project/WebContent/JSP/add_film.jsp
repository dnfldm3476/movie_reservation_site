<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*"%>
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
	
	Movie movie = new Movie();
	
	movie.setId_film(movie_list.getDBList().size() + 1);
	movie.setName_film(movie_title);
	movie.setSeat_num(Integer.parseInt(movie_seat));
	movie.setAge_phase(Integer.parseInt(movie_age));
	movie.setDate(movie_date);
	
	movie_list.insertDB(movie);
	
	response.sendRedirect("admin_list.jsp");
	
%>














</head>
<body>

</body>
</html>