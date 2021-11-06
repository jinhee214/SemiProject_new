<%@page import="java.text.DecimalFormat"%>
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
	
	vat=(Math.round(total*0.11)) ;	
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
	
	DecimalFormat dfm=new DecimalFormat("###,###");
	
	
%>

<b style="margin-left: 200px; font-size: 1.1em;">결제</b>
<hr style="border:1px solid #e6eaee; width:800px; margin-left: 200px;">

<!-- form -->

<form action="order/orderaction.jsp" method="post" id="frm">

<input type="hidden" name="total"  value="<%=total%>">
<input type="hidden" name="addr"  value="<%=addr%>">
<input type="hidden" name=delday1  value="<%=delday1%>">
<input type="hidden" name="delday2"  value="<%=delday2%>">

<h2 style="margin-left: 200px; font-weight: bold;">주문하시겠습니까?<br>
입력하신 사항이 모두 정확한지 확인해주십시오.
</h2>
<br><br>

<!-- 구매날짜 -->
<h3 style="margin-left: 200px; font-weight: bold;"><%=delday1 %> - <%=delday2 %></h3>
<p style="margin-left: 200px;">표준 배송</p>


<!-- 제품이미지 제품 정보받아오기  -->
<table class="table" style="width: 800px; margin-left: 200px;">
<%
	for(CartDto cdto:clist)
	{%>
		<tr>
			<td style="width: 300px;">
			<div style="margin: 15px 0 15px 0;">
			<img style="max-height: 200px; max-width: 350px;" 
			src="<%=root %>/AppleProduct_img/<%=pdao.getProductDetailPhoto(cdto.getProduct_id())%>">
			</div>
			</td>
			<td><div style="margin-top: 80px; font-weight: bold;"><%=pdao.getProductName(cdto.getProduct_id()) %></div></td>
			<td><div style="margin-top: 80px; font-weight: bold;"><%=cdto.getCnt() %></div></td>
			<td align="right" style="width: 300px;"><div style="margin-top: 80px; font-weight: bold;">₩<%=dfm.format(total)%></div></td>					
		</tr>
			
	<%}

%>
</table>

<!--결제 상세정보 결제수단 주소 받기 -->
<table class="table" style="width: 800px; margin-left: 200px;">
	<tr>
		<td><div style="margin: 15px 0 15px 0;"><b style="font-size: 1.2em;">배송 상세 정보</b></div></td>

		<td><div style="margin: 15px 0 15px 0;"><b>배송지:</b><br>

			<span><%=udto.getUser_name() %><br>
			<%
			{	
				for(int i=0;i<tokens.length;i++){%>
					<%=tokens[i] %><br>
			<%}	
			}	
			%>
			</span></div>
			</td>
		
		<td align="center">
			<div style="margin: 15px 0 15px 0;"><b>결제방법:</b>
			<br>
			<span>
			<%=paysel %>
			</span>
			</div>
		</td>
		
		<td>
			<div style="margin: 15px 0 15px 0;" align="right"><b>연락처 정보:</b>
			<div><%=udto.getUser_hp()%></div>
			</div>
		</td>
	</tr>	
	
	<!-- 이용약관  체크박스 -->
	<tr>
		<td colspan="4">
			<div style="margin: 15px 0 15px 0;"><b style="font-size: 1.2em;">이용약관</b><br>
				<span>		
				<input type="checkbox" id="useckb" style="margin: 10px 5px 0 0;">
				<b style="color: #0080ff; margin-left: 6px; font-weight: normal; font-size: 0.9em;">Apple 개인정보 취급방침</b><b style="font-weight: normal; font-size: 0.9em;">에 따라 개인정보를 수집하고, 사용하고, 제3자에 제공하고, 처리한다는 점에 동의합니다.</b>
				</span>
			</div>
		</td>		
	</tr>
	
	<tr>
		<td><div style="margin-top: 15px;"><b style="font-size: 1.2em;">총계</b></div></td>
		<td colspan="3"></td>		
	</tr>	
	
</table>

<table style="width:500px; margin-left: 500px; ">
	
	<tr style="border-bottom: 1px solid lightgray;">
		<td style="font-size: 0.9em;"><div style="margin: 15px 0 15px 0;"> 소계
		<div style="margin: 10px 0 15px 0;">배송</div>
		</div></td>
		
		<td style="font-size: 0.9em;" align="right"><div style="margin: 15px 0 15px 0;">￦<%=dfm.format(total) %>
		<div style="margin: 10px 0 15px 0;">무료</div>
		</div></td>
	</tr>
	
	<tr>
		<td>
		<div style="font-size: 1.7em; font-weight: bold;">총계		
		</div></td>
		
		<td align="right"><div style="margin-top: 15px;"><b style="font-size: 1.7em;">￦<%=dfm.format(total)%></b>
		<div style="font-size: 0.9em;">￦<%=dfm.format(vat)%>의 VAT 포함</div>
		</div></td>
	</tr>	
	
</table>

<div style="margin:60px 0 15px 620px;">
<button type="button" id="subbtn" style="width: 400px; height: 50px; border-radius: 15px; background-color: #0080ff;"
 class="btn btn-primary" >결제 하기</button>
 <img  src="<%=root %>/AppleProduct_img/orderinfo.PNG" style="max-width: 800px; margin-top: 10px;">
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