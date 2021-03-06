<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Apple (대한민국)</title>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
.layout {
	border: 0px solid gray;
	position: absolute;
}

.title {
	width: 100%;
	height: 100px;
	line-height: 80px;
	font-size: 30pt;
	font-family: "바탕체";
	text-align: center;
}

.login {
	width: 100%;
	line-height: 80px;
	text-align: center;
	top: 50px;
}

.menu {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 10pt;
	text-align: center;
	background-color: #404040;
}

.main {
	width: 1300px;
	height: 700px;
	font-size: 12pt;
	
	
}

.setCenter{

	top: 150px;
	width:100%;
	display: flex;
	justify-content: center;

}

a:hover {
	color: black;
	text-decoration: none;
}


</style>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
	
String root=request.getContextPath();

String mainPage="layout/main.jsp";

if(request.getParameter("main")!=null){
	
	mainPage=request.getParameter("main");
	
}
%>

	<%-- <div class="layout title">
		<jsp:include page="layout/title.jsp"></jsp:include>
	</div> --%>

	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"></jsp:include>
	</div>


	<%-- <div class="layout login">
		<!-- 로그인메뉴 -->
		<jsp:include page="layout/loginmenu.jsp"></jsp:include>
	</div> --%>
	
<div class="layout setCenter">
	<div class="main">
		<jsp:include page="<%=mainPage %>"></jsp:include>
	</div>
</div>
	
</body>
</html>