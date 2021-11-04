<%@page import="data.dao.BoardDao"%>
<%@page import="data.dto.BoardPage"%>
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

String userId = request.getParameter("userId");
String myBoardBtnName = request.getParameter("myBoardBtnName");

if(myBoardBtnName == "내 게시글"){
	response.sendRedirect("index.jsp?main=qna/board.jsp");

}else{
	response.sendRedirect("index.jsp?main=qna/board.jsp?userId="+userId);	
}
 

%>
</body>
</html>