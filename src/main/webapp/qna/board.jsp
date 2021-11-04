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

</style>

<script type="text/javascript">
//선택한 카테고리 value를 넘기기
function sendCategory(){
	var category = $("#selCategory").val();
	location.href="index.jsp?main=qna/board.jsp?categoryIndex="+category;
}

//내 게시물 선택시 id값 넘기기 
function sendMyBoard(){
	var userId = $("#selMyBoard").attr("name");
	var myBoardBtnName = $("#selMyBoard").text(); 
	
	if (myBoardBtnName == "내 게시글") {
		location.href= "index.jsp?main=qna/board.jsp?userId="+userId;	
	} 
	else {
		location.href = "index.jsp?main=qna/board.jsp"
	}

}
</script>

<%
//현재 로그인 한 id
String id = (String)session.getAttribute("myid");

//카테고리를 따로 안 정해주면 전체로 보여짐
String categoryIndex = request.getParameter("categoryIndex")==null? "0":request.getParameter("categoryIndex");

//내 게시글 보기
String userId = request.getParameter("userId");		
String btnName = (userId == null)? "내 게시글":"전체 게시글";


//게시판 리스트 뿌려주기 위한 객체 선언
BoardDao bDao = new BoardDao();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
String[] category = {"전체","Mac", "iPad", "iPhone", "Accessory", "기타문의"};

//답변 상태 확인을 위한 객체 선언
CommentDao cmDao = new CommentDao();

//카테고리별 리스트를 받아 오기 때문에 선언만
List<BoardDto> list;	

//페이징 처리가 너무 길어서 data.dto.BoardPage class로 만듬
BoardPage bp = new BoardPage(bDao.getTotalCount(),request.getParameter("currentPage"));

/* 내 게시글을 선택했을 때 */
if(userId != null){
	bp = new BoardPage(bDao.getTotalCount(userId),request.getParameter("currentPage"));
	
	list = bDao.getList(bp.start, bp.perPage, userId);
}
/* 카테고리가 전체일때 */
else if(categoryIndex.equals("0")){

	//전체 게시글 리스트에 넣어주기
	list = bDao.getList(bp.start, bp.perPage);

}
/* 카테고리가 일부일때 */
else{
	
	//카테고리가 달라지면 total 개수가 달라지므로 새로 객체 생성
	bp = new BoardPage(bDao.getTotalCount(Integer.parseInt(categoryIndex)),request.getParameter("currentPage"));
	
	//카테고리에 해당하는 게시글 리스트에 넣어주기
	list = bDao.getList(bp.start, bp.perPage, Integer.parseInt(categoryIndex));
	
}
%>

</head>
<body>
<!-- 메인 화면 부분 -->

<!-- 알림 부분 -->
<h3>Q&A</h3>
<div class="alert alert-default" style="background-color: #dfe6e9">
구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요.<br>
- 평일 9:00 ~ 18:00(점심 12:00 ~ 13:00)<br>
- 토, 일, 공휴일 휴무<br>
</div>

<!-- 카테고리 선택 부분 -->
<select id="selCategory" onchange="sendCategory()">
<%
for(int i = 0; i < category.length; i++){ 
	//카테고리 선택된 값을 보여지게 하기
	if(categoryIndex.equals(String.valueOf(i))){
		%>
		<option value="<%=i %>" selected="selected"><%=category[i] %></option>
		<%
	}else{
		%>
		<option value="<%=i %>"><%=category[i] %></option>
		<%		
	}
%>

<%
} %>
</select>



<!-- 게시글 추가 -->
<%
//회원이 아닐 때는 내 게시글 확인 부분 없으며, 게시글을 쓰지 못하게
if(id != null){
%>
	<button type="button" onclick="sendMyBoard()" id="selMyBoard" class="btn btn-default" name="<%=id%>"><%=btnName %></button>
	<button class="btn btn-info" onclick="location.href='index.jsp?main=qna/boardaddform.jsp'">질문하기</button>
<%
}

//게시글이 1개 이상일 경우
if(bp.no>0){
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


// 리스트 뿌려주는 부분
for(BoardDto dto : list){	
	String apply = cmDao.getCommentsByBoardId(dto.getBoardId()).size()==0? "미답변":"답변";
	%>
	<tr>
	<td><%=bp.no-- %></td>
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
if(bp.startPage > 1){
	%>
	<li>
	<a href="index.jsp?main=qna/board.jsp?currentPage=<%=bp.startPage-1%>">이전</a>
	</li>
	<%
}
for(int p = bp.startPage; p <= bp.endPage; p++){
	if(p == bp.currentPage){
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

if(bp.endPage < bp.totalPage){
	%>
	<li>
	<a href="index.jsp?main=qna/board.jsp?currentPage=<%=bp.endPage+1%>">다음</a>
	</li>
	<%
}

%>

</ul>
</div>



</body>
</html>