<%@page import="data.dto.UserDto"%>
<%@page import="com.sun.security.auth.UnixNumericUserPrincipal"%>
<%@page import="data.dao.UserDao"%>
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
request.setCharacterEncoding("utf-8");
String root=request.getContextPath();
String myid=(String)session.getAttribute("myid");
String addr=request.getParameter("addr");
int total=Integer.parseInt(request.getParameter("total"));
String delday=request.getParameter("delday1")+" - "+request.getParameter("delday2");

//유저아이디 구매날짜 주소
//결제완료 db에저장
OrderDto odto=new OrderDto();
odto.setUser_id(myid);
odto.setOrder_addr(addr);

orderDao odao=new orderDao();
odao.insertOrder(odto);

/* 남은포인트 */
UserDao udao=new UserDao();
UserDto udto=udao.getUser(myid);

int point=udto.getUser_point();

int rem=point-total;


response.sendRedirect("../index.jsp?main=order/ordersuccform.jsp?rem="+rem+"&delday="+delday);
%>


</body>
</html>