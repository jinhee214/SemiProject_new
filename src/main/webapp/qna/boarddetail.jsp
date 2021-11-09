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

<style type="text/css">
.notice{
background-color: #dfe6e9; 
color: gray; 
padding: 20px 20px;
}
</style>

<script type="text/javascript">

/* 댓글 삭제 이벤트 */
function removeComment(remove){
	var commentId=$(remove).attr("commentId");
	$.ajax({
		type:"get",
		dataType:"html",
		url:"qna/commentremove.jsp",
		data:{"commentId":commentId},
		success:function(){
			//새로고침
			location.reload();
		}
	});
}


</script>
<%

//선택한 게시글 id
int boardId = Integer.parseInt(request.getParameter("boardId"));

//로그인 상태 확인
String loginok = (String)session.getAttribute("loginok");
//현재 로그인 한 id
String id = (String)session.getAttribute("myid");


//로그인 한 계정이 관리자 인지(로그인 안했을 경우도 N)
UserDao uDao = new UserDao();
String answer = (loginok==null)?"N":uDao.getUser(id).getIs_admin();	

boolean isAdmin = answer.equalsIgnoreCase("Y")? true:false;

BoardDao dao = new BoardDao();
BoardDto dto = dao.getOneBoard(boardId);

//선택한 카테고리 이름
String category = new CategoryDao().getNameById(dto.getCategoryId());
category = category.equals("etc")?"기타문의":category;



//해당 게시글 댓글 얻기
CommentDao cDao = new CommentDao();
List<CommentDto> list = cDao.getCommentsByBoardId(boardId);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

%>
</head>
<body>
<!-- 게시글 추가 폼 -->
<div class="alert alert-default" align="center"><h2 style="margin-bottom: 30px;"><b>어떤 문제가 있나요?<br>
</b></h2>
<h4>문제에 대한 답변을 드릴 예정입니다. 질문에 대한 답변은 2~3일 소요될 예정이니 조금만 기다려 주세요.</h4></div>

<div align="right">
<!-- 관리자 이거나 해당 게시글 회원이면 삭제하기 버튼 보이게 하기 -->
<%
if(loginok != null){
	if(isAdmin || dto.getUserId().equals(id)){							//수정 필요
		%>
		<div align="right" style="margin: 0 30px 10px 0; font-weight: 700; font-size: 13pt;">
		<a href="qna/boardremove.jsp?boardId=<%=boardId%>">삭제하기 <span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
		<%
	}
}
%>
<div align="right" style="margin: 0 30px 10px 0; font-weight: 700; font-size: 13pt;">
<a href="#" onclick="history.back()">뒤로가기 <span class="glyphicon glyphicon-chevron-right"></span></a>
</div>
</div>

<!-- 문의 상세 내용 보이는 폼 -->
<form action="qna/commentadd.jsp" method="post">
<input type="hidden" name="boardId" value="<%=dto.getBoardId()%>">
<table class="table">
<tr>
<th>작성자</th>
<td align="left"><%=uDao.getName(dto.getUserId()) %></td>
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


<!-- 관리자 댓글 -->
<%

// 댓글 추가
if(isAdmin){
%>

<div style="margin: 0px 100px;">
<span class="glyphicon glyphicon-user"></span> 관리자
<div style="display:flex;">
<textarea rows="5" cols="70" class="form-control" name="comment"></textarea>
<button type="submit" class="btn btn-default" style="width: 100px; height: 100px; margin-left: 10px;">등록</button>
</div>
</div>
<%
}
%>
</form>

<!-- 댓글 보여주기 -->
<%
if(list != null){
	for(CommentDto cDto : list){
		%>
		
		<div style="margin: 20px 100px; width: 1000px;">
		<div><span class="glyphicon glyphicon-user"></span> <%=uDao.getName(cDto.getUserId())%>&nbsp;&nbsp;&nbsp;
		<span style="font-size: 10pt;"><%=sdf.format(cDto.getWriteday()) %></span>
		<%
		 if(isAdmin){
		%> 
		<a style="text-decoration: none" onclick="removeComment(this)" commentId="<%=cDto.getCommentId() %>"><span class="glyphicon glyphicon-remove"></span></a>
		<%
		}
		%>
		</div>
	
		<div><%=cDto.getContent().replace("\n", "<br>") %></div>
		<hr>	
		</div>

		<%		
	}
}
%>

<!-- 안내사항 구역 -->
<p style="margin-top:50px;"><span class="glyphicon glyphicon-alert"></span> 문의하신 내용에 대한 답변은 <a href="index.jsp?main=qna/boardMenu.jsp" style="text-decoration: underline;">'메뉴 > 고객지원'</a>에서 확인하실 수 있습니다.</p>
<div class="notice">
상품 Q&A는 상품 및 상품 구매 과정에 대해 판매자에게 문의하는 게시판 입니다.<br><br>
상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 <br>글쓰기 제한 및 게시글이 삭제 조치될 수 있습니다.<br><br>
전화번호, 이메일 등 개인 정보가 포함된 글로 문의 하지 않도록 유의하여 주시기 바랍니다.<br><br>

</div>


</body>
</html>