<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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
//세션받기
String loginok = (String) session.getAttribute("loginok");

//유저 id받기
String myid=(String)session.getAttribute("myid");

//db선언
UserDao udao=new UserDao();
UserDto udto=udao.getUser(myid);

%>

<%
//Mac 카테고리번호(=1)에 해당하는 리스트 가져오기
ProductDao dao=new ProductDao();
List<ProductDto> list=dao.getAllMembers();
if(loginok==null)
{%>
	<div>
	<table class="table" style="width: 1200px;">
	<caption><b>AirPods 3</b></caption>
	<tr align="center">
		<th width="400px;">제품주문</th>
		<th width="400px;">제품소개</th>
	</tr>
	<%
	for(ProductDto dto:list)
		//iMac=1인경우만 출력
		if(dto.getProduct_id()==99998)
		{%>
		<tr align="center">
			
			<tr>
			<td>
			<%
			String user_id = (String) session.getAttribute("myid");
			UserDto uudto=new UserDto();
			UserDao uudao=new UserDao();
			uudao.getUser(user_id);
			%>
			<form action="product/addProAction.jsp" method="post">
				<table style="width: 500px;">
				<tr>
						<th width="100" height="100" colspan="2" style="font-size: 25pt;">AirPods 3</th>
					</tr>
					
					<tr>
					<th width="100" colspan="2" style="font-size: 1.3em;">￦249,000</th>
					</tr>
					
					<tr>
					<th width="100" colspan="2" style="font-size: 0.8em; color: #0077ed;" >최대 12개월 신용 카드 할부</th>
					</tr>
					
					<tr>
						<th width="100" height="100">수량</th>
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
			<th width="100" height="100">AppleCare</th>
				<td>
					<input type="radio" name="insurance" value="Y">Yes
					<input type="radio" name="insurance" value="N" checked="checked">No
				</tr>
		<tr>
			<td align="center" colspan="2" height="100">
				<!-- hidden -->	
				<input type="hidden" value="<%=dto.getProduct_id() %>" name="product_id">
				<input type="hidden" value="<%=user_id %>" name="user_id">
				<input type="hidden" value="249000" name="price">
				<button type="button" class="btn btn-primary btn-block"
				style="background-color: #0077ed; border-radius: 10px;"
				onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인이 필요한 서비스입니다</button>
			</td>
		</tr>
		</table>
	</form>
</td>

			<td><img alt="" src="image/AppleProduct_img/<%=dto.getDetail_img()%>"></td>
			
		</tr>
	<%}
%>
</table>
</div>
<%}else{

%>

<table class="table" style="width: 1200px;">
	<caption><b>AirPods 3</b></caption>

	<tr>
		<th width="400">제품주문</th>
		<th width="400">제품소개</th>
	</tr>

	<%
	for(ProductDto dto:list)
		//iMac=1인경우만 출력
		if(dto.getProduct_id()==99998)
	{%>
		<tr>
			<td>
			<%
			String user_id = (String) session.getAttribute("myid");
			UserDto uudto=new UserDto();
			UserDao uudao=new UserDao();
			uudao.getUser(user_id);
			%>
			<form action="product/addAccessoryAction.jsp" method="post">
				<table style="width: 500px;">
				<tr>
						<th width="100" height="100" colspan="2" style="font-size: 25pt;">AirPods 3</th>
					</tr>
					
					<tr>
					<th width="100" colspan="2" style="font-size: 1.3em;">￦249,000</th>
					</tr>
					
					<tr>
					<th width="100" colspan="2" style="font-size: 0.8em; color: #0077ed;" >최대 12개월 신용 카드 할부</th>
					</tr>
					
					<tr>
						<th width="100" height="100">수량</th>
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
			<th width="100" height="100">AppleCare</th>
				<td>
					<input type="radio" name="insurance" value="Y">Yes
					<input type="radio" name="insurance" value="N" checked="checked">No
				</tr>
		<tr>
			<td align="center" colspan="2" height="100">
				<!-- hidden -->	
				<input type="hidden" value="화이트" name="color">
				<input type="hidden" value="<%=dto.getProduct_id() %>" name="product_id">
				<input type="hidden" value="<%=user_id %>" name="user_id">
				<input type="hidden" value="249000" name="price">
				<button type="submit" class="btn btn-primary btn-block"
				style="background-color: #0077ed; border-radius: 10px;">장바구니담기</button>
			</td>
		</tr>
		</table>
	</form>
</td>
			
			<td><img alt="" src="image/AppleProduct_img/<%=dto.getDetail_img()%>"></td>
		</tr>
	<%}
}
%>
</table>

</body>
</html>