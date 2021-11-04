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
	
	<form action="product/iMac_M1Deadd.jsp" method="post">
	
	<table class="table table-bordered" style="width: 500px;">
		<caption><b>장바구니담기</b></caption>
		<tr>
			<th width="100" bgcolor="#aaa">제품이름</th>
				<td>
					<select name="product_id">
					<option value="12321" selected="selected">iMacM1</option>
					</select>
				</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">수량</th>
				<td>
				<select name="cnt">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select> 
				</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">색상</th>
			<td>
			<select name="color">
				<option value="실버" selected="selected">실버</option>
				<option value="골드">골드</option>
				<option value="그레이">그레이</option>
			</select>
			
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">보험</th>
				<td>
					<input type="radio" name="insurance" value="Y">Y 
					<input type="radio" name="insurance" value="N" checked="checked">N
				</tr>
		<tr>
			<td align="center" colspan="2">
				<!-- hidden -->	
				<input type="hidden" value="<%=user_id %>" name="user_id">
				<input type="hidden" value="1690000" name="price">
				<button type="submit">장바구니담기</button>
			</td>
		</tr>
		</table>
	</form>

</body>
</html>