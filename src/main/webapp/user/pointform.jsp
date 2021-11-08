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

</script>

</head>
<%
String id=request.getParameter("id"); 
UserDao dao=new UserDao();
UserDto dto=dao.getUser(id);


%>
<body>
<form action="user/pointaction.jsp" method="post" class="form-inline" name="userfrm"
onsubmit="return check(this)">
<!-- hidden  -->

	<table style="width:500px;">
		<caption><b>Point 충전</b></caption>
		<br><br>		
			<tr>
				<td colspan="2">
					현재 포인트
					<input type="number" name="point1" id="point1" class="form-control"
					required="required" style="width: 200px;" placeholder="포인트" readonly="readonly" 
					value="<%=dto.getUser_point()%>">
					<br><br>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<b>충전할 포인트를 입력해주세요</b> 
					<br><br>
					<input type="number" name="point2" id="point2" class="form-control"
					required="required" style="width: 200px;" placeholder="충전 포인트"
					value="">
					<br><br>
				</td>
			</tr>
			
					
			<tr>
				<td colspan="2">
					<button type="submit" class="submit" style="width:60px;">충전</button>
			</tr>
			
	</table>	
</form>
</body>
</html>

