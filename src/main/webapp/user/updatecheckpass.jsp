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
<style type="text/css">

.container {
	display: flex;
	justify-content: center;
	align-item: center;	
}

</style>

</head>
<body>
<%
String id=request.getParameter("id");
String key=request.getParameter("key");

if(key==null){ //form만 표시
%>
	
	<div class="container">
		<form action="user/updatecheckpass.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="key" value="yes">
				<b>비밀번호를 입력해주세요</b>
				<br><br>
				<div class="form-inline">
					<input type="password" name="pass" class="form-control" style="width:120px;"
					required="required" autofocus="autofocus">
						<button type="submit" class="btn btn-default">확인</button>
				
				</div>
		</form>
	</div>
		
<%
		}else //action 처리
		{
			//비번읽기
			String pass=request.getParameter("pass");
			//비번 맞나 체크
			UserDao dao=new UserDao();
			
			boolean b=dao.isPassEqual(id, pass);
			
			if(b){
				
				response.sendRedirect("../index.jsp?main=user/updateform.jsp?id="+id);
				
			}else
			{
		%>
		
		<script type="text/javascript">
		alert("비밀번호가 틀렸어요!!!");
		history.back();
		
		</script>
		
	<%}
}
%>
</body>
</html>
