<%@page import="data.dto.OrderDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="java.util.Vector"%>
<%@page import="data.dto.CartDto"%>
<%@page import="java.util.List"%>
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
String paysel=request.getParameter("paysel");
String addr=request.getParameter("addr1")+"-"+request.getParameter("addr2");

CartDao cdao=new CartDao();

List<CartDto>list=cdao.readCart();


response.sendRedirect("../index.jsp?main=order/orderform.jsp?paysel="+paysel+"&addr="+addr);
%>


</body>
</html>