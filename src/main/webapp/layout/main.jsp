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
	 img.mainimg{
		width: 250px;
		height: 200px;	
		border: 1px solid #aaa;	
		margin: 10px 10px 10px 10px;
	}
	
	 img.mainimg:hover{
		cursor: pointer;
		width: 400px;
		height:300px;
		border: 5px solid black; 		
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
<%
String root=request.getContextPath();
%>
<body>
<table class="maintb">
<%
int n=0;

for(int row=1;row<=2;row++)
{%>
	<tr>
	  <%
	  for(int col=1;col<=3;col++)
	  {
		  n++;
	  
	  %>
		  <td>
		    <img alt="" src="<%=root%>/AppleProduct_img/main<%=n%>.PNG" class="mainimg">
		  </td>
	  <%}
	  %>
	</tr>
<%}
%> 

</table> 

</body>
</html>