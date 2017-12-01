<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, customer.*, movie.*, movie_seat.*"%>
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
	if (username == "" || password == "")
	{
		out.println("<script type='text/javascript'>alert('미기입 사항이 있습니다.');history.back();</script>");
		return;
	}
	if (username != null && password != null) {
		ArrayList<Customer> customer = customer_list.getDBList();

		for (Customer i : customer) { // 같은 이름의 정보가 DB의 고객 list에 있으면 비밀번호 확인
			if ((i.getName_mem().compareTo(username) == 0) && (i.getPass_word().compareTo(password) == 0)) {
				//아이디와 비밀번호가 같으면 login!!
				// 관리자인이 확인
				
				if (i.getName_mem().compareTo("admin") == 0) {
					out.println("admin login");
					response.sendRedirect("admin_list.jsp");
					return;  // 관리자 모드
				}
				else { // 일반 회원 로그인 -> 예매 사이트로 이동
					session.setAttribute("user", i);
					if (session.getAttribute("movie_choice") != null) {
						movie_Beans movie_bean = new movie_Beans();
						int movie_num = Integer.valueOf(session.getAttribute("movie_choice").toString());
						if (i.getAge_mem() < movie_bean.getDB(movie_num).getAge_phase()) {
							out.println("<script type='text/javascript'>alert('이 영화를 보기에는 적절하지 않습니다. 메인으로 돌아갑니다.');location.href = 'main.jsp' ;</script>");
							return;
						}
							
						response.sendRedirect("book_movie.jsp");
					}
					else 
						response.sendRedirect("main.jsp");
					return;
				}

			}
		}

	} 
	System.out.println("fefe");
	out.println("<script type='text/javascript'>alert('unmatched password');history.back();</script>");
	
%>





</head>
<body>

</body>
</html>