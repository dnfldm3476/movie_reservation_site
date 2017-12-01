<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.ArrayList, customer.*, movie.*"%>
       <jsp:useBean id="customer_list" class="customer.customer_Beans" scope="request" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_controll</title>
</head>
<%
	String password_1 = request.getParameter("password");
	String password_2 = request.getParameter("password_2");
	String age = request.getParameter("age");
	
	if (password_1.compareTo(password_2) == 0) { // passwword 2개가 같이야 시작
		
		
		Customer new_customer = (Customer) session.getAttribute("user");
		
		new_customer.setPass_word(password_1);
		new_customer.setAge_mem(Integer.parseInt(age));
				
		customer_list.updateDB(new_customer); // 새로운 고객 정보 DB에 저장
		response.sendRedirect("book_movie.jsp");
		
	}
	else { // password가 다르면 다시 회원가입 창으로
		out.println("<script type='text/javascript'>alert('unmatched password');history.back();</script>");
	}


	 %>
<body>

</body>
</html>