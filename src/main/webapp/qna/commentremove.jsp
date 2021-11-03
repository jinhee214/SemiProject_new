<%@page import="data.dao.CommentDao"%>
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

//댓글 id를 받아서 삭제
String commentId = request.getParameter("commentId");
String boardId = request.getParameter("boardId");

CommentDao dao = new CommentDao();
dao.deleteComment(commentId);

//해당 게시글을 다시 보여주기
response.sendRedirect("../index.jsp?main=qna/boarddetail.jsp?boardId="+boardId);

%>
</body>
</html>