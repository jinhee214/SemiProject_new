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
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//id를 읽는다
String id=request.getParameter("product_id");

//dao선언
ProductDao dao=new ProductDao();
//아이디에 대한 이름을 얻는다


%>

<div style="margin: 0 auto; width: 100%">
    <img alt="" src="image2/03.png">
      <b><%=%>이 장바구니에 추가되었습니다.</b>
      <br><br>
    
    <button type="button" class="btn btn-info" onclick="location.href='index.jsp'">쇼핑하기</button>
    <button type="button" class="btn btn-info" onclick="location.href='cart/cart.jsp'">장바구니로 가기</button>  
</div>

</body>
</html>
