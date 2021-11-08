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
<style type="text/css">
button.logoutbtn {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	width: 150px;
	height: 40px;
	font-weight: bold;
}
</style>
</head>
<body>
<%
//세션에 저장된 loginok를 읽는다
String loginok=(String)session.getAttribute("loginok");
//loginok 는 로그인 성공시 저장하고 로그아웃시 제거
if(loginok==null)
{%>
	<div style="margin-top: 70px; align-content: center; text-align: center;">
		로그인이 필요한 서비스입니다. <br> <br>
		<button onclick="location.href='index.jsp?main=login/loginform.jsp'" class="logoutbtn">로그인</button>
		<button onclick="location.href='index.jsp'" class="logoutbtn">홈으로 돌아가기</button>
	</div>
<%}else{%>
	<jsp:include page="logoutform.jsp"/>
<%}


%>
</body>
</html>

