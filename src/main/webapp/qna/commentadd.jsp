<%@page import="data.dto.CommentDto"%>
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
request.setCharacterEncoding("utf-8");

//관리자 댓글 데이터 get
int boardId = Integer.parseInt(request.getParameter("boardId"));
String userId = (String)session.getAttribute("myid");
String comment = request.getParameter("comment");

//데이터 db에 추가
CommentDao dao = new CommentDao();
CommentDto dto = new CommentDto(boardId, userId, comment);

dao.insertComment(dto);

//해당 게시글 다시 보여주기
response.sendRedirect("../index.jsp?main=qna/boarddetail.jsp?boardId="+boardId);

%>

</body>
</html>