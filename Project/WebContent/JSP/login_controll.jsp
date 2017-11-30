<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*"%>
<jsp:useBean id="customer_list" class="customer.customer_Beans"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_controll</title>


<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username != null && password != null) {
		ArrayList<Customer> customer = customer_list.getDBList();

		for (Customer i : customer) { // 같은 이름의 정보가 DB의 고객 list에 있으면 비밀번호 확인
			if ((i.getName_mem().compareTo(username) == 0) && (i.getPass_word().compareTo(password) == 0)) {
				//아이디와 비밀번호가 같으면 login!!
				// 관리자인이 확인
				if (i.getName_mem().compareTo("admin") == 0)
					;// 관리자 모드
				else { // 일반 회원 로그인 -> 예매 사이트로 이동
					session.setAttribute("user", i);
					response.sendRedirect("reserve_movie.jsp");
					return;
				}

			}
		}

	} else {
		out.println("<script type='text/javascript'>alert('unmatched password');history.back();</script>");
	}
%>





</head>
<body>

</body>
</html>