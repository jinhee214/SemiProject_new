<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.BoardPage"%>
<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.CategoryDao"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
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

<style type="text/css">
.container{
display: flex;
justify-content: center;
margin-top : 50px;
}

.pagination>li.active>a {
  background: #d33b33;
  color: white;
  border: 1px solid #d33b33;
}

.pagination>li.active>a:hover {
  background: #e99a96;
  color: black;
  border: 1px solid #d33b33;
  
}

.pagination>li>a{
	color:black;
}

</style>

<%

//현재 로그인 한 id
String id = (String)session.getAttribute("myid");

//카테고리를 따로 안 정해주면 전체로 보여짐
int categoryIndex = Integer.parseInt(request.getParameter("categoryIndex"));

//게시판 리스트 뿌려주기 위한 객체 선언
BoardDao bDao = new BoardDao();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
String[] category = {"","Mac", "iPad", "iPhone", "Accessory", "기타문의"};

//답변 상태 확인을 위한 객체 선언
CommentDao cmDao = new CommentDao();

UserDao uDao = new UserDao();

//카테고리별 리스트를 받아 오기 때문에 선언만


//페이징 처리가 너무 길어서 data.dto.BoardPage class로 만듬
BoardPage bp = new BoardPage(bDao.getTotalCount(categoryIndex),request.getParameter("currentPage"));

List<BoardDto> list = bDao.getList(bp.start, bp.perPage, categoryIndex);	

%>

</head>
<body>
<!-- 메인 화면 부분 -->

<!-- 상단 그림 부분 -->
<div>
<img alt="" src="image/boardimg/boardtop<%=categoryIndex %>.PNG" style="width:1300px; margin-bottom:40px;">
</div>


<!-- 게시글 추가 -->
<div align="right" style="margin: 0 30px 10px 0; font-weight: 700; font-size: 13pt;">
<a href="index.jsp?main=qna/boardaddform.jsp">질문하기 <span class="glyphicon glyphicon-chevron-right"></span></a>
</div>
<%


//게시글이 1개 이상일 경우
if(bp.no>0){
	%>
<table class="table table-bordered">
<tr>
<!-- <th>NO</th> -->
<th>분류</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>답변상태</th>
</tr>
<%


// 리스트 뿌려주는 부분
for(BoardDto dto : list){	
	String apply = cmDao.getCommentsByBoardId(dto.getBoardId()).size()==0? "미답변":"답변";
	String name = uDao.getName(dto.getUserId());
	%>
	<tr>
	<%-- <td><%=bp.no-- %></td> --%>
	<td><%=category[dto.getCategoryId()] %></td>
	<td style="width: 700px;"><a href="index.jsp?main=qna/boarddetail.jsp?boardId=<%=dto.getBoardId()%>"><%=dto.getSubject() %></a></td>
	<td><%=name %></td>
	<td><%=sdf.format(dto.getWriteday())%></td>
	<td><%=apply %></td>
	</tr>
	<%	
}

%>
</table>
<%
}
//게시글이 없을 경우
else{
	%>
	<div class="alert alert-info">게시글이 존재하지 않습니다.</div>
	
	<%
}
%>

<!-- 페이징 처리 -->
<div class="container">
<ul class="pagination">
<%

//이전
if(bp.startPage > 1){
	%>
	<li>
	<a href="index.jsp?main=qna/boardUser.jsp?categoryIndex=<%=categoryIndex %>&currentPage=<%=bp.startPage-1%>">이전</a>
	</li>
	<%
}
for(int p = bp.startPage; p <= bp.endPage; p++){
	if(p == bp.currentPage){
		%>
		<li class="active">
		<a href="index.jsp?main=qna/boardUser.jsp?categoryIndex=<%=categoryIndex %>&currentPage=<%=p %>"><%=p %></a>
		</li>
		<%
	}
	else{
		%>
		<li>
		<a href="index.jsp?main=qna/boardUser.jsp?categoryIndex=<%=categoryIndex %>&currentPage=<%=p %>"><%=p %></a>
		</li>
		<%
	}
	
}

if(bp.endPage < bp.totalPage){
	%>
	<li>
	<a href="index.jsp?main=qna/boardUser.jsp?categoryIndex=<%=categoryIndex %>&currentPage=<%=bp.endPage+1%>">다음</a>
	</li>
	<%
}

%>

</ul>
</div>

<div class="alert alert-default" style="background-color: #dfe6e9">
구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요.<br>
- 평일 9:00 ~ 18:00(점심 12:00 ~ 13:00)<br>
- 토, 일, 공휴일 휴무<br>
</div>


</body>
</html>