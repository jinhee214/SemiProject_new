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
caption{
	color: black;
	font-weight: bold;
	font-size:2em;
}
td{
	text-align: left;
	font-size: 0.9em;
	color:gray;
}

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
			UserDto dto=dao.getUser(myid);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
	
	%>
	<br><br>
	<table style="width:800px;">
	<caption><b><%=dto.getUser_name() %>님. 안녕하세요.</b>
	<br><br><br><br>
	<b>계정 설정<br><br></b>
	</caption>
	
	<tr>
		<th>개인정보</th>
			<td>아이디</td>
			<td><%=dto.getUser_id()%></td>
	</tr>
	
	<tr>
		<th><br><br></th>
			<td>이름</td>
			<td><%=dto.getUser_name()%></td>
	</tr>
	
	<tr>
		<th><br><br></th>
		<td>전화번호</td>
			<td><%=dto.getUser_hp()%></td>
	</tr>
	
	<tr>
		<th><br><br></th>
		<td>주소</td>
			<td><%=dto.getUser_addr()%></td>
	</tr>
	
	<tr>
		<th><br><br></th>
		<td>가입일자</td>
			<td><%=sdf.format(dto.getUser_joinday())%></td>
	</tr>
	
	<tr>
		<th><br><br></th>
		<td>포인트</td>
			<td><%=dto.getUser_point()%> pt</td>
	</tr>
	
	<tr>
		<th><br><br></th>
		<td><a href="index.jsp?main=user/updatecheckpass.jsp?id=<%=myid%>" class="update">정보 수정></a></td>
	</tr>	
	
	<tr>
		<th><br><br></th>
		<td><button type="button" class="btn btn-danger btn-xs" style="width:50px;"
		onclick="delfunc(<%=myid%>)">탈퇴</button></td>
	</tr>		
	
</table>



	
			

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
        <button type="button" class="btn btn-default delbtn" data-dismiss="modal" onclick="delfunc(this)" id="<%=myid%>">탈퇴</button>
      </div>
    </div>

  </div>
</div>

<!-- 자바스크립트로 처리 -->

<script type="text/javascript">

function delfunc(id) {
	
	$("#delid").val(id); //id값
	$("#myModal").modal(); //mymodal

	
	//모달삭제버튼이벤트
	$("button.delbtn").click(function(){
		
		$(this).attr("id")
		var id=$(this).attr("id")
		var pass=$("#delpass").val();
		//삭제파일 호출
		location.href="user/deleteuser.jsp?id="+id+"&pass="+pass;
	});
	
}


</script>
	
	
	
</div>
</body>
</html>

