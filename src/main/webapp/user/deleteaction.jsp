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
<style type="text/css">
.container,
.button  {
	display: flex;
	justify-content: center;
	align-item: center;	
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
//lokinok 세션 제거
session.removeAttribute("loginok");
%>
<div class="container">
<b>회원을 탈퇴하였습니다. Apple을 이용해 주셔서 감사합니다.</b>
</div>
<br><br>
<div class="button">
<button type="button" class="btn btn-default btn-sm" onclick="location.href='index.jsp'">홈으로 이동</button>
</div>
</body>
</html>

