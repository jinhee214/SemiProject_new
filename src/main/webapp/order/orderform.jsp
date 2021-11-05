<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CartDao"%>
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
 .tot b{
 	color: #a9adb5; 	 	
 } 
 </style>
 
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String root=request.getContextPath();

String paysel=request.getParameter("paysel");
//System.out.println(paysel);

String myid=(String)session.getAttribute("myid");

String delckb=request.getParameter("delckb");
//System.out.println(delckb);

UserDao udao=new UserDao();
UserDto udto=udao.getUser(myid);
String User_addr=udto.getUser_addr();

/* 장바구니에서 제품 정보 리스트로 받아오기  */
CartDao cdao=new CartDao();
List<CartDto>clist=cdao.readCart(myid);


ProductDao pdao=new ProductDao();
List<data.dto.ProductDto>plist=pdao.getAllMembers();

/* 총 결제금액 구하기 */
int total=0;
double vat=0;
for(CartDto cdto:clist)
{	
	int cnt=cdto.getCnt();
	int price=cdto.getPrice();
	total+=cnt*price;
	
	vat=total*0.11;	
}
//System.out.println(total);

/* 배송날짜 */
Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 7);
	
Calendar cal2 = Calendar.getInstance();
	cal2.setTime(new Date());
	cal2.add(Calendar.DATE, 14);
	
	DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
	String delday1=df.format(cal.getTime());
	String delday2=df.format(cal2.getTime());
	
	/* 주소 설정 */
	String addr="";
	if(delckb==null)
	{
		addr=request.getParameter("addr1")+" "+request.getParameter("addr2");
	}else
	{
		addr=udto.getUser_addr();
	}
	
	String []tokens=addr.split(" ");	
	
%>

<h4 style="margin-left: 400px;">결제</h4>
<hr style="border:1px solid #e6eaee; width:1120px;">
<br><br>
<!-- form -->
<form action="order/orderaction.jsp" method="post" id="frm">

<input type="hidden" name="total"  value="<%=total%>">
<input type="hidden" name="addr"  value="<%=addr%>">
<input type="hidden" name=delday1  value="<%=delday1%>">
<input type="hidden" name="delday2"  value="<%=delday2%>">

<h2 style="margin-left: 400px; font-weight: bold;">주문하시겠습니까?<br>
입력하신 사항이 모두 정확한지 확인해주십시오.
</h2>
<br><br>

<!-- 구매날짜 -->
<b style="margin-left: 400px;"><%=delday1 %> - <%=delday2 %></b>
<p style="margin-left: 400px;">표준 배송</p>
<br><br><br>

<!-- 제품이미지 제품 정보받아오기  -->
<div>
<%
	for(CartDto cdto:clist)
	{%>
		<img style="margin-left: 400px;" src="../AppleProduct_img/<%=pdao.getProductPhoto(cdto.getProduct_id())%>">
		<b style="margin-left: 200px;"><%=pdao.getProductName(cdto.getProduct_id()) %></b>
		<b style="margin-left: 200px;"><%=cdto.getCnt() %></b>
		<b style="margin-left: 300px;">₩<%=cdto.getPrice() %></b>
		<br><br>
		<hr style="border:1px solid #e6eaee; width:1120px;">
	<%}

%>
</div>
<br>

<!--결제 상세정보 결제수단 주소 받기 -->
<div style="margin-left: 400px; margin-bottom: 150px;">
<b style="float: left;">배송 상세 정보</b>

<b style="margin-left: 100px; float: left;">배송지
<br>
<span><%=udto.getUser_name() %><br>
<%
{	
	for(int i=0;i<tokens.length;i++){%>
		<%=tokens[i] %><br>
	<%}	
}	
%>

</span></b>
<b style="margin-left: 100px; float: left;">결제방법
<br>
<span>
<%=paysel %>
</span></b>

<b style="margin-left: 200px; float: left;">연락처 정보

<span><p><%=udto.getUser_hp() %></p></span>

</b>
</div>



<hr style="border:1px solid #e6eaee; width:1120px;">

<!-- 이용약관  체크박스 -->
<br>
<b style="margin-left: 400px;">이용약관</b>

<br><br>

<input type="checkbox" id="useckb" style="margin-left: 400px;">
<b style="color: #0080ff; margin-left: 6px;">Apple 개인정보 취급방침</b><b>에 따라 개인정보를 수집하고, 사용하고, 제3자에 제공하고, 처리한다는 점에 동의합니다.</b>

<br><br>
<hr style="border:1px solid #e6eaee; width:1120px;">

<!-- 총계 > span vat포함 계산 -->
<div style="margin-left: 400px;" class="tot">
<h3>총계</h3>

<br><br>

<b style="font-size: 0.9em; margin-left: 730px;">소계</b><b style="font-size: 0.9em;
 margin-left: 300px;">￦<%=total %></b>
 
<br>

<b style="font-size: 0.9em; margin-left: 730px;">배송</b><b style="font-size: 0.9em; margin-left: 300px;">무료</b>

<hr style="border:1px solid #e6eaee; width:400px; margin-right: 388px;">

<b style="color:black; margin-left: 730px; font-weight: bold; font-size: 1.5em;">총계</b>
<b style="color:black; margin-left: 240px; font-weight: bold; font-size: 1.5em;">￦<%=total %></b>
<b style="font-size: 0.9em; margin-left: 1000px;">￦<%=Math.round(vat)/10%>의 VAT 포함</b>

<br><br>

<button type="button" id="subbtn" style="margin-left: 740px; width: 400px; height: 50px; border-radius: 15px; background-color: #0080ff;"
 class="btn btn-primary" >결제 하기</button>
 
 <br><br>
 
<img  src="<%=root %>/AppleProduct_img/orderinfo.PNG" style="margin-left: 740px;">
</div>

</form>

<!-- 이용약관 동의 -->
<script type="text/javascript">
$(document).ready(function(){		
	 
   $("#subbtn").click(function(){
       if($("#useckb").is(":checked") && <%=udto.getUser_point()%> > <%=total%>	){        	
       	
        $("#frm").submit();
        
       }else if($("#useckb").is(":checked")==false){
    	   alert("약관을 동의해 주세요");
    	   return;
       }else if(<%=udto.getUser_point()%> < <%=total%>)
    	   {
    	   alert("포인트가 부족합니다");
    	   }   
   
   });
});




</script>
</body>
</html>