
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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
select{
	font-weight: bold;	
}  
 
 </style>  
 
<title>Insert title here</title>
</head>
<body> 
<%
request.setCharacterEncoding("utf-8");
String root=request.getContextPath();


String myid=(String)session.getAttribute("myid");

//userdao udao=new userdao(); 포인트얻기
UserDao udao=new UserDao();

UserDto udto=udao.getUser(myid);

String User_addr=udto.getUser_addr();

String []tokens=User_addr.split(" ");



%>

<!-- 결제 방법  -->
<h3 style="margin-left: 400px;">결제</h3>
<hr style="border:1px solid #e6eaee; width:1120px;">
<br><br>


<!-- 결제 종류  -->
<h1 style="margin-left: 400px;"><b>어떻게 결제하시겠습니까?</b></h1>
<br><br>

<form action="orderform.jsp" method="post">
<div style="margin-left: 400px; border: 2px solid #0080ff; border-radius: 15px; width: 600px; height: 90px;">

<div class="form-group"> 
  <select  class="form-control" name="paysel" style="width:593.9px; height: 84.2px; border:0px; border-radius:10px; 
  margin-left: 0.7px; margin-top:0.4px; font-size: 1.3em;">
    <option selected="selected" value="결제 포인트" >포인트</option>
    <option value="신용 카드 또는 직불 카드">신용 카드 또는 직불 카드</option>
    <option value="카카오 페이" >카카오 페이</option>
    <option value="토스" >토스</option>  
  </select>
</div>

<img src="<%=root %>/AppleProduct_img/order.PNG" style="position:absolute; top:250px; left: 1050px; max-width:400px;">
</div>

<!-- 포인트선택>포인트 표시 -->
<div name="point" style="margin:30px 0 0 400px;">
<b style="font-size: 1.3em;"><%=udto.getUser_point() %>포인트 사용 가능</b>
</div>


<hr style="border:1px solid #e6eaee; width:600px; margin-left: 400px;">
<br><br>

<!-- 주소출력 -->
<input type="checkbox" name="delckb" id="delckb" checked="checked" style="margin-left: 400px; margin-right: 5px;">내 배송 주소를 사용합니다
 
<div id="uaddr_div" style="margin: 20px 0 0 400px; height: 50px;">
<%
for(int i=0;i<tokens.length;i++)
{%>
	<p><%=tokens[i] %></p>
<%}
%>
</div>


<div id="addr_div" style="margin: 50px 0 0 400px;">
<input type="text" name="addr1" class="form-control" placeholder="시/도" style="width: 400px;">
<input type="text" name="addr2" class="form-control" placeholder="상세주소" 
style="width: 400px; margin-top: 10px;">
 </div>

<br><br><br>
<hr style="border:1px solid #e6eaee; width:1120px;">
<br>
<button type="submit" style="margin-left: 400px; width: 600px; height: 70px; border-radius: 15px; background-color: #0080ff;"
 class="btn btn-primary" >주문 검토</button>
 
 <br><br><br><br>
  
<hr style="border:1px solid #e6eaee; width:1800px;">
<b style="margin-left: 400px; font-size: 1.1em;">도움이 더 필요하신가요?</b> <b style="font-size: 1.1em; color: #0080ff;">지금 채팅하기
</b> <b style="font-size: 1.1em;">또는 080-330-8877 번호로 문의하세요.</b>
<br>
<hr style="border:1px solid #e6eaee; width:1800px;">

</form>

<script type="text/javascript">

/* 체크박스 이용 주소 등록 */
$(document).ready(function(){
	
	 $("#addr_div").hide();
	 $("#uaddr_div").show();
	 
    $("#delckb").change(function(){
        if($("#delckb").is(":checked")){        	
        	
            $("#uaddr_div").show();
            $("#addr_div").hide();
            
        }else{
        	  $("#uaddr_div").hide();
              $("#addr_div").show();
        }
    });
});

</script>

</body>
</html>