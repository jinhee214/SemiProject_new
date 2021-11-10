<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.menu-bar {
	display: flex;
	justify-content: space-around;
	margin-right: 70px;
	padding: 0px;
	list-style: none;
}

.menu-bar a,
.menu-bar a:link,
.menu-bar a:visited,
.menu-bar a:hover,
#list-deail-item a,
#list-deail-item a:link,
#list-deail-item a:visited,
#list-deail-item a:hover
 {
	color: white;
}

.menu-bar li {
	width:200px;
}

#mainicon {
	width: 50px;
}

#list-detail {
	cursor: pointer;
}

#list-detail-item {
	width:200px;
	position:absolute;
	z-index: 1;
	list-style: none;
}

#list-detail-item > li {
	background-color: black;
	border: 1px solid white;
	color:white;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#list-detail").children("ul").hide();
		
		$("#list-detail").click(function() {
			$("#list-detail").children("ul").slideToggle("fast");
		})
	})
</script>


<%
String root = request.getContextPath();

String loginok = (String) session.getAttribute("loginok");

//개인 정보 로그인 버튼일지 로그아웃 버튼일지 비교
String loginBtn = loginok == null ? "로그인" : "로그아웃";
String loginhref = loginok == null ? "index.jsp?main=login/loginform.jsp":"login/logoutaction.jsp";


//아이디 얻기
String myid=(String)session.getAttribute("myid");

//db로부터 가입한 이름 얻기
UserDao dao=new UserDao();
UserDto dto=dao.getUser(myid);


//로그인 or 로그아웃 후에 나올 메시지
String info = dto.getUser_name()+" 님 환영합니다.<br>POINT : "+ dto.getUser_point()+ "pt";

if(loginok == null){
	info = "로그인 바랍니다.";	
}

%>
</head>
<body>


	<div class="wrap">
		<ul class="menu-bar">
			<li><a href="<%=root%>/index.jsp"><img id="mainicon"
					src="<%=root%>/image/logo3.png" alt="apple"></a></li>
			<li><a href="<%=root%>/index.jsp?main=product/maclist.jsp">Mac</a>
			<li><a href="<%=root%>/index.jsp?main=product/iPadlist.jsp">iPad</a></li>
			<li><a href="<%=root%>/index.jsp?main=product/iPhonelist.jsp">iPhone</a></li>
			<li><a
				href="<%=root%>/index.jsp?main=product/accessorylist.jsp">액세서리</a></li>
			<li><a href="<%=root%>/index.jsp?main=qna/boardMenu.jsp">고객지원</a></li>
			<li id="list-detail">
				<a><span class="glyphicon glyphicon-user" style="font-size:22px; margin-top:7px;"></span></a>
				<ul id="list-detail-item">
					<li><%=info%></li>
					<li><a href="<%=loginhref %>"><span class="glyphicon glyphicon-user"></span> <%=loginBtn%></a></li>
					<li><a href="index.jsp?main=cart/cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
					<li><a href="index.jsp?main=user/pointmain.jsp"><span class="glyphicon glyphicon-credit-card"></span> 포인트충전</a></li>
					<li><a href="index.jsp?main=login/loginmain.jsp"><span class="glyphicon glyphicon-info-sign"></span> 개인정보</a></li>
					<li><a href="index.jsp?main=order/ordershowform.jsp"><span class="glyphicon glyphicon-plane"></span> 배송조회</a></li>
				</ul>
			</li>

		</ul>
	</div>

</body>
</html>