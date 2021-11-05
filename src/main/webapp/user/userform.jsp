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


</style>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	//아이디 중복확인 체크
	$("#btnidcheck").click(function(){
		
		window.open("user/idsearch.jsp","","width=600px, height=200px, left=500px;");
		
	});
});

//check
function check(f){
	
	if(f.id.value.length==0){
		alert('아이디 입력을 해주세요');
		return false; 
		
	}
	
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다.");
		f.pass.value="";
		f.pass2.value="";
		return false; //action이 호출되지 않는다
	}
	
}

</script>

</head>
<body>
<form action="user/useraddaction.jsp" method="post" class="form-inline" name="memberfrm"
onsubmit="return check(this)">
	<table style="width:500px;">
		<caption><b>Apple ID 생성</b></caption>
		
			<tr>
				<td colspan="2">
				 <b style="font-size:0.9em;">하나의 Apple ID로 모든 Apple 서비스를 이용할 수 있습니다.</b><br>
				 <b style="font-size:0.9em;">Apple ID를 가지고 계십니까?</b>
				 <a href="index.jsp?main=login/loginmain.jsp">로그인하기></a>
				 <br><br>
				</td>
			</tr>		
		
			<tr>
				<td  colspan="2">
					<input type="text" name="id" maxlength="8" class="form-control"
					required="required" style="width: 220px;" readonly="readonly" placeholder="Apple ID">
					
					<button type="button" class="btn btn-danger btn-sm" id="btnidcheck" style="width: 80px;">중복확인</button>
					<br><br>
				</td>
			</tr>
	
			<tr>
				<td colspan="2">
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 150px;" placeholder="비밀번호">
					
					<input type="password" name="pass2" class="form-control"
					required="required" style="width: 150px;" placeholder="비밀번호확인">
					<br><br>
				</td>
			</tr>
			 
			<tr>
				<td colspan="2">
					<input type="text" name="name" class="form-control"
					required="required" style="width: 300px;" placeholder="이름">
					<br><br>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="text" name="hp" class="form-control"
					required="required" style="width: 300px;" placeholder="전화번호">
					<br><br>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="text" name="addr" class="form-control"
					required="required" style="width: 300px;" placeholder="주소">
					<br><br>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="submit" class="submit" style="width:60px;" id="savepoint">가입</button>
			</tr>
			
	</table>	
</form>
</body>
</html>

