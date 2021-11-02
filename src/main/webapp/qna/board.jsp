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

<%
//db선언
BoardDao bDao = new BoardDao();
CategoryDao cDao = new CategoryDao();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
CommentDao cmDao = new CommentDao();


/* List<SimpleDto> list = dao.getAllData(); */

int totalCount;		//총 개수
int totalPage;		//총 페이지 수
int startPage;		//각 블럭의 시작페이지
int endPage;		//각 블럭의 끝페이지
int start; 			//각 페이지의 시작번호
int perPage=3;		//한 페이지에 보여질 글의 개수
int perBlock=3;		//한 페이지에 보여지는 페이지 개수
int currentPage;	//현재 페이지
int no;

//총 개수
totalCount = bDao.getTotalCount();

//현재 페이지 번호 읽기
if(request.getParameter("currentPage")==null){
	currentPage = 1;
}
else{
	
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

//총 페이지 개수 구하기
totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

//각 블럭의 시작 페이지
//예 : 현재 페이지:3 startPage:1, endpage:3
//예 : 현재 페이지:5 startPage:4, endpage:6

startPage = (currentPage-1)/perBlock*perBlock+1;
endPage = startPage+perBlock-1;

if(endPage > totalPage){
	endPage = totalPage;
}

//각 페이지에서 불러올 시작 번호
start = (currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기
List<BoardDto> list = bDao.getList(start, perPage);

//각 글 앞에 붙일 시작번호 구하기
no = totalCount-(currentPage-1)*perPage;




%>


</head>
<body>

<button class="btn btn-info" onclick="location.href='index.jsp?main=qna/boardaddform.jsp'">질문하기</button>
<table class="table table-bordered">
<tr>
<th>NO</th>
<th>분류</th>
<th>작성자</th>
<th>제목</th>
<th>작성일</th>
<th>답변상태</th>
</tr>
<%
for(BoardDto dto : list){	
	String apply = cmDao.getCommentsByBoardId(dto.getBoardId()).size()==0? "미답변":"답변";
	%>
	<tr>
	<td><%=no-- %></td>
	<td><%=cDao.getNameById(dto.getCategoryId()) %></td>
	<td><%=dto.getUserId() %></td>
	<td style="width: 700px;"><a href="index.jsp?main=qna/boarddetail.jsp?boardId=<%=dto.getBoardId()%>"><%=dto.getSubject() %></a></td>
	<td><%=sdf.format(dto.getWriteday())%></td>
	<td><%=apply %></td>
	</tr>
	<%	
}


%>
</table>


</body>
</html>