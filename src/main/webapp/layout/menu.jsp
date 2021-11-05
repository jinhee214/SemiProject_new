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
.menu-bar{
	display: flex;
	justify-content: space-around;
	margin-right: 70px;
	list-style: none;
}
</style>


<%
String root = request.getContextPath();
%>
</head>
<body>


<div class="wrap">
<ul class="menu-bar">
<li><a href="<%=root %>/index.jsp?main=product/maclist.jsp">Mac</a>
<li><a href="<%=root %>/index.jsp?main=product/iPadlist.jsp">iPad</a></li>
<li><a href="<%=root %>/index.jsp?main=product/iPhonelist.jsp">iPhone</a></li>
<li><a href="<%=root %>/index.jsp?main=product/accessorylist.jsp">액세서리</a></li>
<li><a href="<%=root %>/index.jsp?main=qna/boardIndex.jsp">고객지원</a></li>
<li><a href="<%=root %>/index.jsp?main=login/loginmain.jsp">개인정보</a></li>
</ul>
</div>

</body>
</html>