<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.ProductDto"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
.container {
	display: flex;
	justify-content: center;
	margin-left: auto;
	margin-right: auto;
}

ol li {
	display: block;
}

a:hover {
	cursor: pointer;
}

#name {
	font-weight: bold;
	color: black;
}

#name:hover {
	
}

.cartContent {
	margin: auto;
}

.cartContent h1 {
	font-weight: bold;
}

tr.sum {
	font-size: 1.3em;
	font-weight: bold;
}

button.submit {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	padding: 11px 100px;
	font-weight: bold;
}

button.submit2 {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	width: 230px;
	height: 40px;
	font-weight: bold;
}

button.logoutbtn {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	width: 150px;
	height: 40px;
	font-weight: bold;
}

table tr.bottom-border {
	border-bottom: 0.5px solid lightgray;
}

img.productPhoto {
	max-height: 140px;
	max-width: 140px;
	padding-top: 7px;
	padding-bottom: 7px;
	padding-left: 25px;
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
				
				//alert("cnt:"+cnt+", user_id:"+user_id+", product_id:"+product_id+", color:"+color+", insurance:"+insurance); //콘솔에 출력해서 확인
			}
		});
	});
	
	//장바구니에서 제품 삭제
	$("a.deleteCart").click(function(){
		
		var user_id = $(this).attr("user_id");
		var product_id = $(this).attr("product_id");
		var color = $(this).attr("color");
		var insurance = $(this).attr("insurance");
		
		$.ajax({
			type : "get",
			dataType : "html",
			url : "cart/deleteCart.jsp",
			data : {"user_id" : user_id, "product_id" : product_id,
				"color" : color, "insurance" : insurance},
			success : function() {
				//alert("user_id:"+user_id+", product_id:"+product_id+", color:"+color+", insurance:"+insurance); //콘솔에 출력해서 확인
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

//천단위 컴마 찍기
DecimalFormat df = new DecimalFormat("###,###");
%>

<body>
<div class="container">
	<%
	//로그인 안되어 있을 경우 '로그인','홈으로 돌아가기' 버튼만 보임
	if (loginok == null) {
	%>
	<div style="margin-top: 70px; align-content: center; text-align: center;">
		로그인이 필요한 서비스입니다. <br> <br>
		<button onclick="location.href='index.jsp?main=login/loginform.jsp'" class="logoutbtn">로그인</button>
		<button onclick="location.href='index.jsp'" class="logoutbtn">홈으로 돌아가기</button>
	</div>
	<%
	
	//로그인 되어 있을 경우 장바구니 목록 띄움
	} else {
	%>
	<form action="cart/cartToOrderAction.jsp" method="post" class="">
		<div class="table-main cartContent" style="align-content: center; text-align: center; margin-bottom: 45px;">
			<h1>
				장바구니에 들어있는 제품입니다 <font id="totalCart"></font>.
			</h1>
			<br>
			<font style="font-size: 10pt;">모든 주문에 무료 배송 서비스가 제공됩니다.</font>
			<br><br>
			<button type="submit" class="submit2">결제</button>
		</div>
		<div class="table-main cartContent">
		<table class="" style="width: 830px; margin: auto;">
			<%
			int totalC = 0;
			for (CartDto dto : list) {
			%>
			<tr class="no-bottom-border" style="margin-top: 300px;">
				<!-- 제품사진 -->
				<td class="thumbnail-img" rowspan="2" align="center" width="100">
					<a href="index.jsp?main=product/<%=pdao.getProductName(dto.getProduct_id())%>.jsp"><img class="productPhoto" src="image/AppleProduct_img/<%=pdao.getProductPhoto(dto.getProduct_id())%>"></a>
				</td>				
				<!-- 제품명 -->
				<td id="name" style="padding-left: 50px; color: black; font-size: 1.2em; font-weight: bold;">
				<%
				if (dto.getColor().equals("화이트")) {
				%>
				<a href="index.jsp?main=product/<%=pdao.getProductName(dto.getProduct_id())%>.jsp"><%=pdao.getProductName(dto.getProduct_id())%></a>
				<%
				} else {
				%><a href="index.jsp?main=product/<%=pdao.getProductName(dto.getProduct_id())%>.jsp"><%=pdao.getProductName(dto.getProduct_id())%>
				<span id="color"> <%=dto.getColor()%></span></a>
				<%
				}
				%>
				</td>
				<td><span><%=dto.getCnt()%></span>
					<select name="cnt" user_id="<%=user_id%>" color="<%=dto.getColor()%>" insurance="<%=dto.getInsurance()%>"
					style="font-size: 1.2em; font-weight: bold;">
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
				<td align="right"><span id="cntXprice" style="font-size: 1.2em; font-weight: bold;">
				￦<%=df.format(dto.getCnt()*dto.getPrice())%></span></td>
			</tr>
			<tr class="bottom-border" style="vertical-align: top; padding-top: 1px;">
				<td style="padding-left: 50px;">
					<%
					if (dto.getInsurance().equals("Y")) {
					%>
					AppleCare+ 포함
					<%
					} else {
					%>
					<font color="lightgray">AppleCare+ 미포함</font>
					<%
					}
					%>
				</td>
				<td colspan="2" align="right">
					<%-- <button type="button" class="deleteCart" product_id="<%=dto.getProduct_id()%>" user_id="<%=user_id%>">삭제</button> --%>
					<a class="deleteCart" product_id="<%=dto.getProduct_id()%>" color="<%=dto.getColor()%>" insurance="<%=dto.getInsurance()%>" 
					user_id="<%=user_id%>" style="color: #0077ed; pointer: cursor;">삭제</a>
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
		</div>
		<div>
			<input type="hidden" name="totalPrice" id="totalPrice" value="<%=totalC%>">
			<!-- 소계, 배송, 총계, 결제버튼 -->
			<table style="margin: auto; margin-left: 355px; margin-top: 50px;">
				<tr height="30">
					<th width="350px;">소계</th>
					<td align="right"><font id="totalCart">￦<%=df.format(totalC)%></font></td>
				</tr>
				<tr height="30" class="bottom-border">
					<th width="350px;">배송</th>
					<td align="right">무료</td>
				</tr>
				<tr height="50" class="sum" style="vertical-align: bottom;">
					<th width="350px;">총계</th>
					<td align="right"><font id="totalCart">￦<%=df.format(totalC)%></font></td>
				</tr>
				<tr height="30" style="vertical-align: top;">
					<th width="350px;"></th>
					<td align="right" style="font-size: 9pt;"><font id="totalCart">￦<%=df.format(totalC/1.1*0.1)%></font>의 VAT 포함</td>
				</tr>
				<tr height="80" style="vertical-align: bottom;">
					<td colspan="2" align="right">
					<button type="submit" class="submit">결제</button>
					</td>
				</tr>
				<tr height="80"><td></td></tr>
			</table>
		</div>
	</form>
	<%
	}
	%>
	</div>
</body>
</html>
