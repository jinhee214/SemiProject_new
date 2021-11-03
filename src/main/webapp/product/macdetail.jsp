<%@page import="data.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<title>iMac</title>
</head>
<body>
<%
//Mac 카테고리번호(=1)에 해당하는 리스트 가져오기
ProductDao dao=new ProductDao();
List<ProductDto> list=dao.getAllMembers();
%>
<body>
<table class="table table-bordered" style="width: 1200px;">
	<caption><b>iMac</b></caption>
	<tr>
		<th width="30">제품번호</th>
		<th width="50">제품가격</th>
		<th width="100">제품사진</th>
		<th width="50">장바구니</th>
	</tr>
	<%
	for(ProductDto dto:list)
		//iMac=1인경우만 출력
		if(dto.getCategory_id()==1)
	{%>
		<tr align="center">
			<td><%=dto.getProduct_id()%>
			<td><%=dto.getProduct_price()%></td>
			<td><img alt="" src="AppleProduct_img/<%=dto.getDetail_img()%>"></td>
			<td>
				<button type="submit" class="glyphicon glyphicon-shopping-cart btn btn-success btn-lg"
				onclick="#">장바구니</button>
			</td>						
		</tr>
	<%}
	%>
</table>
		<button class="glyphicon glyphicon-chevron-left btn btn-secondary btn-lg"
		onclick="location.href='index.jsp?main=product/maclist.jsp'" style="margin-left: 1000px;">뒤로가기</button>

</body>
</html>