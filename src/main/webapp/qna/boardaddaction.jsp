<%@page import="data.dao.BoardDao"%>
<%@page import="data.dto.BoardDto"%>
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

//board에 적은 데이터 가져오기 (userid, 카테고리, 제목, 내용)
String id = (String)session.getAttribute("myid");			//수정 필요
//String id = "admin";										//수정 필요
int category = Integer.parseInt(request.getParameter("category"));
String subject = request.getParameter("subject");
String content = request.getParameter("content");

//데이터 DB에 저장하기
BoardDto dto = new BoardDto(id, category,subject,content);
BoardDao dao = new BoardDao();
dao.insertBoard(dto);

response.sendRedirect("../index.jsp?main=qna/board.jsp");


%>
</body>
</html>