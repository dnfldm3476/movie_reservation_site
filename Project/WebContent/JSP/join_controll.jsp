<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.ArrayList, customer.*, movie.*"%>
   <jsp:useBean id="customer_list" class="customer.customer_Beans" scope="request" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id_name = request.getParameter("id_name");
	String password_1 = request.getParameter("password");
	String password_2 = request.getParameter("password_2");
	String age = request.getParameter("age");
	
	if (id_name == "" || password_1 == "" || age == "")
	{
		out.println("<script type='text/javascript'>alert('미기입 사항이 있습니다.');history.back();</script>");
		return;
	}
	if (password_1.compareTo(password_2) == 0) { // passwword 2개가 같이야 시작
		ArrayList<Customer> customer = new ArrayList<Customer>();
		customer = customer_list.getDBList();
	
		for (Customer i : customer) { // 같은 이름의 정보가 DB의 고객 list에 있는지 학인 있으면 되돌아가기
			System.out.println(i.getName_mem());
			if (i.getName_mem().equals(id_name))
			{
				out.println("<script type='text/javascript'>alert('matched name in DB');history.back();</script>");
				return;
			}
		}
		
		int id_mem = customer.get(customer.size() - 1).getId_mem() + 1; // +1 필요 // 확인 필요
		
		Date d = new Date();
        String s = d.toString();
        System.out.println("현재날짜 : "+ s);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String register_date = sdf.format(d);
        System.out.println("현재날짜 : "+ register_date);

		Customer new_customer = new Customer(); // 새로운 고객정보를 저장할 new_customer 생성
		
		new_customer.setId_mem(id_mem);   // 새로운 고객정보의 new_customer 초기화
		new_customer.setName_mem(id_name);
		new_customer.setPass_word(password_1);
		new_customer.setAge_mem(Integer.parseInt(age));
		new_customer.setRegister_date(register_date);
				
		customer_list.insertDB(new_customer); // 새로운 고객 정보 DB에 저장
		response.sendRedirect("login.jsp");

	}
	else { // password가 다르면 다시 회원가입 창으로
		out.println("<script type='text/javascript'>alert('unmatched password');history.back();</script>");
	}

%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
