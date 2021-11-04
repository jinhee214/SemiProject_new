<%@page import="data.dao.orderDao"%>
<%@page import="data.dto.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<%
String id=(String)session.getAttribute("myid");
String addr=request.getParameter("addr");


//유저아이디 구매날짜 주소
//결제완료 db에저장
OrderDto odto=new OrderDto();
odto.setUser_id(id);
odto.setOrder_addr(addr);

//System.out.println(addr);
//System.out.println(id);

//주문번호 제품번호 상세정보 detail db에 저장
//orderDao odao=new orderDao();
//odao.insertOrder(odto);

response.sendRedirect("../index.jsp?main=order/ordersuccform.jsp");
%>


</body>
</html>