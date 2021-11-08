<%@page import="data.dto.CartDto"%>
<%@page import="data.dto.ProductDto"%>
<%@page import="data.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
.btn{
	margin-right: 5px;
}
</style>
</head>
<body>

<table style="margin-left: auto; margin-right: auto;">
<tr align="center">
	<td>
		<br><br><b>장바구니에 상품이 정상적으로 담겼습니다</b><br><br>
		<b>지금 확인하시겠습니까?</b><br>
	</td>
	</tr>
	<tr align="center">
	<td>
		<br><br>
		<button type="button" class="btn glyphicon glyphicon-shopping-cart"
		style="background-color: #0077ed; border-radius: 10px; color: white;" onclick="location.href='index.jsp?main=cart/cart.jsp'">장바구니</button>
		<button type="button" class="btn glyphicon glyphicon-list"
		style="border-radius: 10px; background-color: lightgray;" onclick="location.href='index.jsp'">쇼핑하기</button>
	</td>
</tr>
</table>
</body>
</html>
