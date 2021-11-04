<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="java.util.List"%>

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
request.setCharacterEncoding("utf-8");

//데이터 읽어서 dto에 넣기
CartDto dto = new CartDto();
dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
dto.setUser_id(request.getParameter("user_id"));
dto.setPrice(Integer.parseInt(request.getParameter("price")));
dto.setCnt(Integer.parseInt(request.getParameter("cnt")));
dto.setColor(request.getParameter("color"));
dto.setInsurance(request.getParameter("insurance"));

//장바구니에 있는지 확인후 update 또는 insert
CartDao dao = new CartDao();
if(dao.checkCart(dto)){
	dao.updateCntCart(dto);
}else{
	dao.insertCart(dto);
}

//gaipsuccess로 이동
response.sendRedirect("../index.jsp?main=product/productsuccess.jsp");
%>
</body>
</html>
