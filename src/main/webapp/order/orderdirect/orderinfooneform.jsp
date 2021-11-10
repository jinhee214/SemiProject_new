<%@page import="data.dto.orders_detailDto"%>
<%@page import="java.text.DecimalFormat"%>
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


</head>
<body> 
<%
request.setCharacterEncoding("utf-8");
String root=request.getContextPath();


String myid=(String)session.getAttribute("myid");

String productId = request.getParameter("product_id");
String userId = request.getParameter("user_id");
String price = request.getParameter("price");
String cnt = request.getParameter("cnt");
String color = request.getParameter("color");
String insurance = request.getParameter("insurance");



//userdao udao=new userdao(); 포인트얻기
UserDao udao=new UserDao();

UserDto udto=udao.getUser(myid);

String User_addr=udto.getUser_addr();

String []tokens=User_addr.split(" ");

DecimalFormat df=new DecimalFormat("###,###");



%>

<!-- 결제 방법  -->
<h3 style="margin-left: 150px;">결제</h3>
<hr style="border:1px solid #e6eaee; width:1000px;">
<br><br>


<!-- 결제 종류  -->
<h1 style="margin-left: 150px;"><b>어떻게 결제하시겠습니까?</b></h1>
<br><br>

<form action="<%=root %>/index.jsp?main=order/orderdirect/orderoneform.jsp" method="post" id="frm">
<div style="margin-left: 150px; border: 2px solid #0080ff; border-radius: 15px; width: 600px; height: 90px;">
<input type="hidden" name="productId"  value="<%=productId%>">
<input type="hidden" name="price"  value="<%=price%>">
<input type="hidden" name="cnt"  value="<%=cnt%>">
<input type="hidden" name="color"  value="<%=color%>">
<input type="hidden" name="insurance"  value="<%=insurance%>">

<div class="form-group" >   
 <select  class="form-control" id="paysel" name="paysel" style="width:594.3px; height: 84.2px; border:0px; border-radius:13px; 
 margin-left: 0.9px; margin-top:0.45px; font-size: 1.3em;">
   <option selected="selected" value="결제 포인트" >결제 포인트</option>
   <option value="신용 카드 또는 직불 카드">신용 카드 또는 직불 카드</option>
   <option value="카카오 페이" >카카오 페이</option>
   <option value="토스" >토스</option>  
 </select>
</div>

<img src="<%=root %>/image/AppleProduct_img/order.PNG" style="position:absolute; top:240px; left: 1400px; max-width:400px;">
</div>

<!-- 포인트선택>포인트 표시 -->
<div name="point" id="point"  style="margin:30px 0 0 150px;">
<b style="font-size: 1.3em;"><%=df.format(udto.getUser_point()) %> 포인트 사용 가능</b>
</div>


<hr style="border:1px solid #e6eaee; width:600px; margin-left: 150px;">
<br><br>

<!-- 주소출력 -->
<input type="checkbox" name="delckb" id="delckb" checked="checked" style="margin-left: 150px; margin-right: 5px;">내 배송 주소를 사용합니다

<div id="uaddr_div" style="margin: 20px 0 0 170px; height: 50px;">
<%
for(int i=0;i<tokens.length;i++)
{%>
	<%=tokens[i] %><br>
<%}
%>
</div>


<div id="addr_div" style="margin: -40px 0 0 150px;">
<input type="text" name="addr1" id="addr1" class="form-control" required="required" placeholder="시/도" style="width: 400px;">
<input type="text" name="addr2" id="addr2" class="form-control" required="required" placeholder="상세주소" 
style="width: 400px; margin-top: 10px;">
</div>

<br><br><br>
<hr style="border:1px solid #e6eaee; width:1120px;">
<br>
<button type="button"  id="subbtn" style="margin-left: 350px; width: 600px; height: 70px; border-radius: 15px; background-color: #0080ff;"
class="btn btn-primary" >주문 검토</button>

<br><br><br><br>
 
<hr style="border:1px solid #e6eaee; width:1500px;">
<b style="margin-left: 380px;">도움이 더 필요하신가요?</b> <b style="color: #0080ff;">지금 채팅하기
</b> <b>또는 080-330-8877 번호로 문의하세요.</b>
<br>
<hr style="border:1px solid #e6eaee; width:1500px;">

</form>

<script type="text/javascript">

/* 체크박스 이용 주소 등록 */
$(document).ready(function(){
	
	 $("#addr_div").css("margin-left","-9999px"); 	
	 
   $("#delckb").change(function(){
       if($("#delckb").is(":checked")){        	
       	
           $("#uaddr_div").css("margin-left","170px");
           $("#addr_div").css("margin-left","-9999px");  
           
           $("#addr1").val(" ");   
           $("#addr2").val(" "); 
           
           
       }else{
       	  $("#uaddr_div").css("margin-left","-9999px"); 
             $("#addr_div").css("margin-left","170px");
             
             $("#addr1").val("");   
             $("#addr2").val(""); 
       }
   });  
   
});
	
	/* 보유 포인트 보여주기 */
$("#paysel").change(function(){	
	var s=$("#paysel option:selected").val();
	if(s=="결제 포인트")
		{
		$("#point").show();
		}else 
			{			
			$("#point").hide();
			}	
});
	
	
/* 포인트로만 결제 가능 */
$("#subbtn").click(function(){
	
	var s=$("#paysel option:selected").val();
	if(s!="결제 포인트")
		{
		alert("포인트로만 결제 가능합니다");
		
		}else
			{
			$("#frm").submit();
			}	
	
});


</script>


</body>

</html>