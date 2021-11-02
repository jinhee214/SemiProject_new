<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.CategoryDao"%>
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

<script type="text/javascript">
function addComment(){
	
	
}
</script>
<%
//선택한 게시글 id
int boardId = Integer.parseInt(request.getParameter("boardId"));
//현재 로그인 한 id
//String id = (String)session.getAttribute("myid");		35줄 수정 필요

BoardDao dao = new BoardDao();
BoardDto dto = dao.getOneBoard(boardId);

//선택한 카테고리 이름
String category = new CategoryDao().getNameById(dto.getCategoryId());

//로그인 한 계정이 관리자 인지
UserDao uDao = new UserDao();
String answer = uDao.getUser("admin").getIs_admin();
boolean isAdmin = answer.equalsIgnoreCase("Y")? true:false;

//해당 게시글 댓글 얻기
CommentDao cDao = new CommentDao();
List<CommentDto> list = cDao.getCommentsByBoardId(boardId);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

%>
</head>
<body>
<div class="alert alert-info" align="center"><h3><b>상품 Q&A</b></h3></div>
<div align="right">
<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=qna/board.jsp'">뒤로가기</button>
</div>

<form action="qna/commentadd.jsp" method="post">
<input type="hidden" name="boardId" value="<%=dto.getBoardId()%>">
<table class="table">
<tr>
<th>작성자</th>
<td align="left"><%=dto.getUserId() %></td>
</tr>
<tr>
<th width="120px;">카테고리</th>
<td align="left"><%=category %></td>
</tr>
<tr>
<th>문의 제목</th>
<td align="left"><%=dto.getSubject() %></td>
</tr>
<tr>
<td colspan="2" >
<div style="height:200px; border: 1px solid #bdc3c7; border-radius: 10px; padding: 10px 20px;"><%=dto.getContent().replace("\n", "<br>") %></div>
</td>
</tr>
</table>
<%
if(list != null){
	for(CommentDto cDto : list){
		%>
		<div style="margin-left: 100px; width: 1000px;">
		<span class="glyphicon glyphicon-chevron-down"></span>
		<table class="table">
		<tr>
		<td><span class="glyphicon glyphicon-user"></span> <%=uDao.getName(cDto.getUserId())%></td>
		<td align="right"><%=sdf.format(cDto.getWriteday()) %></td>
		<td width="30px;"><a style="text-decoration: none" href="qna/commentremove.jsp"><span class="glyphicon glyphicon-remove"></span></a></td>
		</tr>
		<tr>
		<td colspan="3"><div><%=cDto.getContent().replace("\n", "<br>") %></div>
		</tr>
		</table>
		</div>
				
		
		<%
		
	}
		
}

if(isAdmin){
%>

<div style="margin-left: 100px;">
<span class="glyphicon glyphicon-chevron-down"></span>
<table>
<tr>
<td colspan="2"><span class="glyphicon glyphicon-user"></span> 관리자</td>
</tr>
<tr>
<td><textarea rows="5" cols="120" class="form-control" name="comment"></textarea></td>
<td><button type="submit" class="btn btn-default" style="width: 100px; height: 100px; margin-left: 10px;">등록</button>
</td>
</tr>
</table>
</div>
<%
} 
%>

</form>
</body>
</html>