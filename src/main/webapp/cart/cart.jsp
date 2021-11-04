<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.ProductDto"%>
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
<!-- (아린 메모) 11/04 15:04 -->
<title>Insert title here</title>
<style type="text/css">
ol li {
	display: block;
}
</style>
<script type="text/javascript">

function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
$(function() {	

	var totalCart = $("#totalCart");
	var totalPrice = $("#totalPrice").val();
	totalCart.text("￦"+numberFormat(totalPrice));
	
	//드롭박스에서 수량 변경할 때마다 CartDao의 장바구니제품 수량 수정하는 메소드 updateCart() 실행됨.
	$("select[name=cnt]").change(function() {
		var selectTag = $(this);
		var cnt = $(this).val();
		var product_id = $(this).parent().find("#productId").val();
		var productPrice = $(this).parent().find("#productPrice").val();
		var cntXprice = $(this).parent().siblings().find("#cntXprice");
		
		var user_id = $(this).attr("user_id");
		var color = $(this).attr("color");
		var insurance = $(this).attr("insurance");
		
		$.ajax({
			type : "get",
			dataType : "html",
			url : "cart/updateCart.jsp",
			data : {"cnt" : cnt, "user_id" : user_id, "product_id" : product_id,
				"color" : color, "insurance" : insurance},
			success : function() {
				selectTag.prev().text(cnt);
				cntXprice.text("￦"+numberFormat(productPrice*cnt));
				location.reload();
				
				alert("cnt:"+cnt+", user_id:"+user_id+", product_id"+product_id+", color:"+color+", insurance:"+insurance); //콘솔에 출력해서 확인
				//console.log("product_id: "+product_id+" / cnt: "+cnt+" / productPrice: "+productPrice); //콘솔에 출력해서 확인
			}
		});
	});
	
	//장바구니에서 제품 삭제
	$("button.deleteCart").click(function(){
		
		var user_id = $(this).attr("user_id");
		var product_id = $(this).attr("product_id");
		var color = $("#hiddencolor").val();
		var insurance = $("#hiddeninsurance").val();
		
		$.ajax({
			type : "get",
			dataType : "html",
			url : "cart/deleteCart.jsp",
			data : {"user_id" : user_id, "product_id" : product_id,
				"color" : color, "insurance" : insurance},
			success : function() {
				alert("user_id:"+user_id+", product_id"+product_id+", color:"+color+", insurance:"+insurance); //콘솔에 출력해서 확인
				//새로고침
				location.reload();
			}
			
		});
	});
});
</script>
</head>
<%
//로그인 상태 확인 후 장바구니 페이지 나타내기 위해 loginok 만듦
String loginok = (String) session.getAttribute("loginok");
String user_id = (String) session.getAttribute("myid");

//CartDto에서 장바구니 리스트 출력하는 메소드 호출
CartDao dao = new CartDao();
List<CartDto> list = dao.readCart(user_id);

//ProductDao 선언. product_id로 제품이미지와 제품명 받아오기 위해
ProductDao pdao = new ProductDao();

DecimalFormat df = new DecimalFormat("###,###");
%>
<body>
	<%
	//로그인 안되어 있을 경우 '로그인','홈으로 돌아가기' 버튼만 보임
	if (loginok == null) {
	%>
	<div>
		로그인이 필요한 서비스입니다. <br> <br>
		<button onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
		<button onclick="location.href='index.jsp'">홈으로 돌아가기</button>
	</div>
	<%
	
	//로그인 되어 있을 경우 장바구니 목록 띄움
	} else {
	%>
	<form action="cartToOrderAction.jsp" method="post" class="">
		<div>
			<h2>
				장바구니에 들어있는 제품입니다. <font id="totalCart"></font>
			</h2>
		</div>
		<table class="table" style="width: 650px;">
			<%
			int totalC = 0;
			for (CartDto dto : list) {
			%>
			<tr>
				<!-- 제품사진 -->
				<td rowspan="2">
					<a href="index.jsp?main=product/#.jsp"><img src="AppleProduct_img/<%=pdao.getProductPhoto(dto.getProduct_id())%>"></a>
				</td>
				<td id="name"><a href="index.jsp?main=product/#.jsp"><%=pdao.getProductName(dto.getProduct_id())%>
				<span id="color">(색상: <%=dto.getColor()%>) <i style="font-size: 2pt;">(product_id(삭제예정): <%=dto.getProduct_id()%>)</i></span></a>
				</td>
				<td><span><%=dto.getCnt()%></span>
					<select name="cnt" user_id="<%=user_id%>" color="<%=dto.getColor()%>" insurance="<%=dto.getInsurance()%>">
						<option value="" selected disabled hidden></option>
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
					</select> <span class="rs-quantity-icon form-dropdown-chevron"></span>
					<input type="hidden" name="productId" id="productId" value="<%=dto.getProduct_id()%>">
					<input type="hidden" name="productPrice" id="productPrice" value="<%=dto.getPrice()%>">
				</td>
				<td><span id="cntXprice">￦<%=df.format(dto.getCnt()*dto.getPrice())%></span></td>
			</tr>
			<tr>
				<td>
					<%
					if (dto.getInsurance().equals("Y")) {
					%> AppleCare+ 포함
					<%} else {
					%>
					<font color="lightgray">AppleCare+ 미포함</font>
					<%
					}
					%>
				</td>
				<td colspan="2" align="right">
					<button type="button" class="deleteCart" product_id="<%=dto.getProduct_id()%>" user_id="<%=user_id%>">삭제</button>
					<!-- hidden -->
					<input type="hidden" name="productName" value="<%=pdao.getProductName(dto.getProduct_id())%>">
					<input type="hidden" id="hiddencolor" value="<%=dto.getColor()%>">
					<input type="hidden" id="hiddeninsurance" value="<%=dto.getInsurance()%>">
				</td>
			</tr>
			<%
			totalC += dto.getCnt() * dto.getPrice();
			}
			%>
		</table>
		<div>
			<input type="hidden" name="totalPrice" id="totalPrice" value="<%=totalC%>">
			<!-- 소계, 배송, 총계, 결제버튼 -->
			<table style="margin-left: 450px;">
				<tr height="30">
					<th width="100px;">소계</th>
					<td align="right"><font id="totalCart">￦<%=df.format(totalC)%></font></td>
				</tr>
				<tr height="30">
					<th width="100px;">배송</th>
					<td align="right">무료</td>
				</tr>
				<tr height="30">
					<th width="100px;">총계</th>
					<td align="right"><font id="totalCart">￦<%=df.format(totalC)%></font></td>
				</tr>
				<tr height="30">
					<td colspan="2" align="right"><button type="submit">결제</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<%
	}
	%>
</body>
</html>
