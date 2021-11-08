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
	text-align:center;
}

td{

	text-align: center;
}

button.submit {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 5px;
	height: 30px;
	font-weight: bold;
	font-size:0.9em;
}

.form-inline {
	display: flex;
	justify-content: center;
	align-item: center;	
}

</style>
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
	<table style="width:500px;">
		<caption><b>Apple ID 수정</b></caption><br><br>
		
			<tr>
				<td  colspan="2">
					<input type="text" name="id" maxlength="8" class="form-control"
					required="required" style="width: 300px;" readonly="readonly" placeholder="Apple ID"
					value="<%=id%>">
					<br><br>
				</td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 150px;" placeholder="비밀번호"
					value="<%=dto.getUser_pw()%>">
					
					<input type="password" name="pass2" class="form-control"
					required="required" style="width: 150px;" placeholder="비밀번호확인"
					value="<%=dto.getUser_pw()%>">
					<br><br>
				</td>
			</tr>
		
			
			<tr>
				<td colspan="2">
					<input type="text" name="name" class="form-control"
					required="required" style="width: 300px;" placeholder="이름"
					value="<%=dto.getUser_name()%>">
					<br><br>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="text" name="hp" class="form-control"
					required="required" style="width: 300px;" placeholder="전화번호"
					value="<%=dto.getUser_hp()%>">
					<br><br>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="text" name="addr" class="form-control"
					required="required" style="width: 300px;" placeholder="주소"
					value="<%=dto.getUser_addr()%>">
					<br><br>
				</td>
			</tr>
			
					
			<tr>
				<td colspan="2">
					<button type="submit" class="submit" style="width:60px;">수정</button>
			</tr>
			
	</table>	
</form>
</body>
</html>

