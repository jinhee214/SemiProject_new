<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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
String root=request.getContextPath();

String delday=request.getParameter("delday");
String myid=(String)session.getAttribute("myid");
//연락처 
UserDao udao=new UserDao();
UserDto udto=new UserDto();
udto=udao.getUser(myid);
//주문번호
orderDao odao=new orderDao();
int num=odao.getNowOrder(myid);

//카트 리스트받기
CartDao cdao=new CartDao();
List<CartDto>clist=cdao.readCart(myid);

//제품 정보 받기
ProductDao pdao=new ProductDao();

//남은포인트
int rem=Integer.parseInt(request.getParameter("rem"));  
udto.setUser_id(myid);
udto.setUser_point(rem);

udao.updatePont(udto);

DecimalFormat dfm=new DecimalFormat("###,###");

%>

<!-- 주문성공 메세지 밑에 주문 번호  -->
<div align="center" style="position: relative; top: 50px;">
<h1 style="font-weight: bold;">모든 준비가 완료되었습니다.</h1>
<br>
<p><b>확인 내역 및 배송 관련 업데이트를 다음 역락처로 보내드리겠습니다.</b></p>
<b><%=udto.getUser_hp() %></b>
<!-- 연락처  -->
<br>
<!-- 주문번호 -->
<h3 style="color: #0080ff;">주문 번호 <%=num%></h3>
<!-- 남은 포인트 -->
<b style="color: #0080ff; font-size: 2em;"><%=dfm.format(rem) %></b> 포인트 남음
</div >

<!-- 주문 상품 상세 설명  -->

<div style="margin: 50px 0 15px 0;">
<%
	for(CartDto cdto:clist)
	{%>
	
		<div style="margin: 200px 50px 0 350px; width:400px;">
		<h1 style="font-weight: bold;">출고 <%=delday %></h1>
		<b style="font-size: 1.3em;"><%=pdao.getProductName(cdto.getProduct_id()) %>, <%=cdto.getColor() %></b>	
		</div>	
			
		<div style="margin: -190px 50px 0 750px;">
		<!--  상품이미지 > 이미지 클릭시 제품 상세설명 창-->
		<a href="<%=root%>/index.jsp?main=product/<%=pdao.getProductName(cdto.getProduct_id())%>.jsp">
		<img  src="<%=root %>/AppleProduct_img/<%=pdao.getProductDetailPhoto(cdto.getProduct_id())%>"
		 style="max-width: 350px; max-height: 250px;" ></a>
		</div>
	
	<%}
%>
</div>

<hr style="border:1px solid #e6eaee; width:1120px;">
<!--프로그래스 바 -->


<!-- 홈버튼 -->
<button type="button"  id="home" style=" background-color: #0080ff; margin:0 0 100px 450px; width: 400px; height: 50px;
border-radius: 15px;" class="btn btn-primary" onclick="location.href='index.jsp'" >메인으로</button>

</body>
</html>