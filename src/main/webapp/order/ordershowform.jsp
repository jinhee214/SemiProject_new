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
 
 <style type="text/css">
 
 button.submit {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	height: 50px;
	font-weight: bold;
}
 </style>
<title>Insert title here</title>
</head>
<body>
<%
String root=request.getContextPath();
%>

<form action="<%=root %>/index.jsp?main=order/ordershow.jsp" method="post" id="#">
<div style="margin:150px 0 0 450px; width:500px;" >
<h1 style="font-weight: bold; margin-bottom: 50px;">배송 조회</h1>
<input type="text" name="oid" class="form-control"
             required="required" style="width: 400px; border-radius: 10px; height: 50px;" placeholder="주문번호">
<h5>주문번호를 입력 하시면 배송상태를 확인하실 수 있습니다.</h5> 
             
 
  <button type="submit" class="submit" style="width: 400px; align:center; margin-top: 40px;">조회</button>
</div>

</form>


</body>
</html>