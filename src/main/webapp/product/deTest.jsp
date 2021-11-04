<%@page import="data.dao.ProductDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.ProductDto"%>
<%@page import="data.dto.UserDto"%>
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
</head>
<body>
<%
String user_id = (String) session.getAttribute("myid");

UserDto dto=new UserDto();
UserDao dao=new UserDao();
dao.getUser(user_id);

%>
	<form action="product/macadd.jsp" method="post">
	상품담기 <br>
		<select name="product_id">
			<option value="12321" selected="selected">iMacM1</option>
			<option value="12325" selected="selected">iMacM2</option>
			</select> <br>
			수량 <input type="text" name="cnt"> 
			<select name="color">
				<option value="실버" selected="selected">실버</option>
				<option value="골드">골드</option>
				<option value="그레이">그레이</option>
			</select> 
			<input type="radio" name="insurance" value="Y">Y 
			<input type="radio" name="insurance" value="N" checked="checked">N
		
		<!-- hidden -->	
		<input type="hidden" value="<%=user_id %>" name="user_id">
		<input type="hidden" value="1690000" name="price">

		<button type="submit">장바구니담기</button>
	</form>
</body>
</html>