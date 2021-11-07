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
		width: 200px;
		height: 250px;	
		border: 1px solid white;	
		margin: 10px 10px 10px 10px;
	}
	
	 img.mainimg:hover{
		cursor: pointer;
		width: 250px;
		height:300px;
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

<table class="maintb" style="margin-left: auto; margin-right: auto;">
	<tr>
		<td align="center" style="font-size: 1.3em;"><b>iPad</b></td>
	</tr>
	<tr>
		  <td><br>
		     <a href="index.jsp?main=product/iPad_De.jsp">
		     <img alt="" src="AppleProduct_img/iPad.PNG" class="mainimg">
		   	 </a>
		    <a href="index.jsp?main=product/iPad_miniDe.jsp">
		    <img alt="" src="AppleProduct_img/iPad_mini.PNG" class="mainimg">
		    </a>
		     <a href="index.jsp?main=product/iPadPro_De.jsp">
		    <img alt="" src="AppleProduct_img/iPadPro.PNG" class="mainimg">
		    </a>
		  </td>
	</tr>
</table> 

</body>
</html>