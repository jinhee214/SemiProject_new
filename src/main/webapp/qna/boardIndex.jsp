<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%
String loginok = (String)session.getAttribute("loginok");

if(loginok == null){
%>
<jsp:include page="board.jsp"></jsp:include>
<%
}
else{
%>
	<jsp:include page="boardUser.jsp"></jsp:include>
<%
}
%>

</body>
</html>