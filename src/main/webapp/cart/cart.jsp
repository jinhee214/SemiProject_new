<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<%
//로그인 상태 확인 후 장바구니 페이지 나타내기 위해 loginok 만듦
String loginok = (String) session.getAttribute("loginok");

//dao에서 장바구니 리스트 출력하는 메소드 호출
CartDao dao = new CartDao();
List<CartDto> list = dao.readCart();
%>
<body>
	<%
	//로그인 안되어 있을 경우 '로그인','홈으로 돌아가기' 버튼만 보임
	if(loginok!=null){ //로그인 파트 완성되면 != > == 로 바꾸기
	%>
	<div>
		로그인이 필요한 서비스입니다.
		<button onclick="#">로그인</button>
		<button onclick="#">홈으로 돌아가기</button>
	</div>
	<%
	
	//로그인 되어 있을 경우 장바구니 목록 띄움
	} else {
	%>
	<form action="cart/cartToOrderAction.jsp" method="post" class="">
		<div><h2>장바구니에 들어있는 제품입니다. <!-- 추가) 총계 --> 원</h2></div>
		<ol><!-- 장바구니 리스트 -->
		<%
		for(CartDto dto : list){
			%>
			<li>
				<div class="main_img">
					<img
						src="<%=/* 추가) product dao에 product_id로 사진소스 구하는 메소드 만들어 호출 */dto.getProduct_id()%>">
				</div> <!-- 제품 이미지 -->
				<div>
					<div><%=/*추가) 제품명 */dto.getProduct_id()%></div>
					<div><%=/*추가) 수량 */dto.getProduct_id()%></div>
						<select>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10+">10+</option>
						</select> <span class="rs-quantity-icon form-dropdown-chevron"></span>
					<div><%=/*추가) 금액 */dto.getProduct_id()%>
					</div>
				</div>
				<div></div>
			</li>
			<%
		}
		%>
		</ol>
		<div> <!-- 소계, 배송, 총계, 결제버튼 -->
		
		
		
		</div>
		<button type="submit" style="width: 100px;">결제</button>
	</form>
	<%
	}
	%>
</body>
</html>
