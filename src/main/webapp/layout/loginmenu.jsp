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
</head>
<body>
 <div style="float:right; padding-right:75px;">
<%
//로그인중인지...세션값 얻기
String loginok=(String)session.getAttribute("loginok");

//아이디 얻기
String myid=(String)session.getAttribute("myid");

//db로부터 가입한 이름 얻기
UserDao dao=new UserDao();
String name=dao.getName(myid);
UserDto dto=dao.getUser(name);

//title 표시
if(loginok==null){
%>
	<button type="button" class="btn btn-default btn-sm" 
	style="width:100px;"
	onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
<%}

else{%>
	<b style="font-size:10pt;">Apple ID:<%=name %>님 / Point:<%=dto.getUser_point() %>pt </b>
	<button type="button" class="btn btn-danger btn-sm"
	style="width:100px;" 
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	<button type="button" class="btn btn-info btn-sm"
	style="width:100px;" 
	onclick="location.href='index.jsp?main=cart/cart.jsp'">장바구니</button>
<%}

%>
</div>
</body>
</html>

