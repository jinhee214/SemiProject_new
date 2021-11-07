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
.menu-section{

	display: flex;
	justify-content: space-around;
	align-items: center;
	
}

.menu-section-item{

	display:flex;
	flex-direction: column;
	justify-content:center;
	align-items:center;
	text-align: center;
	border-radius: 30px;
	width:120px;
	height:120px;
}

.menu-section-item:hover {
	border : 6px solid lightgray;
	cursor: pointer;
}

</style>

<%
String loginok = (String)session.getAttribute("loginok");
String userId = (String)session.getAttribute("myid");
String locationCategory = "";
String locationMy = "";

if(loginok == null){
	locationCategory = "\"index.jsp?main=qna/board.jsp?categoryIndex=\"";
	locationMy = "index.jsp?main=login/loginform.jsp";
}
else {
	locationCategory = "\"index.jsp?main=qna/boardUser.jsp?categoryIndex=\"";
	locationMy = "index.jsp?main=qna/boardmy.jsp";
}
%>

</head>
<body>
<div>
<img alt="" src="image/boardimg/boardmainimg.PNG" style="width:1300px; margin-bottom:40px;">
</div>

<div class="menu-section">
<div class="menu-section-item">
<img alt="" src="image/boardimg/macmenu.png" style="width:80px; margin-bottom: 10px;">
<span value="1">Mac</span>
</div>

<div class="menu-section-item">
<img alt="" src="image/boardimg/padmenu.png" style="width:80px; margin-bottom: 10px;">
<span value="2">iPad</span>
</div>
<div class="menu-section-item">
<img alt="" src="image/boardimg/iphonemenu.png" style="width:80px; margin-bottom: 10px;">
<span value="3">iPhone</span>
</div>
<div class="menu-section-item">
<img alt="" src="image/boardimg/accmenu.png" style="width:70px;">
<span value="4">Accessory</span>
</div>

<div class="menu-section-item">
<img alt="" src="image/boardimg/etcmenu.png" style="width:70px;">
<span value="5">기타문의</span>
</div>
</div>

<div align="center" style="margin-top: 30px; font-weight: 700;"><a href="<%=locationMy%>" style="text-decoration: none;">
내 문의 확인하기 <span class="glyphicon glyphicon-chevron-right"></span>
</a></div>

<script type="text/javascript">

//카테고리 선택할 경우 해당 주소로 이동
$(".menu-section-item").click(function(){
	var category = $(this).children("span").attr("value");
	
		location.href=<%=locationCategory%>+category;
	
});

</script>

</body>
</html>