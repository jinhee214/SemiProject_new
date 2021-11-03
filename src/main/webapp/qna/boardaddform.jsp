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
<link rel="stylesheet" type="text/css" href="qna/boardaddform.css">
<style type="text/css">
.notice{
background-color: #dfe6e9; 
color: gray; 
padding: 20px 20px;
}

</style>
</head>
<body>

<div class="alert alert-info" align="center"><h3><b>상품 Q&A</b></h3></div>
<form action="qna/boardaddaction.jsp" method="post">
<table class="table">
<tr>
<th>카테고리</th>
<td style="padding-left: 50px;">
<select class="form-control" style="width: 115px;" name="category">
<option value="1">mac</option>
<option value="2">ipad</option>
<option value="3">iphone</option>
<option value="4">accessory</option>
<option value="5">기타문의</option>
</select>
</td>
</tr>
<tr>
<th>문의 제목</th>
<td align="center"><input type="text" name="subject" style="width: 1000px;" class="form-control"></td>
</tr>
<tr>
<td colspan="2"><textarea rows="10" cols="100" name="content" class="form-control" placeholder="문의하실 내용을 입력하세요"></textarea></td>
</tr>
</table>

<table class="table">
<tr >
<td><input type="button" value="취소" class="btn btn-default btn-block" onclick="history.back()"></td>
<td><input type="submit" value="등록" class="btn btn-primary btn-block"></td>
</tr>
</table>
</form>
<p><span class="glyphicon glyphicon-alert"></span> 문의하신 내용에 대한 답변은 <a href="index.jsp?main=qna/board.jsp" style="text-decoration: underline;">'메뉴 > 고객지원'</a>에서 확인하실 수 있습니다.</p>
<div class="notice">
상품 Q&A는 상품 및 상품 구매 과정에 대해 판매자에게 문의하는 게시판 입니다.<br><br>
상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 <br>글쓰기 제한 및 게시글이 삭제 조치될 수 있습니다.<br><br>
전화번호, 이메일 등 개인 정보가 포함된 글로 문의 하지 않도록 유의하여 주시기 바랍니다.<br><br>

</div>
</body>
</html>