<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.OrderDto"%>
<%@page import="data.dao.orderDao"%>
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

String delday=request.getParameter("delday");
String myid=(String)session.getAttribute("myid");
//연락처 
//주문번호
orderDao odao=new orderDao();
int num=odao.getNowOrder(myid);

//카트 리스트받기
CartDao cdao=new CartDao();
List<CartDto>clist=cdao.readCart(myid);

//제품 정보 받기
ProductDao pdao=new ProductDao();

//이미지 받기

//남은포인트
int rem=Integer.parseInt(request.getParameter("rem"));  

%>

<!-- 주문성공 메세지 밑에 주문 번호  -->
<div align="center" style="position: relative; top: 100px;">
<h1>모든 준비가 완료되었습니다.</h1>
<br>
<b>확인 내역 및 배송 관련 업데이트를 다음 역락처로 보내드리겠습니다.</b>
<!-- 연락처  -->
<br>
<!-- 주문번호 -->
<h3 style="color: #0080ff;">주문 번호 <%=num%></h3>
</div >

<div align="center" style="position: relative; top: 500px;">
<!-- 주문 상품 상세 설명  -->
<b>출고 <%=delday %></b>
<br>
<b>제품 상세설명</b>

<!-- 남은 포인트 -->



<!--  상품이미지 > 이미지 클릭시 제품 상세설명 창-->
<!-- 반복문  -->
<a href="#"><img  src="#" style="max-width: 400px;"></a>

<!--프로그래스 바 -->

</div>

<!-- 홈버튼 -->

</body>
</html>