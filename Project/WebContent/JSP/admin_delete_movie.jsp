<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, customer.*, movie.*, movie_seat.*, movie_book.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_delete_movie</title>
</head>
<%
	String del_id = request.getParameter("delete");
	System.out.println(del_id);

	book_Beans book_bean = new book_Beans();
	movie_Beans movie_bean = new movie_Beans();
	seat_Beans seat_bean = new seat_Beans();
	// 예매 삭제

	book_bean.deleteDB_idfilm(Integer.parseInt(del_id));
	movie_bean.deleteDB(Integer.parseInt(del_id)); // 영화 삭제
	seat_bean.deleteDB(Integer.parseInt(del_id)); // 영화 관련 좌석 모두 삭제
	response.sendRedirect("admin_list.jsp");
%>

<body>

</body>
</html>