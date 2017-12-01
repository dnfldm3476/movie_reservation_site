<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.ArrayList, customer.*, movie.*, movie_seat.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_delete_movie</title>
</head>
<% String del_id = request.getParameter("delete"); 
	System.out.println(del_id);
	
	movie_Beans movie_bean = new movie_Beans();
	seat_Beans seat_bean = new seat_Beans();
	
	movie_bean.deleteDB(Integer.parseInt(del_id));
	seat_bean.deleteDB(Integer.parseInt(del_id));
	response.sendRedirect("admin_list.jsp");

	%>

<body>

</body>
</html>