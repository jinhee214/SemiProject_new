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

</style>

<script type="text/javascript">
function showCategory(){
	var c = $("#selCategory").val();
	
	$("#categoryVal").text(c);
	
	console.log($("#categoryVal").text(c));
}

</script>


<%
//게시판 리스트 뿌려주기 위한 객체 선언
BoardDao bDao = new BoardDao();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
String[] category = {"","mac", "iPhone", "iPad", "accessory", "기타문의"};

//답변 상태 확인을 위한 객체 선언
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

//각 글 앞에 붙일 시작번호 구하기
no = totalCount-(currentPage-1)*perPage;

%>


</head>
<body>
<div id="categoryVal" hidden=""></div>
<!-- 메인 화면 부분 -->
<button class="btn btn-info" onclick="location.href='index.jsp?main=qna/boardaddform.jsp'">질문하기</button>
<select id="selCategory" onchange="showCategory()">
<option value="0">전체</option>
<option value="1">Mac</option>
<option value="2">iPad</option>
<option value="3">iPhone</option>
<option value="4">액세서리</option>
<option value="5">기타</option>
</select>
<%

//게시글이 1개 이상일 경우
if(no>0){
	%>
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
//각 페이지에서 필요한 게시글 가져오기
List<BoardDto> list = bDao.getList(start, perPage);

// 리스트 뿌려주는 부분
for(BoardDto dto : list){	
	String apply = cmDao.getCommentsByBoardId(dto.getBoardId()).size()==0? "미답변":"답변";
	%>
	<tr>
	<td><%=no-- %></td>
	<td><%=category[dto.getCategoryId()] %></td>
	<td><%=dto.getUserId() %></td>
	<td style="width: 700px;"><a href="index.jsp?main=qna/boarddetail.jsp?boardId=<%=dto.getBoardId()%>"><%=dto.getSubject() %></a></td>
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
if(startPage > 1){
	%>
	<li>
	<a href="index.jsp?main=qna/board.jsp?currentPage=<%=startPage-1%>">이전</a>
	</li>
	<%
}
for(int p = startPage; p <= endPage; p++){
	if(p == currentPage){
		%>
		<li class="active">
		<a href="index.jsp?main=qna/board.jsp?currentPage=<%=p %>"><%=p %></a>
		</li>
		<%
	}
	else{
		%>
		<li>
		<a href="index.jsp?main=qna/board.jsp?currentPage=<%=p %>"><%=p %></a>
		</li>
		<%
	}
	
}

if(endPage < totalPage){
	%>
	<li>
	<a href="index.jsp?main=qna/board.jsp?currentPage=<%=endPage+1%>">다음</a>
	</li>
	<%
}

%>

</ul>
</div>



</body>
</html>