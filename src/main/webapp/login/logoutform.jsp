<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
<title>Insert title here</title>
</head>

<body>
<div style="margin-left:100px; margin-top:50px;">
	<img alt="" src="image/mainImg.png" width="200" align="left" hspace="20">
	
	<%
		//세션으로 아이디를 얻는다
			String myid=(String)session.getAttribute("myid");
			
			//db로부터 아이디에 해당하는 이름을 얻는다.
			UserDao dao=new UserDao();
			String name=dao.getName(myid);
			
		%>
	<br><br>
	<b><%=name %>님이 로그인 하셨습니다.</b><br><br><br>
	<table class="table table-bordered" style="width: 800px;">
	<caption><b>전체 회원 목록</b></caption>
	<tr>
		<th width="100"  bgcolor="skyblue">아이디</th>
			<td>아이디</td>
	</tr>

	<tr>
		<th width="100"  bgcolor="skyblue">이름</th>
			<td><%=name %></td>
	</tr>
	
		<tr>
		<th width="100"  bgcolor="skyblue">전화번호</th>
			<td>전화번호</td>
	</tr>
	
		<tr>
		<th width="100"  bgcolor="skyblue">주소</th>
			<td>주소</td>
	</tr>
	
		<tr>
		<th width="100"  bgcolor="skyblue">가입일자</th>
			<td>가입일자</td>
	</tr>

</table>

<%
//전체 멤버정보 가져오기

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;
%>

	
	<button type="button" class="btn btn-info" style="width:100px;" 
	onclick="location.href='index.jsp?main=user/updatecheckpass.jsp?id=<%=myid%>'">회원정보</button>
	<br><br>
	
	<button type="button" class="btn btn-danger" style="width:100px;"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	<br><br>
	
	<button type="button" class="btn btn-danger btn-xs" style="width:50px;"
	onclick="delfunc(<%=myid%>)">탈퇴</button>	
	
			

<!--삭제 모달창과 자바스크립트 코드 추가  -->

<!-- 삭제모달 -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">탈퇴 비밀번호 입력</h4>
      </div>
      
      <div class="modal-body form-inline">
      <input type="hidden" id="delid">
        <b>비밀번호: </b>
          <input type="password" id="delpass" class="form-control" style="width: 120px;">
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default delbtn" data-dismiss="modal">탈퇴</button>
      </div>
    </div>

  </div>
</div>

<!-- 자바스크립트로 처리 -->

<script type="text/javascript">

function delfunc(id) {
	
	$("#delid").val(id);
	$("#myModal").modal();
	
	
	//모달삭제버튼이벤트
	$("button.delbtn").click(function(){
		
		var id=$("#delid").val();
		var pass=$("#delpass").val();
		//삭제파일 호출
		location.href="user/deleteuser.jsp?id="+id+"&pass="+pass;
	});
	
}


</script>
	
	
	
</div>
</body>
</html>

