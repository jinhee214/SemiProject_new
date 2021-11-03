<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.ProductDto"%>
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
//한글엔코딩
request.setCharacterEncoding("utf-8");

//데이터 읽어서 dto담기
ProductDto dto=new ProductDto();
int product_id=Integer.parseInt(request.getParameter("product_id"));
int category_id=Integer.parseInt(request.getParameter("category_id"));
String product_name=request.getParameter("product_name");
int product_price=Integer.parseInt(request.getParameter("product_price"));


dto.setProduct_id(product_id);
dto.setCategory_id(category_id);
dto.setProduct_name(product_name);
dto.setProduct_price(product_price);


//dao선언후에 insert호출
ProductDao dao=new ProductDao();
dao.getProductName(product_id);


//gaipsuccess로 이동
response.sendRedirect("../index.jsp?main=productsuccess.jsp");

%>
</body>
</html>
