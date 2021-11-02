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

<title>Insert title here</title>
<script type="text/javascript">

//check
function check(f){
	
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다.");
		f.pass.value="";
		f.pass2.value="";
		return false; //action이 호출되지 않는다
	}
	
}

</script>

</head>
<%
String id=request.getParameter("id"); 
UserDao dao=new UserDao();
UserDto dto=dao.getUser(id);

%>
<body>
<form action="user/updateaction.jsp" method="post" class="form-inline" name="userfrm"
onsubmit="return check(this)">
<!-- hidden  -->
<input type="hidden" name="id" value="<%=id %>">
	<table class="table table-bordered" style="width:500px;">
		<caption><b>회원정보 수정</b></caption>
		
			<tr>
				<th width="100" bgcolor="#aaa">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 120px;"
					value="<%=dto.getUser_pw()%>">
					
					<input type="password" name="pass2" class="form-control"
					required="required" style="width: 120px;"
					value="<%=dto.getUser_pw()%>">
				</td>
			</tr>
		
			
			<tr>
				<th width="100" bgcolor="#aaa">이름</th>
				<td>
					<input type="text" name="name" class="form-control"
					required="required" style="width: 120px;"
					value="<%=dto.getUser_name()%>">

				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-control"
					required="required" style="width: 200px;"
					value="<%=dto.getUser_hp()%>">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">주소</th>
				<td>
					<input type="text" name="addr" class="form-control"
					required="required" style="width: 400px;"
					value="<%=dto.getUser_addr()%>">
				</td>
			</tr>
			
					
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default" style="width:100px;">수정하기</button>
			</tr>
			
	</table>	
</form>
</body>
</html>

