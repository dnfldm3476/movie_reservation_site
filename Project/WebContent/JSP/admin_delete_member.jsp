<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.ArrayList, customer.*, movie_book.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_delete_member</title>
</head>
<%  String del_id = request.getParameter("delete"); 
	System.out.println(del_id);
	
	customer_Beans customer = new customer_Beans(); // 에약 테이블에서 지우기
	book_Beans movie_book = new book_Beans();
	
	customer.deleteDB(Integer.parseInt(del_id));
	movie_book.deleteDB(Integer.parseInt(del_id));
	
	response.sendRedirect("admin_member.jsp");
	%>


<body>

</body>
</html>