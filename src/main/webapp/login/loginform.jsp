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

button.submit {
	color: white;
	background-color: #0077ed;
	border: none;
	border-radius: 10px;
	height: 50px;
	font-weight: bold;
}

.container {
	display: flex;
	justify-content: center;
	align-item: center;	
}


</style>
<title>Insert title here</title>
</head>
<%
//세션값 얻기
String saveok=(String)session.getAttribute("saveok");
String myid="";

if(saveok!=null)
	myid=(String)session.getAttribute("myid");
%>
<body>
<div class="container">
  <form action="login/loginaction.jsp" method="post" class="form-inline">
    <table style="width: 410px;">
       <caption><b>로그인.</b><br><br></caption>
         <tr>
           <td>
             <input type="text" name="id" class="form-control"
             required="required" style="width: 400px; border-radius: 10px; height: 50px;" 
             value="<%=myid%>" placeholder="Apple ID">
             <br><br>
           </td>
         </tr>
         <tr>
           <td>
             <input type="password" name="pass" class="form-control" 
             required="required" style="width: 400px; border-radius: 10px; height: 50px;" 
             placeholder="암호">
             <br><br>
           </td>
         </tr>
         <tr>
           <td colspan="2" align="center">
             <input type="checkbox" name="cbsave"
             <%=saveok==null?"":"checked" %>>아이디저장
             <br><br>
           </td>
         </tr>
         <tr>
           <td>
             <b style="color:gray; font-size:0.9em; ">Apple ID는 iTunes, App Store, iCloud에 로그인할 때 사용하는</b><br>
             <b style="color:gray; font-size:0.9em;">이메일 주소입니다.</b>
             <br><br><br>
         </tr>
         <tr>
           <td colspan="2">
             <button type="submit" class="submit" style="width: 400px; align:center;">로그인</button>
             
             <br><br>
             <a href="index.jsp?main=user/userform.jsp" style="width:400px;"><b>Apple ID가 없으신가요? 지금 생성.</b></a>               
           </td>
         </tr>

    </table>
  </form>
</div>
</body>
</html>
