<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pay_middle</title>
</head>
<%
	session.setAttribute("pay_movie", Integer.valueOf(request.getParameter("choice")));
	response.sendRedirect("card_pay.jsp");

%>


<body>

</body>
</html>