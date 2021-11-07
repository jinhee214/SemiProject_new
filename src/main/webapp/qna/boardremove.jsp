<%@page import="data.dao.BoardDao"%>
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

//게시글 id를 받아서 삭제
String boardId = request.getParameter("boardId");

BoardDao dao = new BoardDao();
dao.deleteBoard(boardId);

//게시판으로 이동
response.sendRedirect("../index.jsp?main=qna/boardMenu.jsp");

%>

</body>
</html>