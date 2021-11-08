<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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

button.pointbtn {
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
String root = request.getContextPath();

//아이디 얻기
String myid=(String)session.getAttribute("myid");

//db로부터 가입한 이름 얻기
UserDao dao=new UserDao();
UserDto dto=dao.getUser(myid);

%>
<%
//loginok 는 로그인 성공시 저장하고 로그아웃시 제거
if(loginok==null)
{%>
	<div style="margin-top: 70px; align-content: center; text-align: center;">
		로그인이 필요한 서비스입니다. <br> <br>
		<button onclick="location.href='index.jsp?main=login/loginform.jsp'" class="pointbtn">로그인</button>
		<button onclick="location.href='index.jsp'" class="pointbtn">홈으로 돌아가기</button>
	</div>
<%}else{%>
	<div style="margin-top: 70px; align-content: center; text-align: center;">
		<b>포인트를 충전하기 위해서는 아래 버튼을 클릭해 주십시오</b> <br> <br>
		<b>현재 포인트: <%=dto.getUser_point() %></b> <br> <br>
		<button onclick="location.href='index.jsp?main=user/pointcheckpass.jsp?id=<%=myid%>'" class="pointbtn">충전</button>
	</div>
<%}


%>
</body>
</html>

