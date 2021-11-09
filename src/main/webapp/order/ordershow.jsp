<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="data.dao.orderDao"%>
<%@page import="data.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.orderDetailDao"%>
<%@page import="data.dto.orders_detailDto"%>
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

int orderid=Integer.parseInt(request.getParameter("oid"));

/* 이미지 가져오기 */
ProductDao pdao=new ProductDao();

/* 주문내역 가져오기 */
orderDetailDao ddao=new orderDetailDao();
ArrayList<orders_detailDto>list1=ddao.getAllOrder(orderid);

/* 주문날짜 가져오기 */
orderDao odao=new orderDao();
OrderDto odto=odao.getOder(orderid);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");

if(list1.size()==0)
{%>
	<script type="text/javascript">
	alert("유효하지 않은 주문번호 입니다");
	history.back();
	</script>
<%}
%>

<div style="margin-left: 250px;">
<h2 style="font-weight: bold;">주문 날짜 <%=sdf.format(odto.getOrder_date()) %></h2>
<h4 style="margin-top: 15px;">주문번호: <%=orderid %></h4>
</div>

<!-- 프로그래스바  -->
<div class="progress" style="margin: 50px 0 0 250px; width:800px; height: 20px; border-radius: 15px;">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  aria-valuemin="0" aria-valuemax="100" style="width:24%">   
  </div>
</div>

 <table style="margin-left: 250px; margin-top:15px; width: 800px; font-size: 0.9em;" >
  	<tr>
  		<td style="margin-left: 50px;">주문접수</td>
  		<td style="margin-left: 50px; color:#0080ff; font-weight: bold; font-size: 1.1em;">배송 준비 중</td>
  		<td style="margin-left: 50px;">출고 준비 중</td>
  		<td style="margin-left: 50px;">출고됨</td>
  		<td align="right">배송 완료</td>
  	</tr>
 </table>
 
 <div style="margin-left: 250px; margin-top:15px; width: 800px; font-weight: bold;">
 <p>제품을 배송 준비 중입니다. 24시간 이내에 배송 정보를 확인하실 수 있습니다. 운송업체에서 배송 시 서명을 요청할 수 있습니다.</p>
 <a href="<%=root%>/index.jsp?main=qna/boardMenu.jsp" style="margin-left: 733px; font-size: 0.9em; color:#0080ff;">고객센터</a>
 </div>

<table class="table" style="width: 1000px; margin:0 auto; margin-top: 50px; border-bottom: 1px solid lightgray;">
<%
	for(orders_detailDto ddto:list1)
	{%>
		<tr>
			<td style="width: 300px;">
			<div style="margin: 0 -100px 15px 0;">
			<a href="<%=root%>/index.jsp?main=product/<%=pdao.getProductName(ddto.getProduct_id())%>.jsp">
			<img style="max-height: 200px; max-width: 200px;" 
			src="<%=root %>/image/AppleProduct_img/<%=pdao.getProductPhoto(ddto.getProduct_id())%>">
			</a>
			</div>
			</td>
			<td align="left"><div style="margin-top: 80px; font-weight: bold;"><%=pdao.getProductName(ddto.getProduct_id()) %></div></td>
			<td align="left"><div style="margin-top: 80px; font-weight: bold;">색상: <%=ddto.getColor()%></div></td>
			<td align="center"><div style="margin-top: 80px; font-weight: bold;">수량: <%=ddto.getCnt() %></div></td>
			<td align="right"><div style="margin-top: 80px; font-weight: bold;">AppleCare: <%=ddto.getInsurance()%></div></td>
		</tr>
			
	<%}
 
%>
</table>

<button type="button"  id="home" style=" background-color: #0080ff; margin: 50px 0 100px 450px; width: 400px; height: 50px;
border-radius: 15px;" class="btn btn-primary" onclick="location.href='index.jsp'" ><b>메인으로</b></button>


</body>
</html>