<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	 img.mainimg{
		width: 400px;
		height: 300px;	
		border: 1px solid white;	
		margin: 10px 10px 10px 10px;
	}
	
	 img.mainimg:hover{
		cursor: pointer;
		width: 450px;
		height:350px;
		border: 3px solid lightgray; 		
	} 
	
	/* table.maintb{
		width: 1000px;
		
	}
	table.maintb tr{
		height: 180px;
	} 
	
</style>  
<title>Apple Project</title>
</head>
<body>
<div>
<table class="maintb" style="margin-left: auto; margin-right: auto;">
	<tr>
		<td align="center" style="font-size: 1.3em;" colspan="3"><b>MAC</b></td>
	</tr>
	<tr>
		  <td><br>
		     <a href="index.jsp?main=product/iMac_M1De.jsp">
		     <img alt="" src="image/AppleProduct_img/iMac.PNG" class="mainimg">
		   	 </a>
		   </td>
		   <td>
		    <a href="index.jsp?main=product/MacBook_ProM1.jsp">
		    <img alt="" src="image/AppleProduct_img/MacBook_Pro.PNG" class="mainimg">
		    </a>
		  </td>
		  <td>
		     <a href="index.jsp?main=product/MacBook_AirDeM1.jsp">
		    <img alt="" src="image/AppleProduct_img/MacBook_Air.PNG" class="mainimg">
		    </a>
		  </td>
	</tr>
	
	<tr style="font-size: 1.0em;">
		
		<td align="center"><br>
			<img alt="" src="image/AppleProduct_img/_delivery.PNG"><br><br>
			<b>업무일 기준 무료 익일 배송</b><br>
			오후 3시 이전에 주문된<br>
			재고 보유 제품에 한합니다.
		</td>
		
		<td align="center"><br>
			<img alt="" src="image/AppleProduct_img/_money.PNG"><br><br>
			<b>금융 혜택</b><br>
			무이자 할부를 통해 Apple 제품을<br>
			부담 없이 구매하실 수 있습니다.
		</td>
		
		<td align="center"><br><br>
			<img alt="" src="image/AppleProduct_img/_help.PNG"><br><br>
			<b>도움이 필요하다면</b><br>
			질문이 있으신가요? 전문가와 전화로<br>
			상담하거나 온라인으로 채팅하세요.<br>
			080-330-8877로 전화 주세요.<br>
			<a href="index.jsp?main=qna/boardMenu.jsp">더 알아보기 ></a>
		</td>
	</tr>
</table> 
</div>
</body>
</html>