<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.ArrayList, customer.*, movie_book.*, movie_seat.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_delete_member</title>
</head>
<%  String del_id = request.getParameter("delete"); 
	System.out.println(del_id);
	
	customer_Beans customer = new customer_Beans(); // 에약 테이블에서 지우기
	book_Beans book_bean = new book_Beans();
	seat_Beans seat_bean = new seat_Beans();
	// 좌석에서 사용자가 예매한것 취소 = 0으로 값 변경
	for ( movie_book i : book_bean.getDBList(Integer.parseInt(del_id))) {
		seat_bean.updateDB(i.getId_film(), i.getSeat_no(), 0);
	}

	
	customer.deleteDB(Integer.parseInt(del_id)); // 사용자 삭제
	book_bean.deleteDB_idmem(Integer.parseInt(del_id)); // 예매에서 사용자 관련 삭제
	
	
	response.sendRedirect("admin_member.jsp");
	%>


<body>

</body>
</html>