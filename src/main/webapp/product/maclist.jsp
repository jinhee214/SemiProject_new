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
		width: 250px;
		height: 200px;	
		border: 1px solid white;	
		margin: 10px 10px 10px 10px;
	}
	
	 img.mainimg:hover{
		cursor: pointer;
		width: 300px;
		height:250px;
		border: 3px solid lightgray; 		
	} 
	
	/* table.maintb{
		width: 700px;
		
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
		<td align="center" style="font-size: 1.3em;"><b>MAC</b></td>
	</tr>
	<tr>
		  <td><br>
		     <a href="index.jsp?main=product/iMac_M1De.jsp">
		     <img alt="" src="AppleProduct_img/iMac.PNG" class="mainimg">
		   	 </a>
		    <a href="index.jsp?main=product/MacBook_ProM1.jsp">
		    <img alt="" src="AppleProduct_img/MacBook_Pro.PNG" class="mainimg">
		    </a>
		     <a href="index.jsp?main=product/MacBook_AirDeM1.jsp">
		    <img alt="" src="AppleProduct_img/MacBook_Air.PNG" class="mainimg">
		    </a>
		  </td>
	</tr>
</table> 
</div>
</body>
</html>